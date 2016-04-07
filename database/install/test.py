# -*- coding: utf-8 -*-
# import sys
# reload(sys)
# import getopt
#
# __author__ = 'Abbott'
#
# try:
#     opts, args = getopt.getopt(sys.argv[2:], "v", ["instance-ports=", "mysql-user=", "base-prefix=", "data-prefix=", "log-prefix=",
#                                        "max-allowed-packet=", "max-binlog-size=", "binlog-cache-size=", "expire-logs-days=",
#                                        "slow-query-log=", "long-query-time=", "log-queries-not-using-indexes=", "key-buffer-size=",
#                                        "innodb-data-file-path=", "innodb-buffer-pool-size=", "innodb-log-file-size=", "innodb-log-buffer-size=",
#                                        "innodb-thread-concurrency=", "innodb-write-io-threads=", "innodb-read-io-threads=", "innodb_io_capacity=",
#                                        "max-connections=", "read-buffer-size=", "read-rnd-buffer-size=", "tmp-table-size=", "max-heap-table-size=",
#                                        "thread-cache-size=", "wait-timeout="])
# except getopt.GetoptError, err:
#     print str(err)
#
# print opts,"+++"
# print args,"---"
a = "*" * 50
INFO = "\033[1;33;40m%s\033[0m"
ERROR = "\033[1;31;40m%s\033[0m"
NOTICE = "\033[1;32;40m%s\033[0m"

print a