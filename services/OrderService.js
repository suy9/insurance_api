var path = require("path");
var orderDAO = require(path.join(process.cwd(), "dao/OrderDAO"));


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
module.exports.getAllOrders = function (conditions, cb) {

    if (!conditions.pagenum) return cb("pagenum 参数不合法");
    if (!conditions.pagesize) return cb("pagesize 参数不合法");

    orderDAO.countOrderByKey(conditions["query"], function (err, count) {
        key = conditions["query"];
        pagenum = parseInt(conditions["pagenum"]);
        pagesize = parseInt(conditions["pagesize"]);

        pageCount = Math.ceil(count / pagesize);
        if (pagenum > pageCount) return cb("页数超出范围");
        offset = (pagenum - 1) * pagesize;
        if (offset >= count) {
            offset = count;
        }
        limit = pagesize;
        orderDAO.findOrderByKey(key, offset, limit, function (err, orders) {
            var retOrders = [];
            for (idx in orders) {
                var order = orders[idx];

                console.log(orders);
                retOrders.push({
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
module.exports.createOrder = function (params, cb) {

    orderDAO.exists(params.order_number, function (err,isExists) {
        if (err) return cb(err);

        if (isExists) {
            return cb("保单号已存在");
        }

        orderDAO.create({
            "user_id": params.user_id,
            "seller_id": params.seller_id,
            "order_kind": params.order_kind,
            "order_number": params.order_number,
            "order_price": params.order_price,
            "order_pay": params.order_pay,
            "pay_status": params.pay_status,
            "create_time": (Date.parse(new Date()) / 1000),
            "update_time": (Date.parse(new Date()) / 1000),
        }, function (err, order) {
            if (err) return cb(err);
            result = {
                "id": order.id,
                "user_id": order.user_id,
                "seller_id": order.seller_id,
                "order_kind": order.order_kind,
                "order_number": order.order_number,
                "order_price": order.order_price,
                "order_pay": order.order_pay,
                "pay_status": order.pay_status,
                "create_time": order.create_time,
                "update_time": order.update_time,
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
module.exports.updateOrder = function (params, cb) {
    orderDAO.update(
        {
            "order_id": params.order_id,
            "user_id": params.user_id,
            "seller_id": params.seller_id,
            "order_kind": params.order_kind,
            "order_number": params.order_number,
            "order_price": params.order_price,
            "order_pay": params.order_pay,
            "pay_status": params.pay_status,
            "update_time": (Date.parse(new Date()) / 1000),
        },
        function (err, order) {
            if (err) return cb(err);
            cb(
                null,
                {
                    "id": order.id,
                    "user_id": order.user_id,
                    "seller_id": order.seller_id,
                    "order_kind": order.order_kind,
                    "order_number": order.order_number,
                    "order_price": order.order_price,
                    "order_pay": order.order_pay,
                    "pay_status": order.pay_status,
                    "create_time": order.create_time,
                    "update_time": order.update_time,
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
module.exports.getOrder = function (id, cb) {
    orderDAO.show(id,function (err, order) {
        if (err) return cb(err);
        if(!order) return cb("保单不存在");
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
        });
    });
}

/**
 * 通过保单 ID 进行删除操作
 *
 * @param  {[type]}   id 保单ID
 * @param  {Function} cb 回调函数
 */

module.exports.deleteOrder = function (id, cb) {
    orderDAO.destroy(id, function (err) {
        if (err) return cb("删除失败");
        cb(null);
    });
}
