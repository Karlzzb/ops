import MySQLdb


class mysql_connect:

        def sql_exec(self, amont_sql):
                result_dic = {}
                try:
                        conn = MySQLdb.connect(host='192.168.10.227', user='root', passwd='6aLNeXuEZW0Sn74B', port=3306, db='svn_version')
                        cur = conn.cursor()
                        cur.execute(amont_sql)
                        conn.commit()
                        value = cur.fetchall()
                        field = cur.description
                        cur.close()
                        conn.close()
                        result_dic = {'result': 'True', 'value': value, 'field': field}
                        return result_dic
                except MySQLdb.Error, e:
                        err_msg = "Mysql Error Msg: %s" % e
                        result_dic = {'result': 'False', 'err_msg': err_msg}
                        return result_dic
