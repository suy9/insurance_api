var path = require("path");
var sellersDAO = require(path.join(process.cwd(), "dao/SellerDAO"));
var logger = require('../modules/logger').logger();


/**
 * 获取所有被投保人
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
module.exports.getAllSeller = function (conditions, cb) {


    if (!conditions.pagenum) return cb("pagenum 参数不合法");
    if (!conditions.pagesize) return cb("pagesize 参数不合法");


    // 通过关键词获取用户数量
    sellersDAO.countSellerByKey(conditions["query"], function (err, count) {
        key = conditions["query"];
        pagenum = parseInt(conditions["pagenum"]);
        pagesize = parseInt(conditions["pagesize"]);

        pageCount = Math.ceil(count / pagesize);
        offset = (pagenum - 1) * pagesize;
        if (offset >= count) {
            offset = count;
        }
        limit = pagesize;

        sellersDAO.findByKey(key, offset, limit, function (err, sellers) {
            var retManagers = [];
            for (idx in sellers) {
                var seller = sellers[idx];

                retManagers.push({
                    "id": seller.seller_id,
                    "seller_num": seller.seller_num,
                    "seller_name": seller.seller_name,
                    "seller_birthday": seller.seller_birthday,
                    "seller_phone": seller.seller_phone,
                    "username": seller.username,
                    "seller_sex": seller.seller_sex,
                    "create_time": seller.create_time,
                    "update_time": seller.update_time,
                });
            }
            var resultDta = {};
            resultDta["total"] = count;
            resultDta["pagenum"] = pagenum;
            resultDta["sellers"] = retManagers;
            cb(err, resultDta);
        });
    });
}

/**
 * 创建被投保人
 *
 * @param  {[type]}   seller 用户数据集
 * @param  {Function} cb   回调函数
 */
module.exports.createSeller = function (params, cb) {

    sellersDAO.exists(params.sellername, function (err, isExists) {
        if (err) return cb(err);

        if (isExists) {
            return cb("用户名已存在");
        }

        sellersDAO.create({
            "seller_num": params.seller_num,
            "seller_name": params.seller_name,
            "seller_birthday": params.seller_birthday,
            "seller_phone": params.seller_phone,
            "username": params.username,
            "password": params.password,
            "seller_email": params.seller_email,
            "seller_sex": params.seller_sex,
            "seller_qq": params.seller_qq,
            "seller_edu": params.seller_edu,
            "create_time": (Date.parse(new Date()) / 1000),
            "update_time": (Date.parse(new Date()) / 1000),
        }, function (err, seller) {
            if (err) return cb("创建失败");
            result = {
                "id": seller.seller_id,
                "seller_num": seller.seller_num,
                "seller_name": seller.seller_name,
                "seller_birthday": seller.seller_birthday,
                "seller_address": seller.seller_address,
                "seller_phone": seller.seller_phone,
                "username": seller.username,
                "password": seller.password,
                "seller_email": seller.seller_email,
                "seller_sex": seller.seller_sex,
                "seller_qq": seller.seller_qq,
                "seller_edu": seller.seller_edu,
                "create_time": seller.create_time,
                "update_time": seller.update_time,
            };
            cb(null, result);
        });
    });
}

/**
 * 更新被投保人信息
 *
 * @param  {[type]}   params 被投保人信息
 * @param  {Function} cb     回调函数
 */
module.exports.updateSeller = function (params, cb) {
    sellersDAO.update(
        {
            "seller_name": params.name,
            "seller_birthday": params.seller_birthday,
            "seller_address": params.seller_address,
            "seller_phone": params.seller_phone,
            "seller_email": params.seller_email,
            "seller_qq": params.seller_qq,
            "seller_edu": params.seller_edu,
            "update_time": (Date.parse(new Date()) / 1000),
        },
        function (err, seller) {
            if (err) return cb(err);
            cb(
                null,
                {
                    "id": seller.seller_id,
                    "seller_num": seller.seller_num,
                    "seller_name": seller.seller_name,
                    "seller_birthday": seller.seller_birthday,
                    "seller_phone": seller.seller_phone,
                    "username": seller.username,
                    "seller_sex": seller.seller_sex,
                    "create_time": seller.create_time,
                    "update_time": seller.update_time,
                });
        }
    )
}

/**
 * 通过被投保人 ID 获取被投保人信息
 *
 * @param  {[type]}   id 被投保人 ID
 * @param  {Function} cb 回调函数
 */
module.exports.getSeller = function (id, cb) {
    sellersDAO.show(id, function (err, seller) {
        if (err) return cb(err);
        if (!seller) return cb("该用户不存在");
        cb(
            null,
            {
                "id": seller.seller_id,
                "seller_num": seller.seller_num,
                "seller_name": seller.seller_name,
                "seller_birthday": seller.seller_birthday,
                "seller_phone": seller.seller_phone,
                "username": seller.username,
                "seller_sex": seller.seller_sex,
                "create_time": seller.create_time,
                "update_time": seller.update_time,
            }
        );
    });
}

/**
 * 通过被投保人 ID 进行删除操作
 *
 * @param  {[type]}   id 被投保人ID
 * @param  {Function} cb 回调函数
 */
module.exports.deleteSeller = function (id, cb) {
    sellersDAO.destroy(id, function (err) {
        if (err) return cb("删除失败");
        cb(null);
    });
}

/*module.exports.updateMgrState = function (id, state, cb) {
    sellersDAO.show(id, function (err, seller) {
        if (err || !seller) cb("被投保人ID不存在");

        sellersDAO.update({"mg_id": seller.mg_id, "mg_state": state}, function (err, seller) {
            if (err) return cb("设置失败");
            cb(null, {
                "id": seller.mg_id,
                "sellername": seller.mg_name,
                "mobile": seller.mg_mobile,
                "email": seller.mg_email,
                "mg_state": seller.mg_state ? 1 : 0
            });
        });

    })
}*/

/**
 * 被投保人登录
 * @param  {[type]}   sellername 用户名
 * @param  {[type]}   password 密码
 * @param  {Function} cb       回调
 */
/*module.exports.login = function (sellername, password, cb) {
    logger.debug('login => sellername:%s,password:%s', sellername, password);
    logger.debug(sellername);
    sellersDAO.findOne({"mg_name": sellername}, function (err, seller) {
        logger.debug(err);
        if (err || !seller) return cb("用户名不存在");

        if (seller.role_id != 0 && seller.mg_state != 1) {
            return cb("该用户已经被禁用");
        }
        // if(Password.verify(password, seller.mg_pwd))
        if ((password === seller.mg_pwd)) {
            cb(
                null,
                {
                    "id": seller.mg_id,
                    "rid": seller.role_id,
                    "sellername": seller.mg_name,
                    "mobile": seller.mg_mobile,
                    "email": seller.mg_email,
                }
            );
        } else {
            return cb("密码错误");
        }
    });
}


// 用户登录
module.exports.login = function (sellername, password, cb) {
    console.log("登录 %s %s", sellername, password);
}*/
