# 数据结构表

对于数据结构表而言，只是罗列出需要使用的数据，并没有做联合。它们都是裸数据，不涉及其他操作。

## 数据表
* UAccount： 通行证账号表。对客户端透明。
* GameAccount：游戏账号表。
* GameAccountLogs: 游戏账号登录记录表。
* UAccountPay：账户充值记录表


## 记录表
* UAccountLogs: 通行证账号操作记录表。
* GameAccountLogs: 游戏账号操作记录。
* UAccountPayLogs: 账号充值记录
* ServerLogs: 服务器崩溃等日志记录

## 配置表
* Permissions： 账户权限表
* ServerDomains: 服务器服务域表。
* GameAccountOps: 游戏账户操作表

