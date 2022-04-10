SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_category
-- ----------------------------
DROP TABLE IF EXISTS `sp_category`;
CREATE TABLE `sp_category`
(
    `cat_id`      int(32) NOT NULL AUTO_INCREMENT COMMENT '分类唯一ID',
    `cat_name`    varchar(255) DEFAULT NULL COMMENT '分类名称',
    `cat_pid`     int(32)      DEFAULT NULL COMMENT '分类父ID',
    `cat_level`   int(4)       DEFAULT NULL COMMENT '分类层级 0: 顶级 1:二级 2:三级',
    `cat_deleted` int(2)       DEFAULT '0' COMMENT '是否删除 1为删除',
    PRIMARY KEY (`cat_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1484
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_category
-- ----------------------------
INSERT INTO `sp_category`
VALUES ('1', '保险产品分类', '0', '0', '0');
INSERT INTO `sp_category`
VALUES ('2', '人身保险', '1', '1', '0');
INSERT INTO `sp_category`
VALUES ('3', '意外险', '2', '2', '0');
INSERT INTO `sp_category`
VALUES ('4', '医疗险', '2', '2', '0');
INSERT INTO `sp_category`
VALUES ('5', '重疾险', '2', '2', '0');
INSERT INTO `sp_category`
VALUES ('6', '养老险', '2', '2', '0');
INSERT INTO `sp_category`
VALUES ('7', '财产保险', '1', '1', '0');
INSERT INTO `sp_category`
VALUES ('8', '车险', '7', '2', '0');
INSERT INTO `sp_category`
VALUES ('9', '企财险', '7', '2', '0');
INSERT INTO `sp_category`
VALUES ('10', '工程险', '7', '2', '0');
INSERT INTO `sp_category`
VALUES ('11', '责任险', '7', '2', '0');
INSERT INTO `sp_category`
VALUES ('12', '信用险', '7', '2', '0');
INSERT INTO `sp_category`
VALUES ('13', '保证险', '7', '2', '0');

-- ----------------------------
-- Table structure for sp_goods
-- ----------------------------
DROP TABLE IF EXISTS `sp_goods`;
CREATE TABLE `sp_goods`
(
    `goods_id`         mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `goods_name`       varchar(255)          NOT NULL COMMENT '保险名称',
    `goods_price`      decimal(10, 2)        NOT NULL DEFAULT '0.00' COMMENT '保险价格',
    `cat_one_id`       smallint(5)                    DEFAULT '0' COMMENT '一级分类id',
    `cat_two_id`       smallint(5)                    DEFAULT '0' COMMENT '二级分类id',
    `cat_id`           smallint(5) unsigned  NOT NULL DEFAULT '0' COMMENT '类型id',
    `goods_introduce`  varchar(255)     COMMENT '商品详情介绍',
    `add_time`         int(11)               NOT NULL COMMENT '添加商品时间',
    `upd_time`         int(11)               NOT NULL COMMENT '修改商品时间',
    `is_del`           enum ('0','1')        NOT NULL DEFAULT '0' COMMENT '0:正常  1:删除',
    `delete_time`      int(11)                        DEFAULT NULL COMMENT '软删除标志字段',
    `goods_state`      int(11)                        DEFAULT '0' COMMENT '商品状态 0: 未通过 1: 审核中 2: 已审核',
    PRIMARY KEY (`goods_id`),
    UNIQUE KEY `goods_name` (`goods_name`),
    KEY `goods_price` (`goods_price`),
    KEY `add_time` (`add_time`),
    KEY `goods_name_2` (`goods_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 928
  DEFAULT CHARSET = utf8 COMMENT ='险种表';

-- ----------------------------
-- Records of sp_goods
-- ----------------------------
INSERT INTO `sp_goods`
VALUES ('1', '意外险', 1000, '1', '2', '3', '内容', 1649489164, 1649489164, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('2', '医疗险', 1000, '1', '2', '4', '内容', 1649489192, 1649489192, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('3', '重疾险', 1000, '1', '2', '5', '', 1649489206, 1649489206, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('4', '养老险', 1000, '1', '2', '6', '', 1649489217, 1649489217, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('5', '车险', 1000, '1', '7', '8', '', 1649489232, 1649489232, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('6', '企财险', 1000, '1', '7', '9', '', 1649489244, 1649489244, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('7', '工程险', 1000, '1', '7', '10', '', 1649489256, 1649489256, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('8', '责任险', 1000, '1', '7', '11', '', 1649489269, 1649489269, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('9', '信用险', 1000, '1', '7', '12', '', 1649489283, 1649489283, '0', NULL, NULL);
INSERT INTO `sp_goods`
VALUES ('10', '保证险', 1000, '1', '7', '13', '', 1649489297, 1649489297, '0', NULL, NULL);

-- ----------------------------
-- Table structure for sp_manager
-- ----------------------------
DROP TABLE IF EXISTS `sp_manager`;
CREATE TABLE `sp_manager`
(
    `mg_id`     int(11)          NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `mg_name`   varchar(32)      NOT NULL COMMENT '名称',
    `mg_pwd`    char(64)         NOT NULL COMMENT '密码',
    `mg_time`   int(10) unsigned COMMENT '注册时间',
    `role_id`   tinyint(11)      NOT NULL DEFAULT '0' COMMENT '角色id',
    `mg_mobile` varchar(32)               DEFAULT NULL,
    `mg_email`  varchar(64)               DEFAULT NULL,
    `mg_state`  tinyint(2)                DEFAULT '1' COMMENT '1：表示启用 0:表示禁用',
    PRIMARY KEY (`mg_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 510
  DEFAULT CHARSET = utf8 COMMENT ='管理员表';

-- ----------------------------
-- Records of sp_manager
-- ----------------------------
INSERT INTO `sp_manager`
VALUES ('500', 'admin', '123456', '1486720211', '0', '12345678', 'adsfad@qq.com', '1');
-- $2y$10$sZlpZNoLAnoD1DtYO9REAODCPkpMb5bwl4oMzrMvJa83k9BY3KRwq

-- ----------------------------
-- Table structure for sp_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order`
(
    `order_id`      int(10) unsigned   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_num`      varchar(32)        NOT NULL COMMENT '投保人身份证号',
    `seller_num`    varchar(32)        NOT NULL COMMENT '被投保人身份证号',
    `order_kind`    varchar(32)        NOT NULL COMMENT '保险种类',
    `order_number`  varchar(32)        NOT NULL COMMENT '订单编号',
    `order_price`   decimal(10, 2)     NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
    `order_pay`     enum ('1','2','3') NOT NULL DEFAULT '1' COMMENT '支付方式  1支付宝  2微信  3银行卡',
    `pay_status`    enum ('0','1')     NOT NULL DEFAULT '0' COMMENT '订单状态： 0正常、1逾期',
    `create_time`   varchar(30)        NOT NULL COMMENT '记录生成时间',
    `update_time`   varchar(30)        NOT NULL COMMENT '记录修改时间',
    `next_pay_time` varchar(30)        NOT NULL COMMENT '下次缴费时间',
    PRIMARY KEY (`order_id`),
    UNIQUE KEY `order_number` (`order_number`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8 COMMENT ='订单表';

-- ----------------------------
-- Records of sp_order
-- ----------------------------
INSERT INTO `sp_order`
VALUES ('1', '332522198705040011', '35042619790906301X', '信用险', 'itcast-1151543252053', '9464.93', '1', '1', '2016-04-27', '2020-01-18', '2022-02-23');
INSERT INTO `sp_order`
VALUES ('2', '210602198711260513', '340103198303072554', '车险', 'itcast-1287774058660', '2719.35', '2', '0', '2015-02-05', '2018-03-23', '2022-11-19');
INSERT INTO `sp_order`
VALUES ('3', '410183199307210015', '362326198306270039', '医疗险', 'itcast-2256110820065', '7098.06', '1', '0', '2015-01-18', '2020-11-13', '2022-04-12');
INSERT INTO `sp_order`
VALUES ('4', '430503198706130038', '331081198601210014', '重疾险', 'itcast-7447567155163', '6974.35', '1', '0', '2016-11-17', '2020-05-14', '2022-11-24');
INSERT INTO `sp_order`
VALUES ('5', '230103198509121352', '120106199501191514', '医疗险', 'itcast-7442041481162', '1060.6', '3', '0', '2014-12-31', '2020-01-21', '2022-08-08');
INSERT INTO `sp_order`
VALUES ('6', '130825199408161416', '342623198109140335', '保证险', 'itcast-7668345537250', '273.25', '1', '0', '2016-09-26', '2018-10-09', '2022-12-21');
INSERT INTO `sp_order`
VALUES ('7', '522125198511033430', '422823198511163376', '意外险', 'itcast-1208274820058', '8955.82', '1', '1', '2015-10-03', '2018-07-03', '2022-03-20');
INSERT INTO `sp_order`
VALUES ('8', '130181198808086417', '31010919850214201X', '养老险', 'itcast-8013633674562', '4998.04', '1', '0', '2015-06-11', '2019-01-30', '2022-07-24');
INSERT INTO `sp_order`
VALUES ('9', '37060219830224041X', '431223199110305030', '责任险', 'itcast-2028227384652', '589.3', '3', '0', '2016-03-16', '2020-12-13', '2022-10-23');
INSERT INTO `sp_order`
VALUES ('10', '422201199001160814', '431002198211301517', '企财险', 'itcast-1332365071506', '7870.11', '3', '0', '2014-05-31', '2018-04-23', '2022-06-09');


-- --------------------------
-- Table structure for sp_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_goods`;
CREATE TABLE `sp_order_goods`
(
    `id`                int(10) unsigned      NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `order_id`          int(10) unsigned      NOT NULL COMMENT '订单id',
    `goods_id`          mediumint(8) unsigned NOT NULL COMMENT '商品id',
    `goods_price`       decimal(10, 2)        NOT NULL DEFAULT '0.00' COMMENT '商品单价',
    PRIMARY KEY (`id`),
    KEY `order_id` (`order_id`),
    KEY `goods_id` (`goods_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 86
  DEFAULT CHARSET = utf8 COMMENT ='商品订单关联表';

-- ----------------------------
-- Records of sp_order_goods
-- ----------------------------
INSERT INTO `sp_order_goods`
VALUES ('1', '1', '1', '1000.00');
INSERT INTO `sp_order_goods`
VALUES ('2', '1', '2', '1000.00');
INSERT INTO `sp_order_goods`
VALUES ('3', '1', '3', '1000.00');

-- ----------------------------
-- Table structure for sp_permission
-- ----------------------------
DROP TABLE IF EXISTS `sp_permission`;
CREATE TABLE `sp_permission`
(
    `ps_id`    smallint(6) unsigned NOT NULL AUTO_INCREMENT,
    `ps_name`  varchar(20)          NOT NULL COMMENT '权限名称',
    `ps_pid`   smallint(6) unsigned NOT NULL COMMENT '父id',
    `ps_c`     varchar(32)          NOT NULL DEFAULT '' COMMENT '控制器',
    `ps_a`     varchar(32)          NOT NULL DEFAULT '' COMMENT '操作方法',
    `ps_level` enum ('0','2','1')   NOT NULL DEFAULT '0' COMMENT '权限等级',
    PRIMARY KEY (`ps_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 200
  DEFAULT CHARSET = utf8 COMMENT ='权限表';

-- ----------------------------
-- Records of sp_permission
-- ----------------------------
INSERT INTO `sp_permission`
VALUES ('101', '险种管理', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('102', '保单管理', '0', '', 'order', '0');
INSERT INTO `sp_permission`
VALUES ('104', '险种列表', '101', 'Goods', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('105', '添加险种', '104', 'Goods', 'tianjia', '2');
INSERT INTO `sp_permission`
VALUES ('107', '保单列表', '102', 'Order', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('109', '添加订单', '107', 'Order', 'tianjia', '2');
INSERT INTO `sp_permission`
VALUES ('110', '用户列表', '125', 'Manager', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('112', '投保人列表', '125', 'User', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('113', '被投保人列表', '125', 'Seller', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('116', '商品修改', '104', 'Goods', 'upd', '2');
INSERT INTO `sp_permission`
VALUES ('117', '商品删除', '104', 'Goods', 'del', '2');
INSERT INTO `sp_permission`
VALUES ('125', '用户管理', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('131', '添加用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('132', '删除用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('133', '更新用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('136', '获取用户详情', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('137', '分配用户角色', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('145', '数据统计', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('146', '数据报表', '145', '', '', '1');
INSERT INTO `sp_permission`
VALUES ('147', '订单统计', '145', '', '', '1');
INSERT INTO `sp_permission`
VALUES ('148', '查看数据', '146', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('151', '更新商品属性', '104', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('152', '更新商品状态', '104', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('153', '获取商品详情', '104', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('154', '订单更新', '107', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('155', '获取订单详情', '107', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('159', '设置管理状态', '110', '', '', '2');
-- user
INSERT INTO `sp_permission`
VALUES ('161', '添加用户', '112', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('162', '删除用户', '112', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('163', '更新用户', '112', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('166', '获取用户详情', '112', '', '', '2');
-- seller
INSERT INTO `sp_permission`
VALUES ('171', '添加用户', '113', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('172', '删除用户', '113', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('173', '更新用户', '113', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('176', '获取用户详情', '113', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('177', '删除订单', '107', '', '', '2');

INSERT INTO `sp_permission`
VALUES ('178', '续期拜访', '102', 'Renewal', '', '1');

-- ----------------------------
-- Table structure for sp_permission_api
-- ----------------------------
DROP TABLE IF EXISTS `sp_permission_api`;
CREATE TABLE `sp_permission_api`
(
    `id`             int(11) NOT NULL AUTO_INCREMENT,
    `ps_id`          int(11) NOT NULL,
    `ps_api_service` varchar(255) DEFAULT NULL,
    `ps_api_action`  varchar(255) DEFAULT NULL,
    `ps_api_path`    varchar(255) DEFAULT NULL,
    `ps_api_order`   int(4)       DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `ps_id` (`ps_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_permission_api
-- ----------------------------
INSERT INTO `sp_permission_api`
VALUES ('1', '101', null, null, 'goods', '3');
INSERT INTO `sp_permission_api`
VALUES ('2', '102', null, null, 'orders', '4');
INSERT INTO `sp_permission_api`
VALUES ('3', '103', null, null, 'rights', '2');
INSERT INTO `sp_permission_api`
VALUES ('4', '104', 'GoodService', 'getAllGoods', 'goods', '1');
INSERT INTO `sp_permission_api`
VALUES ('5', '105', 'GoodService', 'createGood', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('6', '107', 'OrderService', 'getAllOrders', 'orders', null);
INSERT INTO `sp_permission_api`
VALUES ('9', '109', 'OrderService', 'createOrder', 'orders', null);
INSERT INTO `sp_permission_api`
VALUES ('10', '110', 'ManagerService', 'getAllManagers', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('15', '115', 'CategoryService', 'getAttributes', 'params', '2');
INSERT INTO `sp_permission_api`
VALUES ('16', '116', 'GoodService', 'updateGood', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('17', '117', 'GoodService', 'deleteGood', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('21', '121', 'CategoryService', 'getAllCategories', 'categories', '3');
INSERT INTO `sp_permission_api`
VALUES ('22', '122', 'CategoryService', 'addCategory', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('23', '123', 'CategoryService', 'deleteCategory', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('25', '125', null, null, 'managers', '1');
INSERT INTO `sp_permission_api`
VALUES ('29', '129', 'RoleService', 'createRole', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('30', '130', 'RoleService', 'deleteRole', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('31', '131', 'ManagerService', 'createManager', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('32', '132', 'ManagerService', 'deleteManager', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('33', '133', 'ManagerService', 'updateManager', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('34', '134', 'RoleService', 'updateRoleRight', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('35', '135', 'RoleService', 'deleteRoleRight', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('36', '136', 'ManagerService', 'getManager', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('37', '137', 'ManagerService', 'setRole', 'managers', null);
INSERT INTO `sp_permission_api`
VALUES ('38', '138', 'RoleService', 'getAllRoles', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('39', '139', 'RoleService', 'getRoleById', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('40', '140', 'RoleService', 'updateRole', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('41', '141', 'RoleService', 'updateRoleRight', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('42', '142', 'AttributeService', 'getAttributes', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('43', '143', 'AttributeService', 'createAttribute', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('44', '144', 'AttributeService', 'deleteAttribute', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('45', '145', null, null, 'reports', '5');
INSERT INTO `sp_permission_api`
VALUES ('46', '146', null, null, 'reports', null);
INSERT INTO `sp_permission_api`
VALUES ('47', '147', 'RightService', 'getAllRights', 'totalorders', null);
INSERT INTO `sp_permission_api`
VALUES ('48', '148', null, null, 'reports', null);
INSERT INTO `sp_permission_api`
VALUES ('49', '149', 'CategoryService', 'getCategoryById', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('53', '153', 'GoodService', 'getGoodById', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('54', '154', 'OrderService', 'updateOrder', 'orders', null);
INSERT INTO `sp_permission_api`
VALUES ('55', '155', 'OrderService', 'getOrder', 'orders', null);
INSERT INTO `sp_permission_api`
VALUES ('56', '156', 'CategoryService', 'createAttribute', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('57', '157', 'CategoryService', 'deleteAttribute', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('58', '158', 'CategoryService', 'attributeById', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('59', '159', 'ManagerService', 'updateMgrState', 'managers', null);
-- user_permission
INSERT INTO `sp_permission_api`
VALUES ('60', '112', 'UserService', 'getAllUsers', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('61', '161', 'UserService', 'createUser', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('62', '162', 'UserService', 'deleteUser', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('63', '163', 'UserService', 'updateUser', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('66', '166', 'UserService', 'getUser', 'users', null);
-- seller_permission
INSERT INTO `sp_permission_api`
VALUES ('70', '113', 'SellerService', 'getAllSellers', 'sellers', null);
INSERT INTO `sp_permission_api`
VALUES ('71', '171', 'SellerService', 'createSeller', 'sellers', null);
INSERT INTO `sp_permission_api`
VALUES ('72', '172', 'SellerService', 'deleteSeller', 'sellers', null);
INSERT INTO `sp_permission_api`
VALUES ('73', '173', 'SellerService', 'updateSeller', 'sellers', null);
INSERT INTO `sp_permission_api`
VALUES ('76', '176', 'SellerService', 'getSeller', 'sellers', null);
INSERT INTO `sp_permission_api`
VALUE  ('77', '177', 'OrderService', 'deleteOrder', 'orders', null);
-- renewal_permission
INSERT INTO `sp_permission_api`
VALUES ('78', '178', 'RenewalService', 'getRenewal', 'renewals', null);

-- ----------------------------
-- Table structure for sp_report_1
-- ----------------------------
DROP TABLE IF EXISTS `sp_report_1`;
CREATE TABLE `sp_report_1`
(
    `id`             int(8) NOT NULL AUTO_INCREMENT,
    `rp1_user_count` int(8)       DEFAULT NULL COMMENT '用户数',
    `rp1_area`       varchar(128) DEFAULT NULL COMMENT '地区',
    `rp1_date`       date         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_report_1
-- ----------------------------
INSERT INTO `sp_report_1`
VALUES ('1', '2999', '华东', '2017-12-27');
INSERT INTO `sp_report_1`
VALUES ('2', '5090', '华南', '2017-12-27');
INSERT INTO `sp_report_1`
VALUES ('3', '6888', '华北', '2017-12-27');
INSERT INTO `sp_report_1`
VALUES ('4', '9991', '西部', '2017-12-27');
INSERT INTO `sp_report_1`
VALUES ('5', '15212', '其他', '2017-12-27');
INSERT INTO `sp_report_1`
VALUES ('6', '3111', '华东', '2017-12-28');
INSERT INTO `sp_report_1`
VALUES ('8', '2500', '华南', '2017-12-28');
INSERT INTO `sp_report_1`
VALUES ('9', '4000', '华北', '2017-12-28');
INSERT INTO `sp_report_1`
VALUES ('10', '4130', '西部', '2017-12-28');
INSERT INTO `sp_report_1`
VALUES ('11', '5800', '其他', '2017-12-28');
INSERT INTO `sp_report_1`
VALUES ('12', '4100', '华东', '2017-12-29');
INSERT INTO `sp_report_1`
VALUES ('13', '3400', '华南', '2017-12-29');
INSERT INTO `sp_report_1`
VALUES ('14', '8010', '华北', '2017-12-29');
INSERT INTO `sp_report_1`
VALUES ('15', '7777', '西部', '2017-12-29');
INSERT INTO `sp_report_1`
VALUES ('16', '10241', '其他', '2017-12-29');
INSERT INTO `sp_report_1`
VALUES ('17', '3565', '华东', '2017-12-30');
INSERT INTO `sp_report_1`
VALUES ('18', '6000', '华南', '2017-12-30');
INSERT INTO `sp_report_1`
VALUES ('19', '12321', '华北', '2017-12-30');
INSERT INTO `sp_report_1`
VALUES ('20', '12903', '西部', '2017-12-30');
INSERT INTO `sp_report_1`
VALUES ('21', '14821', '其他', '2017-12-30');
INSERT INTO `sp_report_1`
VALUES ('22', '3528', '华东', '2017-12-31');
INSERT INTO `sp_report_1`
VALUES ('23', '6400', '华南', '2017-12-31');
INSERT INTO `sp_report_1`
VALUES ('24', '13928', '华北', '2017-12-31');
INSERT INTO `sp_report_1`
VALUES ('25', '13098', '西部', '2017-12-31');
INSERT INTO `sp_report_1`
VALUES ('26', '15982', '其他', '2017-12-31');
INSERT INTO `sp_report_1`
VALUES ('27', '6000', '华东', '2018-01-01');
INSERT INTO `sp_report_1`
VALUES ('28', '7800', '华南', '2018-01-01');
INSERT INTO `sp_report_1`
VALUES ('29', '12984', '华北', '2018-01-01');
INSERT INTO `sp_report_1`
VALUES ('30', '14028', '西部', '2018-01-01');
INSERT INTO `sp_report_1`
VALUES ('31', '14091', '其他', '2018-01-01');


-- ----------------------------
-- Table structure for sp_report_3
-- ----------------------------
DROP TABLE IF EXISTS `sp_report_3`;
CREATE TABLE `sp_report_3`
(
    `id`        int(8) NOT NULL AUTO_INCREMENT,
    `rp3_src`   varchar(127) DEFAULT NULL COMMENT '用户来源',
    `rp3_count` int(8)       DEFAULT NULL COMMENT '数量',
    `rp3_date`  datetime     DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_report_3
-- ----------------------------

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role`
(
    `role_id`   smallint(6) unsigned NOT NULL AUTO_INCREMENT,
    `role_name` varchar(20)          NOT NULL COMMENT '角色名称',
    `ps_ids`    varchar(512)         NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5',
    `ps_ca`     text COMMENT '控制器-操作,控制器-操作,控制器-操作',
    `role_desc` text,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role`
VALUES ('30', '主管',
        '101,0,104,116,115,142,143,144,121,122,123,149,102,107,109,103,111,129,130,134,135,138,139,140,141,112,147,125,110,131,132,133,136,137,145,146,148',
        'Goods-index,Goods-tianjia,Category-index,Order-showlist,Brand-index', '技术负责人');
INSERT INTO `sp_role`
VALUES ('31', '测试角色', '101,0,104,105,116,117,115,142,143,144,121,122,123,149,103,111,129,134,138,112,147',
        'Goods-showlist,Goods-tianjia,Category-showlist,Order-showlist,Order-dayin,Order-tianjia', '测试角色描述');
INSERT INTO `sp_role`
VALUES ('34', '测试角色2', '0,105,116,142,143,122', null, '测试描述12');
INSERT INTO `sp_role`
VALUES ('39', '技术人员', '101,0,104,105,116', null, '阿斯蒂芬');
INSERT INTO `sp_role`
VALUES ('40', '部门经理', '102,0,107,109,154,155,145,146,148', null, 'test');
INSERT INTO `sp_role`
VALUES ('41', '普通职员', '', null, 'sf ');

-- ----------------------------
-- Table structure for sp_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user`
(
    `user_id`       int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `user_num`      varchar(255)     NOT NULL COMMENT '投保人身份证号',
    `user_name`     varchar(255)     NOT NULL COMMENT '投保人姓名',
    `user_birthday` varchar(30)      NOT NULL COMMENT '投保人生日',
    `user_address`  varchar(255) COMMENT '投保人地址',
    `user_phone`    varchar(12)      NOT NULL COMMENT '投保人电话',
    `username`      varchar(128) COMMENT '登录名',
    `password`      char(64) COMMENT '登录密码',
    `user_email`    varchar(64) COMMENT '邮箱',
    `user_sex`      enum ('女','男')   NOT NULL COMMENT '性别',
    `user_qq`       varchar(32)                                   DEFAULT '' COMMENT 'qq',
    `user_edu`      enum ('博士','硕士','本科','专科','高中','初中','小学','无') DEFAULT '无' COMMENT '学历',
    `create_time`   int(11)          NOT NULL COMMENT '创建时间',
    `update_time`   int(11)          NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8 COMMENT ='投保人表';

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_user`
VALUES ('1', '332522198705040011', 'test1', '1987-05-04', '上海市', '17347834668',
        'usertest1', '123321', 'etabtwbz@rl.pve', '女', null, '高中', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('2', '210602198711260513', 'test2', '1987-11-26', '苏州市', '18004266064',
        'usertest2', '123321', 'etdouwok@bx.rcv', '女', null, '小学', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('3', '410183199307210015', 'test3', '1993-07-21', '南宁市', '15171923428',
        'usertest3', '123321', 'dzybsmdk@pt.amg', '男', null, '硕士', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('4', '430503198706130038', 'test4', '1987-06-13', '杭州市', '19801027262',
        'usertest4', '123321', 'xqyxqlon@py.bzf', '男', null, '无', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('5', '230103198509121352', 'test5', '1985-09-12', '海口市', '15096794193',
        'usertest5', '123321', 'pjbereov@bi.rxe', '男', null, '本科', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('6', '130825199408161416', 'test6', '1994-08-16', '拉萨市', '13034929970',
        'usertest6', '123321', 'zdakyhus@hv.mzq', '男', null, '博士', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('7', '522125198511033430', 'test7', '1985-11-03', '大连市', '17898213911',
        'usertest7', '123321', 'uvksfeyt@ro.cqf', '男', null, '小学', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('8', '130181198808086417', 'test8', '1988-08-08', '兰州市', '18268150713',
        'usertest8', '123321', 'ctpyhcnl@hb.nwx', '女', null, '初中', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('9', '37060219830224041X', 'test9', '1983-02-24', '苏州市', '15578010163',
        'usertest9', '123321', 'nzlmgjuq@rz.wyq', '男', null, '小学', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('10', '422201199001160814', 'test10', '1990-01-16', '银川市', '17328079093',
        'usertest10', '123321', 'tzftnins@yi.rve', '男', null, '小学', '1512033129', '1512033129');


-- ----------------------------
-- Table structure for sp_seller
-- ----------------------------
DROP TABLE IF EXISTS `sp_seller`;
CREATE TABLE `sp_seller`
(
    `seller_id`       int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `seller_num`      varchar(255)     NOT NULL COMMENT '被投保人身份证号',
    `seller_name`     varchar(255)     NOT NULL COMMENT '被投保人姓名',
    `seller_birthday` varchar(30)      NOT NULL COMMENT '被投保人生日',
    `seller_address`  varchar(255)     NOT NULL COMMENT '被投保人地址',
    `seller_phone`    varchar(12)      NOT NULL COMMENT '被投保人电话',
    `username`        varchar(128) COMMENT '登录名',
    `password`        char(64) COMMENT '登录密码',
    `seller_email`    varchar(64) COMMENT '邮箱',
    `seller_sex`      enum ('女','男')   NOT NULL COMMENT '性别',
    `seller_qq`       varchar(32)                                   DEFAULT '' COMMENT 'qq',
    `seller_edu`      enum ('博士','硕士','本科','专科','高中','初中','小学','无') DEFAULT '无' COMMENT '学历',
    `create_time`     int(11)          NOT NULL COMMENT '创建时间',
    `update_time`     int(11)          NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`seller_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8 COMMENT ='被投保人表';

-- ----------------------------
-- Records of sp_seller
-- ----------------------------
INSERT INTO `sp_seller`
VALUES ('1', '35042619790906301X', 'seller1', '1979-09-06', '三亚市', '17759826418',
        'sellertest1', '123321', 'etabtwbz@rl.pve', '男', null, '初中', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('2', '340103198303072554', 'seller2', '1983-03-07', '西安市', '18454842147',
        'sellertest2', '123321', 'etdouwok@bx.rcv', '女', null, '无', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('3', '362326198306270039', 'seller3', '1983-06-27', '三亚市', '13515445957',
        'sellertest3', '123321', 'dzybsmdk@pt.amg', '女', null, '初中', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('4', '331081198601210014', 'seller4', '1986-01-21', '青岛市', '18183258213',
        'sellertest4', '123321', 'xqyxqlon@py.bzf', '女', null, '无', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('5', '120106199501191514', 'seller5', '1995-01-19', '南京市', '13877716316',
        'sellertest5', '123321', 'pjbereov@bi.rxe', '男', null, '本科', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('6', '342623198109140335', 'seller6', '1981-09-14', '重庆市', '17570993328',
        'sellertest6', '123321', 'zdakyhus@hv.mzq', '男', null, '小学', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('7', '422823198511163376', 'seller7', '1985-11-16', '杭州市', '17705434307',
        'sellertest7', '123321', 'uvksfeyt@ro.cqf', '男', null, '初中', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('8', '31010919850214201X', 'seller8', '1985-02-14', '西宁市', '13076531906',
        'sellertest8', '123321', 'ctpyhcnl@hb.nwx', '女', null, '无', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('9', '431223199110305030', 'seller9', '1991-10-30', '福州市', '13831235155',
        'sellertest9', '123321', 'nzlmgjuq@rz.wyq', '女', null, '初中', '1512033129', '1512033129');
INSERT INTO `sp_seller`
VALUES ('10', '431002198211301517', 'seller10', '1982-11-30', '天津市', '13996053216',
        'sellertest10', '123321', 'tzftnins@yi.rve', '女', null, '博士', '1512033129', '1512033129');



