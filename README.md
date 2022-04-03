#### 项目整体文件说明

- `config` 配置文件目录
  - `default.json` 默认配置文件（其中包含数据库配置，jwt配置）
- `dao` 数据访问层，存放对数据库的增删改查操作
  - `DAO.js` 提供的公共访问数据库的方法
- `models` 存放具体数据库 ORM 模型文件
- `modules` 当前项目模块
  - `authorization.js` API权限验证模块
  - `database.js` 数据库模块（数据库加载基于 nodejs-orm2 库加载）
  - `passport.js` 基于 passport 模块的登录搭建
  - `resextra.js` API 统一返回结果接口
- `node_modules` 项目依赖的第三方模块
- `routes` 统一路由
  - `api` 提供 api 接口
  - `mapp` 提供移动APP界面
  - `mweb` 提供移动web站点
- `services` 服务层，业务逻辑代码在这一层编写，通过不同的接口获取的数据转换成统一的前端所需要的数据
- `app.js` 主项目入口文件
- `package.json` 项目配置文件

# 运行说明
- 首先需要将db文件内sql还原到mydb数据库中
- 在<font color="red">config/default.json</font>修改数据库用户名以及密码
- mysql为5.7 8.0版本不兼容
- 运行`npm install`
- 再运行`node ./app.js`即可实现后台api接口

# sql 说明
sp_attribute  
- 商品特点

sp_category       
- 商品分类

sp_consignee      
sp_express        
sp_goods
- 商品管理
  - 商品列表

sp_goods_attr     
sp_goods_cats     
sp_goods_pics
- 商品的图片  

sp_manager
- 可以登录后台的用户

sp_order 
- 订单管理
  - 订单列表  

sp_order_goods   
- 订单的里面的商品

sp_permission     
- 页面内每个按钮对应名称

sp_permission_api 
- 按钮对应的api接口

数据报表  
sp_report_1  
sp_report_2       
sp_report_3       
sp_role
- 权限管理
  - 角色列表
sp_type           
sp_user           
sp_user_cart
