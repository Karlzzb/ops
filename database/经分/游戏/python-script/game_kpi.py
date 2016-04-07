# -*- coding: utf-8 -*-
import sys

reload(sys)
__author__ = 'Abbott'

import decimal
import commands
import json
from elk_common import *
import mysqlconf

ElkAddress = 'http://127.0.0.1:9200/'
LogstatshIndex = 'game_stat'
# TargeIndex = 'interim'
PreGameDocType = 'game_pay_stat'

DB_HOST = 'apdbs'
DB_USER = 'kerl'
DB_PASSWD = '1qaz@WSX'
DB_PORT = 3306
DB_DATABASE = 'g_leajoy'
DB_CHAR_SET = 'utf8'

MongoJsFile = "select.js"
MongoPath = "/app/mongodb/bin/mongo apcache:27017/game_leajoy"
gid_1_dic = {'dctusercount': 0, 'gmoney': 0, 'usercount': 0, 'apru': 0}
gid_2_dic = {'dctusercount': 0, 'gmoney': 0, 'usercount': 0, 'apru': 0}
gid_3_dic = {'dctusercount': 0, 'gmoney': 0, 'usercount': 0, 'apru': 0}
gid_4_dic = {'dctusercount': 0, 'gmoney': 0, 'usercount': 0, 'apru': 0}
global_dic = {}

GameIdDic = {"1": "封神伏魔", "2": "像素骑士团", "3": "血屠龙", "4": "战棋时代"}

KPI_list1 = ["PGYdFLoginUserCnt", "PG30DFLoginUserCnt", "PGLoginUserCnt",
             "PG7DLoginUserCnt", "YdLoginCnt", "YdLoginUserCnt", "LoginCnt"]
KPI_list2 = ["GYdFLoginUserCnt", "YdRetRates", "3DRetRates", "7DRetRates",
             "30DRetRates"]
mysql_conf = mysqlconf.mysql_connect()

MongoRes = commands.getstatusoutput("%s %s |egrep -v 'version|connecting'" % (MongoPath, MongoJsFile))
# print MongoRes


for val in MongoRes[1].split('\n'):
    res = json.loads(val)
    if res['mytitle'] in KPI_list1:
        if res['gid'] == 1:
            gid_1_dic[res['mytitle']] = res['num']
        elif res['gid'] == 2:
            gid_2_dic[res['mytitle']] = res['num']
        elif res['gid'] == 3:
            gid_3_dic[res['mytitle']] = res['num']
        elif res['gid'] == 4:
            gid_4_dic[res['mytitle']] = res['num']

    elif res['mytitle'] in KPI_list2:
        global_dic[res['mytitle']] = res['n']


#print global_dic

SelectSQL = "(SELECT 'PreGame30DaysAddMoney' AS mytitle, gid,COUNT(1) AS cnt, now() AS data_time FROM g_leajoy.g_pay_order WHERE atime>=UNIX_TIMESTAMP(FROM_UNIXTIME(UNIX_TIMESTAMP()-86400*30,'%Y-%m-%d')) and gid>0 GROUP BY gid) UNION (SELECT 'PreOnlineServerCount' AS mytitle, gid, COUNT(1) AS cnt, now() AS data_time FROM g_leajoy.g_game_server WHERE `status`=1 and gid>0 GROUP BY gid) ;"

SelectRes = mysql_conf.sql_exec(DB_HOST, DB_USER, DB_PASSWD, DB_PORT, DB_DATABASE, DB_CHAR_SET, SelectSQL)

for res in SelectRes['table_result']:
    gid_dic = locals()['gid_' + str(int(res['gid'])) + '_dic']
    gid_dic[res['mytitle']] = res['cnt']

SelectPaySQL = "select concat(p.gid, '-', DATE(FROM_UNIXTIME(p.paytime))) as myid, count(distinct p.uid) as dctusercount, sum(p.gmoney) as gmoney, count(p.uid) as usercount, sum(p.gmoney)/count(distinct p.uid) as apru, p.gid as gameid, g.title as gamename, unix_timestamp(DATE(FROM_UNIXTIME(p.paytime))) as mydate from  g_pay_order p join g_game g on p.gid = g.gid where p.status = 4 and DATE(FROM_UNIXTIME(p.paytime)) = DATE_SUB(curdate(), INTERVAL 1 DAY) group by p.gid, DATE(FROM_UNIXTIME(p.paytime)) order by  DATE(FROM_UNIXTIME(p.paytime));"

SelectPayRes = mysql_conf.sql_exec(DB_HOST, DB_USER, DB_PASSWD, DB_PORT, DB_DATABASE, DB_CHAR_SET, SelectPaySQL)

for payres in SelectPayRes['table_result']:
    gid_dic = locals()['gid_' + str(int(payres['gameid'])) + '_dic']
    gid_dic['dctusercount'] = payres['dctusercount']
    gid_dic['gmoney'] = payres['gmoney']
    gid_dic['usercount'] = payres['usercount']
    gid_dic['apru'] = payres['apru']


datetimes = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y-%m-%d")
time = (datetime.date.today() - datetime.timedelta(days=2)).strftime("%Y-%m-%d")
times = '%sT16:00:00.000Z' % time

for GID, GN in GameIdDic.items():
    Ids = "%s-%s" % (GID, datetimes)
    # GetRes = GetElasticsearch(ElkAddress, LogstatshIndex, PreGameDocType, Ids)
    gid_dic = locals()['gid_' + str(GID) + '_dic']
    # print GetRes


    # print GameIdDic[GID].decode(encoding='UTF-8')
    TitileCommonDoc = {'gameid': int(GID), 'myid': Ids,
                     '@timestamp': times, 'gamename': GameIdDic[GID].decode(encoding='UTF-8')}
    InputBody = dict(TitileCommonDoc, **gid_dic)
    InputElasticsearch(ElkAddress, LogstatshIndex, 'None', PreGameDocType, Ids, InputBody)


Ids = 'sum-%s' % datetimes
SumInputBody = dict({'myid': Ids, '@timestamp': times}, **global_dic)
InputElasticsearch(ElkAddress, LogstatshIndex, 'None', PreGameDocType, Ids, SumInputBody)