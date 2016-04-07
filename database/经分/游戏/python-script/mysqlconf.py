# -*- coding: utf-8 -*-
__author__ = 'Abbott'
import MySQLdb
import datetime
import decimal

class mysql_connect:

        def sql_exec(self, host, user, passwd, port, db, charset, amont_sql):
                result_dic = {}
                try:
                        conn = MySQLdb.connect(host=host, user=user, passwd=passwd, port=port, db=db, charset=charset)
                        cur = conn.cursor()
                        cur.execute(amont_sql)
                        conn.commit()
                        value = cur.fetchall()
                        field = cur.description
                        cur.close()
                        conn.close()
                        result_dic = {'result': 'True', 'value': value, 'field': field}
                        if result_dic['result'] == 'True':
                            mysql_exe = result_dic['value']
                            mysql_des = result_dic['field']
                            datas_list = []
                            for rows in mysql_exe:
                                data_list = []
                                for row in rows:
                                    if isinstance(row, datetime.date):
                                        row = row.strftime("%Y-%m-%d %H:%M:%S")
                                    elif isinstance(row, decimal.Decimal):
                                        row = float(row)
                                    data_list.append(row)
                                datas_list.append(data_list)
                            mysql_rows = datas_list
                            field_list = []
                            for field in mysql_des:
                                field_list.append(field[0])

                            mysql_rows_list = []
                            for res in mysql_rows:
                                res_dic = {}
                                for i, v in enumerate(res):
                                    res_dic[field_list[i]] = v
                                mysql_rows_list.append(res_dic)
                            return_dic = {"result_status": "ok", "table_result": mysql_rows_list, "table_field": field_list}
                        else:
                            err_msg = result_dic['err_msg']
                            return_dic = {"result_status": "no", "table_result": err_msg}
                        return return_dic
                except MySQLdb.Error, e:
                        err_msg = "Mysql Error Msg: %s" % e
                        result_dic = {'result': 'False', 'err_msg': err_msg}
                        # return result_dic

