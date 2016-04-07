///昨日新增用户 单个游戏昨日初次登录游戏的用户(按游戏新登录用户)
db.game_login_log.group({key:{gid:true},initial:{num:0},
$reduce:function(doc,prev){prev.mytitle="单个游戏昨日初次登录游戏的用户";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-1);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate==dk;
}}}).forEach(function(o){print(tojson(o))});
///30天新增用户 单个游戏30天内初次登录游戏的用户（每天累计）
db.game_login_log.group({key:{gid:true},initial:{num:0},
$reduce:function(doc,prev){prev.mytitle="单个游戏30天内初次登录游戏的用户当月";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-30);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate>=dk;}}}).forEach(function(o){print(tojson(o))});
///
/// 总用户      单个游戏登录的用户总数（每天累计）
db.game_login_log.group({key:{gid:true},initial:{num:0},$reduce:function(doc,prev){prev.mytitle="单个游戏登录的用户总数";prev.num++;}}).forEach(function(o){print(tojson(o))});

///7天活跃用户  单个游戏7天内登录的用户总数（每天累计）
db.game_login_log.group({key:{gid:true},initial:{num:0},
$reduce:function(doc,prev){prev.mytitle="单个游戏7天内登录的用户总数(当月)";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-7);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate>=dk;}}}).forEach(function(o){print(tojson(o))});

///昨日登录次数 单个游戏总共的登录次数(包含重复的)（每天累计）
db.game_login_log.group({key:{gid:true},initial:{num:0},
$reduce:function(doc,prev){prev.mytitle="昨日登录次数";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-1);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate==dk;}}}).forEach(function(o){print(tojson(o))});

///昨日登录用户数       单个游戏昨日登录游戏的用户（每天累计）   输出格式为横向
db.game_login_log.group({key:{gid:true},initial:{num:0,a:[]},
$reduce:function(doc,prev){prev.a.push(doc.uid);prev.mytitle="昨日登录用户数";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-1);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate==dk;}}}).forEach(function(o){var result = [], hash = {};for (var i = 0, elem; (elem = o.a[i]) != null; i++) {
        if (!hash[elem]) {
            result.push(elem);
            hash[elem] = true;
        }
    };

o.num=result.length;delete o.a;print(tojson(o))});

///登录次数     单个游戏时间范围内的登录次数，包括重复登录（24小时内）
db.game_login_log.group({key:{gid:true},initial:{num:0},
$reduce:function(doc,prev){prev.mytitle="登录次数";prev.num++;},
condition:{$where:function(){var date=new Date();date.setDate(date.getDate()-1);var dk=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();return this.adate==dk;}}}).forEach(function(o){print(tojson(o))});