use npe;
CREATE TABLE oplogs ( uuid varchar(64) NOT NULL, searchkey varchar(256) NOT NULL, message varchar(512) NOT NULL, level varchar(32) DEFAULT 'info', createtime varchar(64), PRIMARY KEY (uuid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE params ( keyy varchar(256) NOT NULL, valuee varchar(512) NOT NULL, des varchar(512) NOT NULL, PRIMARY KEY (keyy) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE procdef ( defid varchar(48) NOT NULL, defname varchar(64), version varchar(64), packages varchar(64), xmlbody longtext, subelements varchar(512), createtime varchar(64), PRIMARY KEY (defid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE procinsts ( procdefid varchar(32) NOT NULL, procinstid varchar(32) NOT NULL, PRIMARY KEY (procinstid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE taskcenter ( centerid varchar(48) NOT NULL, centername varchar(64), status int DEFAULT '0', createtime varchar(64), modtime varchar(64), PRIMARY KEY (centerid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE taskrole ( roleid varchar(48) NOT NULL, rolename varchar(64), status int DEFAULT '0', centerid varchar(64), createtime varchar(64), modtime varchar(64), PRIMARY KEY (roleid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE tasks ( taskinstid varchar(48) NOT NULL, procdefid varchar(48) NOT NULL, procinstid varchar(48) NOT NULL, taskdefid varchar(48) NOT NULL, interstate int DEFAULT '0' NOT NULL, previnsts text, antecessors text, procPIO int, taskPIO int, rolemark varchar(256), startMS varchar(64), idata1 int, idata2 int, strdata1 varchar(64), strdata2 varchar(64), fdata1 float, fdata2 float, taskname varchar(64), jsondata longtext, submitter varchar(64), submittime varchar(64), obtainer varchar(64), obtaintime varchar(64), createtime varchar(64), taskcenter varchar(64), rootproc varchar(64), nodetype int DEFAULT '0', PRIMARY KEY (taskinstid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE tasks_obtain ( taskinstid varchar(48) NOT NULL, interstate int DEFAULT '0' NOT NULL, obtainer varchar(64), obtaintime varchar(64), PRIMARY KEY (taskinstid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;
CREATE TABLE tasks_submit ( taskinstid varchar(48) NOT NULL, interstate int DEFAULT '0' NOT NULL, procPIO int, taskPIO int, rolemark varchar(256), idata1 int, idata2 int, strdata1 varchar(64), strdata2 varchar(64), fdata1 float, fdata2 float, taskname varchar(64), jsondata longtext, submitter varchar(64), submittime varchar(64), PRIMARY KEY (taskinstid) ) ENGINE=InnoDB DEFAULT CHARSET=gbk;

