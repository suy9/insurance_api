module.exports = function (db, callback) {
    // 用户模型
    db.define("SellerModel", {
        seller_id: {type: 'serial', key: true},
        seller_num: String,
        seller_name: String,
        seller_birthday: Date,
        seller_address: String,
        seller_phone: Number,
        seller_email: String,
        seller_sex: ['男', '女'],
        create_time: Number,
        update_time: Number
    }, {
        table: "sp_seller"
    });
    return callback();
}
