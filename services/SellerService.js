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
module.exports.getAllSellers = function (conditions, cb) {


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

        sellersDAO.findSellerByKey(key, offset, limit, function (err, sellers) {
            var retSellers = [];
            for (idx in sellers) {
                var seller = sellers[idx];

                retSellers.push({
                    "id": seller.seller_id,
                    "seller_num": seller.seller_num,
                    "seller_name": seller.seller_name,
                    "seller_birthday": seller.seller_birthday,
                    "seller_phone": seller.seller_phone,
                    "seller_email": seller.seller_email,
                    "seller_address": seller.seller_address,
                    "seller_sex": seller.seller_sex,
                    "create_time": seller.create_time,
                    "update_time": seller.update_time,
                });
            }
            var resultDta = {};
            resultDta["total"] = count;
            resultDta["pagenum"] = pagenum;
            resultDta["users"] = retSellers;
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

    sellersDAO.exists(params.seller_name, function (err, isExists) {
        if (err) return cb(err);

        if (isExists) {
            return cb("用户名已存在");
        }

        sellersDAO.create({
            "seller_name": params.seller_name,
            "seller_sex": params.seller_sex,
            "seller_num": params.seller_num,
            "seller_email": params.seller_email,
            "seller_phone": params.seller_phone,
            "seller_birthday": params.seller_birthday,
            "seller_address": params.seller_address,
            "create_time": (Date.parse(new Date()) / 1000),
            "update_time": (Date.parse(new Date()) / 1000),
        }, function (err, seller) {
            if (err) return cb("创建失败");
            result = {
                "id": seller.seller_id,
                "seller_name": seller.seller_name,
                "seller_sex": seller.seller_sex,
                "seller_num": seller.seller_num,
                "seller_email": seller.seller_email,
                "seller_phone": seller.seller_phone,
                "seller_birthday": seller.seller_birthday,
                "seller_address": seller.seller_address,
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
            "seller_id": params.id,
            "seller_phone": params.seller_phone,
            "seller_email": params.seller_email,
            "seller_address": params.seller_address
        },
        function (err, seller) {
            if (err) return cb(err);
            cb(
                null,
                {
                    "id": seller.seller_id,
                    "seller_name": seller.seller_name,
                    "seller_sex": seller.seller_sex,
                    "seller_num": seller.seller_num,
                    "seller_email": seller.seller_email,
                    "seller_phone": seller.seller_phone,
                    "seller_birthday": seller.seller_birthday,
                    "seller_address": seller.seller_address,
                    "create_time": seller.create_time,
                    "update_time": (Date.parse(new Date()) / 1000)
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
module.exports.getSeller = function (id,cb) {
    sellersDAO.show(id, function (err, seller) {
        if (err) return cb(err);
        if (!seller) return cb("该用户不存在");
        cb(
            null,
            {
                "id": seller.seller_id,
                "seller_name": seller.seller_name,
                "seller_sex": seller.seller_sex,
                "seller_num": seller.seller_num,
                "seller_email": seller.seller_email,
                "seller_phone": seller.seller_phone,
                "seller_address": seller.seller_address,
                "seller_birthday": seller.seller_birthday,
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
