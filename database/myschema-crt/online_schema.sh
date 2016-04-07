#!/bin/sh


schema_crt(){
    SPY_DIR=$1
    SCHEMA_DIR=$2
    HOSTNAME=$3
    PORT=$4
    USERNAME=$5
    PASSWORD=$6
    #empting previous schema
    rm -rf $SCHEMA_DIR
    mkdir -p $SCHEMA_DIR
    
    #CREATE database schema one by one
    query_sql="SELECT SCHEMA_NAME FROM  information_schema.SCHEMATA WHERE SCHEMA_NAME <> 'analyze_db' AND  SCHEMA_NAME <> 'common_schema' AND SCHEMA_NAME <> 'information_schema' AND SCHEMA_NAME <> 'performance_schema' AND SCHEMA_NAME <> 'test' AND SCHEMA_NAME <> 'mysql';"
    dbs=`/usr/bin/mysql -h${HOSTNAME}   -P${PORT}   -u${USERNAME} -p${PASSWORD} -N -L -e "${query_sql}"`
    for db in $dbs
    do
        mkdir -p ${SCHEMA_DIR}/${db}
        /usr/bin/java -jar ${SPY_DIR}/schemaSpy.jar -dp ${SPY_DIR}/mysql-connector-java-5.1.18-bin.jar -t mysql  -db ${db} -host ${HOSTNAME}:${PORT}  -u ${USERNAME} -p ${PASSWORD} -charset UTF-8 -hq -o ${SCHEMA_DIR}/${db}
    done
}

#sso SCHEMA
schema_crt `pwd` /data/myschema-online/v-schema`date +%Y%m%d` caegi-v-mysql01 3366
