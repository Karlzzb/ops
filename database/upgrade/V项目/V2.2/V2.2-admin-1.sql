truncate table video.video_user_buy_group;
#1富	七品白尊	7天 
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,30,1101,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 7 day),1,'3000','1500' from video.video_user where lv_rich in (2);
update video.video_user set vip = 1101, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 7 day) where lv_rich in (2);

#2富/3富	七品白尊	15天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,30,1101,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day),1,'3000','1500' from video.video_user where lv_rich in (3,4);
update video.video_user set vip = 1101, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day) where lv_rich in (3,4);

#4富	六品墨尊	7天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,31,1102,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 7 day),1,'10000','5000' from video.video_user where lv_rich in (5);
update video.video_user set vip = 1102, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 7 day) where lv_rich in (5);

#5富/6富/7富	六品墨尊	15天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,31,1102,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day),1,'10000','5000' from video.video_user where lv_rich in (6,7,8);
update video.video_user set vip = 1102, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day) where lv_rich in (6,7,8);

#8富/9富	六品墨尊	20天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,31,1102,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day),1,'10000','5000' from video.video_user where lv_rich in  (9,10);
update video.video_user set vip = 1102, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day) where lv_rich in (9,10);

#10富/男爵	五品绿尊	15天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,32,1103,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day),1,'20000','8000' from video.video_user where lv_rich in (11,12);
update video.video_user set vip = 1103, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day) where lv_rich in (11,12);

#子爵/伯爵/侯爵	五品绿尊	20天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,32,1103,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day),1,'20000','8000' from video.video_user where lv_rich in (13,14,15);
update video.video_user set vip = 1103, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day) where lv_rich in (13,14,15);

#公爵/郡公	四品青尊	15天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,33,1104,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day),1,'100000','30000' from video.video_user where lv_rich in (16,17);
update video.video_user set vip = 1104, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 15 day) where lv_rich in (16,17);

#直到世界的尽头/精英一月落  四品青尊	20天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,33,1104,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day),1,'100000','30000' from video.video_user where uid in (1223943,1213302);
update video.video_user set vip = 1104, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day) where uid in (1223943,1213302);

#水水老跟班/垫底/大海啊/采花贼/詹妮弗的肉体  三品蓝尊	20天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,34,1105,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day),1,'250000','80000' from video.video_user where uid in (1224289,1328456,1127646,1147138,1224668);
update video.video_user set vip = 1105, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 20 day) where uid in (1224289,1328456,1127646,1147138,1224668);

#尼古拉斯赵四先生/大羽  二品红尊	30天
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,35,1106,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day),1,'500000','150000' from video.video_user where uid in (1145532,1147106);
update video.video_user set vip = 1106, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day) where uid in (1145532,1147106);

#七品百尊（共91位用户） 30天
delete from video.video_user_buy_group where uid in (1365713,1366358,1339532,1350516,1368436,1324941,1352431,1348429,1366107,1359919,1341061,1156118,1372185,1369634,1360096,1249357,1363356,1306096,1198340,1296738,1310008,1364420,1349218,1362068,1364872,1364446,1355163,1367648,1350212,1340826,1298434,1355183,1371247,1144004,1241066,1374185,1366401,1374381,1374318,1334797,1370351,1158871,1371658,1336219,1343322,1247768,1195647,1354923,1324895,1178410,1370170,1367053,1368452,1288716,1239115,1376520,1376301,1376255,1375150,1233268,1368295,1301781,1161064,1283073,1266728,1245799,1377005,1316961,1377338,1328434,1367358,1192446,1374236,1350317,1308413,1309003,1346825,1372717,1365135,1369455,1340422,1316762,1352117,1250226,1359373,1379286,1351340,1147106,1350317,1361004,1361591);
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,30,1101,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day),1,'3000','1500' from video.video_user where uid in (1365713,1366358,1339532,1350516,1368436,1324941,1352431,1348429,1366107,1359919,1341061,1156118,1372185,1369634,1360096,1249357,1363356,1306096,1198340,1296738,1310008,1364420,1349218,1362068,1364872,1364446,1355163,1367648,1350212,1340826,1298434,1355183,1371247,1144004,1241066,1374185,1366401,1374381,1374318,1334797,1370351,1158871,1371658,1336219,1343322,1247768,1195647,1354923,1324895,1178410,1370170,1367053,1368452,1288716,1239115,1376520,1376301,1376255,1375150,1233268,1368295,1301781,1161064,1283073,1266728,1245799,1377005,1316961,1377338,1328434,1367358,1192446,1374236,1350317,1308413,1309003,1346825,1372717,1365135,1369455,1340422,1316762,1352117,1250226,1359373,1379286,1351340,1147106,1350317,1361004,1361591);
update video.video_user set vip = 1101, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day) where uid in (1365713,1366358,1339532,1350516,1368436,1324941,1352431,1348429,1366107,1359919,1341061,1156118,1372185,1369634,1360096,1249357,1363356,1306096,1198340,1296738,1310008,1364420,1349218,1362068,1364872,1364446,1355163,1367648,1350212,1340826,1298434,1355183,1371247,1144004,1241066,1374185,1366401,1374381,1374318,1334797,1370351,1158871,1371658,1336219,1343322,1247768,1195647,1354923,1324895,1178410,1370170,1367053,1368452,1288716,1239115,1376520,1376301,1376255,1375150,1233268,1368295,1301781,1161064,1283073,1266728,1245799,1377005,1316961,1377338,1328434,1367358,1192446,1374236,1350317,1308413,1309003,1346825,1372717,1365135,1369455,1340422,1316762,1352117,1250226,1359373,1379286,1351340,1147106,1350317,1361004,1361591);

#六品墨尊	30天
delete from video.video_user_buy_group where uid in (1376632,1372257,1358979,1338498,1251536);
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,31,1102,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day),1,'10000','5000' from video.video_user where uid in (1376632,1372257,1358979,1338498,1251536);
update video.video_user set vip = 1102, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day) where uid in (1376632,1372257,1358979,1338498,1251536);

#五品绿尊	30天
delete from video.video_user_buy_group where uid in (1311127,1341159,1286067,1364727,1371164,1352244,1350986,1361135,1371134);
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,32,1103,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day),1,'20000','8000' from video.video_user where uid in (1311127,1341159,1286067,1364727,1371164,1352244,1350986,1361135,1371134);
update video.video_user set vip = 1103, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day) where uid in (1311127,1341159,1286067,1364727,1371164,1352244,1350986,1361135,1371134);

#四品青尊	30天
delete from video.video_user_buy_group where uid in (1253397,1328456);
insert into video.video_user_buy_group(uid,gid,level_id,type,create_at,rid,end_time,status,open_money,keep_level) select uid,33,1104,1,concat(date(now()),' 00:00:00'),0,DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day),1,'100000','30000' from video.video_user where uid in (1253397,1328456);
update video.video_user set vip = 1104, vip_end = DATE_ADD(concat(date(now()),' 00:00:00'), interval 30 day) where uid in (1253397,1328456);
