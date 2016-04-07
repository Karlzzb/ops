///昨日新增用户 单个游戏昨日初次登录游戏的用户(按游戏新登录用户)
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0},
    $reduce: function (doc, prev) {
        prev.mytitle = "PGYdFLoginUserCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 1);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate == dk;
        }
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});
///30天新增用户 单个游戏30天内初次登录游戏的用户（每天累计）
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0},
    $reduce: function (doc, prev) {
        prev.mytitle = "PG30DFLoginUserCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 30);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate >= dk;
        }
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});
///
/// 总用户      单个游戏登录的用户总数（每天累计）
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0}, $reduce: function (doc, prev) {
        prev.mytitle = "PGLoginUserCnt";
        prev.num++;
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});

///7天活跃用户  单个游戏7天内登录的用户总数（每天累计）
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0},
    $reduce: function (doc, prev) {
        prev.mytitle = "PG7DLoginUserCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 7);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate >= dk;
        }
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});

///昨日登录次数 单个游戏总共的登录次数(包含重复的)（每天累计）
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0},
    $reduce: function (doc, prev) {
        prev.mytitle = "YdLoginCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 1);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate == dk;
        }
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});

///昨日登录用户数       单个游戏昨日登录游戏的用户（每天累计）   输出格式为横向
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0, a: []},
    $reduce: function (doc, prev) {
        prev.a.push(doc.uid);
        prev.mytitle = "YdLoginUserCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 1);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate == dk;
        }
    }
}).forEach(function (o) {
    var result = [], hash = {};
    for (var i = 0, elem; (elem = o.a[i]) != null; i++) {
        if (!hash[elem]) {
            result.push(elem);
            hash[elem] = true;
        }
    };
    o.num = result.length;
    delete o.a;

    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});

///登录次数     单个游戏时间范围内的登录次数，包括重复登录（24小时内）
db.game_login_log.group({
    key: {gid: true}, initial: {num: 0},
    $reduce: function (doc, prev) {
        prev.mytitle = "LoginCnt";
        prev.num++;
    },
    condition: {
        $where: function () {
            var date = new Date();
            date.setDate(date.getDate() - 1);
            var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            return this.adate == dk;
        }
    }
}).forEach(function (o) {
    var newRow = o;
    if (o.gid instanceof NumberLong) newRow.gid = Number(o.gid);
///    print(tojson(newRow))
	printjson(newRow)
});///游戏昨日出资登录游戏的用户 总数
db.game_login_log.group({
    keyf: function (doc) {
        return {"day": doc.adate};
    }, initial: {num: 0}, $reduce: function (doc, prev) {
        prev.num++;
    }
}).forEach(function (x) {
    var date = new Date();
    date.setDate(date.getDate() - 1);
    var dk = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    if (x.day == dk) {
        var t = {};
        t.n = x.num;
        t.day = x.day;
        t.mytitle = "GYdFLoginUserCnt";
        printjson(t);
    }
});
//次日留存率

db.runCommand({
    mapreduce: "game_login_user_list", map: function () {
        var cdate = get_date(-1);
        var pdate = get_date(-2);
        if (this.adate == pdate || this.adate == cdate) {
            emit(this.adate, {cnt: this.cnt, login_list: this.login_list});
        }
    }, reduce: function (key, values) {
        var cdate = get_date(-1);
        var ret = {login_list: [], cnt: 0, today: cdate, flag: "1"};
        values.forEach(function (v) {
            ret.login_list.push.apply(ret.login_list, v.login_list);
        });
        ret.login_list = ary_unique(ret.login_list);
        ret.cnt = ret.login_list.length;
        return ret;
    }, out: "game_login_user_list_group", verbose: true
});
var ret = db.runCommand({
    mapreduce: "game_login_user_list_group", map: function () {
        emit({today: this.value.today, flag: this.value.flag}, {
            cnt: this.value.cnt,
            login_list: this.value.login_list
        });
    }, reduce: function (key, values) {
        var ret = {n: 0, adate: key.today, "mytitle": "YdRetRates"};
        var alist = [], i = 0, cnt = 0, prev_cnt = 0;
        values.forEach(function (v) {
            if (i == 0)prev_cnt = v.cnt;
            i++;
            alist.push.apply(alist, v.login_list);
        });
        alist = ary_intersect(alist);
        cnt = alist.length;
        ret.n = Math.round(cnt / prev_cnt * 10000) / 100;
        return ret;
    }, out: {inline: 1}, verbose: true
});
printjson(ret.results[0].value);


//3日留存率
db.runCommand({
    mapreduce: "game_login_user_list", map: function () {
        var cdate = get_date(-1);
        var pdate = get_date(-3);
        if (this.adate == pdate || this.adate == cdate) {
            emit(this.adate, {cnt: this.cnt, login_list: this.login_list});
        }
    }, reduce: function (key, values) {
        var cdate = get_date(-1);
        var ret = {login_list: [], cnt: 0, today: cdate, flag: "3"};
        values.forEach(function (v) {
            ret.login_list.push.apply(ret.login_list, v.login_list);
        });
        ret.login_list = ary_unique(ret.login_list);
        ret.cnt = ret.login_list.length;
        return ret;
    }, out: "game_login_user_list_group", verbose: true
});
var ret = db.runCommand({
    mapreduce: "game_login_user_list_group", map: function () {
        emit({today: this.value.today, flag: this.value.flag}, {
            cnt: this.value.cnt,
            login_list: this.value.login_list
        });
    }, reduce: function (key, values) {
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DRetRates"};
        var alist = [], i = 0, cnt = 0, prev_cnt = 0;
        values.forEach(function (v) {
            if (i == 0)prev_cnt = v.cnt;
            i++;
            alist.push.apply(alist, v.login_list);
        });
        alist = ary_intersect(alist);
        cnt = alist.length;
        ret.n = Math.round(cnt / prev_cnt * 10000) / 100;
        return ret;
    }, out: {inline: 1}, verbose: true
});
printjson(ret.results[0].value);
//7日留存率
db.runCommand({
    mapreduce: "game_login_user_list", map: function () {
        var cdate = get_date(-1);
        var pdate = get_date(-7);
        if (this.adate == pdate || this.adate == cdate) {
            emit(this.adate, {cnt: this.cnt, login_list: this.login_list});
        }
    }, reduce: function (key, values) {
        var cdate = get_date(-1);
        var ret = {login_list: [], cnt: 0, today: cdate, flag: "7"};
        values.forEach(function (v) {
            ret.login_list.push.apply(ret.login_list, v.login_list);
        });
        ret.login_list = ary_unique(ret.login_list);
        ret.cnt = ret.login_list.length;
        return ret;
    }, out: "game_login_user_list_group", verbose: true
});
var ret = db.runCommand({
    mapreduce: "game_login_user_list_group", map: function () {
        emit({today: this.value.today, flag: this.value.flag}, {
            cnt: this.value.cnt,
            login_list: this.value.login_list
        });
    }, reduce: function (key, values) {
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DRetRates"};
        var alist = [], i = 0, cnt = 0, prev_cnt = 0;
        values.forEach(function (v) {
            if (i == 0)prev_cnt = v.cnt;
            i++;
            alist.push.apply(alist, v.login_list);
        });
        alist = ary_intersect(alist);
        cnt = alist.length;
        ret.n = Math.round(cnt / prev_cnt * 10000) / 100;
        return ret;
    }, out: {inline: 1}, verbose: true
});
printjson(ret.results[0].value);

//30日留存率
db.runCommand({
    mapreduce: "game_login_user_list",
    map: function () {
        var cdate = get_date(-1);
        var pdate = get_date(-30);
        if (this.adate == pdate || this.adate == cdate) {
            emit(this.adate, {cnt: this.cnt, login_list: this.login_list});
        }
    },
    reduce: function (key, values) {
        var cdate = get_date(-1);
        var ret = {login_list: [], cnt: 0, today: cdate, flag: "30"};
        values.forEach(function (v) {
            ret.login_list.push.apply(ret.login_list, v.login_list);
        });
        ret.login_list = ary_unique(ret.login_list);
        ret.cnt = ret.login_list.length;
        return ret;
    },
    out: "game_login_user_list_group",
    verbose: true
});
var ret = db.runCommand({
    mapreduce: "game_login_user_list_group",
    map: function () {
        emit({today: this.value.today, flag: this.value.flag}, {
            cnt: this.value.cnt,
            login_list: this.value.login_list
        });
    },
    reduce: function (key, values) {
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DRetRates"};
        var alist = [], i = 0, cnt = 0, prev_cnt = 0;
        values.forEach(function (v) {
            if (i == 0)prev_cnt = v.cnt;
            i++;
            alist.push.apply(alist, v.login_list);
        });
        alist = ary_intersect(alist);
        cnt = alist.length;
        ret.n = Math.round(cnt / prev_cnt * 10000) / 100;
        return ret;
    },
    out: {inline: 1},
    verbose: true
});
printjson(ret.results[0].value);
