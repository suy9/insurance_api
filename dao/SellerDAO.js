var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));

/**
 * 创建被投保人
 *
 * @param  {[type]}   obj 被投保人信息
 * @param  {Function} cb  回调函数
 */
module.exports.create = function (obj, cb) {
    daoModule.create("SellerModel", obj, cb);
}

/**
 * 获取被投保人列表
 *
 * @param  {[type]}   conditions 查询条件
 * @param  {Function} cb         回调函数
 */
module.exports.list = function (conditions, cb) {
    daoModule.list("SellerModel", conditions, function (err, models) {
        if (err) return cb(err, null);
        cb(null, models);
    });
}

/**
 * 通过查询条件获取被投保人对象
 *
 * @param  {[type]}   conditions 条件
 * @param  {Function} cb         回调函数
 */
module.exports.findOne = function (conditions, cb) {
    daoModule.findOne("SellerModel", conditions, cb);
}

/**
 * 通过关键词查询用户
 *
 * @param  {[type]}   key    关键词
 * @param  {[type]}   offset
 * @param  {[type]}   limit
 * @param  {Function} cb     回调函数
 */
module.exports.findByKey = function (key, offset, limit, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT * FROM sp_seller ";

    if (key) {
        sql += " WHERE seller_name LIKE ? LIMIT ?,?";
        database.driver.execQuery(
            sql
            , ["%" + key + "%", offset, limit], function (err, sellers) {
                if (err) return cb("查询执行出错");
                cb(null, sellers);
            });
    } else {
        sql += " LIMIT ?,? ";
        database.driver.execQuery(sql, [offset, limit], function (err, sellers) {
            if (err) return cb("查询执行出错");
            cb(null, sellers);
        });
    }
}

/**
 * 判断是否存在被投保人
 *
 * @param  {[type]}   username 用户名
 * @param  {Function} cb       回调函数
 *
 */
module.exports.exists = function (username, cb) {
    var db = databaseModule.getDatabase();
    var Model = db.models.SellerModel;
    Model.exists({"seller_name": username}, function (err, isExists) {
        if (err) return cb("查询失败");
        cb(null, isExists);
    });
}

/**
 * 模糊查询被投保人数量
 *
 * @param  {[type]}   key 关键词
 * @param  {Function} cb  回调函数
 */
module.exports.countByKey = function (key, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT count(*) as count FROM sp_seller";
    if (key) {
        sql += " WHERE seller_name LIKE ?";
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
 * 通过ID获取被投保人对象数据
 *
 * @param  {[type]}   id 被投保人主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.show = function (id, cb) {
    daoModule.show("SellerModel", id, cb);
}

/**
 * 更新被投保人信息
 *
 * @param  {[type]}   obj 被投保人对象
 * @param  {Function} cb  回调函数
 */
module.exports.update = function (obj, cb) {
    daoModule.update("SellerModel", obj.seller_id, obj, cb);
}

/**
 * 删除被投保人对象数据
 *
 * @param  {[type]}   id 主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.destroy = function (id, cb) {
    daoModule.destroy("SellerModel", id, function (err) {
        if (err) return cb(err);
        return cb(null);
    });
}

/**
 * 保存被投保人信息
 *
 * @param  {[type]}   obj 被投保人对象
 * @param  {Function} cb  回调函数
 */
module.exports.save = function (obj, cb) {
    daoModule.show(obj.seller_id, function (err, oldObj) {
        if (err) {
            daoModule.create("SellerModel", obj, cb);
        } else {
            daoModule.update("SellerModel", obj.seller_id, obj, cb);
        }
    })
}

/**
 * 获取被投保人数量
 *
 * @param  {Function} cb 回调函数
 */
module.exports.count = function (cb) {
    daoModule("SellerModel", cb);
}
