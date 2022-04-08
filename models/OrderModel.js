module.exports = function (db, callback) {
    // 用户模型
    db.define("OrderModel", {
        order_id : {type: 'serial', key: true},
        user_num : String,
        seller_num:String,
        order_kind:String,
        order_number:String,
        order_price:Number,
        order_pay:['1','2','3'],
        pay_status:['0','1'],
        create_time:Date,
        update_time:Date,
        next_pay_time:Date
    }, {
        table: "sp_order"
    });
    return callback();
}
