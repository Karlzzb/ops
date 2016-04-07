# -*- coding: utf-8 -*-
import sys
reload(sys)
import commands
import mysqlconf
import datetime
import os
import re
__author__ = 'Abbott'


local_svn_path = "/script/svn/trunk"
own_version_path = "/script/version"
dir_list = ['video-admin', 'video-front', 'video_gs', 'socket']
sql_files_list = []
mysql_conf = mysqlconf.mysql_connect()

def svn_update():
    svn_update = commands.getstatusoutput("cd %s  && svn update && cd %s && svn update && cd %s && svn update" % (local_svn_path, os.path.join(local_svn_path, "video_gs"), os.path.join(local_svn_path, "socket")))
    if int(svn_update[0]) == 0:
        print "svn update success"
        return "True"
    else:
        print "svn update fail"
        return "False"


def check_version_path():
    version = raw_input("请输入版本号：").strip()
    sql_file_list = []
    check_version_list = []
    for dir in dir_list:
        local_version_path =os.path.join(local_svn_path, dir, version)
        if os.path.exists(local_version_path):
            # print "the version is right !"
            check_version_list.append(local_version_path)
            if os.path.exists(os.path.join(local_version_path, "sql")):
                sql_file_list.append(os.path.join(local_version_path, "sql"))

    if check_version_list:
        print "the version is right !"
        if sql_file_list:
            result = {'local_version_path': sql_file_list, 'version': version}
        else:
            print "no sql file for update"
            sys.exit()
    else:
        print "please check your version number is right !"
        sys.exit()
    # print sql_file_list, "++++"
    # print check_version_list, "----"
    return result

def write_sql_file(path, file, version, small_version, sql_files_count):
    # insert = "insert into version values('%s', '%s', %d, '%s', '%s', '%s', %d)"
    # print sql_files_count, "xxxxxxxxxxxxx"
    local_version = '%s-%s' % (version, small_version)

    if file[-3:] == "sql":
        if str(file) not in sql_files_count:
            sql_files_list.append(str(file))
            # local_version = ''
            version_file = "%s.sql" % (local_version)
            fout = open(os.path.join(own_version_path, version_file), 'ab+')
            fin = open(os.path.join(path, file))
            strinfo = fin.read()
            # fout = open(version_file, 'ab+')
            fout.write("/*\n")
            fout.write("%s\n" % str(path))
            fout.write("%s\n" % str(file))
            fout.write("*/\n")
            if re.search('admin', file):
                fout.write("use video_bos;\n")
            else:
                fout.write("use video;\n")
            fout.write("%s\n\n" % strinfo)
            fin.close()
            fout.close()
    # print sql_files_list,"aaaaaaaaaaa"



def check_version(version):
    sql_files_count = []
    select = "select * from version where svn_version = '%s'"
    select_sql_files = "select sql_file from version where svn_version = '%s'"
    select_dic = mysql_conf.sql_exec(select % str(version))
    select_sql_files_dic = mysql_conf.sql_exec(select_sql_files % str(version))
    if int(len(select_dic['value'])) == 0:
        small_version = '1'
        now_frequency = '0'
        sql_files_count = []
    else:
        small_version = str(len(select_dic['value'])+1)
        now_frequency = str(len(select_dic['value']))
        # print select_sql_files_dic['value'],"ggg"
        # print type(select_sql_files_dic['value']), "bbb"
        for files in select_sql_files_dic['value']:
            # print files, "fff"
            for file in files:
                for f in file.split(','):
                    sql_files_count.append(f)

        # print sql_files_count

    check_dic = {'small_version': small_version, 'now_frequency': now_frequency, 'sql_files_count': sql_files_count}
    return check_dic


def save_mysql(version, small_version, now_frequency, sql_files_list):
    print sql_files_list
    if sql_files_list:
        local_version = '%s-%s' % (version, small_version)
        create_dml = 1
        insert = "insert into version (svn_version, local_version, commit_frequency, sql_file, created_at, updated_at, dml_flag) values('%s', '%s', %d, '%s', '%s', '%s', %d)"
        now_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        mysql_conf.sql_exec(insert % (str(version), str(local_version), int(now_frequency)+1, str(','.join(sql_files_list)), str(now_time), str(now_time), create_dml))
    else:
        print "no sql file for update"
        sys.exit()
    # print a

def versions_merger(path, small_version, sql_files_count):

    for dir in path['local_version_path']:
        sql_files = os.listdir(dir)
        sql_files.sort()
        sql_files.remove('.svn')
        for sql_file in sql_files:
            write_sql_file(dir, sql_file, path['version'], small_version, sql_files_count)
        # print sql_files



if __name__ == '__main__':
    update_result = svn_update()
    # check_dic =
    if update_result == "True":
        local_version_path = check_version_path()
        check_dic = check_version(local_version_path['version'])
        versions_merger(local_version_path, check_dic['small_version'], check_dic['sql_files_count'])
        # print sql_files_list
        save_mysql(local_version_path['version'], check_dic['small_version'], check_dic['now_frequency'], sql_files_list)
    else:
        sys.exit()
