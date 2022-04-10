var express = require('express');
var router = express.Router();
var path = require("path");

// 获取验证模块
var authorization = require(path.join(process.cwd(),"/modules/authorization"));

var repServ = authorization.getService("ReportsService");






router.get("/",
    function(req,res,next) {
        // 参数验证
        if(!req.query.pagenum || req.query.pagenum <= 0) return res.sendResult(null,400,"pagenum 参数错误");
        if(!req.query.pagesize || req.query.pagesize <= 0) return res.sendResult(null,400,"pagesize 参数错误");
        next();
    },
    function (req, res, next) {
        // 获取用户列表
        repServ.getReports({
            "query":req.query.query,
            "startDate":req.query.startDate,
            "endDate":req.query.endDate,
            "pagenum":req.query.pagenum,
            "pagesize":req.query.pagesize
        },
            function(err,result){
            if(err) return res.sendResult(null,400,err);
            res.sendResult(result,200,"获取数据列表成功");
            console.log(result);
            console.log("this is a test");
        }
        )(req,res,next);
    }
);

module.exports = router;
