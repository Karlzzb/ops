# -*- coding: utf-8 -*-
__author__ = 'Abbott'

from game_common import *


BeforedatetimeDic = {"start": 1, "end": 1, "switch": "on"}

#DateDic = {"today": 0, "beforedate": BeforedateList, "beforedatepoint": 1, "beforedatetime": BeforedatetimeDic}
DateDic = {"type": "normal",  "beforedatepoint": 1}

if BeforedatetimeDic['switch'] == "on":
    for num in range(BeforedatetimeDic['start'], (BeforedatetimeDic['end'] + 1)):
        KPI = 'PreOnlineServerCount'
        SelectSQL = "%s' AS mytitle, gid, COUNT(1) AS cnt, now() AS data_time FROM g_leajoy.g_game_server WHERE status = 1 and gid > 0 GROUP BY gid;"
        SelectSQL = SelectSQL % KPI
        print SelectSQL

        DateDic['beforedatepoint'] = int(num)
        print DateDic
        GameElkSqlCommon(KPI, SelectSQL, DateDic['beforedatepoint'])