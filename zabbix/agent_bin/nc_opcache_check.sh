#!/bin/bash
# Zabbix monitoring script for PHP-FPM Opcache 

# please define opcache status page 
OPCACHE_STATUS_URL="http://127.0.0.1:8088/opcache.php"

ZABBIX_REQ="$1"
ELINKS_BIN="/usr/bin/elinks"
TMP_DIR="/home/zabbix/tmp"
OPCACHE_TMP="$TMP_DIR/opcache.tmp"

# Error handling:
ERROR_USER="-0.90"
ERROR_OPTIONS="-0.91"
ERROR_DATA="-0.92"
ERROR_PERMISSION="-0.93"
ERROR_ELINKS="-0.94"

if [ ! -x $ELINKS ]; then
    echo $ERROR_ELINKS
    exit 1
fi

if [ $(whoami) != "zabbix" ]; then
    echo $ERROR_USER 
    exit 1
fi

if [ ! -w "$TMP_DIR" ]; then
    echo $ERROR_PERMISSION
    exit 1
fi

status_generate() {
    mkdir -p /home/zabbix/tmp
    OPCACHE_STATS=$($ELINKS_BIN --dump $OPCACHE_STATUS_URL 2> /dev/null)

    if [ $? -ne 0 -o -z "$OPCACHE_STATS" ]; then
        echo $ERROR_DATA
        exit 1
    fi

    echo "$OPCACHE_STATS" > $OPCACHE_TMP
    if [ $? -ne 0 ]; then
        echo "$ERROR_PERMISSION"
        exit 1
    fi


    if [ $(grep 'Configuration' $OPCACHE_TMP | wc -l) -eq 0 ]; then
        echo $ERROR_DATA
        exit 1
    fi

    case "$1" in
        enabled)                        awk '/opcache.enable/ {print $NF;exit}'             $OPCACHE_TMP;;
        max_memory)                     awk '/opcache.memory_consumption/ {print $NF}'      $OPCACHE_TMP;;
        max_accelerated_files)          awk '/opcache.max_accelerated_files/ {print $NF}'   $OPCACHE_TMP;;
        cache_full)                     awk '/cache_full/ {print $NF}'                      $OPCACHE_TMP;;
        used_memory)                    awk '/used_memory/ {print $NF;exit}'                $OPCACHE_TMP;;
        free_memory)                    awk '/free_memory/ {print $NF;exit}'                $OPCACHE_TMP;;
        num_cached_scripts)             awk '/num_cached_scripts/ {print $NF}'              $OPCACHE_TMP;;
        oom_restarts)                   awk '/oom_restarts/ {print $NF}'                    $OPCACHE_TMP;;
        hash_restarts)                  awk '/hash_restarts/ {print $NF}'                   $OPCACHE_TMP;;
        opcache_hit_rate)               awk '/opcache_hit_rate/ {print $NF}'                $OPCACHE_TMP | sed 's/%//';;
        *)                              echo $ERROR_OPTIONS; exit 1;;
    esac
    exit 0
}

if [ ! -f "$OPCACHE_TMP" -o "$2" == "-f" ]; then
    status_generate "$ZABBIX_REQ"
else
    NOW=$(date +%s)
    LAST_CTIME=$(stat -c %Y $OPCACHE_TMP)

    if [ $((NOW - LAST_CTIME)) -lt 30 ]; then
        if [ $(grep 'Configuration' $OPCACHE_TMP | wc -l) -eq 0 ]; then
            echo $ERROR_DATA
            exit 1
        fi
        case "$1" in
            enabled)                        awk '/opcache.enable/ {print $NF;exit}'             $OPCACHE_TMP;;
            max_memory)                     awk '/opcache.memory_consumption/ {print $NF}'      $OPCACHE_TMP;;
            max_accelerated_files)          awk '/opcache.max_accelerated_files/ {print $NF}'   $OPCACHE_TMP;;
            cache_full)                     awk '/cache_full/ {print $NF}'                      $OPCACHE_TMP;;
            used_memory)                    awk '/used_memory/ {print $NF;exit}'                $OPCACHE_TMP;;
            free_memory)                    awk '/free_memory/ {print $NF;exit}'                $OPCACHE_TMP;;
            num_cached_scripts)             awk '/num_cached_scripts/ {print $NF}'              $OPCACHE_TMP;;
            oom_restarts)                   awk '/oom_restarts/ {print $NF}'                    $OPCACHE_TMP;;
            hash_restarts)                  awk '/hash_restarts/ {print $NF}'                   $OPCACHE_TMP;;
            opcache_hit_rate)               awk '/opcache_hit_rate/ {print $NF}'                $OPCACHE_TMP | sed 's/%//';;
            *)                              echo $ERROR_OPTIONS; exit 1;;
        esac
    else
        status_generate "$ZABBIX_REQ"
    fi
fi
exit 0
