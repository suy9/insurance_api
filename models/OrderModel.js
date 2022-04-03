module.exports = function (db, callback) {
    // 用户模型
    db.define("OrderModel", {
        order_id: {type: 'serial', key: true},
        user_id: Number,
        seller_id: Number,
        order_number: String,
        order_price: Number,
        order_pay: [1, 2, 3],
        pay_status: ['0', '1'],
        create_time: Number,
        update_time: Number
    }, {
        table: "sp_order"
    });
    return callback();
}
