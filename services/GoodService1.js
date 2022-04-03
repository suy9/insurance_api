var _ = require('lodash');
var path = require("path");
var dao = require(path.join(process.cwd(),"dao/DAO"));
var goodAttributeDao = require(path.join(process.cwd(),"dao/GoodAttributeDAO"));
var orm = require("orm");
var Promise = require("bluebird");
var fs = require("fs");

var gm = require("gm");
var uniqid = require('uniqid');
var upload_config = require('config').get("upload_config");

/**
 * 通过参数生成产品基本信息
 * 
 * @param  {[type]} params.cb [description]
 * @return {[type]}           [description]
 */
function generateGoodInfo(params) {
	return new Promise(function(resolve,reject){
		var info = {};
		if(params.goods_id) info["goods_id"] = params.goods_id;
		if(!params.goods_name) return reject("商品名称不能为空");
		info["goods_name"] = params.goods_name;

		if(!params.goods_price) return reject("商品价格不能为空");
		var price = parseFloat(params.goods_price);
		if(isNaN(price) || price < 0) return reject("商品价格不正确")
		info["goods_price"] = price;


		if(!params.goods_cat) return reject("商品没有设置所属分类");
		var cats = params.goods_cat.split(',');
		if(cats.length > 0) {
			info["cat_one_id"] = cats[0];
		}
		if(cats.length > 1) {
			info["cat_two_id"] = cats[1];
		}
		if(cats.length > 2) {
			info["cat_three_id"] = cats[2];
			info["cat_id"] = cats[2];
		}

		// 属性
		if(params.attrs) {
			info["attrs"] = params.attrs;
		} 


		info["add_time"] = Date.parse(new Date()) / 1000;
		info["upd_time"] = Date.parse(new Date()) / 1000;
		info["is_del"] = '0';

		if(params.hot_mumber) {
			hot_num = parseInt(params.hot_mumber);
			if(isNaN(hot_num) || hot_num < 0) return reject("热销品数量格式不正确");
			info["hot_mumber"] = hot_num;
		} else {
			info["hot_mumber"] = 0;
		}
		
		info["is_promote"] = info["is_promote"] ? info["is_promote"] : false;
		
		resolve(info);
	});
}

/**
 * 检查商品名称是否重复
 * 
 * @param  {[type]} info [description]
 * @return {[type]}      [description]
 */
function checkGoodName(info) {
	return new Promise(function(resolve,reject) {

		dao.findOne("GoodModel",{"goods_name":info.goods_name,"is_del":"0"},function(err,good) {
			if(err) return reject(err);
			if(!good) return resolve(info);
			if(good.goods_id == info.goods_id) return resolve(info);
			return reject("商品名称已存在");
		});
	});
}

/**
 * 创建商品基本信息
 * 
 * @param  {[type]} info [description]
 * @return {[type]}      [description]
 */
function createGoodInfo(info) {

	return new Promise(function(resolve,reject){
		dao.create("GoodModel",_.clone(info),function(err,newGood) {

			if(err) return reject("创建商品基本信息失败");
			newGood.goods_cat = newGood.getGoodsCat();
			info.good = newGood;
			return resolve(info);
		});
	});
}

function updateGoodInfo(info) {
	return new Promise(function(resolve,reject){
		if(!info.goods_id) return reject("商品ID不存在");
		dao.update("GoodModel",info.goods_id,_.clone(info),function(err,newGood) {
			if(err) return reject("更新商品基本信息失败");
			info.good = newGood;
			return resolve(info);
		});
		
	});
}

/**
 * 获取商品对象
 * 
 * @param  {[type]} info 查询内容
 * @return {[type]}      [description]
 */
function getGoodInfo(info) {
	return new Promise(function(resolve,reject){
		if(!info || !info.goods_id || isNaN(info.goods_id)) return reject("商品ID格式不正确");
		
		dao.show("GoodModel",info.goods_id,function(err,good){
			if(err) return reject("获取商品基本信息失败");
			good.goods_cat = good.getGoodsCat();
			info["good"] = good;
			return resolve(info);
		});
	});
}


function createGoodAttribute(goodAttribute) {
	return new Promise(function(resolve,reject) {
		dao.create("GoodAttributeModel",_.omit(goodAttribute,"delete_time"),function(err,newAttr){
			if(err) return reject("创建商品参数失败");
			resolve(newAttr);
		});
	});
}

/**
 * 更新商品属性
 * 
 * @param  {[type]} info 参数
 * @param  {[type]} good 商品对象
 */
function doUpdateGoodAttributes(info) {
	return new Promise(function(resolve,reject) {
		var good = info.good;
		if(!good.goods_id) return reject("获取商品图片必须先获取商品信息");
		if(!info.attrs) return resolve(info);
		// var GoodAttributeModel = dao.getModel("GoodAttributeModel");
		goodAttributeDao.clearGoodAttributes(good.goods_id,function(err){
			if(err) return reject("清理原始的商品参数失败");
			
			var newAttrs = info.attrs ? info.attrs : [];

			if(newAttrs) {
				var createFns = [];
				_(newAttrs).forEach(function(newattr) {
					newattr.goods_id = good.goods_id;
					if(newattr.attr_value) {
						if(newattr.attr_value instanceof Array) {
							newattr.attr_value = newattr.attr_value.join(",");
						} else {
							newattr.attr_value = newattr.attr_value;
						}
					}
					else
						newattr.attr_value = "";
					createFns.push(createGoodAttribute(_.clone(newattr)));
				});
			}

			if(createFns.length == 0) return resolve(info);

			Promise.all(createFns)
			.then(function(){
				resolve(info);
			})
			.catch(function(error){
				if(error) return reject(error);
			});

			
		});
	});
}

/**
 * 挂载属性
 * @param  {[type]} info [description]
 * @return {[type]}      [description]
 */
function doGetAllAttrs(info) {
	return new Promise(function(resolve,reject){
		var good = info.good;
		if(!good.goods_id) return reject("获取商品图片必须先获取商品信息");
		goodAttributeDao.list(good.goods_id,function(err,goodAttrs){

			if(err) return reject("获取所有商品参数列表失败");
			info.good.attrs = goodAttrs;
			resolve(info);
		});
	});
}


/**
 * 创建商品
 * 
 * @param  {[type]}   params 商品参数
 * @param  {Function} cb     回调函数
 */
module.exports.createGood = function(params,cb) {


	// 验证参数 & 生成数据
	generateGoodInfo(params)
	// 检查商品名称
	.then(checkGoodName)
	// 创建商品
	.then(createGoodInfo)
	// 更新商品参数
	.then(doUpdateGoodAttributes)
	.then(doGetAllAttrs)
	// 创建成功
	.then(function(info){
		cb(null,info.good);
	})
	.catch(function(err) {
		cb(err);
	});
}

/**
 * 删除商品
 * 
 * @param  {[type]}   id 商品ID
 * @param  {Function} cb 回调函数
 */
module.exports.deleteGood = function(id,cb) {
	if(!id) return cb("产品ID不能为空");
	if(isNaN(id)) return cb("产品ID必须为数字");
	dao.update(
		"GoodModel",
		id,
		{
			'is_del':'1',
			'delete_time':Date.parse(new Date()) / 1000,
			'upd_time' : Date.parse(new Date()) / 1000
		},
		function(err){
			if(err) return cb(err);
			cb(null);
		}
	);
}

/**
 * 获取商品列表
 * 
 * @param  {[type]}   params     查询条件
 * @param  {Function} cb         回调函数
 */
module.exports.getAllGoods = function(params,cb) {
	var conditions = {};
	if(!params.pagenum || params.pagenum <= 0) return cb("pagenum 参数错误");
	if(!params.pagesize || params.pagesize <= 0) return cb("pagesize 参数错误"); 

	conditions["columns"] = {};
	if(params.query) {
		conditions["columns"]["goods_name"] = orm.like("%" + params.query + "%");
	}
	conditions["columns"]["is_del"] = '0';


	dao.countByConditions("GoodModel",conditions,function(err,count){
		if(err) return cb(err);
		pagesize = params.pagesize;
		pagenum = params.pagenum;
		pageCount = Math.ceil(count / pagesize);
		offset = (pagenum - 1) * pagesize;
		if(offset >= count) {
			offset = count;
		}
		limit = pagesize;

		// 构建条件
		conditions["offset"] = offset;
		conditions["limit"] = limit;
		conditions["only"] = ["goods_id","goods_name","goods_price","add_time","goods_number","upd_time","hot_mumber","is_promote"];
		conditions["order"] = "-add_time";


		dao.list("GoodModel",conditions,function(err,goods){
			if(err) return cb(err);
			var resultDta = {};
			resultDta["total"] = count;
			resultDta["pagenum"] = pagenum;
			resultDta["goods"] = _.map(goods,function(good){
				return _.omit(good,"goods_introduce","is_del","delete_time");
			});
			cb(err,resultDta);
		})
	});
}

/**
 * 更新商品
 * 
 * @param  {[type]}   id     商品ID
 * @param  {[type]}   params 参数
 * @param  {Function} cb     回调函数
 */
module.exports.updateGood = function(id,params,cb) {
	
	params.goods_id = id;
	// 验证参数 & 生成数据
	generateGoodInfo(params)
	// 检查商品名称
	.then(checkGoodName)
	// 创建商品
	.then(updateGoodInfo)
	// 更新商品参数
	.then(doUpdateGoodAttributes)
	.then(doGetAllPics)
	.then(doGetAllAttrs)
	// 创建成功
	.then(function(info){
		cb(null,info.good);
	})
	.catch(function(err) {
		cb(err);
	});
}

module.exports.updateGoodAttributes = function(goods_id,attrs,cb) {
	
	getGoodInfo({"goods_id":goods_id,"attrs":attrs})
	.then(doUpdateGoodAttributes)
	.then(doGetAllAttrs)
	.then(function(info){
		cb(null,info.good);
	})
	.catch(function(err) {
		cb(err);
	});
}

/**
 * 通过商品ID获取商品数据
 * 
 * @param  {[type]}   id 商品ID
 * @param  {Function} cb 回调函数
 */
module.exports.getGoodById = function(id,cb) {
	getGoodInfo({"goods_id":id})
	.then(doGetAllAttrs)
	.then(function(info){
		cb(null,info.good);
	})
	.catch(function(err) {
		cb(err);
	});
}
