# -*- coding: utf-8 -*-
import sys
reload(sys)
import getopt
import commands
import fileinput
import os

__author__ = 'Abbott'


INFO = "\033[1;33;40m%s\033[0m"
ERROR = "\033[1;31;40m%s\033[0m"
NOTICE = "\033[1;32;40m%s\033[0m"
LINE = "#" * 50
LINE_ERROR = "-" * 50

def CheckAndHelp(project_name, option):
    usage_help = '''Usage: python %s install [OPTION] [arg...]''' % project_name
    example = '''Example:

            Simple: python mysql_install.py install --instance-ports=3366
            Multiple instances: python mysql_install.py install --instance-ports=3366,3399,4466


            If you know enough to the MySQL, you can use configure area:

            Simple: python mysql_install.py install --instance-ports=3366  --max-allowed-packet=64M --long-query-time=1
            '''
    configure_usage = '''configure:

            SAFETY:

                    --max-allowed-packet     default:32M     max:1G

            BINARY LOGGING:

                    --max-binlog-size        default:128M    max:2G
                    --binlog-cache-size      default:2M      max:4M
                    --expire-logs-days       default:7       max:0

            LOGGING:
                    --slow-query-log         default:0       on:1            off:0
                    --long-query-time        default:1       max:0
                    --log-queries-not-using-indexes  default:0       on:1        off:0

            MyISAM:

                    --key-buffer-size        default:64M        max:system memory 20%

            INNODB:

                    --innodb-data-file-path     default:ibdata1:512M;ibdata2:256M:autoextend:max:10G
                    --innodb-buffer-pool-size   default:formula
                    --innodb-log-file-size      default:256M
                    --innodb-log-buffer-size    default:2M
                    --innodb-thread-concurrency default:CPU core * 2
                    --innodb-write-io-threads   default:CPU core
                    --innodb-read-io-threads    default:CPU core
                    --innodb_io_capacity        default:200     disk properties: 150 < general-disk < 500    SSD > 1000

            CACHES AND LIMITS:

                    --max-connections           default:500
                    --read-buffer-size          default:2M
                    --read-rnd-buffer-size      default:2M
                    --tmp-table-size            default:32M         max:system memory * 10%
                    --max-heap-table-size       default:32M         max:system memory * 10%
                    --thread-cache-size         default:max-connections * 10%
                    --wait-timeout              default:600'''

    install_usage = '''install:

            custom  install:

                    --instance-ports            default:3306
                    --mysql-user                default:mysql
                    --base-prefix               default:/opt/mysql
                    --data-prefix               default:/data/db
                    --log-prefix                default:/data/dblogs'''



    if option == "install" or option is None:
        usage = usage_help+"\n"+example+"\n"+install_usage+"\n"+configure_usage
        return usage

    else:
        usage = usage_help+"\n"+example+"\n"+install_usage+"\n"+configure_usage
        return usage


def CheckArgv(argvs):
    check_start_message = "Check Argument Start . . ."
    print LINE
    print INFO % check_start_message
    print LINE

    invalid_list = []
    result_dic = {}
    # print argvs,"???"
    try:
        opts, args = getopt.getopt(argvs, "v", ["instance-ports=", "mysql-user=", "base-prefix=", "data-prefix=", "log-prefix=",
                                           "max-allowed-packet=", "max-binlog-size=", "binlog-cache-size=", "expire-logs-days=",
                                           "slow-query-log=", "long-query-time=", "log-queries-not-using-indexes=", "key-buffer-size=",
                                           "innodb-data-file-path=", "innodb-buffer-pool-size=", "innodb-log-file-size=", "innodb-log-buffer-size=",
                                           "innodb-thread-concurrency=", "innodb-write-io-threads=", "innodb-read-io-threads=", "innodb_io_capacity=",
                                           "max-connections=", "read-buffer-size=", "read-rnd-buffer-size=", "tmp-table-size=", "max-heap-table-size=",
                                           "thread-cache-size=", "wait-timeout="])
        # print opts, "++"
        # print args, "--"
        result_dic = {'result_state': 'true', 'result': opts}
    except getopt.GetoptError, err:
        # print err
        err_msg = "     use -h or -help check"
        result_dic = {'result_state': 'false', 'result': str(err)+"\n\n"+err_msg}

    # print result_dic
    return result_dic


def CreateConfigurationFiles(configure):
    # print configure

    instance_ports = '3306'
    mysql_user = 'mysql'
    base_prefix = '/opt/mysql'
    data_prefix = '/data/db'
    log_prefix = '/data/dblogs'
    max_allowed_packet = '32M'
    max_binlog_size = '128M'
    binlog_cache_size = '2M'
    expire_logs_days = '7'
    slow_query_log = '0'
    long_query_time = '1'
    log_queries_not_using_indexes = '0'
    key_buffer_size = '64M'
    innodb_data_file_path = 'ibdata1:512M;ibdata2:256M:autoextend:max:10G'
    innodb_log_file_size = '256M'
    innodb_log_buffer_size = '2M'
    innodb_io_capacity = '200'
    max_connections = '500'
    read_buffer_size = '2M'
    read_rnd_buffer_size = '2M'
    tmp_table_size = '32M'
    max_heap_table_size = '32M'
    wait_timeout = '600'
    system_free_memory = commands.getstatusoutput("cat /proc/meminfo | grep MemFree|awk '{print $(NF-1)}'")[1]
    # system_total_memory = '1048576'
    system_total_memory = commands.getstatusoutput("cat /proc/meminfo | grep MemTotal|awk '{print $(NF-1)}'")[1]
    sort_buffer_size = '2M'
    # innodb_buffer_pool_size = '128M'
    innodb_buffer_pool_size = '%sM' % int((int(system_free_memory)/1024 - int(key_buffer_size[:-1]) - int(max_connections) * (int(sort_buffer_size[:-1]) + int(read_buffer_size[:-1]) + int(binlog_cache_size[:-1])) - int(max_connections) - int(max_binlog_size[:-1]) - int(tmp_table_size[:-1])) * 0.95)
    if int(innodb_buffer_pool_size[:-1]) < 0:
        innodb_buffer_pool_size = '512M'
    cpu_core = commands.getstatusoutput("cat /proc/cpuinfo | grep processor | wc -l")[1]
    # innodb_thread_concurrency = '8'
    # innodb_write_io_threads = '4'
    # innodb_read_io_threads = '4'
    innodb_thread_concurrency = '%s' % (int(cpu_core) * 2)
    innodb_write_io_threads = '%s' % (int(cpu_core))
    innodb_read_io_threads = '%s' % (int(cpu_core))
    thread_cache_size = '%s' % int(int(max_connections) * 0.1)
    default_argv = {'--instance-ports': instance_ports, '--mysql-user': mysql_user, '--base-prefix': base_prefix, '--data-prefix': data_prefix,
                  '--log-prefix': log_prefix, '--max-allowed-packet': max_allowed_packet, '--max-binlog-size': max_binlog_size, '--binlog-cache-size': binlog_cache_size,
                  '--expire-logs-days': expire_logs_days, '--slow-query-log': slow_query_log, '--long-query-time': long_query_time, '--log-queries-not-using-indexes': log_queries_not_using_indexes,
                  '--key-buffer-size': key_buffer_size, '--innodb-data-file-path': innodb_data_file_path,
                  '--innodb-buffer-pool-size': innodb_buffer_pool_size, '--innodb-log-file-size': innodb_log_file_size, '--innodb-log-buffer-size': innodb_log_buffer_size,
                  '--innodb-thread-concurrency': innodb_thread_concurrency, '--innodb-write-io-threads': innodb_write_io_threads, '--innodb-read-io-threads': innodb_read_io_threads,
                  '--innodb_io_capacity': innodb_io_capacity, '--max-connections': max_connections, '--read-buffer-size': read_buffer_size, '--read-rnd-buffer-size': read_rnd_buffer_size,
                  '--tmp-table-size': tmp_table_size, '--max-heap-table-size': max_heap_table_size, '--thread-cache-size': thread_cache_size,
                  '--wait-timeout': wait_timeout
                  }

    for k, v in configure:
        if k == "--max-allowed-packet":
            if int(v[:-1]) < 1000:
                default_argv[k] = v
                continue
            else:
                default_argv[k] = max_allowed_packet
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue

        elif k == "--max-binlog-size":
            if int(v[:-1]) < 2000:
                default_argv[k] = v
                continue
            else:
                default_argv[k] = max_binlog_size
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue

        elif k == "--binlog-cache-size":
            if 2 <= int(v[:-1]) <= 4:
                default_argv[k] = v
                continue
            else:
                default_argv[k] = binlog_cache_size
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue

        elif k == "--key-buffer-size":
            if int(v[:-1]) <= int(int(system_total_memory)/1024*0.2):
                default_argv[k] = v
                continue
            else:
                default_argv[k] = key_buffer_size
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue

        elif k == "--tmp-table-size":
            if int(v[:-1]) <= int(int(system_total_memory)/1024*0.1):
                default_argv[k] = v
                continue
            else:
                default_argv[k] = tmp_table_size
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue

        elif k == "--max-heap-table-size":
            if int(v[:-1]) <= int(int(system_total_memory)/1024*0.1):
                default_argv[k] = v
                continue
            else:
                default_argv[k] = max_heap_table_size
                msg = "%s   The Value Is Unavailable, Change Default Value" % k
                print LINE
                print NOTICE % msg
                print LINE
                continue
        else:
            default_argv[k] = v
    # print default_argv
    check_finish_message = "Check Argument Finish"
    print LINE
    print INFO % check_finish_message
    print LINE
    return default_argv


def CheckReplaceFile(configure_dic):

    check_environment_start_message = "Check Environment Start . . ."
    print LINE
    print INFO % check_environment_start_message
    print LINE

    data_file_path = "%s/mysql%s" % (configure_dic['--data-prefix'], configure_dic['--instance-ports'])
    log_file_path = "%s/mysql%s" % (configure_dic['--log-prefix'], configure_dic['--instance-ports'])
    local_file = 'my.cnf'
    # if os.path.exists(configure_dic['--base-prefix']):
    #     pass
    # else:
    #     commands.getstatusoutput("mkdir -p %s" % configure_dic['--base-prefix'])
    #     print "The %s create success" % configure_dic['--base-prefix']

    if os.path.exists(configure_dic['--data-prefix']):
        pass
    else:
        commands.getstatusoutput("mkdir -p %s" % configure_dic['--data-prefix'])
        msg = "The Path: %s Create Success" % configure_dic['--data-prefix']
        print LINE
        print NOTICE % msg
        print LINE

    if os.path.exists(configure_dic['--log-prefix']):
        pass
    else:
        commands.getstatusoutput("mkdir -p %s" % configure_dic['--log-prefix'])
        msg = "The Path: %s Create Success" % configure_dic['--log-prefix']
        print LINE
        print NOTICE % msg
        print LINE

    if os.path.exists(data_file_path):
        msg = "[Error]: The MySQL Instance Port: %s exists, Pleace Change" % configure_dic['--instance-ports']
        print LINE_ERROR
        print ERROR % msg
        print LINE_ERROR
        sys.exit()
    else:
        commands.getstatusoutput("mkdir -p %s" % data_file_path)
        msg = "The Path: %s Create Success" % data_file_path
        print LINE
        print NOTICE % msg
        print LINE

    if os.path.exists(log_file_path):
        msg = "[Error]: The MySQL Instance Port: %s exists, Pleace Change" % configure_dic['--instance-ports']
        print LINE_ERROR
        print ERROR % msg
        print LINE_ERROR
        sys.exit()
    else:
        commands.getstatusoutput("mkdir -p %s" % log_file_path)
        msg = "The Path: %s Create Success" % log_file_path
        print LINE
        print NOTICE % msg
        print LINE

    if int(commands.getstatusoutput("id %s" % configure_dic['--mysql-user'])[0]) == 0:
        pass
    else:
        commands.getstatusoutput("useradd %s" % configure_dic['--mysql-user'])
        msg = "Add MySQL User: %s Succsee" % configure_dic['--mysql-user']
        print LINE
        print NOTICE % msg
        print LINE

    check_environment_finish_message = "Check Environment Finish"
    print LINE
    print INFO % check_environment_finish_message
    print LINE

    create_file_start_message = "Create MySQL Configuration File Start . . ."
    print LINE
    print INFO % create_file_start_message
    print LINE
    cp_file = commands.getstatusoutput("cp -fr %s  %s" % (local_file, data_file_path))
    if int(cp_file[0]) == 0:
        pass
    else:
        print cp_file[1]

    mysql_file = os.path.join(data_file_path, local_file)
    for k, v in configure_dic.items():
        commands.getstatusoutput("sed -i 's#$%s#%s#g' %s" % (k, v, mysql_file))

    result_dic = {'result_state': "true", 'result': mysql_file}

    create_file_finish_message = "Create MySQL Configuration File Finish"
    print LINE
    print INFO % create_file_finish_message
    print LINE

    return result_dic


def InstallMysql(install_cfg):
    install_start_message = "Install MySQL Start Port: %s. . ." % install_cfg['--instance-ports']
    print LINE
    print INFO % install_start_message
    print LINE

    rootpwd="myadmin"
    mysql_conf_name = "my.cnf"
    old_mysql_file = "/etc/my.cnf"
    data_file_path = "%s/mysql%s" % (install_cfg['--data-prefix'], install_cfg['--instance-ports'])
    log_file_path = "%s/mysql%s" % (install_cfg['--log-prefix'], install_cfg['--instance-ports'])
    data_dir = ['data', 'mysqltmp']
    log_dir = ['binlogs', 'slowlogs', 'relaylogs']
    install_dir = "/opt"
    mysql_src_name = 'mysql-5.6.22-linux-glibc2.5-x86_64'
    mysql_src_tar = 'mysql-5.6.22-linux-glibc2.5-x86_64.tar.gz'
    mysql_run_script = 'mysql'
    mysql_safe_file = '%s/bin/mysqld_safe' % install_cfg['--base-prefix']
    mysql_conf_file = os.path.join(data_file_path, mysql_conf_name)
    mysql_run_file = os.path.join(data_file_path, mysql_run_script)
    sys_run_file = "/etc/init.d/mysql%s" % install_cfg['--instance-ports']
    mysql_sock = "%s/mysql%s/mysql%s.sock" % (install_cfg['--data-prefix'], install_cfg['--instance-ports'], install_cfg['--instance-ports'])

    if os.path.exists(install_cfg['--base-prefix']) and os.path.exists(os.path.join(install_dir, mysql_src_name)):
        pass
    else:
        if os.path.exists(mysql_src_tar):
            tar_mysql = commands.getstatusoutput("tar zxf %s -C %s" % (mysql_src_tar, install_dir))
            if int(tar_mysql[0]) == 0:
                commands.getstatusoutput("ln -s %s %s" % (os.path.join(install_dir, mysql_src_name), install_cfg['--base-prefix']))
        else:
            msg = "[Error]: %s is not exist, pls check it." % mysql_src_tar
            print LINE_ERROR
            print ERROR % msg
            print LINE_ERROR
            sys.exit()

    create_environment_start_message = "Create MySQL Environment Start . . ."
    print LINE
    print INFO % create_environment_start_message
    print LINE

    if os.path.exists('/usr/sbin/lsof'):
        pass
    else:
        lsof_install = commands.getstatusoutput("yum install lsof -y")
        if int(lsof_install[0]) != 0:
            msg = "[Error]: Failed To Install Lsof"
            print LINE_ERROR
            print ERROR % msg
            print LINE_ERROR
            sys.exit()

    if os.path.exists('/usr/bin/perl'):
        pass
    else:
        perl_install = commands.getstatusoutput("yum install perl -y")
        if int(perl_install[0]) != 0:
            msg = "[Error]: Failed To Install Perl"
            print LINE_ERROR
            print ERROR % msg
            print LINE_ERROR
            sys.exit()

    if os.path.exists('/lib/libaio.so.1'):
        pass
    else:
        libaio_install = commands.getstatusoutput("yum install libaio-devel libaio -y")
        if int(libaio_install[0]) != 0:
            msg = "[Error]: Failed To Install Libaio"
            print LINE_ERROR
            print ERROR % msg
            print LINE_ERROR
            sys.exit()

    commands.getstatusoutput("sed -i 's#/usr/local/mysql#'%s'#g' %s" % (install_cfg['--base-prefix'], mysql_safe_file))

    if os.path.exists(old_mysql_file):
        commands.getstatusoutput("rm -fr %s" % old_mysql_file)



    for data in data_dir:
        commands.getstatusoutput("mkdir -p %s/%s" % (data_file_path, data))

    for log in log_dir:
        commands.getstatusoutput("mkdir -p %s/%s" % (log_file_path, log))

    commands.getstatusoutput("cp -fr %s %s" % (mysql_run_script, data_file_path))
    commands.getstatusoutput("chown -R mysql.mysql %s" % data_file_path)
    commands.getstatusoutput("chown -R mysql.mysql %s" % log_file_path)

    commands.getstatusoutput("sed -i 's#{MYCNF-DIR}#'%s'#g' %s" % (mysql_conf_file, mysql_run_file))
    commands.getstatusoutput("sed -i 's#{BIN-DIR}#'%s/bin'#g' %s" % (install_cfg['--base-prefix'], mysql_run_file))
    commands.getstatusoutput("sed -i 's#{PID-DIR}#'%s/mysql.pid'#g' %s" % (log_file_path, mysql_run_file))

    commands.getstatusoutput("cp -fr %s %s" % (mysql_run_file, sys_run_file))

    commands.getstatusoutput("/bin/rm -f /etc/init.d/mysqld")

    commands.getstatusoutput("chmod 700 %s" % sys_run_file)

    commands.getstatusoutput("/sbin/chkconfig add mysql%s" % install_cfg['--base-prefix'])
    commands.getstatusoutput("/sbin/chkconfig mysql%s on" % install_cfg['--base-prefix'])
    commands.getstatusoutput("find %s -name mysql -exec chmod 700 {} \;" % data_file_path)

    mysql_value = commands.getstatusoutput("grep -w mysql%s /etc/profile | wc -l" % install_cfg['--base-prefix'])
    if int(mysql_value[1]) == 0:
        commands.getstatusoutput("echo alias mysql%s='\"'%s/bin/mysql --defaults-file=%s -S %s'\"' >> /etc/profile" % (install_cfg['--instance-ports'], install_cfg['--base-prefix'], mysql_conf_file, mysql_sock))


    create_environment_finish_message = "Create MySQL Environment Finish"
    print LINE
    print INFO % create_environment_finish_message
    print LINE

    initialize_mysql_start_message = "Initialize MySQL . . ."
    print LINE
    print INFO % initialize_mysql_start_message
    print LINE

    mysql_initialize = commands.getstatusoutput("%s/scripts/mysql_install_db --basedir=%s --defaults-file=%s --user=mysql --explicit_defaults_for_timestamp >/dev/null" % (install_cfg['--base-prefix'], install_cfg['--base-prefix'], mysql_conf_file))
    if int(mysql_initialize[0]) != 0:
        print mysql_initialize[1]
        msg = "[Error]: Failed to initialize MySQL data directory. Port: %s" % install_cfg['--instance-ports']
        print LINE_ERROR
        print ERROR % msg
        print LINE_ERROR
        sys.exit()

    initialize_mysql_finish_message = "Initialize MySQL Finish"
    print LINE
    print INFO % initialize_mysql_finish_message
    print LINE

    mysql_start_message = "MySQL Start . . ."
    print LINE
    print INFO % mysql_start_message
    print LINE

    mysql_start = commands.getstatusoutput("%s start" % sys_run_file)
    if int(mysql_start[0]) != 0:
        print mysql_start[1]
        print "MySQL failed to start on %s" % install_cfg['--instance-ports']
        sys.exit()

    mysql_finish_message = "MySQL Start Finish"
    print LINE
    print INFO % mysql_finish_message
    print LINE

    mysql_privileges_start_message = "Cfg MySQL(%s) Privileges Start . . ." % install_cfg['--instance-ports']
    print LINE
    print INFO % mysql_privileges_start_message
    print LINE

    cfg_mysql_privileges = commands.getstatusoutput("/usr/sbin/lsof -i :%s &>/dev/null && %s/bin/mysqladmin -u root password '%s' -S %s >/dev/null 2>&1" % (install_cfg['--instance-ports'], install_cfg['--base-prefix'], rootpwd, mysql_sock))
    if int(cfg_mysql_privileges[0]) != 0:
        print cfg_mysql_privileges[1]
        msg = "[Error]: Failed to set MySQL root password! Please do it manually."
        print LINE_ERROR
        print ERROR % cfg_mysql_privileges[1]
        print ERROR % msg
        print LINE_ERROR
        sys.exit()

    mysql_privileges_finish_message = "Cfg MySQL(%s) Privileges Finish" % install_cfg['--instance-ports']
    print LINE
    print INFO % mysql_privileges_finish_message
    print LINE


    check_mysql_start_message = "Check MySQL(%s) Connected to port Start" % install_cfg['--instance-ports']
    print LINE
    print INFO % check_mysql_start_message
    print LINE

    check_mysql = commands.getstatusoutput('''%s/bin/mysql -uroot -p%s -S %s -Bse "SELECT concat(version(),' started in %s port')" ''' % (install_cfg['--base-prefix'], rootpwd, mysql_sock, install_cfg['--instance-ports']))
    if int(check_mysql[0]) != 0:
        msg = "[Error]: Failed to connect to port %s! You need to create MySQL monitoring user manually." % install_cfg['--instance-ports']
        print LINE_ERROR
        print ERROR % check_mysql[1]
        print ERROR % msg
        print LINE_ERROR
        sys.exit()
    else:
        msg = "Connected to port %s successful." % install_cfg['--instance-ports']
        print LINE
        print NOTICE % msg
        print LINE

    check_mysql_finish_message = "Check MySQL(%s) Connected to port Finish" % install_cfg['--instance-ports']
    print LINE
    print INFO % check_mysql_finish_message
    print LINE

    create_user_start_message = "Creating MySQL Monitoring User Start..."
    print LINE
    print INFO % create_user_start_message
    print LINE

    create_mysql_monitor = commands.getstatusoutput('''%s/bin/mysql -uroot -p%s -S %s -Bse "GRANT PROCESS,REPLICATION CLIENT ON *.* TO 'monitoring'@'127.0.0.1 identified by '8e3d7855e5681ee463e28394c2bb33043e65dbb9';FLUSH PRIVILEGES;" ''' % (install_cfg['--base-prefix'], rootpwd, mysql_sock))

    create_user_finish_message = "Creating MySQL Monitoring User Finish..."
    print LINE
    print INFO % create_user_finish_message
    print LINE

    install_rpl_start_message = "Install rpl_semi_sync on %s  Start.... " % install_cfg['--instance-ports']
    print LINE
    print INFO % install_rpl_start_message
    print LINE

    install_rpl_semi_sync = commands.getstatusoutput('''%s/bin/mysql -uroot -p%s -S %s -e "INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so';" ''' % (install_cfg['--base-prefix'], rootpwd, mysql_sock))
    if int(install_rpl_semi_sync[0]) != 0:
        print install_rpl_semi_sync[1]
        msg = "[Error]: Install rpl_semi_sync failed on %s" % install_cfg['--instance-ports']
        print LINE_ERROR
        print ERROR % install_rpl_semi_sync[1]
        print ERROR % msg
        print LINE_ERROR
        sys.exit()

    install_rpl_finish_message = "Install rpl_semi_sync on %s  Finish.... " % install_cfg['--instance-ports']
    print LINE
    print INFO % install_rpl_finish_message
    print LINE

    return "true"

if __name__ == '__main__':
    if os.geteuid() != 0:
        msg = "[Error]: This script must be run as root. Aborting."
        print LINE_ERROR
        print ERROR % msg
        print LINE_ERROR
        sys.exit()
    project_name = sys.argv[0].split("/")[-1]
    if len(sys.argv) == 2:
        if sys.argv[1] == "install":
            # if not sys.argv[2] or sys.argv[2] == "-h" or sys.argv[2] == "--help":
            help_argv = "install"
        elif sys.argv[1] == "-h" or sys.argv[1] == "--help":
            help_argv = None
        else:
            help_argv = sys.argv[1:]
        configure_help = CheckAndHelp(project_name, help_argv)
        print configure_help
    # elif len(sys.argv) == 3:
    #     if sys.argv[1] == "install":
    #         if sys.argv[2] == "-h" or sys.argv[2] == "--help":
    #             help_argv = "install"
    #         else:
    #             check_argv = sys.argv[2:]
    #     else:
    #         help_argv = sys.argv[1:]
    elif len(sys.argv) >= 3:
        if sys.argv[1] == "install":
            check_argv = sys.argv[2:]
            check_result = CheckArgv(check_argv)
            # print check_result,"++"
            if check_result['result_state'] == "false":
                print check_result['result']
            else:
                create_result = CreateConfigurationFiles(check_result['result'])
                # print create_result, "++"
                for port in create_result['--instance-ports'].split(','):
                    create_result['--instance-ports'] = port
                    create_file_result = CheckReplaceFile(create_result)
                    if create_file_result['result_state'] == "true":
                        msg = "Configuration File %s Create Success" % create_file_result['result']
                        print LINE
                        print INFO % msg
                        print LINE

                        install_result = InstallMysql(create_result)
                        if install_result == "true":
                            commands.getstatusoutput('source /etc/profile')
                            install_finish_message = "Install MySQL Finish Port: %s" % port
                            print LINE
                            print INFO % install_finish_message
                            print LINE
        else:
            help_argv = sys.argv[1:]
            configure_help = CheckAndHelp(project_name, help_argv)
            print configure_help

    elif len(sys.argv) == 1:
        help_argv = None
        configure_help = CheckAndHelp(project_name, help_argv)
        print configure_help

