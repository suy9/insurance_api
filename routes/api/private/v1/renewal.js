var express = require('express');
var router = express.Router();
var path = require("path");

// 获取验证模块
var authorization = require(path.join(process.cwd(), "/modules/authorization"));

// 通过验证模块获取分类管理
var renewalServ = authorization.getService("RenewalService");

// 订单列表
router.get("/",
    // 参数验证
    function (req, res, next) {
        // 参数验证
        if (!req.query.pagenum || req.query.pagenum <= 0) return res.sendResult(null, 400, "pagenum 参数错误");
        if (!req.query.pagesize || req.query.pagesize <= 0) return res.sendResult(null, 400, "pagesize 参数错误");
        next();
    },
    // 业务逻辑
    function (req, res, next) {
        renewalServ.getAllRenewals(
            {
                query: req.query.query,
                pagenum: req.query.pagenum,
                pagesize: req.query.pagesize
            },
            function (err, result) {
                if (err) return res.sendResult(null, 400, err);
                res.sendResult(result, 200, "获取保单列表成功");
            },
        )(req, res, next);
    }
);

// 添加订单
router.post("/",
    // 参数验证
    function (req, res, next) {
        console.log(req.body);
        if (!req.body.user_num) return res.sendResult(null, 400, "user_id 参数错误");
        if (!req.body.seller_num) return res.sendResult(null, 400, "seller_id 参数错误");
        if (!req.body.order_kind) return res.sendResult(null, 400, "order_kind 参数错误");
        if (!req.body.order_number) return res.sendResult(null, 400, "order_number 参数错误");
        if (req.body.order_price <= 0) return res.sendResult(null, 400, "order_price 参数错误");
        if (!req.body.order_pay) return res.sendResult(null, 400, "order_pay 参数错误");
        if (!req.body.pay_status) return res.sendResult(null, 400, "pay_status 参数错误");
        next();
    },
    // 业务逻辑
    function (req, res, next) {
        params = {
            "user_num": req.body.user_num,
            "seller_num": req.body.seller_num,
            "order_kind": req.body.order_kind,
            "order_number": req.body.order_number,
            "order_price": req.body.order_price,
            "order_pay": req.body.order_pay,
            "pay_status": req.body.pay_status,
            "next_pay_time": req.body.next_pay_time
        }
        renewalServ.createRenewal(params, function (err, result) {
                if (err) return res.sendResult(null, 400, err);
                res.sendResult(result, 201, "添加保单成功");
            }
        )(req, res, next);
    }
);

// 更新订单发送状态
router.put("/:id",
    // 参数验证
    function (req, res, next) {
        if (!req.params.id) return res.sendResult(null, 400, "保单id不能为空");
        if(isNaN(parseInt(req.params.id))) return res.sendResult(null, 400, "保单id必须为数字");
        next();
        console.log(req.body);
    },
    // 业务逻辑
    function (req, res, next) {
        params = {
            "id": req.params.id,
            "next_pay_time": req.body.next_pay_time
        }
        renewalServ.updateRenewal(params, function (err, result) {
                if (err) return res.sendResult(null, 400, err);
                res.sendResult(result, 200, "更新成功");
            }
        )(req, res, next);
    }
);

router.delete("/:id",
    // 参数验证
    function (req, res, next) {
        if (!req.params.id) return res.sendResult(null, 400, "保单id不能为空");
        if(isNaN(parseInt(req.params.id))) return res.sendResult(null, 400, "保单id必须为数字");
        next();
    },
    // 业务逻辑
    function (req, res, next) {
        renewalServ.deleteRenewal(req.params.id, function (err, result) {
                if (err) return res.sendResult(null, 400, err);
                res.sendResult(result, 200, "删除成功");
            }
        )(req, res, next);
    }
);




router.get("/:id",
    // 参数验证
    function (req, res, next) {
        console.log(req.pa)
        if (!req.params.id) {
            return res.sendResult(null, 400, "保单id不能为空");
        }
        if (isNaN(parseInt(req.params.id))) return res.sendResult(null, 400, "保单id必须为数字");
        next();
    },
    function (req,res,next) {
        renewalServ.getRenewal(req.params.id, function (err, result) {
            if (err) return res.sendResult(null, 400, err);
            res.sendResult(result, 200, "获取保单成功");
        }) (req, res, next);
    }
);


module.exports = router;
