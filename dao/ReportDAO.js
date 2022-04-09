var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));


/**
 * 模糊查询符合要求的数量
 *
 * @param  {[type]}   key 关键词
 * @param  {[type]}   start 关键词
 * @param  {[type]}   end 关键词
 * @param  {Function} cb  回调函数
 */
module.exports.countreportsByKey = function(start,end,cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT count(*) as count FROM sp_order";
    if(start!=null&&end!=null){
        sql += " WHERE sp_order.update_time > ? and sp_order.update_time < ?";
        database.driver.execQuery(
           sql
            ,[start,end],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result[0]["count"]);
            });
    } else {
        database.driver.execQuery(sql,function(err,result){
            if(err) return cb("查询执行出错");
            cb(null,result[0]["count"]);
        });
    }

}

module.exports.findreportByKey = function (start,end,offset,limit,cb) {
    db = databaseModule.getDatabase();
    sql = "SELECT sp_order.*,sp_user.user_name,sp_user.user_num,sp_user.user_birthday,sp_user.user_address,sp_user.user_phone,sp_seller.seller_name,sp_seller.seller_num,sp_seller.seller_birthday,sp_seller.seller_address,sp_seller.seller_phone  " +
        "FROM sp_order,sp_user,sp_seller " +
        "WHERE sp_order.user_num=sp_user.user_num " +
        "AND sp_order.seller_num=sp_seller.seller_num ";;
    if(start!=null&&end!=null){
        sql += " AND sp_order.update_time > ? AND sp_order.update_time < ?"+
        " LIMIT ?,?";
        database.driver.execQuery(
            sql
            ,[start,end,offset,limit],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result);
            });
    } else {
        database.driver.execQuery(sql,function(err,result){
            if(err) return cb("查询执行出错");
            cb(null,result);
        });
    }
}
