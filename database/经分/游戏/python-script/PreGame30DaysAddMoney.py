# -*- coding: utf-8 -*-
__author__ = 'Abbott'

from game_common import *

# 指标已经修改过

# start开始的前几个月，例如：1就是前一个月
BeforedatetimeDic = {"start": 1, "end": 1, "switch": "on"}

#DateDic = {"today": 0, "beforedate": BeforedateList, "beforedatepoint": 1, "beforedatetime": BeforedatetimeDic}
DateDic = {"type": "normal",  "beforedatepoint": 1}

if BeforedatetimeDic['switch'] == "on":
    for num in range(BeforedatetimeDic['start'], (BeforedatetimeDic['end'] + 1)):
        y = datetime.date.today().year
        m = datetime.date.today().month + 1 - num
        # d = datetime.date.today().day
        d = 1
        if d == 1:
            if m == 1:
                start_date = datetime.date(y - 1, 12, 1).strftime("%Y-%m-%d 00:00:00")
            else:
                start_date = datetime.date(y, m - 1, 1).strftime("%Y-%m-%d 00:00:00")
            end_date = datetime.date(y, m, 1).strftime("%Y-%m-%d 00:00:00")

            KPI = 'PreGame30DaysAddMoney'
            SelectSQL = "select '%s' AS mytitle, count(1), sum(a.money) as cnt, gid from g_pay_order a where a.status = 4 and gid > 0 and a.atime between unix_timestamp('%s') and unix_timestamp('%s') and not exists (select * from g_pay_order b where b.status = 4 and b.atime < unix_timestamp('%s') and b.uid = a.uid) group by gid;;"
            SelectSQL = SelectSQL % (KPI, start_date, end_date, start_date)
            print SelectSQL

            DateDic['beforedatepoint'] = int(num)
            TimeType = '30days'
            print DateDic
            GameElkSqlCommon(KPI, SelectSQL, DateDic['beforedatepoint'], TimeType)