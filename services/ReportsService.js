var path = require("path");
var reportDAO = require(path.join(process.cwd(), "dao/ReportDAO"));
var logger = require('../modules/logger').logger();


/**
 * 获取所有管理员
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

module.exports.getReports = function(conditions, cb) {
	if(!conditions.pagenum)return cb(new Error("pagenum is required"));
	if(!conditions.pagesize)return cb(new Error("pagesize is required"));

	reportDAO.countreportsByKey(conditions["query"], conditions["startDate"],conditions["endDate"], function(err, count) {
		pagenum = parseInt(conditions["pagenum"]);
		pagesize = parseInt(conditions["pagesize"]);

		pageCount = Math.ceil(count / pagesize);
		offset = (pagenum - 1) * pagesize;
		if (offset >= count) {
			offset = count;
		}
		limit = pagesize;

		reportDAO.findreportByKey(conditions["query"], conditions["startDate"],conditions["endDate"],offset, limit, function (err, reports) {
			var retReports = [];
			for (idx in reports) {
				var report = reports[idx];

				retReports.push({
					"id": report.order_id,
					"user_name": report.user_name,
					"user_num": report.user_num,
					"user_birthday": report.user_birthday,
					"user_phone": report.user_phone,
					"user_address": report.user_address,
					"seller_name": report.seller_name,
					"seller_num": report.seller_num,
					"seller_birthday": report.seller_birthday,
					"seller_phone": report.seller_phone,
					"seller_address": report.seller_address,
					"order_kind": report.order_kind,
					"order_number": report.order_number,
					"order_price": report.order_price,
					"order_pay": report.order_pay,
					"pay_status": report.pay_status,
					"create_time": report.create_time,
					"update_time": report.update_time,
					"next_pay_time": report.next_pay_time,
				});
			}
			var resultDta = {};
			resultDta["total"] = count;
			resultDta["pagenum"] = pagenum;
			resultDta["reports"] = retReports;
			console.log('resultDta',resultDta);
			cb(err, resultDta);
		});
	});
};
