# -*- coding: utf-8 -*-
__author__ = 'Abbott'

import datetime
from elasticsearch import Elasticsearch
import mysqlconf

mysql_conf = mysqlconf.mysql_connect()
import time

insert_sql = "insert into discuz_access_stat(domain_name, access_pv, access_ip, stat_date) value ('%s', '%d', '%d', '%s')"

# Get time row
times = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y.%m.%d")
# times = '2015.10.25'

# Connect elasticsearch API
es = Elasticsearch("http://172.16.31.100:9200/")

# Number of query result data
max_result_number = 0

starttime = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y-%m-%d 00:00:00")
endtime = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%Y-%m-%d 23:59:59")

starttimestamp = "%s000" % int(time.mktime(time.strptime(starttime, '%Y-%m-%d %H:%M:%S')))
endtimestamp = "%s999" % int(time.mktime(time.strptime(endtime, '%Y-%m-%d %H:%M:%S')))

# Data index name
#logstash_index = 'logstash-%s' % times
logstash_index = 'logstash-*'

# send elasticsearch API mapping
body = {
    "size": 0,
    "query": {
        "filtered": {
            "query": {
                "query_string": {
                    #          "query": 'request:\"[.html$]\"',
                    "query": '*',
                    "analyze_wildcard": "true"
                }
            },
            "filter": {
                "bool": {
                    "must": [
                        {
                            "range": {
                                "@timestamp": {
                                    "gte": int(starttimestamp),
                                    "lte": int(endtimestamp)
                                }
                            }
                        }
                    ],
                    "must_not": []
                }
            }
        }
    },
    "aggs": {
        "mydate": {
            "date_histogram": {
                "field": "@timestamp",
                # "interval": "1h"
                "interval": "1d",
                "pre_zone": "+08:00",
                #        	"pre_zone_adjust_large_interval": "true",
                "min_doc_count": 1,
                #        	"extended_bounds": {
                #          		"min": 1445702400000,
                #          		"max": 1446307199999
                #        	}
            },
            "aggs": {
                "distinct_host": {
                    "terms": {
                        "field": "http_host.raw",
                        "size": 10,
                        "order": {
                        "_count": "desc"
                        }
                    },
                    "aggs": {
                        "cardinality_ip": {
                            "cardinality": {
                                "field": "clientip.raw"
                            },

                        }
                    }
                }

            }
        }
    }
}


# Execute elasticsearch search, res is result, u can use it that get ur rows
res = es.search(index=logstash_index, size=max_result_number, body=body)
#print res




# result list
result_list = res['aggregations']['mydate']['buckets']

#processing results
for result in result_list:
    datetimes = datetime.datetime.strptime(result['key_as_string'], '%Y-%m-%dT%H:%M:%S.%fZ').strftime(
        "%Y-%m-%d %H:%M:%S")
    for r in result['distinct_host']['buckets']:
        #save mysql
        mysql_conf.sql_exec(insert_sql % (r['key'], r['doc_count'], r['cardinality_ip']['value'], datetimes))
