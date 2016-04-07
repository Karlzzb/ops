import os
import random
import re
import subprocess
import time
import requests
from datetime import datetime
from jinja2 import Environment, FileSystemLoader
import mysqlconf


class RequestException(Exception):
    pass


class Webkaka(object):
    def __init__(self, session, request):
        self._checker_url = "http://www.webkaka.com"
        self._session = session
        self._request = request
        self._request_head = dict()
        self._request_head["Content-Type"] = "text/plain;charset=UTF-8"
        self._str_check_host = "shijiazhuangdx;dongguandx;bjdianxin;luoyangdx;shanghaidx;chongqingdx;" \
                               "hengyangdx;hubeiwhdx;changshadx;scmydx;beijingdx;jiangxidx;quanzhoudx;" \
                               "lishuidx;baojidx;guangxidx;hubeisydx;shenzhendx;qingdaodx;guangdongdx;" \
                               "sccddx;guizhou360jq;jxnc360jq;szbgp;jinhuasx;qhddx;qhdlt;beijinglt;hrbwt;" \
                               "weifangwt;jslyglt;hebeilt;shanxilt;sichuanlt;bjtopservers;baojilt;tjlt;" \
                               "beijingsx;xiamendx;fujiansx;fujianyd;hnzhengzhougd;bj3389;zzbgp;bjdxt;" \
                               "tjbgp;bjdx1000"
        self._str_check_count = 20
        self._current_check = 1
        self._valid_mointor_points = 0
        self._available_hosts = dict()

    def get_connectivity_rate(self, dns_record, ips):
        request_url = "%s/ajax/WebChecking.WebCheck,App_Web_dyb2tzne.ashx?_method=" \
                      "GetWebResponse&_session=rw" % self._checker_url
        strCheckCount_str = "strCheckCount=%s" % self._str_check_count
        url_str = "url=%s" % dns_record
        UID_str = "UID=%s" % "045b9ee8-edd4-bf08-7132-43d0d93eee5d"
        useragent_str = "useragent=100"

        for i in range(1, self._str_check_count):
            time.sleep(1)
            code_str = "code=%s" % i
            request_body = "\r\n".join([strCheckCount_str, code_str, url_str, UID_str, useragent_str])
            if i < 3:
                self.get_response_content(request_url, request_body)
            else:
                content = self.get_response_content(request_url, request_body)
                if content:
                    self.check_status_ok_hosts(content, ips)

        total_mointor_points = len(self._str_check_host.split(';'))
        valid_mointor_points = len(self._available_hosts)
        return (valid_mointor_points * 100) / total_mointor_points

    def get_response_content(self, request_url, request_body):
        try:
            response = self._request.do_request(self._session, request_url, request_body, headers=self._request_head)
            if response and response.status_code == 200:
                return response.content
        except Exception as e:
            if self._current_check <= 3:
                self._current_check += 1
                print e
                self.get_response_content(request_url, request_body)
            else:
                return None

    def check_status_ok_hosts(self, content, ips):
        arr_str = content.split("$$")[0].split('$')
        arr_id = self._str_check_host.split(';')
        for _str in arr_str:
            for _id in arr_id:
                if _id in _str:
                    arr_data = _str.split('|')
                    if 'N/A' not in arr_data[5]:
                        ip_address = arr_data[5].split('<br>')[0]
                        if arr_data[1] == "200" and ip_address in ips:
                            self._available_hosts[_id] = "200"
                    break

    def get_new_guid(self):
        #s4 = (((1+Math.random())*0x10000)|0).toString(16).substring(1)
        pass


class RequestObj(object):
    def __init__(self):
        self._timeout = 10  # secs

    def get_session(self):
        return requests.Session()

    def do_request(self, session, request_url, request_data=None, **kwargs):
        try:
            if request_data:
                response = session.post(request_url, timeout=self._timeout, data=request_data, **kwargs)
            else:
                response = session.get(request_url, timeout=self._timeout, **kwargs)
            return response
        except requests.exceptions.ConnectionError as e:
            # A Connection error occurred.
            print("A Connection error occurred. Error: %s" % e)
        except requests.exceptions.HTTPError as e:
            # An HTTP error occurred.
            print("An HTTP error occurred. Error: %s" % e)
        except requests.exceptions.URLRequired as e:
            # A valid URL is required to make a request.
            print("A valid URL is required to make a request. Error: %s" % e)
        except requests.exceptions.RequestException as e:
            # There was an ambiguous exception that occurred while handling your request.
            print("There was an ambiguous exception that occurred while handling your request. Error: %s" % e)


class DnsAvailableCheck(object):
    def __init__(self, request):
        self._dns_server = "8.8.8.8"
        self._check_key = "sex8.zip"

        self._dns_metadata_list = ["Domain Name", "Registrar", "Creation Date", "Update Date",
                                   "Registrar Registration Expiration Date"]
        self._ip_metadata_list = ["GeoIP Country Edition", "GeoIP ASNum Edition"]

        self._re_pattern = r'%s: (?P<value>.+).*'

        self._result = []
        self._request = request
        self._session = self._request.get_session()
        self._retry_count = 0
        self._max_retry_num = 3

    def get_dns_details(self, dns_record):
        dns = dict()
        lines = []
        try:
            proc = subprocess.Popen("whois %s" % dns_record, shell=True, stdout=subprocess.PIPE)
            lines = proc.stdout.readlines()
        except subprocess.CalledProcessError as e:
            print e

        for line in lines:
            for key in self._dns_metadata_list:
                match_obj = re.match(self._re_pattern % key, line)
                if match_obj:
                    dns[key.replace(' ', '_')] = match_obj.group('value').replace("\r", "")
        return dns

    def get_ip_by_dns(self, dns_record):
        try:
            proc = subprocess.Popen("dig @%s %s +short" % (self._dns_server, dns_record), shell=True,
                                    stdout=subprocess.PIPE)
            ips = proc.stdout.readlines()
            if ips:
                return [ip.rstrip('\n') for ip in ips]
            return None
        except subprocess.CalledProcessError as e:
            print e

    def get_country_and_asnum_by_ip(self, ips):
        country_asnum = dict()
        for ip in ips:
            try:
                proc = subprocess.Popen("geoiplookup %s" % ip, shell=True,
                                        stdout=subprocess.PIPE)
                lines = proc.stdout.readlines()
                if lines:
                    for line in lines:
                        for key in self._ip_metadata_list:
                            match_obj = re.match(self._re_pattern % key, line)
                            if match_obj:
                                country_asnum[key.replace(' ', '_')] = match_obj.group('value').replace("\r", "")
                    return country_asnum
            except subprocess.CalledProcessError as e:
                print e

    def check_available(self, dns_record):
        request_url = "http://%s/index.php" % dns_record

        try:
            response = self._request.do_request(self._session, request_url)
            if response and response.status_code == 200:
                if response.content.find(self._check_key) != -1:
                    return True
        except Exception as e:
            if self._retry_count < self._max_retry_num:
                self._retry_count += 1
                print e
                self.check_available(dns_record)
        return False


class FileController(object):
    def __init__(self):
        self._path_cur = os.path.split(os.path.realpath(__file__))[0]

    def read_file(self, file_name):
        file_path = os.path.join(self._path_cur, file_name)
        fp = open(file_path, 'r')
        try:
            lines = fp.readlines()
            return lines
        finally:
            fp.close()

    def write_to_file(self, output_html, output_template, keys, data_list):
        output_html_path = os.path.join(self._path_cur, output_html)

        env = Environment(loader=FileSystemLoader(os.path.join(self._path_cur, 'templates')))
        template = env.get_template(output_template)
        output_from_parsed_template = template.render({"data_list": data_list, "title_list": keys,
                                                       "current_data": datetime.now()})

        # to save the results
        with open(output_html_path, 'wb') as fp:
            fp.write(output_from_parsed_template)


def main():
    # domain file
    domain_file_name = "domain_list"
    output_template = "dns_available_check.j2"
    output_html = "dns_available_check.html"
    mysql_conf = mysqlconf.mysql_connect()

    # get request obj
    request = RequestObj()
    # create a request session
    session = request.get_session()

    # file controller, read domain from file and write result to a html file
    fc = FileController()

    # read domain as list from file 'domain_list'
    domain_list = fc.read_file(domain_file_name)

    keys = []
    data_list = []
    for domain in domain_list:
        time.sleep(random.randrange(3, 10, 1))  # sleep with random number(the range is 3 - 10 secs)

        # dns available check obj
        ce = DnsAvailableCheck(request)

        # use "webkaka(www.webkaka.com) to check the connectivity rate"
        webkaka = Webkaka(session, request)

        dns_record = domain.rstrip('\n')
        dns = ce.get_dns_details(dns_record)
        ips = ce.get_ip_by_dns(dns_record)
        website_status = ce.check_available(dns_record)
        connectivity_rate = ''

        # cut datetime format to "YYYY-MM-DD"
        for key, value in dns.iteritems():
            if key in ["Creation_Date", "Update_Date", "Registrar_Registration_Expiration_Date"]:
                dns[key] = value[0:10]

        if ips:
            ips_str = "<br>".join(ips)
            country_asnum = ce.get_country_and_asnum_by_ip(ips)
            if website_status:
                connectivity_rate = webkaka.get_connectivity_rate(dns_record, ips)
        else:
            country_asnum = {"GeoIP_Country_Edition": "N/A", "GeoIP_ASNum_Edition": "N/A"}
            ips_str = "N/A"

        other_data = {'Domain': dns_record, 'IP': ips_str, 'Page_Status': "YES" if website_status else "NO",
                      "Connectivity_Rate": connectivity_rate}

        data = dict(dict(dns, **country_asnum), **other_data)
        keys = data.keys()
        data_list.append(data)
        #
    #     print "dns:%s " % dns
    #     print "========================================================"
    #     print "ip: %s" % ips
    #     print "========================================================"
    #     print "country_asnum: %s" % country_asnum
    #     print "========================================================"
    #     print "website_status: %s" % website_status
    #     print "========================================================"
    #     print "connectivity_rate: %s" % connectivity_rate
    #     print "========================================================"
    # print data_list
    fc.write_to_file(output_html, output_template, keys, data_list)

#get data
    for mydata in data_list:
        if 'Update_Date' in mydata.keys():
                pass
        else:
                mydata['Update_Date'] = time.strftime('%Y-%m-%d',time.localtime(time.time()))
#save mysql
	domainid = mysql_conf.sql_exec("select id from dns where Domain = '%s';" %(mydata['Domain']))
        for dataid in domainid:
#                print dataid[0]
        mysqldata = mysql_conf.sql_exec("insert into check_dns_result (IP,Page_Status,Registrar,Creation,Update_Date,Expiration_Date,GeoIP_ASNum_Edition,GeoIP_Country_Edition,webkaka_Connectivity_Rate,did) values('%s','%s','%s','%s','%s','%s','%s','%s',%d,%d);"%(mydata['IP'],mydata['Page_Status'],mydata['Registrar'],mydata['Creation_Date'],mydata['Update_Date'],mydata['Registrar_Registration_Expiration_Date'],mydata['GeoIP_ASNum_Edition'],mydata['GeoIP_Country_Edition'],mydata['Connectivity_Rate'],dataid[0]))

if __name__ == "__main__":
    main()

