module.exports = function (db, callback) {
    // 用户模型
    db.define("UserModel", {
        user_id: {type: 'serial', key: true},
        user_num: String,
        user_name: String,
        user_birthday: Date,
        user_address: String,
        user_phone: Number,
        user_email: String,
        user_sex: ['男', '女'],
        create_time: Number,
        update_time: Number
    }, {
        table: "sp_user"
    });
    return callback();
}
