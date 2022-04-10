var path = require("path");
daoModule = require("./DAO");
databaseModule = require(path.join(process.cwd(), "modules/database"));


/**
 * 模糊查询符合要求的数量
 *
 * @param  {[string]}   key 关键词
 * @param  {[type]}   start 关键词
 * @param  {[type]}   end 关键词
 * @param  {Function} cb  回调函数
 */
module.exports.countreportsByKey = function(key,start,end,cb) {
    console.log("countreportsByKey");
    console.log(key,start,end);
    db = databaseModule.getDatabase();
    sql = "SELECT count(*) as count ";
    if(key=="info"){
        sql += "FROM sp_order WHERE sp_order.update_time > ? and sp_order.update_time <= ?";
        database.driver.execQuery(
            sql
            ,[start,end],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result[0]["count"]);
            });
    } else if(key=="user_birthday") {
        sql += "FROM sp_order,sp_user WHERE sp_order.user_num=sp_user.user_num AND right(sp_user.user_birthday, 5) > ? AND right(sp_user.user_birthday, 5) <? AND sp_order.pay_status = '0' "
        database.driver.execQuery(
            sql
            , [start, end], function (err, result) {
                if (err) return cb("查询执行出错");
                cb(null, result[0]["count"]);
            });
    } else{
            sql += "FROM sp_order,sp_seller WHERE sp_order.seller_num=sp_seller.seller_num AND right(sp_seller.seller_birthday, 5) > ? AND right(sp_seller.seller_birthday, 5) <? AND sp_order.pay_status = '0' "
            database.driver.execQuery(
                sql
                ,[start,end],function(err,result){
                    if(err) return cb("查询执行出错");
                    cb(null,result[0]["count"]);
                });
        }
}

module.exports.findreportByKey = function (key, start,end,offset,limit,cb) {

    db = databaseModule.getDatabase();
    sql = "SELECT sp_order.*,sp_user.user_name,sp_user.user_num,sp_user.user_birthday,sp_user.user_address,sp_user.user_phone,sp_seller.seller_name,sp_seller.seller_num,sp_seller.seller_birthday,sp_seller.seller_address,sp_seller.seller_phone  " +
        "FROM sp_order,sp_user,sp_seller " +
        "WHERE sp_order.user_num=sp_user.user_num " +
        "AND sp_order.seller_num=sp_seller.seller_num ";
    if(key=="info"){
        sql += " AND sp_order.update_time > ? and sp_order.update_time <= ?";
        database.driver.execQuery(
            sql
            ,[start,end],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result);
            });
    } else if(key=="user_birthday"){
        sql += " AND right(sp_user.user_birthday, 5) > ? AND right(sp_user.user_birthday, 5) <? AND sp_order.pay_status = '0' ";
        database.driver.execQuery(
            sql
            ,[start,end],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result);
            })
    }else{
        sql += " AND right(sp_seller.seller_birthday, 5) > ? AND right(sp_seller.seller_birthday, 5) <? AND sp_order.pay_status = '0' ";
        database.driver.execQuery(
            sql
            ,[start,end],function(err,result){
                if(err) return cb("查询执行出错");
                cb(null,result);
            });
    }
}
