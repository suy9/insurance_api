var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));

/**
 * 创建投保人
 *
 * @param  {[type]}   obj 投保人信息
 * @param  {Function} cb  回调函数
 */
module.exports.create = function (obj, cb) {
    daoModule.create("UserModel", obj, cb);
}

/**
 * 获取投保人列表
 *
 * @param  {[type]}   conditions 查询条件
 * @param  {Function} cb         回调函数
 */
module.exports.list = function (conditions, cb) {
    daoModule.list("UserModel", conditions, function (err, models) {
        if (err) return cb(err, null);
        cb(null, models);
    });
}

/**
 * 通过查询条件获取投保人对象
 *
 * @param  {[type]}   conditions 条件
 * @param  {Function} cb         回调函数
 */
module.exports.findOne = function (conditions, cb) {
    daoModule.findOne("UserModel", conditions, cb);
}

/**
 * 通过关键词查询用户
 *
 * @param  {[type]}   key    关键词
 * @param  {[type]}   offset
 * @param  {[type]}   limit
 * @param  {Function} cb     回调函数
 */
module.exports.findUserByKey = function (key, offset, limit, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT * FROM sp_user ";

    if (key) {
        sql += " WHERE user_name LIKE ? LIMIT ?,?";
        database.driver.execQuery(
            sql
            , ["%" + key + "%", offset, limit], function (err, users) {
                if (err) return cb("查询执行出错");
                cb(null, users);
            });
    } else {
        sql += " LIMIT ?,? ";
        database.driver.execQuery(sql, [offset, limit], function (err, users) {
            if (err) return cb("查询执行出错");
            cb(null, users);
        });
    }
}

/**
 * 判断是否存在投保人
 *
 * @param  {[type]}   username 用户名
 * @param  {Function} cb       回调函数
 *
 */
module.exports.exists = function (username, cb) {
    var db = databaseModule.getDatabase();
    var Model = db.models.UserModel;
    Model.exists({"user_name": username}, function (err, isExists) {
        if (err) return cb("查询失败");
        cb(null, isExists);
    });
}

/**
 * 模糊查询投保人数量
 *
 * @param  {[type]}   key 关键词
 * @param  {Function} cb  回调函数
 */
module.exports.countUserByKey = function (key, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT count(*) as count FROM sp_user";
    if (key) {
        sql += " WHERE user_name LIKE ?";
        database.driver.execQuery(
            sql
            , ["%" + key + "%"], function (err, result) {
                if (err) return cb("查询执行出错");
                cb(null, result[0]["count"]);
            });
    } else {
        database.driver.execQuery(sql, function (err, result) {
            if (err) return cb("查询执行出错");
            cb(null, result[0]["count"]);
        });
    }

}


/**
 * 通过ID获取投保人对象数据
 *
 * @param  {[type]}   id 投保人主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.show = function (id, cb) {
    daoModule.show("UserModel", id, cb);
}

/**
 * 更新投保人信息
 *
 * @param  {[type]}   obj 投保人对象
 * @param  {Function} cb  回调函数
 */
module.exports.update = function (obj, cb) {
    daoModule.update("UserModel", obj.user_id, obj, cb);
}

/**
 * 删除投保人对象数据
 *
 * @param  {[type]}   id 主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.destroy = function (id, cb) {
    daoModule.destroy("UserModel", id, function (err) {
        if (err) return cb(err);
        return cb(null);
    });
}

/**
 * 保存投保人信息
 *
 * @param  {[type]}   obj 投保人对象
 * @param  {Function} cb  回调函数
 */
module.exports.save = function (obj, cb) {
    daoModule.show(obj.user_id, function (err, oldObj) {
        if (err) {
            daoModule.create("UserModel", obj, cb);
        } else {
            daoModule.update("UserModel", obj.user_id, obj, cb);
        }
    })
}

/**
 * 获取投保人数量
 *
 * @param  {Function} cb 回调函数
 */
module.exports.count = function (cb) {
    daoModule("UserModel", cb);
}
