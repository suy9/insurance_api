module.exports = function (db, callback) {
    // 用户模型
    db.define("UserModel", {
        user_id: {type: 'serial', key: true},
        user_num: String,
        user_name: String,
        user_birthday: Date,
        user_address: String,
        user_phone: Number,
        username: String,
        password: String,
        user_email: String,
        user_sex: ['男', '女'],
        user_qq: String,
        user_edu: ['博士', '硕士', '本科', '专科', '高中', '初中', '小学'],
        create_time: Number,
        update_time: Number
    }, {
        table: "sp_user"
    });
    return callback();
}
