module.exports = function (db, callback) {
    // 用户模型
    db.define("SellerModel", {
        seller_id: {type: 'serial', key: true},
        seller_num: String,
        seller_name: String,
        seller_birt: Date,
        seller_address: String,
        seller_phone: Number,
        username: String,
        password: String,
        seller_email: String,
        seller_sex: ['男', '女'],
        seller_qq: String,
        seller_edu: ['博士', '硕士', '本科', '专科', '高中', '初中', '小学'],
        create_time: Number,
        update_time: Number
    }, {
        table: "sp_seller"
    });
    return callback();
}
