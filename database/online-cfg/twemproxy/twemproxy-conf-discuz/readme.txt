redis-server /data/db/redis8691/redis8691.conf

redis-server /data/db/redis8692/redis8692.conf

redis-server /data/db/redis8693/redis8693.conf

redis-cli -p 8691 -h caegi-b-redis02 slaveof caegi-b-redis01 8691
redis-cli -p 8691 -h caegi-b-redis03 slaveof caegi-b-redis01 8691
redis-cli -p 8692 -h caegi-b-redis01 slaveof caegi-b-redis02 8692
redis-cli -p 8692 -h caegi-b-redis03 slaveof caegi-b-redis02 8692
redis-cli -p 8693 -h caegi-b-redis01 slaveof caegi-b-redis03 8693
redis-cli -p 8693 -h caegi-b-redis02 slaveof caegi-b-redis03 8693

/opt/redis/src/redis-sentinel /data/db/sentinel/sentinel.conf

/opt/twemproxy/src/nutcracker -d -c /data/db/twemproxy/nutcracker.yml -o /data/dblogs/twemproxy/twemproxy.log