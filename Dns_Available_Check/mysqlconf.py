import MySQLdb

class mysql_connect:
        def sql_exec(self,amont_sql):
                try:
                        conn = MySQLdb.connect(host='127.0.0.1',user='root',passwd='password',db='dnscheck',port=3306)
                        cur = conn.cursor()
                        cur.execute(amont_sql)
                        conn.commit()
                        value = cur.fetchall()
                        cur.close()
                        conn.close()
                        return value
                except MySQLdb.Error,e:
                        print 'Mysql Error Msg:' ,e
