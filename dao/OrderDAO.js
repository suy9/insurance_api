var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));

/**
 * 创建保单
 * @param {[type]} obj 保单对象
 * @param {Function} cb 回调函数
 */
module.exports.create = function (obj, cb) {
    daoModule.create("OrderModel", obj, cb);
}

/**
 * 获取保单列表
 *
 * @param  {[type]}   conditions 查询条件
 * @param  {Function} cb         回调函数
 */
module.exports.list = function (conditions, cb) {
    daoModule.list("OrderModel", conditions, function (err, models) {
        if (err) return cb(err, null);
        cb(null, models);
    });
}

/**
 * 通过查询条件获取保单
 *
 * @param  {[type]}   conditions 条件
 * @param  {Function} cb         回调函数
 */

module.exports.findOne = function (conditions, cb) {
    daoModule.findOne("OrderModel", conditions, cb);
}

/**
 * 通过关键词查询保单
 *
 * @param  {[type]}   key    关键词
 * @param  {[type]}   offset
 * @param  {[type]}   limit
 * @param  {Function} cb     回调函数
 */

module.exports.findOrderByKey = function (key, offset, limit, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT sp_order.*,sp_user.user_name,sp_user.user_num,sp_user.user_birthday,sp_user.user_address,sp_user.user_phone,sp_seller.seller_name,sp_seller.seller_num,sp_seller.seller_birthday,sp_seller.seller_address,sp_seller.seller_phone  FROM sp_order,sp_user,sp_seller WHERE sp_order.user_id=sp_user.user_id AND  sp_order.seller_id=sp_seller.seller_id";
    if (key) {
        sql += " WHERE user_id LIKE ? LIMIT ?,?";
        database.driver.execQuery(
            sql
            , ["%" + key + "%", offset, limit], function (err, orders) {
                if (err) return cb("查询执行出错");
                cb(null, orders);
            });
    } else {
        sql += " LIMIT ?,? ";
        database.driver.execQuery(sql, [offset, limit], function (err, orders) {
            if (err) return cb("查询执行出错");
            cb(null, orders);
        });
    }
}

/**
 * 判断是否存在保单
 *
 * @param  {[type]}   username 用户名
 * @param  {Function} cb       回调函数
 *
 */
module.exports.exists = function (username, cb) {
    var db = databaseModule.getDatabase();
    var Model = db.models.OrderModel;
    Model.exists({"user_id": username}, function (err, isExists) {
        if (err) return cb("查询失败");
        cb(null, isExists);
    });
}

/**
 * 模糊查询保单数量
 *
 * @param  {[type]}   key 关键词
 * @param  {Function} cb  回调函数
 */
module.exports.countOrderByKey = function (key, cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT count(*) as count FROM sp_order";
    if (key) {
        sql += " WHERE user_id LIKE ?";
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
 * 通过ID获取保单对象数据
 *
 * @param  {[type]}   id 保单主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.show = function (id, cb) {
    daoModule.show("OrderModel", id, cb);
}

/**
 * 更新保单信息
 *
 * @param  {[type]}   obj 保单对象
 * @param  {Function} cb  回调函数
 */
module.exports.update = function (obj, cb) {
    daoModule.update("OrderModel", obj.order_id, obj, cb);
}

/**
 * 删除保单对象数据
 *
 * @param  {[type]}   id 主键ID
 * @param  {Function} cb 回调函数
 */
module.exports.destroy = function (id, cb) {
    daoModule.destroy("OrderModel", id, function (err) {
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
    daoModule.show(obj.order_id, function (err, oldObj) {
        if (err) {
            daoModule.create("OrderModel", obj, cb);
        } else {
            daoModule.update("OrderModel", obj.order_id, obj, cb);
        }
    })
}

/**
 * 获取投保人数量
 *
 * @param  {Function} cb 回调函数
 */
module.exports.count = function (cb) {
    daoModule("OrderModel", cb);
}
