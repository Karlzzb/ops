///游戏昨日初次登录游戏的用户 总数
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
        t.mytitle = "GameYesterdayFirstLoginUserCount";
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
        var ret = {n: 0, adate: key.today, "mytitle": "YesterdayRetentionRates"};
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
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DaysRetentionRates"};
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
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DaysRetentionRates"};
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
        var ret = {n: 0, adate: key.today, "mytitle": key.flag + "DaysRetentionRates"};
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