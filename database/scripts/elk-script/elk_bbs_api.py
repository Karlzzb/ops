# -*- coding: utf-8 -*-
__author__ = 'Abbott'


# -*- coding: utf-8 -*-
__author__ = 'Abbott'

import datetime
from elasticsearch import Elasticsearch
import mysqlconf

mysql_conf = mysqlconf.mysql_connect()
import time

insert_sql = "insert into discuz_api_stat(api_source_name, api_name, api_counts, invt_time) value ('%s', '%s', '%d', '%d')"

# api_dic = {'is_get_push': '推送接口', 'pic_by_gid': '图吧板块根据组图ID获取子图接口', 'pic_group': '图吧板块组图获取接口', 'version_upd': '版本更新接口',
# 'banner': '轮播图接口', 'daohang': '首页导航网站接口', 'channel_see': '某个用户的频道查询接口', 'ip_list': '获取IP列表',
#            'plugin_sel': '用户插件的查询接口', 'picclub_label': '图吧板块标签获取接口', 'head_news': '频道内容查询列表接口'}

elk_log_path = '/var/log/elk/elk_api.log'

api_dic = {'register': '用户注册接口', 'login': '用户登录接口', 'user_sel': '用户详细信息接口', 'pswd_update': '用户密码修改接口',
           'verify_code': '发送验证码接口', 'find_pswd': '用户找回密码接口', 'update_img': '用户图片修改接口', 'sign_update': '用户签名修改接口',
           'menu': '菜单接口', 'banner': '轮播图接口', 'daohang': '首页导航网站接口', 'head_news': '频道内容查询列表接口',
           'new_detail': '某个新闻详细内容接口', 'channel_add': '某个频道的添加接口', 'channel_see': '某个用户的频道查询接口',
           'channel_add_see': '某个用户的可以添加的频道接口', 'channel_del': '频道删除接口', 'plugin_add': '插件的增加接口',
           'plugin_sel': '用户插件的查询接口', 'plugin_del': '插件的删除接口', 'plugin_add_sel': '用户可添加插件查询接口', 'shelf_add': '个人书架添加接口',
           'shelf_del': '个人书架删除接口', 'bookshelf': '个人书架列表查询接口', 'book_detail': '某个小说详细信息接口',
           'book_select': '所有的小说查询列表接口', 'tbook_type_select': '热搜标签查询标签列表接口', 'book_hot_select': '小说热搜查询接口',
           'book_recom': '小说推荐查询列表接口', 'book_find': '小说匹配查找', 'book_tag_find': '小说类别匹配查找接口',
           'book_page_find': '小说指定页面查询接口', 'user_book_log': '查询某个用户某本书查看到的页面接口', 'get_time': '获取当前时间接口',
           'sign': '签到接口', 'is_sign': '今天是否签到了查询接口', 'sign_list': '打印用户签到列表接口', 'version_upd': '版本更新接口',
           'is_get_push': '推送接口', 'api_select': '小说新接口', 'channel_sort': '频道排序接口', 'picclub_label': '图吧板块标签获取接口',
           'pic_group': '图吧板块组图获取接口', 'pic_by_gid': '图吧板块根据组图ID获取子图接口', 'ip_list': '获取IP列表', 'subgroup': '组图切换的接口',
           'radio_host': '获取电台主播的接口', 'radio_by_hostid': '根据主播ID获取主播作品列表', 'add_record': '用户下载完成请求记录接口',
           'record_by_id': '根据recordID获取下载列表', 'video': '获取影吧列表的接口', 'radio': '获取上一个，下一个电台的接口'}

# Get time row
times = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y.%m.%d")
# times = '2015.10.25'

# Connect elasticsearch API
es = Elasticsearch("http://172.16.31.100:9200/")

# Number of query result data
max_result_number = 0

starttime = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y-%m-%d 00:00:00")
endtime = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y-%m-%d 23:59:59")

starttimestamp = "%s000" % int(time.mktime(time.strptime(starttime, '%Y-%m-%d %H:%M:%S')))
endtimestamp = "%s999" % int(time.mktime(time.strptime(endtime, '%Y-%m-%d %H:%M:%S')))

# Data index name
# logstash_index = 'logstash-%s' % times
logstash_index = 'logstash-*'

# send elasticsearch API mapping
body = {
    "size": 0,
    "aggs": {
        "mydata": {
            "date_histogram": {
                "field": "@timestamp",
                "interval": "1d",
                "pre_zone": "+08:00",
                # "pre_zone_adjust_large_interval": "true",
                "min_doc_count": 1,
                # "extended_bounds": {
                #     "min": 1449158400000,
                #     "max": 1449244799999
                # }
            },
            "aggs": {
                "api_data": {
                    "terms": {
                        "field": "api_type.raw",
                        "size": 50,
                        "order": {
                            "_count": "desc"
                        }
                    }
                }
            }
        }
    },
    "highlight": {
        "pre_tags": [
            "@kibana-highlighted-field@"
        ],
        "post_tags": [
            "@/kibana-highlighted-field@"
        ],
        "fields": {
            "*": {}
        },
        "fragment_size": 2147483647
    },
    "query": {
        "filtered": {
            "query": {
                "query_string": {
                    "query": "*",
                    "analyze_wildcard": "true"
                }
            },
            "filter": {
                "bool": {
                    "must": [
                        {
                            "range": {
                                "@timestamp": {
                                    "gte": starttimestamp,
                                    "lte": endtimestamp
                                }
                            }
                        }
                    ],
                    "must_not": []
                }
            }
        }
    }
}


# Execute elasticsearch search, res is result, u can use it that get ur rows
res = es.search(index=logstash_index, size=max_result_number, body=body)
# print res


# result list
result_list = res['aggregations']['mydata']['buckets']

#processing results
for result in result_list:
    datetimes = datetime.datetime.strptime(result['key_as_string'], '%Y-%m-%dT%H:%M:%S.%fZ').strftime("%Y%m%d")
    for r in result['api_data']['buckets']:
        #save mysql
        if r['key'] in api_dic.keys():
            mysql_conf.sql_exec(insert_sql % (r['key'], api_dic[r['key']], r['doc_count'], int(datetimes)))
        else:
            now_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            f = open(elk_log_path, 'ab+')
            f.write("%s\n\n" % now_time)
            f.write("%s\n\n" % r['key'])
            f.write("\n\n\n")
            f.close()
