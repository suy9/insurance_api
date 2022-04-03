SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sp_attribute`;
CREATE TABLE `sp_attribute`
(
    `attr_id`     smallint(5) unsigned   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `attr_name`   varchar(32)            NOT NULL COMMENT '属性名称',
    `cat_id`      smallint(5) unsigned   NOT NULL COMMENT '外键，类型id',
    `attr_sel`    enum ('only','many')   NOT NULL DEFAULT 'only' COMMENT 'only:输入框(唯一)  many:后台下拉列表/前台单选框',
    `attr_write`  enum ('manual','list') NOT NULL DEFAULT 'manual' COMMENT 'manual:手工录入  list:从列表选择',
    `attr_vals`   text                   NOT NULL COMMENT '可选值列表信息,例如颜色：白色,红色,绿色,多个可选值通过逗号分隔',
    `delete_time` int(11)                         DEFAULT NULL COMMENT '删除时间标志',
    PRIMARY KEY (`attr_id`),
    KEY `type_id` (`cat_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3803
  DEFAULT CHARSET = utf8 COMMENT ='属性表';

-- ----------------------------
-- Records of sp_attribute
-- ----------------------------
INSERT INTO `sp_attribute`
VALUES ('1', '主观参数-型号', '1191', 'only', 'manual', '00002', null);
INSERT INTO `sp_attribute`
VALUES ('2', '实质参数-适用人群', '1191', 'only', 'manual', '女士', null);
INSERT INTO `sp_attribute`
VALUES ('3', '颜色', '1191', 'many', 'list', '4条装高腰1662,4条装高腰1661,5条装中腰1305,5条装中腰2006,5条装高腰1665,5条装中腰1543,均码', null);

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
    `cat_icon`    varchar(255) DEFAULT NULL,
    `cat_src`     text,
    PRIMARY KEY (`cat_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1484
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_category
-- ----------------------------
INSERT INTO `sp_category`
VALUES ('1', '大家电', '0', '0', '0', '', '');
INSERT INTO `sp_category`
VALUES ('3', '电视', '1', '1', '0', '', '');
INSERT INTO `sp_category`
VALUES ('4', '空调', '1', '1', '0', '', '');
INSERT INTO `sp_category`
VALUES ('5', '4K超高清', '1482', '2', '0', 'full/fd99414907afb2e0382456b55ae051e51f9816f5.jpg',
        '/list/243505-1344991.html');
INSERT INTO `sp_category`
VALUES ('6', '曲面电视', '3', '2', '0', 'full/2fb113b32f7a2b161f5ee4096c319afedc3fd5a1.jpg', '/list/243505-914942.html');
INSERT INTO `sp_category`
VALUES ('7', '海信', '3', '2', '0', 'full/5e38cf9e6e7c46a17fe1c597a883ae627977b296.jpg', '/list/243505-10005.html');
INSERT INTO `sp_category`
VALUES ('8', '夏普', '3', '2', '0', 'full/cece39bd7e9654c20043e4af71696e1f838d4a22.jpg', '/list/243505-10070.html');
INSERT INTO `sp_category`
VALUES ('9', '创维', '3', '2', '0', 'full/f62eba98423af3311487f3331c6798d8f099c893.jpg', '/list/243505-11164.html');
INSERT INTO `sp_category`
VALUES ('10', 'TCL', '3', '2', '0', 'full/86832cc37db8474ac07853c835009f9873eaec89.jpg', '/list/243505-10415.html');
INSERT INTO `sp_category`
VALUES ('11', 'PPTV', '3', '2', '0', 'full/41c169f14680b3ebf88b4a37ea09085ed731c985.jpg', '/list/243505-14501.html');
INSERT INTO `sp_category`
VALUES ('12', '小米', '3', '2', '0', 'full/5c282c3ec283fbc092107f8c7b86f212365acdfa.jpg', '/list/243505-12121.html');
INSERT INTO `sp_category`
VALUES ('13', '长虹', '3', '2', '0', 'full/14291787e1f9f0215816048e813e4ec4fbb3dffe.jpg', '/list/243505-10075.html');
INSERT INTO `sp_category`
VALUES ('14', '康佳', '3', '2', '0', 'full/de58455691bc7b85351055c220f1a5410ab15693.jpg', '/list/243505-10149.html');
INSERT INTO `sp_category`
VALUES ('15', '三星', '3', '2', '0', 'full/8b36730c09815e90de1f86664baef8690c89e979.jpg', '/list/243505-10011.html');
INSERT INTO `sp_category`
VALUES ('16', '飞利浦', '3', '2', '0', 'full/7643c31541df41da21c9e734bd2d9a18fed2a2aa.jpg', '/list/243505-1253445.html');
INSERT INTO `sp_category`
VALUES ('17', '索尼', '3', '2', '0', 'full/e8c76dd2bb103a620929bcb4ad5c5431d62418d3.jpg', '/list/243505-10028.html');
INSERT INTO `sp_category`
VALUES ('18', '先锋', '3', '2', '0', 'full/5a46bef92bf32f0157b4d5a6d9a35ca8a5615aca.jpg', '/list/243505-10328.html');
INSERT INTO `sp_category`
VALUES ('19', '家庭影院', '3', '2', '0', 'full/5fae60f2cc05c53eaf43075db7eb82bfc9bba9b4.jpg', '/list/244010-0.html');
INSERT INTO `sp_category`
VALUES ('20', '音响', '3', '2', '0', 'full/5515d491f88587084e59aac50010458bb916ee17.jpg', '/list/244011-0.html');
INSERT INTO `sp_category`
VALUES ('21', '盒子', '3', '2', '0', 'full/e65bab9fcb64c336a3f5fba3b2174fef41f12330.jpg',
        '//m.suning.com/search/%E7%9B%92%E5%AD%90/?adTypeCode=1023&adId=%E7%9B%92%E5%AD%90');
INSERT INTO `sp_category`
VALUES ('22', '家用空调', '1482', '2', '0', 'full/8ba61feee8f4a8333efee8ed00ce3f327e66367c.jpg', '/list/431505-0.html');
INSERT INTO `sp_category`
VALUES ('23', '变频空调', '4', '2', '0', 'full/994977fac8f4fa6cea5eb413cd64ddac24a97600.jpg', '/list/431505-125483.html');
INSERT INTO `sp_category`
VALUES ('24', '立柜空调', '4', '2', '0', 'full/19fc040b41b4c821c16748529545265f5feb34fa.jpg', '/list/431505-262043.html');
INSERT INTO `sp_category`
VALUES ('25', '挂壁空调', '4', '2', '0', 'full/7f3dfec1efdb2559d7fba1ea39d901f4763fae21.jpg', '/list/431505-615804.html');
INSERT INTO `sp_category`
VALUES ('26', '洗衣机', '1', '1', '0', '', '');
INSERT INTO `sp_category`
VALUES ('27', '中央空调', '4', '2', '0', 'full/47a417ea3c71e5b88a261729e43706611da4ae7e.jpg', '/list/431506-0.html');
INSERT INTO `sp_category`
VALUES ('28', '移动空调', '4', '2', '0', 'full/b9f06f11815deebf5417636cf6967d859956e8bf.jpg', '/list/431507-0.html');
INSERT INTO `sp_category`
VALUES ('29', '海尔', '4', '2', '0', 'full/528517c1f5c49a15f4558be03f46e27f23d379ba.jpg', '/list/431505-10010.html');
INSERT INTO `sp_category`
VALUES ('30', '三菱重工', '4', '2', '0', 'full/3ae5b4e47f663b3889edc694c95bf098b7893316.jpg', '/list/431505-10174.html');
INSERT INTO `sp_category`
VALUES ('31', '志高', '4', '2', '0', 'full/4d5fd81e6e2e45a9a55d187c2326dea57ef90f9d.jpg', '/list/431505-10181.html');
INSERT INTO `sp_category`
VALUES ('32', '奥克斯', '4', '2', '0', 'full/9ec815cf683ef384f74c0b1c6011891da20589f9.jpg', '/list/431504-10132.html');
INSERT INTO `sp_category`
VALUES ('33', '长虹', '4', '2', '0', 'full/74547903a7193d252f4a1643849cc707981affa2.jpg', '/list/431504-10075.html');
INSERT INTO `sp_category`
VALUES ('34', '科龙', '4', '2', '0', 'full/85ac1aecafb4f25158d2e08d213e6f617307a323.jpg', '/list/431504-10278.html');
INSERT INTO `sp_category`
VALUES ('35', '海信', '4', '2', '0', 'full/2079cb1725672419834c3624d52b6abaea8be308.jpg', '/list/431505-10005.html');
INSERT INTO `sp_category`
VALUES ('36', '惠而浦', '4', '2', '0', 'full/33774cdd0a4b866bc3f56c0fc55a0063d1f15892.jpg', '/list/431504-10034.html');
INSERT INTO `sp_category`
VALUES ('37', '空调清洗', '4', '2', '0', 'full/f4836d9ba4831e4d81ab275cff4ab50677076a2b.jpg', '/list/500723-0.html');
INSERT INTO `sp_category`
VALUES ('38', '空调维修', '4', '2', '0', 'full/19ed844b023720a49792de3c1397e614c9bb260b.jpg',
        '//assss.suning.com/assss-web/wap/afterService/toServBookingOrders_0.do');
INSERT INTO `sp_category`
VALUES ('39', '空调安装', '4', '2', '0', 'full/f216557789c6d87ac6b31845e0a8c47186d6521a.jpg',
        '//c.m.suning.com/anzhuangfw.html');
INSERT INTO `sp_category`
VALUES ('40', '空调回收', '4', '2', '0', 'full/da07de0ac2f01b18a9ec206fd44a51cf117cf987.jpg',
        '//hx.m.suning.com/wap/home.htm');

-- ----------------------------
-- Table structure for sp_goods
-- ----------------------------
DROP TABLE IF EXISTS `sp_goods`;
CREATE TABLE `sp_goods`
(
    `goods_id`         mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `goods_name`       varchar(255)          NOT NULL COMMENT '商品名称',
    `goods_price`      decimal(10, 2)        NOT NULL DEFAULT '0.00' COMMENT '商品价格',
    `goods_number`     int(8) unsigned       NOT NULL DEFAULT '0' COMMENT '商品数量',
    `goods_weight`     smallint(5) unsigned  NOT NULL DEFAULT '0' COMMENT '商品重量',
    `cat_id`           smallint(5) unsigned  NOT NULL DEFAULT '0' COMMENT '类型id',
    `goods_introduce`  text COMMENT '商品详情介绍',
    `goods_big_logo`   char(128)             NOT NULL DEFAULT '' COMMENT '图片logo大图',
    `goods_small_logo` char(128)             NOT NULL DEFAULT '' COMMENT '图片logo小图',
    `is_del`           enum ('0','1')        NOT NULL DEFAULT '0' COMMENT '0:正常  1:删除',
    `add_time`         int(11)               NOT NULL COMMENT '添加商品时间',
    `upd_time`         int(11)               NOT NULL COMMENT '修改商品时间',
    `delete_time`      int(11)                        DEFAULT NULL COMMENT '软删除标志字段',
    `cat_one_id`       smallint(5)                    DEFAULT '0' COMMENT '一级分类id',
    `cat_two_id`       smallint(5)                    DEFAULT '0' COMMENT '二级分类id',
    `cat_three_id`     smallint(5)                    DEFAULT '0' COMMENT '三级分类id',
    `hot_mumber`       int(11) unsigned               DEFAULT '0' COMMENT '热卖数量',
    `is_promote`       smallint(5)                    DEFAULT '0' COMMENT '是否促销',
    `goods_state`      int(11)                        DEFAULT '0' COMMENT '商品状态 0: 未通过 1: 审核中 2: 已审核',
    PRIMARY KEY (`goods_id`),
    UNIQUE KEY `goods_name` (`goods_name`),
    KEY `goods_price` (`goods_price`),
    KEY `add_time` (`add_time`),
    KEY `goods_name_2` (`goods_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 928
  DEFAULT CHARSET = utf8 COMMENT ='商品表';

-- ----------------------------
-- Records of sp_goods
-- ----------------------------
INSERT INTO `sp_goods`
VALUES ('1', '南极人女士三角内裤 中腰可爱无痕女士内裤 均码 k102P1027', '49.00', '100', '100', '1191',
        '<div class=\"lazyimg\"><div moduleid=\"R9000475_3\" modulename=\"商品详情\"><p><img data-src=\"//image.suning.cn/uimg/sop/commodity/138920341921275653753268_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/138920341921275653753268_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/320294018209000122936780_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/320294018209000122936780_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/704928021836697029300000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/704928021836697029300000_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/674563845781283224909500_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/674563845781283224909500_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/151134588018743970526002_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/151134588018743970526002_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/831318046793946113206000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/831318046793946113206000_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/916281915185884963655750_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/916281915185884963655750_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/472343017167947876723490_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/472343017167947876723490_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/942767809372154340834000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/942767809372154340834000_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/163812559664514099011170_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/163812559664514099011170_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/697203950107440612220250_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/697203950107440612220250_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/697247714477543390785500_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/697247714477543390785500_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/161411030914914658667827_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/161411030914914658667827_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/669094843119273038295020_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/669094843119273038295020_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/362990339109906307146490_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/362990339109906307146490_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/200766730097564804937320_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/200766730097564804937320_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/357686216186091569615500_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/357686216186091569615500_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/206539641915557176577986_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/206539641915557176577986_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/106568805613403252031066_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/106568805613403252031066_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/562575204157804367889930_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/562575204157804367889930_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/201136725963941859463860_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/201136725963941859463860_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/174343734111585091167516_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/174343734111585091167516_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/174437664961525990196410_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/174437664961525990196410_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"><img data-src=\"//image.suning.cn/uimg/sop/commodity/852602712102381755560600_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/852602712102381755560600_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p></div><div moduleid=\"R9000475_4\" modulename=\"商品尺码表\"><p><img data-src=\"//image.suning.cn/uimg/sop/commodity/191351338116998619431514_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/191351338116998619431514_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p></div><div moduleid=\"R9000475_5\" modulename=\"模特效果\"><p><img data-src=\"//image.suning.cn/uimg/sop/commodity/378452992490143925172200_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/378452992490143925172200_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p></div></div>',
        '', '', '0', '1514255862', '1514255862', null, '1157', '1174', '1191', '0', '0', '0');
INSERT INTO `sp_goods`
VALUES ('2', '邦诺姿 情趣内衣无痕蕾丝提臀诱惑丁字裤中腰档纯棉女士内裤低腰三角裤', '11.00', '100', '100', '1193',
        '<div class=\"lazyimg\"><p><img data-src=\"//image.suning.cn/uimg/sop/commodity/689982530173400477121750_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"\" src=\"//image.suning.cn/uimg/sop/commodity/689982530173400477121750_x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p>邦诺姿 情趣内衣无痕蕾丝提臀诱惑丁字裤中腰档纯棉内裤女低腰三角裤</p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/549576726132196462330130_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"25kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/549576726132196462330130_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/104343487925972960976710_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"15kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/104343487925972960976710_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/677188189104696859564200_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"25kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/677188189104696859564200_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/165268111319512662259174_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"19kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/165268111319512662259174_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/183861682115321737636075_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"16kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/183861682115321737636075_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/209636224883257434873210_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"22kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/209636224883257434873210_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/613490401485519279904600_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"21kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/613490401485519279904600_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/973421549384124627194600_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"20kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/973421549384124627194600_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/103415878141517397689040_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"18kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/103415878141517397689040_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/874812982127994638116750_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"23kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/874812982127994638116750_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/299521442384832985226700_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"31kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/299521442384832985226700_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/970478405999096697242500_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"20kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/970478405999096697242500_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/381378146241206027873200_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"33kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/381378146241206027873200_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/815691648173584685513900_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"15kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/815691648173584685513900_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p><p><img data-src=\"//image.suning.cn/uimg/sop/phonecomm/715947388156906411646530_640x.jpg?from=mobile&amp;format=80q.webp\" picsize=\"28kb\" src=\"//image.suning.cn/uimg/sop/phonecomm/715947388156906411646530_640x.jpg?from=mobile&format=80q.webp\" width=\"100%\" height=\"auto\"></p></div>',
        '', '', '0', '1514255865', '1514255865', null, '1157', '1174', '1193', '0', '0', '0');
INSERT INTO `sp_goods`
VALUES ('3', '【4条装】无痕女士内裤 秋冰丝面料中腰性感纯棉档大码收腹三角裤', '39.00', '100', '100', '1195', '<div></div>', '', '', '0', '1514255872',
        '1514255872', null, '1157', '1174', '1195', '0', '0', '0');

-- ----------------------------
-- Table structure for sp_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `sp_goods_attr`;
CREATE TABLE `sp_goods_attr`
(
    `id`         int(10) unsigned      NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `goods_id`   mediumint(8) unsigned NOT NULL COMMENT '商品id',
    `attr_id`    smallint(5) unsigned  NOT NULL COMMENT '属性id',
    `attr_value` text                  NOT NULL COMMENT '商品对应属性的值',
    `add_price`  decimal(8, 2) DEFAULT NULL COMMENT '该属性需要额外增加的价钱',
    PRIMARY KEY (`id`),
    KEY `attr_id` (`attr_id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 3174
  DEFAULT CHARSET = utf8 COMMENT ='商品-属性关联表';

-- ----------------------------
-- Records of sp_goods_attr
-- ----------------------------
INSERT INTO `sp_goods_attr`
VALUES ('1', '1', '1', '00002', '0.00');
INSERT INTO `sp_goods_attr`
VALUES ('2', '1', '2', '女士', '0.00');
INSERT INTO `sp_goods_attr`
VALUES ('3', '2', '4', 'NK1505', '0.00');

-- ----------------------------
-- Table structure for sp_goods_cats
-- ----------------------------
DROP TABLE IF EXISTS `sp_goods_cats`;
CREATE TABLE `sp_goods_cats`
(
    `cat_id`      int(11)     NOT NULL AUTO_INCREMENT COMMENT '分类id',
    `parent_id`   int(11)     NOT NULL COMMENT '父级id',
    `cat_name`    varchar(50) NOT NULL COMMENT '分类名称',
    `is_show`     tinyint(4)  NOT NULL DEFAULT '1' COMMENT '是否显示',
    `cat_sort`    int(11)     NOT NULL DEFAULT '0' COMMENT '分类排序',
    `data_flag`   tinyint(4)  NOT NULL DEFAULT '1' COMMENT '数据标记',
    `create_time` int(11)     NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`cat_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 77
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_goods_cats
-- ----------------------------
INSERT INTO `sp_goods_cats`
VALUES ('40', '0', '图书、音像、数字商品', '1', '0', '1', '1509332276');
INSERT INTO `sp_goods_cats`
VALUES ('41', '0', '家用电器', '1', '0', '1', '1509332286');
INSERT INTO `sp_goods_cats`
VALUES ('42', '0', '手机、数码', '1', '0', '1', '1509332294');

-- ----------------------------
-- Table structure for sp_manager
-- ----------------------------
DROP TABLE IF EXISTS `sp_manager`;
CREATE TABLE `sp_manager`
(
    `mg_id`     int(11)          NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `mg_name`   varchar(32)      NOT NULL COMMENT '名称',
    `mg_pwd`    char(64)         NOT NULL COMMENT '密码',
    `mg_time`   int(10) unsigned NOT NULL COMMENT '注册时间',
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
    `order_id`     int(10) unsigned       NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`      mediumint(8) unsigned  NOT NULL COMMENT '投保人id',
    `seller_id`    mediumint(8) unsigned  NOT NULL COMMENT '被投保人id',
    `order_number` varchar(32)            NOT NULL COMMENT '订单编号',
    `order_price`  decimal(10, 2)         NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
    `order_pay`    enum ('0','1','2','3') NOT NULL DEFAULT '1' COMMENT '支付方式  0未支付 1支付宝  2微信  3银行卡',
    `pay_status`   enum ('0','1')         NOT NULL DEFAULT '0' COMMENT '订单状态： 0未付款、1已付款',
    `create_time`  int(10) unsigned       NOT NULL COMMENT '记录生成时间',
    `update_time`  int(10) unsigned       NOT NULL COMMENT '记录修改时间',
    PRIMARY KEY (`order_id`),
    UNIQUE KEY `order_number` (`order_number`),
    KEY `add_time` (`create_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8 COMMENT ='订单表';

-- ----------------------------
-- Records of sp_order
-- ----------------------------
INSERT INTO `sp_order`
VALUES ('22', '1', '1', 'itcast-59e411eaaccc9', '222.00', '2', '1', '1508119018', '1508119018');
INSERT INTO `sp_order`
VALUES ('23', '2', '2', 'itcast-59e71b546d30a', '805.00', '0', '0', '1508318036', '1508318036');

-- ----------------------------
-- Table structure for sp_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_goods`;
CREATE TABLE `sp_order_goods`
(
    `id`                int(10) unsigned      NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `order_id`          int(10) unsigned      NOT NULL COMMENT '订单id',
    `goods_id`          mediumint(8) unsigned NOT NULL COMMENT '商品id',
    `goods_price`       decimal(10, 2)        NOT NULL DEFAULT '0.00' COMMENT '商品单价',
    `goods_number`      tinyint(4)            NOT NULL DEFAULT '1' COMMENT '购买单个商品数量',
    `goods_total_price` decimal(10, 2)        NOT NULL DEFAULT '0.00' COMMENT '商品小计价格',
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
VALUES ('50', '1', '66', '111.00', '1', '111.00');
INSERT INTO `sp_order_goods`
VALUES ('51', '1', '67', '111.00', '1', '111.00');
INSERT INTO `sp_order_goods`
VALUES ('52', '1', '92', '111.00', '3', '333.00');

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
  AUTO_INCREMENT = 160
  DEFAULT CHARSET = utf8 COMMENT ='权限表';

-- ----------------------------
-- Records of sp_permission
-- ----------------------------
INSERT INTO `sp_permission`
VALUES ('101', '保险管理', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('102', '订单管理', '0', '', 'order', '0');
INSERT INTO `sp_permission`
VALUES ('104', '商品列表', '101', 'Goods', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('105', '添加商品', '104', 'Goods', 'tianjia', '2');
INSERT INTO `sp_permission`
VALUES ('107', '订单列表', '102', 'Order', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('109', '添加订单', '107', 'Order', 'tianjia', '2');
INSERT INTO `sp_permission`
VALUES ('110', '用户列表', '125', 'Manager', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('111', '角色列表', '103', 'Role', 'index', '1');
INSERT INTO `sp_permission`
VALUES ('116', '商品修改', '104', 'Goods', 'upd', '2');
INSERT INTO `sp_permission`
VALUES ('117', '商品删除', '104', 'Goods', 'del', '2');
INSERT INTO `sp_permission`
VALUES ('122', '添加分类', '121', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('123', '删除分类', '121', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('125', '用户管理', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('129', '添加角色', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('130', '删除角色', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('131', '添加用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('132', '删除用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('133', '更新用户', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('134', '角色授权', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('135', '取消角色授权', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('136', '获取用户详情', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('137', '分配用户角色', '110', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('138', '获取角色列表', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('139', '获取角色详情', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('140', '更新角色信息', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('141', '更新角色权限', '111', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('142', '获取参数列表', '115', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('143', '创建商品参数', '115', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('144', '删除商品参数', '115', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('145', '数据统计', '0', '', '', '0');
INSERT INTO `sp_permission`
VALUES ('146', '数据报表', '145', '', '', '1');
INSERT INTO `sp_permission`
VALUES ('147', '查看权限', '112', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('148', '查看数据', '146', '', '', '2');
INSERT INTO `sp_permission`
VALUES ('149', '获取分类详情', '121', '', '', '2');
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
  AUTO_INCREMENT = 60
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
VALUES ('10', '110', 'ManagerService', 'getAllManagers', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('11', '111', 'RoleService', 'getAllRoles', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('12', '112', 'RightService', 'getAllRights', 'rights', null);
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
VALUES ('25', '125', null, null, 'users', '1');
INSERT INTO `sp_permission_api`
VALUES ('29', '129', 'RoleService', 'createRole', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('30', '130', 'RoleService', 'deleteRole', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('31', '131', 'ManagerService', 'createManager', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('32', '132', 'ManagerService', 'deleteManager', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('33', '133', 'ManagerService', 'updateManager', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('34', '134', 'RoleService', 'updateRoleRight', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('35', '135', 'RoleService', 'deleteRoleRight', 'roles', null);
INSERT INTO `sp_permission_api`
VALUES ('36', '136', 'ManagerService', 'getManager', 'users', null);
INSERT INTO `sp_permission_api`
VALUES ('37', '137', 'ManagerService', 'setRole', 'users', null);
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
VALUES ('47', '147', 'RightService', 'getAllRights', 'rights', null);
INSERT INTO `sp_permission_api`
VALUES ('48', '148', null, null, 'reports', null);
INSERT INTO `sp_permission_api`
VALUES ('49', '149', 'CategoryService', 'getCategoryById', 'categories', null);
INSERT INTO `sp_permission_api`
VALUES ('50', '150', 'GoodService', 'updateGoodPics', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('51', '151', 'GoodService', 'updateGoodAttributes', 'goods', null);
INSERT INTO `sp_permission_api`
VALUES ('52', '152', 'GoodService', 'updateGoodsState', 'goods', null);
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
VALUES ('59', '159', 'ManagerService', 'updateMgrState', 'users', null);

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
-- Table structure for sp_report_2
-- ----------------------------
DROP TABLE IF EXISTS `sp_report_2`;
CREATE TABLE `sp_report_2`
(
    `id`        int(8) NOT NULL AUTO_INCREMENT,
    `rp2_page`  varchar(128) DEFAULT NULL,
    `rp2_count` int(8)       DEFAULT NULL,
    `rp2_date`  date         DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 117
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_report_2
-- ----------------------------
INSERT INTO `sp_report_2`
VALUES ('1', '首页', '2001', '2017-12-28');
INSERT INTO `sp_report_2`
VALUES ('2', '分类', '2401', '2017-12-28');
INSERT INTO `sp_report_2`
VALUES ('3', '商品列表', '2410', '2017-12-28');
INSERT INTO `sp_report_2`
VALUES ('4', '商品详情', '4512', '2017-12-28');
INSERT INTO `sp_report_2`
VALUES ('5', '首页', '2311', '2017-12-29');
INSERT INTO `sp_report_2`
VALUES ('6', '分类', '3941', '2017-12-29');
INSERT INTO `sp_report_2`
VALUES ('7', '商品列表', '4312', '2017-12-29');
INSERT INTO `sp_report_2`
VALUES ('8', '商品详情', '1231', '2017-12-29');
INSERT INTO `sp_report_2`
VALUES ('9', '首页', '2391', '2017-12-27');
INSERT INTO `sp_report_2`
VALUES ('10', '分类', '1232', '2017-12-27');
INSERT INTO `sp_report_2`
VALUES ('11', '商品列表', '1232', '2017-12-27');
INSERT INTO `sp_report_2`
VALUES ('12', '商品详情', '1231', '2017-12-27');
INSERT INTO `sp_report_2`
VALUES ('13', '首页', '2440', '2017-12-26');
INSERT INTO `sp_report_2`
VALUES ('14', '分类', '3468', '2017-12-26');
INSERT INTO `sp_report_2`
VALUES ('15', '商品列表', '3022', '2017-12-26');
INSERT INTO `sp_report_2`
VALUES ('16', '商品详情', '3704', '2017-12-26');
INSERT INTO `sp_report_2`
VALUES ('17', '首页', '2455', '2017-12-25');
INSERT INTO `sp_report_2`
VALUES ('18', '分类', '3165', '2017-12-25');
INSERT INTO `sp_report_2`
VALUES ('19', '商品列表', '1458', '2017-12-25');
INSERT INTO `sp_report_2`
VALUES ('20', '商品详情', '2799', '2017-12-25');
INSERT INTO `sp_report_2`
VALUES ('21', '首页', '2619', '2017-12-24');
INSERT INTO `sp_report_2`
VALUES ('22', '分类', '3697', '2017-12-24');
INSERT INTO `sp_report_2`
VALUES ('23', '商品列表', '3630', '2017-12-24');
INSERT INTO `sp_report_2`
VALUES ('24', '商品详情', '3060', '2017-12-24');
INSERT INTO `sp_report_2`
VALUES ('25', '首页', '3412', '2017-12-23');
INSERT INTO `sp_report_2`
VALUES ('26', '分类', '3880', '2017-12-23');
INSERT INTO `sp_report_2`
VALUES ('27', '商品列表', '2166', '2017-12-23');
INSERT INTO `sp_report_2`
VALUES ('28', '商品详情', '1187', '2017-12-23');
INSERT INTO `sp_report_2`
VALUES ('29', '首页', '1439', '2017-12-22');
INSERT INTO `sp_report_2`
VALUES ('30', '分类', '2636', '2017-12-22');
INSERT INTO `sp_report_2`
VALUES ('31', '商品列表', '1862', '2017-12-22');
INSERT INTO `sp_report_2`
VALUES ('32', '商品详情', '3401', '2017-12-22');
INSERT INTO `sp_report_2`
VALUES ('33', '首页', '1421', '2017-12-21');
INSERT INTO `sp_report_2`
VALUES ('34', '分类', '1904', '2017-12-21');
INSERT INTO `sp_report_2`
VALUES ('35', '商品列表', '1258', '2017-12-21');
INSERT INTO `sp_report_2`
VALUES ('36', '商品详情', '2576', '2017-12-21');
INSERT INTO `sp_report_2`
VALUES ('37', '首页', '2108', '2017-12-20');
INSERT INTO `sp_report_2`
VALUES ('38', '分类', '1811', '2017-12-20');
INSERT INTO `sp_report_2`
VALUES ('39', '商品列表', '1730', '2017-12-20');
INSERT INTO `sp_report_2`
VALUES ('40', '商品详情', '2220', '2017-12-20');
INSERT INTO `sp_report_2`
VALUES ('41', '首页', '1910', '2017-12-19');
INSERT INTO `sp_report_2`
VALUES ('42', '分类', '1891', '2017-12-19');
INSERT INTO `sp_report_2`
VALUES ('43', '商品列表', '2724', '2017-12-19');
INSERT INTO `sp_report_2`
VALUES ('44', '商品详情', '3949', '2017-12-19');
INSERT INTO `sp_report_2`
VALUES ('45', '首页', '1571', '2017-12-18');
INSERT INTO `sp_report_2`
VALUES ('46', '分类', '1011', '2017-12-18');
INSERT INTO `sp_report_2`
VALUES ('47', '商品列表', '2342', '2017-12-18');
INSERT INTO `sp_report_2`
VALUES ('48', '商品详情', '1679', '2017-12-18');
INSERT INTO `sp_report_2`
VALUES ('49', '首页', '3370', '2017-12-17');
INSERT INTO `sp_report_2`
VALUES ('50', '分类', '1813', '2017-12-17');
INSERT INTO `sp_report_2`
VALUES ('51', '商品列表', '3953', '2017-12-17');
INSERT INTO `sp_report_2`
VALUES ('52', '商品详情', '1328', '2017-12-17');
INSERT INTO `sp_report_2`
VALUES ('53', '首页', '2780', '2017-12-16');
INSERT INTO `sp_report_2`
VALUES ('54', '分类', '2917', '2017-12-16');
INSERT INTO `sp_report_2`
VALUES ('55', '商品列表', '2244', '2017-12-16');
INSERT INTO `sp_report_2`
VALUES ('56', '商品详情', '1472', '2017-12-16');
INSERT INTO `sp_report_2`
VALUES ('57', '首页', '2627', '2017-12-15');
INSERT INTO `sp_report_2`
VALUES ('58', '分类', '1719', '2017-12-15');
INSERT INTO `sp_report_2`
VALUES ('59', '商品列表', '2713', '2017-12-15');
INSERT INTO `sp_report_2`
VALUES ('60', '商品详情', '1412', '2017-12-15');
INSERT INTO `sp_report_2`
VALUES ('61', '首页', '3919', '2017-12-14');
INSERT INTO `sp_report_2`
VALUES ('62', '分类', '2360', '2017-12-14');
INSERT INTO `sp_report_2`
VALUES ('63', '商品列表', '2045', '2017-12-14');
INSERT INTO `sp_report_2`
VALUES ('64', '商品详情', '2144', '2017-12-14');
INSERT INTO `sp_report_2`
VALUES ('65', '首页', '3586', '2017-12-13');
INSERT INTO `sp_report_2`
VALUES ('66', '分类', '1498', '2017-12-13');
INSERT INTO `sp_report_2`
VALUES ('67', '商品列表', '1733', '2017-12-13');
INSERT INTO `sp_report_2`
VALUES ('68', '商品详情', '3174', '2017-12-13');
INSERT INTO `sp_report_2`
VALUES ('69', '首页', '3668', '2017-12-12');
INSERT INTO `sp_report_2`
VALUES ('70', '分类', '1818', '2017-12-12');
INSERT INTO `sp_report_2`
VALUES ('71', '商品列表', '3087', '2017-12-12');
INSERT INTO `sp_report_2`
VALUES ('72', '商品详情', '2980', '2017-12-12');
INSERT INTO `sp_report_2`
VALUES ('73', '首页', '1641', '2017-12-11');
INSERT INTO `sp_report_2`
VALUES ('74', '分类', '1263', '2017-12-11');
INSERT INTO `sp_report_2`
VALUES ('75', '商品列表', '3396', '2017-12-11');
INSERT INTO `sp_report_2`
VALUES ('76', '商品详情', '3191', '2017-12-11');
INSERT INTO `sp_report_2`
VALUES ('77', '首页', '1769', '2017-12-10');
INSERT INTO `sp_report_2`
VALUES ('78', '分类', '1269', '2017-12-10');
INSERT INTO `sp_report_2`
VALUES ('79', '商品列表', '3041', '2017-12-10');
INSERT INTO `sp_report_2`
VALUES ('80', '商品详情', '1396', '2017-12-10');
INSERT INTO `sp_report_2`
VALUES ('81', '首页', '2860', '2017-12-01');
INSERT INTO `sp_report_2`
VALUES ('82', '分类', '3111', '2017-12-01');
INSERT INTO `sp_report_2`
VALUES ('83', '商品列表', '2975', '2017-12-01');
INSERT INTO `sp_report_2`
VALUES ('84', '商品详情', '1542', '2017-12-01');
INSERT INTO `sp_report_2`
VALUES ('85', '首页', '3786', '2017-12-02');
INSERT INTO `sp_report_2`
VALUES ('86', '分类', '1304', '2017-12-02');
INSERT INTO `sp_report_2`
VALUES ('87', '商品列表', '3163', '2017-12-02');
INSERT INTO `sp_report_2`
VALUES ('88', '商品详情', '1903', '2017-12-02');
INSERT INTO `sp_report_2`
VALUES ('89', '首页', '2028', '2017-12-03');
INSERT INTO `sp_report_2`
VALUES ('90', '分类', '3429', '2017-12-03');
INSERT INTO `sp_report_2`
VALUES ('91', '商品列表', '1061', '2017-12-03');
INSERT INTO `sp_report_2`
VALUES ('92', '商品详情', '3019', '2017-12-03');
INSERT INTO `sp_report_2`
VALUES ('93', '首页', '1913', '2017-12-04');
INSERT INTO `sp_report_2`
VALUES ('94', '分类', '2510', '2017-12-04');
INSERT INTO `sp_report_2`
VALUES ('95', '商品列表', '2812', '2017-12-04');
INSERT INTO `sp_report_2`
VALUES ('96', '商品详情', '2528', '2017-12-04');
INSERT INTO `sp_report_2`
VALUES ('97', '首页', '3206', '2017-12-05');
INSERT INTO `sp_report_2`
VALUES ('98', '分类', '1445', '2017-12-05');
INSERT INTO `sp_report_2`
VALUES ('99', '商品列表', '2610', '2017-12-05');
INSERT INTO `sp_report_2`
VALUES ('100', '商品详情', '1716', '2017-12-05');
INSERT INTO `sp_report_2`
VALUES ('101', '首页', '2750', '2017-12-06');
INSERT INTO `sp_report_2`
VALUES ('102', '分类', '1601', '2017-12-06');
INSERT INTO `sp_report_2`
VALUES ('103', '商品列表', '1755', '2017-12-06');
INSERT INTO `sp_report_2`
VALUES ('104', '商品详情', '2974', '2017-12-06');
INSERT INTO `sp_report_2`
VALUES ('105', '首页', '2606', '2017-12-07');
INSERT INTO `sp_report_2`
VALUES ('106', '分类', '3110', '2017-12-07');
INSERT INTO `sp_report_2`
VALUES ('107', '商品列表', '3731', '2017-12-07');
INSERT INTO `sp_report_2`
VALUES ('108', '商品详情', '2324', '2017-12-07');
INSERT INTO `sp_report_2`
VALUES ('109', '首页', '2429', '2017-12-08');
INSERT INTO `sp_report_2`
VALUES ('110', '分类', '1172', '2017-12-08');
INSERT INTO `sp_report_2`
VALUES ('111', '商品列表', '3574', '2017-12-08');
INSERT INTO `sp_report_2`
VALUES ('112', '商品详情', '1354', '2017-12-08');
INSERT INTO `sp_report_2`
VALUES ('113', '首页', '1051', '2017-12-09');
INSERT INTO `sp_report_2`
VALUES ('114', '分类', '3190', '2017-12-09');
INSERT INTO `sp_report_2`
VALUES ('115', '商品列表', '2800', '2017-12-09');
INSERT INTO `sp_report_2`
VALUES ('116', '商品详情', '3431', '2017-12-09');

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
VALUES ('39', '大发送到', '101,0,104,105,116', null, '阿斯蒂芬');
INSERT INTO `sp_role`
VALUES ('40', 'test', '102,0,107,109,154,155,145,146,148', null, 'test');
INSERT INTO `sp_role`
VALUES ('41', 'dsdf', '', null, 'sf ');

-- ----------------------------
-- Table structure for sp_type
-- ----------------------------
DROP TABLE IF EXISTS `sp_type`;
CREATE TABLE `sp_type`
(
    `type_id`     smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `type_name`   varchar(32)          NOT NULL COMMENT '类型名称',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间标志',
    PRIMARY KEY (`type_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8 COMMENT ='类型表';

-- ----------------------------
-- Records of sp_type
-- ----------------------------
INSERT INTO `sp_type`
VALUES ('1', '精品手机', null);
INSERT INTO `sp_type`
VALUES ('2', '书', null);
INSERT INTO `sp_type`
VALUES ('3', '电脑', null);
INSERT INTO `sp_type`
VALUES ('4', '电影', null);

-- ----------------------------
-- Table structure for sp_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user`
(
    `user_id`       int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `user_num`      varchar(255)     NOT NULL COMMENT '投保人身份证号',
    `user_name`     varchar(255)     NOT NULL COMMENT '投保人姓名',
    `user_birthday` date             NOT NULL COMMENT '投保人生日',
    `user_address`  varchar(255)     NOT NULL COMMENT '投保人地址',
    `user_phone`    varchar(12)      NOT NULL COMMENT '投保人电话',
    `username`      varchar(128)     NOT NULL                 DEFAULT '' COMMENT '登录名',
    `password`      char(64)         NOT NULL                 DEFAULT '' COMMENT '登录密码',
    `user_email`    varchar(64)      NOT NULL                 DEFAULT '' COMMENT '邮箱',
    `user_sex`      enum ('女','男')   NOT NULL COMMENT '性别',
    `user_qq`       varchar(32)                               DEFAULT '' COMMENT 'qq',
    `user_edu`      enum ('博士','硕士','本科','专科','高中','初中','小学') DEFAULT NULL COMMENT '学历',
    `create_time`   int(11)          NOT NULL COMMENT '创建时间',
    `update_time`   int(11)          NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8 COMMENT ='会员表';

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_user`
VALUES ('1', '310101198710279976', '胡超', '1987-10-27', '上海市', '18789276493',
        'user_test1', '123321', 'w@zce.me', '男', null, '本科', '1512033129', '1512033129');
INSERT INTO `sp_user`
VALUES ('2', '31010119910722661X', '陈冬', '1986-11-05', '上海市', '18763524951',
        'user_test2', 'zzzzzz', 'asd@asd.cc', '男', '1000001', '博士', '1512122098', '1512122098');

-- ----------------------------
-- Table structure for sp_seller
-- ----------------------------
DROP TABLE IF EXISTS `sp_seller`;
CREATE TABLE `sp_seller`
(
    `seller_id`       int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `seller_num`      varchar(255)     NOT NULL COMMENT '被投保人身份证号',
    `seller_name`     varchar(255)     NOT NULL COMMENT '被投保人姓名',
    `seller_birthday` date             NOT NULL COMMENT '被投保人生日',
    `seller_address`  varchar(255)     NOT NULL COMMENT '被投保人地址',
    `seller_phone`    varchar(12)      NOT NULL COMMENT '被投保人电话',
    `username`        varchar(128)     NOT NULL                 DEFAULT '' COMMENT '登录名',
    `password`        char(64)         NOT NULL                 DEFAULT '' COMMENT '登录密码',
    `seller_email`    varchar(64)      NOT NULL                 DEFAULT '' COMMENT '邮箱',
    `seller_sex`      enum ('女','男')   NOT NULL COMMENT '性别',
    `seller_qq`       varchar(32)                               DEFAULT '' COMMENT 'qq',
    `seller_edu`      enum ('博士','硕士','本科','专科','高中','初中','小学') DEFAULT NULL COMMENT '学历',
    `create_time`     int(11)          NOT NULL COMMENT '创建时间',
    `update_time`     int(11)          NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`seller_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8 COMMENT ='会员表';

-- ----------------------------
-- Records of sp_user
-- ----------------------------
INSERT INTO `sp_seller`
VALUES ('1', '31010119910722661X', '占徐平', '1991-07-22', '上海市', '15365849214',
        'seller_test1', '123321', 'sad@dd.me', '男', null, '本科', '1512233129', '1512333129');
INSERT INTO `sp_seller`
VALUES ('2', '31010119910722661X', '陈冬', '1986-11-05', '上海市', '18763524951',
        'seller_test2', 'zzzzzz', 'afff@qrw.cc', '男', '1000001', '博士', '1512124098', '1512126098');


-- ----------------------------
-- Table structure for sp_user_cart
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_cart`;
CREATE TABLE `sp_user_cart`
(
    `cart_id`     int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     int(11) unsigned NOT NULL COMMENT '学员id',
    `cart_info`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '购物车详情信息，二维数组序列化信息',
    `created_at`  timestamp        NULL DEFAULT NULL,
    `updated_at`  timestamp        NULL DEFAULT NULL,
    `delete_time` timestamp        NULL DEFAULT NULL,
    PRIMARY KEY (`cart_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of sp_user_cart
-- ----------------------------
INSERT INTO `sp_user_cart`
VALUES ('19', '5764',
        'a:1:{s:32:\"84c7dfb6cb829817f6de9e7c9506d6f4\";a:10:{s:8:\"goods_id\";i:77;s:10:\"goods_name\";s:14:\"小米手机22\";s:11:\"goods_price\";s:6:\"111.00\";s:16:\"goods_small_logo\";s:67:\"./uploads/goods/20171017/small_9d5cccb340525d3f0652fd327cfb178b.jpg\";s:16:\"goods_buy_number\";i:1;s:14:\"goods_cart_uid\";s:32:\"84c7dfb6cb829817f6de9e7c9506d6f4\";s:7:\"user_id\";i:5764;s:4:\"time\";d:1509438617.630688;s:5:\"queue\";b:1;s:18:\"goods_price_xiaoji\";d:111;}}',
        null, null, null);
INSERT INTO `sp_user_cart`
VALUES ('20', '7505',
        'a:1:{s:32:\"65927e4ef01cf6ab4b2764bea2f4ffba\";a:10:{s:8:\"goods_id\";i:76;s:10:\"goods_name\";s:14:\"华为闪耀33\";s:11:\"goods_price\";s:6:\"111.00\";s:16:\"goods_small_logo\";s:67:\"./uploads/goods/20171017/small_6a666c60fb4a9bd4fe462a04f4318019.jpg\";s:16:\"goods_buy_number\";i:1;s:14:\"goods_cart_uid\";s:32:\"65927e4ef01cf6ab4b2764bea2f4ffba\";s:7:\"user_id\";i:7505;s:4:\"time\";d:1509438621.5471151;s:5:\"queue\";b:1;s:18:\"goods_price_xiaoji\";d:111;}}',
        null, null, null);
INSERT INTO `sp_user_cart`
VALUES ('21', '1',
        '[{\"goods_id\":92,\"amount\":2},{\"goods_id\":94,\"amount\":2},{\"goods_id\":76,\"amount\":2},{\"goods_id\":75,\"amount\":1},{\"goods_id\":73,\"amount\":1}]',
        null, null, null);
