# -*- coding: utf-8 -*-
__author__ = 'Abbott'

# 指标已经修改过

from game_common import *


BeforedatetimeDic = {"start": 1, "end": 1, "switch": "on"}

# DateDic = {"today": 0, "beforedate": BeforedateList, "beforedatepoint": 1, "beforedatetime": BeforedatetimeDic}
DateDic = {"type": "normal", "beforedatepoint": 1}

if BeforedatetimeDic['switch'] == "on":
    for num in range(BeforedatetimeDic['start'], (BeforedatetimeDic['end'] + 1)):
        KPI = 'dctusercount'
        SelectSQL = "select '%s' AS mytitle, count(distinct p.uid) as cnt, now() AS data_time, p.gid as gid, g.title as gamename from g_pay_order p join g_game g on p.gid = g.gid where p.status = 4 and p.paytime > UNIX_TIMESTAMP(concat(DATE(DATE_SUB(curdate(), INTERVAL %d DAY)), ' 00:00:00')) AND p.paytime < UNIX_TIMESTAMP(concat(DATE(DATE_SUB(curdate(), INTERVAL %d DAY)), ' 23:59:59')) and p.gid > 0 group by p.gid;"
        SelectSQL = SelectSQL % (KPI, num, num)
        print SelectSQL

        DateDic['beforedatepoint'] = int(num)
        print DateDic
        GameElkSqlCommon(KPI, SelectSQL, DateDic['beforedatepoint'])