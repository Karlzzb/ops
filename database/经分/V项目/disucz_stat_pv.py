#!/usr/bin/python
# -*- coding: utf-8 -*-

import random
import string
from datetime import datetime, timedelta
import re
from elasticsearch import Elasticsearch
from collections import Counter


es = Elasticsearch("http://10.1.110.25:9200/")

bankuai_dic = {'100': 'AV',
               '400': 'Radio',
               '96': 'Zipai'
               }

bk_list = []

bk_count_dic = {}

max_result_number = 1000

logstash_index = "logstash-*"

target_index = "test"

init_doc = {'timestamp': datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
            'bankuai': 'init'
            }

mapping = {
    "t1": {
        "properties": {
            "timestamp": {"type": "date"},
            "bankuai": {
                "type": "multi_field",
                "fields": {
                    "bankuai": {"type": "string",  "index": "analyzed"},
                    "raw": {"type": "string", "index": "not_analyzed"}
                }
            },
            "bankuai_counts": {
                "type": "long",
                # "fields": {
                #     "bankuai": {"type": "string",  "index": "analyzed"},
                #     "raw": {"type": "string", "index": "not_analyzed"}
                # }
            },
        }
    }
}

# create an indice
es.indices.create(index=target_index, body=mapping, ignore=400)

es.indices.put_mapping(index=target_index, doc_type="t1", body=mapping)

res = es.index(index=target_index, doc_type='t1', body=init_doc)
print(res['created'])


res = es.search(index=logstash_index, size=max_result_number, body={"query": {
    "filtered": {
        "query": {"match_all": {}},
        "filter": {
            "range": {
                "@timestamp": {
                    "gte": "%s" % (datetime.utcnow() - timedelta(minutes=10)).strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
                    "lt": "%s" % (datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.%fZ'))
                }
            }
        }
    }
}})


print("Got %d Hits:" % res['hits']['total'])

regex = re.compile("/forum-(?P<test>[0-9]+)-[0-9]+.html")

for hit in res['hits']['hits']:
    print datetime.strptime(hit["_source"]['@timestamp'], '%Y-%m-%dT%H:%M:%S.%fZ').strftime('%Y-%m-%dT%H:%M:%S.%fZ')
    url = hit["_source"]['request']
    match = regex.match(url)
    key = match.group('test')

    if str(key) in bankuai_dic.keys():
        bk_list.append(key)
    else:
        key = "0"
        bk_list.append(key)

for k, v in Counter(bk_list).items():
    bk_count_dic[k] = v

print bk_count_dic

for bk, num in bk_count_dic.items():

    try:
        bankuai = bankuai_dic[str(bk)]
    except:
        bankuai = 'unknow'
    bankuai_counts = num

    doc = {
        'timestamp': datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
        # 'timestamp': datetime.strptime(hit["_source"]['@timestamp'], '%Y-%m-%dT%H:%M:%S.%fZ').strftime('%Y-%m-%dT%H:%M:%S.%fZ'),
        'bankuai': bankuai,
        'bankuai_counts': bankuai_counts
    }
    try:
        res = es.index(index=target_index, doc_type='t1', body=doc)
        print(res['created'])
    except Exception as e:
        print str(e)

es.indices.refresh(index=target_index)