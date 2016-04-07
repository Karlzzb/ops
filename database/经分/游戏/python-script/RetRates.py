# -*- coding: utf-8 -*-
__author__ = 'Abbott'

from game_common import *
# 6 29

TemplateFile = 'RetRates.temp'
BeforedateList = [1, 3, 7, 30]
BeforedatetimeDic = {"start": 1, "end": 3, "switch": "on"}

#DateDic = {"today": 0, "beforedate": BeforedateList, "beforedatepoint": 1, "beforedatetime": BeforedatetimeDic}
DateDic = {"type": "rate", "today": 0, "beforedate": BeforedateList, "beforedatepoint": 1}

if BeforedatetimeDic['switch'] == "on":
    for num in range(BeforedatetimeDic['start'], (BeforedatetimeDic['end'] + 1)):
        DateDic['beforedatepoint'] = int(num)
        for rate in BeforedateList:
                RowCountRes = MongoRow(DateDic['beforedatepoint'])
                # if RowCountRes == True:
                DateDic['beforedate'] = int(rate)
                print DateDic

                if DateDic['beforedate'] == 1:
                        KPI = 'YdRetRates'
                else:
                        KPI = '%sDRetRates' % DateDic['beforedate']
                CheckRes = CheckRow(DateDic)
                if CheckRes == True:
                    JsFile = CopyTemplate(TemplateFile, DateDic)
                    GameElkCommon(KPI, JsFile, DateDic['beforedatepoint'])
