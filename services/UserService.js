var path = require("path");
var usersDAO = require(path.join(process.cwd(), "dao/UserDAO"));
var logger = require('../modules/logger').logger();


/**
 * 获取所有投保人
 * @param  {[type]}   conditions 查询条件
 * 查询条件统一规范
 * conditions
 {
		"query" : 关键词查询,
		"pagenum" : 页数,
		"pagesize" : 每页长度
	}
 * @param  {Function} cb         回调函数
 */
module.exports.getAllUsers = function (conditions, cb) {


    if (!conditions.pagenum) return cb("pagenum 参数不合法");
    if (!conditions.pagesize) return cb("pagesize 参数不合法");


    // 通过关键词获取用户数量
    usersDAO.countUserByKey(conditions["query"], function (err, count) {
        key = conditions["query"];
        pagenum = parseInt(conditions["pagenum"]);
        pagesize = parseInt(conditions["pagesize"]);

        pageCount = Math.ceil(count / pagesize);
        offset = (pagenum - 1) * pagesize;
        if (offset >= count) {
            offset = count;
        }
        limit = pagesize;

        usersDAO.findUserByKey(key, offset, limit, function (err, users) {
            var retUsers = [];
            for (idx in users) {
                var user = users[idx];

                retUsers.push({
                    "id": user.user_id,
                    "user_num": user.user_num,
                    "user_name": user.user_name,
                    "user_birthday": user.user_birthday,
                    "user_address": user.user_address,
                    "user_phone": user.user_phone,
                    "username": user.username,
                    "password": user.password,
                    "user_email": user.user_email,
                    "user_qq": user.user_qq,
                    "user_edu": user.user_edu,
                    "user_sex": user.user_sex,
                    "create_time": user.create_time,
                    "update_time": user.update_time,
                });
            }
            var resultDta = {};
            resultDta["total"] = count;
            resultDta["pagenum"] = pagenum;
            resultDta["users"] = retUsers;
            cb(err, resultDta);
        });
    });
}

/**
 * 创建投保人
 *
 * @param  {[type]}   user 用户数据集
 * @param  {Function} cb   回调函数
 */
module.exports.createUser = function (params, cb) {

    usersDAO.exists(params.username, function (err, isExists) {
        if (err) return cb(err);

        if (isExists) {
            return cb("用户名已存在");
        }

        usersDAO.create({
            "user_num": params.user_num,
            "user_name": params.user_name,
            "user_birthday": params.user_birthday,
            "user_address": params.user_address,
            "user_phone": params.user_phone,
            "username": params.username,
            "password": params.password,
            "user_email": params.user_email,
            "user_sex": params.user_sex,
            "user_qq": params.user_qq,
            "user_edu": params.user_edu,
            "create_time": (Date.parse(new Date()) / 1000),
            "update_time": (Date.parse(new Date()) / 1000),
        }, function (err, user) {
            if (err) return cb("创建失败");
            result = {
                "user_id": user.user_id,
                "user_num": user.user_num,
                "user_name": user.user_name,
                "user_birthday": user.user_birthday,
                "user_address": user.user_address,
                "user_phone": user.user_phone,
                "username": user.username,
                "password": user.password,
                "user_email": user.user_email,
                "user_sex": user.user_sex,
                "user_qq": user.user_qq,
                "user_edu": user.user_edu,
                "create_time": user.create_time,
                "update_time": user.update_time,
            };
            cb(null, result);
        });
    });
}

/**
 * 更新投保人信息
 *
 * @param  {*}   params 投保人信息
 * @param  {Function} cb     回调函数
 */
module.exports.updateUser = function (params, cb) {
    usersDAO.update(
        {
            "user_id": params.user_id,
            "user_address": params.user_address,
            "user_phone": params.user_phone,
            "user_email": params.user_email,
            "user_qq": params.user_qq,
            "user_edu": params.user_edu,
            "update_time": (Date.parse(new Date()) / 1000),
        },
        function (err, user) {
            if (err) return cb(err);
            cb(
                null,
                {
                    "user_id": user.user_id,
                    "user_num": user.user_num,
                    "user_name": user.user_name,
                    "user_birthday": user.user_birthday,
                    "user_phone": user.user_phone,
                    "username": user.username,
                    "user_sex": user.user_sex,
                    "create_time": user.create_time,
                    "update_time": user.update_time,
                });
        }
    )
}

/**
 * 通过投保人 ID 获取投保人信息
 *
 * @param  {[type]}   id 投保人 ID
 * @param  {Function} cb 回调函数
 */
module.exports.getUser = function (id, cb) {
    usersDAO.show(id, function (err, user) {
        if (err) return cb(err);
        if (!user) return cb("该用户不存在");
        cb(
            null,
            {
                "user_id": user.user_id,
                "user_num": user.user_num,
                "user_name": user.user_name,
                "user_birthday": user.user_birthday,
                "user_phone": user.user_phone,
                "username": user.username,
                "user_sex": user.user_sex,
                "create_time": user.create_time,
                "update_time": user.update_time,
            }
        );
    });
}

/**
 * 通过投保人 ID 进行删除操作
 *
 * @param  {[type]}   id 投保人ID
 * @param  {Function} cb 回调函数
 */
module.exports.deleteUser = function (id, cb) {
    usersDAO.destroy(id, function (err) {
        if (err) return cb("删除失败");
        cb(null);
    });
}

/*module.exports.updateMgrState = function (id, state, cb) {
    usersDAO.show(id, function (err, user) {
        if (err || !user) cb("投保人ID不存在");

        usersDAO.update({"mg_id": user.mg_id, "mg_state": state}, function (err, user) {
            if (err) return cb("设置失败");
            cb(null, {
                "id": user.mg_id,
                "username": user.mg_name,
                "mobile": user.mg_mobile,
                "email": user.mg_email,
                "mg_state": user.mg_state ? 1 : 0
            });
        });

    })
}*/

/**
 * 投保人登录
 * @param  {[type]}   username 用户名
 * @param  {[type]}   password 密码
 * @param  {Function} cb       回调
 */
/*module.exports.login = function (username, password, cb) {
    logger.debug('login => username:%s,password:%s', username, password);
    logger.debug(username);
    usersDAO.findOne({"mg_name": username}, function (err, user) {
        logger.debug(err);
        if (err || !user) return cb("用户名不存在");

        if (user.role_id != 0 && user.mg_state != 1) {
            return cb("该用户已经被禁用");
        }
        // if(Password.verify(password, user.mg_pwd))
        if ((password === user.mg_pwd)) {
            cb(
                null,
                {
                    "id": user.mg_id,
                    "rid": user.role_id,
                    "username": user.mg_name,
                    "mobile": user.mg_mobile,
                    "email": user.mg_email,
                }
            );
        } else {
            return cb("密码错误");
        }
    });
}


// 用户登录
module.exports.login = function (username, password, cb) {
    console.log("登录 %s %s", username, password);
}*/
