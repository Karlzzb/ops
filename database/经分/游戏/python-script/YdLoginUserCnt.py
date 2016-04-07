# -*- coding: utf-8 -*-
__author__ = 'Abbott'

from game_common import *


TemplateFile = 'YdLoginUserCnt.temp'

BeforedatetimeDic = {"start": 1, "end": 1, "switch": "on"}

#DateDic = {"today": 0, "beforedate": BeforedateList, "beforedatepoint": 1, "beforedatetime": BeforedatetimeDic}
DateDic = {"type": "normal",  "beforedatepoint": 1}

if BeforedatetimeDic['switch'] == "on":
    for num in range(BeforedatetimeDic['start'], (BeforedatetimeDic['end'] + 1)):
        KPI = 'YdLoginUserCnt'
        DateDic['beforedatepoint'] = int(num)
        print DateDic
        JsFile = CopyTemplate(TemplateFile, DateDic)
        print JsFile
        GameElkCommon(KPI, JsFile, DateDic['beforedatepoint'])