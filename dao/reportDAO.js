var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));

module.exports.reportByKey = function (key, offset, limit, cb) {
    db = databaseModule.getDatabase();
    //sql="SELECT count(*) as count FROM sp_order WHERE sp_order.create_time>=DATE_SUB(NOW(),INTERVAL 1 DAY) AND sp_order.create_time<=NOW() AND sp_order.status=1 AND sp_order.key=?";


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
