# 保险后台数据库

## 保单表 ins_order
- <font color="red">id</font> order_id
- 保单号  order_num
- 投保人姓名  user_id
- 被投保人姓名  seller_id
- 保险种类 ins_type
- 上次缴费时间  last_pay
- 剩余到期时间  remd_time
- 下次缴费时间  next_pay
- 保单状态  order_stat
- 价格  order_pric

    - |正常|待缴费|过期|
      |:---:|:---:|:---:|
      |1|2|3|
- 操作人员

## 投保人表  ins_user
- <font color="red">id</font>  user_id
- 身份证号  user_num
- 姓名  user_name
- 生日  user_birt
- 地址  user_addr
- 电话  user_phon

## 被投保人表  ins_seller
- <font color="red">id</font>  sell_id
- 身份证号  sell_num
- 姓名  sell_name
- 生日  sell_birt
- 地址  sell_addr
- 电话  sell_phon

## 管理员表  ins_manager
- <font color="red">id</font> mg_id
- 姓名 mg_name
- 密码  mg_passwd
- 状态  mg_state
  - |正常|禁用|
    |:---:|:---:|
    |1|0|
- 权限  mg_ps

##  权限表  ins_permission
- <font color="red">权限id</font>  ps_id
- 权限名称  ps_name
- 父ID  ps_pid
- 控制器  ps_c
- 操作方法  ps_a
- 权限等级  ps_level
  - |一级|二级|三级|
    |:---:|:---:|:---:|
    |0|1|2

## 报表  report_1
- <font color="red">id</font>  rp1_id
- 交易金额  rp1_tran
- 参保人数  rp1_per
- 地区  rp1_area
- 日期  rp1_date

