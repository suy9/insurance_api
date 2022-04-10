var path = require("path");
var RenewalDAO = require(path.join(process.cwd(), "dao/RenewalDAO"));


/**
 * 获取所有保单
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
module.exports.getAllRenewals = function (conditions, cb) {

    if (!conditions.pagenum) return cb("pagenum 参数不合法");
    if (!conditions.pagesize) return cb("pagesize 参数不合法");
    console.log("conditions", conditions);
    RenewalDAO.countOrderByKey(conditions["query"], function (err, count) {
        key = conditions["query"];
        pagenum = parseInt(conditions["pagenum"]);
        pagesize = parseInt(conditions["pagesize"]);

        pageCount = Math.ceil(count / pagesize);
        console.log("pageCount", pageCount);

        if (pagenum > pageCount) return cb("页数超出范围");
        offset = (pagenum - 1) * pagesize;
        if (offset >= count) {
            offset = count;
        }
        limit = pagesize;

        RenewalDAO.findReportByKey(key, offset, limit, function (err, orders) {
            var retOrders = [];
            for (idx in orders) {
                var order = orders[idx];
                retOrders.push({
                    "id": order.order_id,
                    "user_id": order.user_id,
                    "user_name": order.user_name,
                    "user_num": order.user_num,
                    "user_birthday": order.user_birthday,
                    "user_phone": order.user_phone,
                    "user_address": order.user_address,
                    "seller_name": order.seller_name,
                    "seller_num": order.seller_num,
                    "seller_birthday": order.seller_birthday,
                    "seller_phone": order.seller_phone,
                    "seller_address": order.seller_address,
                    "seller_id": order.seller_id,
                    "order_kind": order.order_kind,
                    "order_number": order.order_number,
                    "order_price": order.order_price,
                    "order_pay": order.order_pay,
                    "pay_status": order.pay_status,
                    "create_time": order.create_time,
                    "update_time": order.update_time,
                    "next_pay_time": order.next_pay_time,
                })
            }
            var resultDta = {};
            resultDta["total"] = count;
            resultDta["pagenum"] = pagenum;
            resultDta["orders"] = retOrders;
            cb(err, resultDta);
        });
    });
}

/**
 * 创建保单
 *
 * @param  {[type]}   user 保单数据集
 * @param  {Function} cb   回调函数
 */
module.exports.createRenewal = function (params, cb) {
    var nowDate = new Date();//当前时间
    var year = nowDate.getFullYear();//获取年
    var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;//获取月份，两位不够补0
    var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();//获取日期，两位不够补0

    var dateStr = year + "-" + month + "-" + day;
    var datenextStr = (year + 1) + "-" + month + "-" + day;
    RenewalDAO.exists(params.order_number, function (err, isExists) {
        if (err) return cb(err);

        if (isExists) {
            return cb("保单号已存在");
        }

        RenewalDAO.create({
            "user_num": params.user_num,
            "seller_num": params.seller_num,
            "order_kind": params.order_kind,
            "order_number": params.order_number,
            "order_price": params.order_price,
            "order_pay": params.order_pay,
            "pay_status": params.pay_status,
            "create_time": dateStr,
            "update_time": dateStr,
            "next_pay_time": datenextStr,
        }, function (err, order) {
            if (err) return cb(err);
            result = {
                "id": order.id,
                "user_num": order.user_num,
                "seller_num": order.seller_num,
                "order_kind": order.order_kind,
                "order_number": order.order_number,
                "order_price": order.order_price,
                "order_pay": order.order_pay,
                "pay_status": order.pay_status,
                "create_time": order.create_time,
                "update_time": order.update_time,
                "next_pay_time": order.next_pay_time,
            };
            cb(null, result);
        });
    })
}

/**
 * 更新保单信息
 *
 * @param  {*}   params 保单信息
 * @param  {Function} cb     回调函数
 */
module.exports.updateRenewal = function (params, cb) {
    console.log("this is updateRenewal");
    console.log(params);
    RenewalDAO.update(
        {
            "order_id": params.id,
            "next_pay_time": params.next_pay_time,
            "pay_status": '0'
        },
        function (err, order) {
            if (err) return cb(err);
            cb(
                null,
                {
                    "id": order.id,
                    "pay_status": order.pay_status,
                    "next_pay_time": order.next_pay_time,
                });
        }
    )
}

/**
 * 通过保单 ID 获取投保人信息
 *
 * @param  {[type]}   id 保单 ID
 * @param  {Function} cb 回调函数
 */
module.exports.getRenewal = function (id, cb) {
    RenewalDAO.show(id, function (err, order) {
        if (err) return cb(err);
        if (!order) return cb("保单不存在");
        cb(null, {
            "id": order.order_id,
            "user_id": order.user_id,
            "seller_id": order.seller_id,
            "order_kind": order.order_kind,
            "order_number": order.order_number,
            "order_price": order.order_price,
            "order_pay": order.order_pay,
            "pay_status": order.pay_status,
            "create_time": order.create_time,
            "update_time": order.update_time,
            "next_pay_time": order.next_pay_time,
        });
    });
}

/**
 * 通过保单 ID 进行删除操作
 *
 * @param  {[type]}   id 保单ID
 * @param  {Function} cb 回调函数
 */

module.exports.deleteRenewal = function (id, cb) {
    RenewalDAO.destroy(id, function (err) {
        if (err) return cb("删除失败");
        cb(null);
    });
}
