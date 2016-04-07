drop procedure if exists new_member;
DELIMITER //
CREATE PROCEDURE `new_member`(IN num INT)
BEGIN
DECLARE name char(32);
DECLARE i int;
DECLARE begin int;
DECLARE max int;
DECLARE my_uid int;

select `uid` into my_uid from pre_common_member where username like 'test%' order by uid desc limit 1;
select username into name from pre_common_member where username like 'test%' order by uid desc limit 1;
SELECT SUBSTRING(name,5) into i;

SET begin = i+1;
SET i = begin;
SET max = begin+num;

WHILE i < max DO
START TRANSACTION;
REPLACE INTO pre_common_member(
`uid`,
username,
`password`,
email,
regdate,
status,
emailstatus,
groupid,
adminid) 
SELECT 
i + 1,
CONCAT('test',i),
`password`,
CONCAT('test',i,'@163.com'),
regdate,
status,
emailstatus,
groupid,
adminid FROM pre_common_member WHERE `uid` = my_uid;

REPLACE INTO pre_ucenter_members(
`uid`,
username,
`password`,
email,
regip,
regdate,
lastloginip,
lastlogintime,
salt) 
SELECT 
i + 1,
CONCAT('test',i),
`password`,
CONCAT('test',i,'@163.com'),
regip,
regdate,
lastloginip,
lastlogintime,
salt FROM pre_ucenter_members WHERE `uid` = my_uid;
COMMIT;
SET i=i+1;
END WHILE;

END//
DELIMITER ;