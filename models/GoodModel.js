module.exports = function(db,callback){
	// 用户模型
	db.define("GoodModel",{
		goods_id : {type: 'serial', key: true},
		goods_name : String,
		goods_price : Number,
		cat_id : Number,
		goods_introduce : String,
		is_del : ['0','1'],	// 0: 正常 , 1: 删除
		add_time : Date,
		upd_time : Date,
		delete_time : Date,
		cat_one_id : Number,
		cat_two_id : Number,
		goods_state : Number	// 0：未审核 1: 审核中 2: 已审核
	},{
		table : "sp_goods",
		methods: {
		getGoodsCat: function () {
			return this.cat_one_id + ',' + this.cat_two_id;
		}
	}
	});
	return callback();
}
