RPC - 服务器和客户端通信中客户端的API函数
----------

所有的API函数都是客户端的函数。

# 文档用例标识：

* ==> 发送
* <== 接收
* struct{} 数据结构
* fn()->ret 函数，参数列表(Tuple)
* Module.fn 模块

一、APP阶段
========

1. 当打开APP时，需要上传
	- fn App.open(appinfo)

	==> appinfo{version,vendor,locale,platform,netadr,deviceinfo}
	<== code,verinfo {version,manifest}

2. 检测更新：
	- fn App.check_version(localVersionInfo) -> result
	- fn App.get_remote_version(localVersion) -> remoteVersion
	- fn App.get_update_manifest(remoteVersion) -> manifest
	- fn App.dl_manifest(manifest,fnFailed,fnSuccess,fnProgress) -> downloadHandle
	- fn App.get_dl_progress(downloadHandle) -> progress

3. 检测能更新，会得到：
	verinfo{version,manifest}
	然后，可以根据manifest进行下载，下载完后验证资源完整性。
	如果是主包更新，则需要重启应用；如果是支包更新，则无需重启应用。

4. 更新完毕，如果是新用户，可以进行游客登录或注册账号。

二、登录阶段
==========

## 游客登录:
	fn Account.login(logininfo)

	会发送登录信息： => logininfo{ type }，
	然后返回账号信息 <= code,accountinfo{ _id, name,password,lv,state},
### 手机登录：
	fn Account.login(logininfo)

	发送 => reginfo{type,phone,vcode,netadr,from},
	返回账户信息 <= accountinfo{_id, name,lv,state}
### 第三方登录：
	fn Account.login(logininfo)
	
	调用第三方API时，发送 => logininfo{type,account,netadr,from}
	<= accountinfo{_id,name,lv,state}
### 已注册账号登录
	fn Account.login(logininfo)
	
	调用第三方API时，发送 => logininfo{type,account,netadr,from}
	<= accountinfo{_id,name,lv,state}
## 注册：
	fn Account.reg(reginfo)

	发送：=> reginfo{type,name,nickname,password,netadr,from,phone,details}, 
	返回账号信息: <= accountinfo{_id,name,lv,state,}

## 游客转正式用户：
	注册新的用户，并将游客数据移到此新用户下。
	fn Accout.memberlise(reginfo)

	=> reginfo{type,guestname,name,nickname,password,netadr,from,details}
	<= accountinfo{_id,name,lv,state}

## 账户管理
> 注册流程：填写资料 - 点击登录 [- 发送注册账号请求 - 服务器生成账号并保存 -] - 返回账号信息
> 快速登录流程：点击快速登录[- 获取本地保存token - 发送账号登录请求 - 服务器根据token查询对应的账号 - 查询账号信息并返回] - 返回账号信息
> 第三方登录流程： 点击第三方登录 [- 发送第三方登录请求并获取本地token - 服务器获取第三方返回的结果 - 查询token对应的账号信息 - 记录此账号绑定 -]- 返回账号信息
> 游客登录： 点击游客登录 [- 发送游客登录请求 - 返回生成的游客账号信息-] - 返回账号信息
> 游客转为正式用户： 点击转为正式用户 - 填写账号 - 发送游客账号转移请求 - 服务器生成新账号，并将游客账号数据迁移进新账号 - 返回账号信息
> 填写详细信息： 填写详细信息资料 - 发送修改详细资料请求 - 返回账号信息
> 冻结账户：当账户出现异常情况时，可以快速通知用户，并让用户采取冻结形式。

### 账户API列表(客户端)

	# 注册账户
	- fn Account.reg(reginfo) -> accountinfo
	# 解注册账户，即销毁账户
	- fn Account.unreg(account) -> result
	# 检查账户信息
	- fn Account.check(account) -> result
	# 获取账户完整信息
	- fn Account.get(account) -> account
	# 设置账户的密码
	- fn Account.set_password(account,newPassword) -> result
	# 绑定第三方账户
	- fn Account.bind(account,thirdpartyAccount) -> result
	# 解绑定第三方账户
	- fn Account.unbind(account,thirdpartyAccount) -> result
	# 关联游戏账户
	- fn Account.assoc(account,type,otheraccount) -> result
	# 与游戏账户取消关联
	- fn Account.unassoc(account,type,otheraccount) -> result
	# 登录账户
	- fn Account.login(account) -> result,accountinfo
	# 账户登出
	- fn Account.logout(account) -> result
	# 获取账户权限
	- fn Account.get_privilege(account) -> privilege
	# 设置账户权限
	- fn Account.set_privilege(account,privilege) -> result
	# 账户是否有效账户
	- fn Account.is_valid(account) -> result
	# 游客账户转正式账户
	- fn Account.memberlise(account) -> result
	# 冻结账户，之后关于账户的一些重要操作都停止，需要提供超级密码进行管理。超级密码由系统生成，并不可更改。
	- fn Account.freeze(account,reason) -> result
	# 解冻账户
	- fn Account.unfreeze(account,reason) -> result
	# 设置账户私有信息
	- fn Account.set_priv_info(account,key,value) -> result
	# 获取账户私有信息
	- fn Account.get_priv_info(account) -> privinfo

### 游戏账户管理

游戏账户可登录论坛、圈子、游戏。用户可通过账户查找游戏账户，但游戏账户逆向查找。用户账户可管理多个游戏账户，游戏账户只能有一个用户账户。

	# 设置游戏账户信息
	- fn GameAccount.set(gameaccount,key,val) -> result
	# 获取游戏账户信息
	- fn GameAccount.get(gameaccount) -> result
	# 获取游戏账户的登录记录
	- fn GameAccount.get_logins(gameaccount) -> loginhistory
	# 获取游戏账户的余额
	- fn GameAccount.balance(gameaccount) -> balance
	# 获取游戏账户的充值历史记录
	- fn GameAccount.bill(gameaccount,start,end) -> payhistory

当完成登录流程后，进入游戏，可以进入下一步预游戏阶段。游戏壳阶段中的操作，是与游戏逻辑没有任何关系的操作。

三、游戏壳阶段
=============

## 签到管理

签到是通过游戏账户签到。同样，游戏账户可以直接登录论坛。

> 签到流程： 点击签到 - 服务器判断奖励物品并发放 - 返回结果

	# 通过游戏账户签到，可在论坛和游戏中进行签到
	- fn GameAccount.sign_in(type,index) -> result


## 邮件管理

邮件可在游戏中发送邮件，也可以在论坛中发送邮件。邮件通过游戏账户进行发送。
邮件系统包括收件夹、发件夹、回收站、联系人表

> 发送邮件流程： 选择收件人- 填写内容- 发送-返回结果
> 删除邮件流程： 选择邮件 - 删除 - 返回结果
> 领取邮件内物品流程： 选择邮件打开 - 领取物品 - 返回结果

	# 发送邮件
	- fn Mail.send(gameaccount,mail) -> result
	# 手动接收邮件
	- fn Mail.fetch(gameaccount) -> mails
	# 销毁收件夹所有邮件
	- fn Mail.remove_all(gameaccount) -> result
	# 移除文件，将邮件移入到回收站
	- fn Mail.remove(gameaccount,mail) -> result
	# 清空对应位置的所有邮件，清空后不可恢复
	- fn Mail.clear(gameaccount,place) -> result
	# 获取收件夹邮件中的附件。
	- fn Mail.take(gameaccount,mail) -> result
	# 领取收件夹中所有邮件中的附件，并将邮件移到回收站
	- fn Mail.take_clean(gameaccount)

### 邮件联系人管理

在每次发送邮件或接收邮件后，会将发送者或接受者信息自动存入到联系人表，客户端只需要同步联系人即可。

	# 获取所有的联系人列表
	- fn Mail.contacts(gameaccount) -> contacts
	# 给联系人添加备注
	- fn Mail.remark(gameaccount,contactor) -> result

## 支付管理

支付管理是统一的，无论是在论坛、游戏还是平台中产生的交易结算，以统一的方式进行。所有的计算记录，都挂在账户名下。支付的每笔订单都会记录在案，不可漏记。

> 支付流程： 选取物品 - 点击购买 - 向支付平台发起支付请求 - $记录订单$ - 支付平台返回支付结果 - 返回结果给客户 - $记录订单结果$

	# 发起订单
	- fn Trade.order(vendor,items) -> order
	# 获取订单状态
	- fn Trade.get_state(order) -> state
	# 取消订单
	- fn Trade.cancel(order) -> result
	# 支付订单
	- fn Trade.pay(order) -> result
	# 获取账单明细
	- fn Trade.bill(account,start,end) -> payhistory
	# 获取账户余额
	- fn Trade.balance(account,vendor) -> result

### 商城

交易管理主要是贩卖游戏道具或其他实物。商家物品可以通过论坛发起，也可通过游戏内发起。交易完成的收入，统一计入结算平台。

用户购买物品，会以订单形式存在。用户交互物品，则以兑换请求形式存在，平台不参与任何中间环节。

> 上架流程： 填写商品价格 - 上架商品 - 扣除上架费用 - 返回结果
> 下架流程： 选择商品- 点击下架- 返回结果
> 交易流程： 选择商品 - 点击交易 - 可选择货币支付或以物易物 - A确定 - B确定 - 发送交易请求 - 扣除佣金 - 返回结果
> 兑换流程： 选择要兑换的物品 - 点击兑换 - 扣除佣金 - 返回结果

	# 上架商品
	- fn Trade.shelf(gameaccount,shelf,commodity) -> result
	# 下架商品
	- fn Trade.unshelf(gameaccount,shelf,commodity) -> result
	# 下架所有对应游戏账户的商品
	- fn Trade.unshelf_all(gameaccount,shelf) -> result
	# 发送兑换物品请求，主要是以物易物。
	- fn Trade.req_exchange(gameaccount,myitems,youritems) -> exchangereq
	# 对兑换请求做出回应
	- fn Trade.resp_exchange(gamesccount,exchangereq) -> result
	# 打赏
	- fn Trade.gift(gameaccount,user,item) -> result

在商城中的购买，与支付相同。@see [支付]()

## 公告管理

公告是系统和有权限的用户发出的，可以在游戏、论坛中发送。聊天则是由用户自己发起，通常有不同的频道作为聊天形式。

公告是全局同步的，即，当用户发送公告时，会同步发送至论坛、游戏等广播形式中，确保任何人都可得到消息。

公告通常不是用户聊天的地方，只用于广播非常重要的信息，因此如果用户要发送广播时，通常需要较高的代价，而且两条公告消息之间，需要隔一段时间（默认为3分钟）

对客户端而言，通常公告是不可被屏蔽的，而且是全局的，无论是在游戏中，还是在任何地方，当有公告时，客户端必须能立即知道。

	# 发送公告，可发送至论坛、游戏、游戏内大厅等
	fn Notice.push(gameaccount,content,place,repeatcount) -> result
	# NOTICE! 拉取公告。通常客户端很少主动拉取公告。
	fn Notice.pull(gameaccount,place) -> notices

## 聊天管理

聊天管理通常是由用户自行发起和终止。聊天形式主要有：文本+表情、语音、即时聊天、聊天组聊天等。

聊天主要通过频道区分，主要的频道有这样几种：私人、聊天组以及游戏内自定义的频道，如帮会、队伍、区域等。同样的，此种形式的聊天可以通过论坛直接相通，即用户在游戏中发送的信息，可以即时在论坛中显示。聊天组信息也以此种方式进行同步。

频道是个抽象的概念，只有用户进入此频道后，才可通过此频道进行聊天。通常而言，用户不可同时进入多个频道。但在实现上，频道有互斥和共存两种形式存在。互斥频道不可同时进入，共存频道则可同时进入。当用户在共存频道中时，当这些频道中有消息时，会全部同步至客户端，但当共存频道多时，客户端的带宽会非常拥堵，因此不太建议使用共存频道。

聊天还有另外一种形式，即时聊天，同样，即时聊天也以频道作为划分。即时聊天生命周期有限，但对资源带宽需求明显。即时聊天的频道和普通聊天频道是不互通的。而且即时聊天的信息，不会被服务器存储下来。

> 发送聊天信息流程： 填写内容  - 发送 - 服务器转发 - 返回结果
> 创建聊天组： 拉取好友 - 设定聊天组信息 -  点击创建聊天组 - 返回聊天组信息
> 解散聊天组： 选取聊天组 - 点击解散 - 返回结果
> 踢出成员： 选择成员 - 点击踢出 - 当没有成员时，解散聊天组 - 返回结果
> 邀请成员： 选择好友 - 点击邀请 - 生成邀请信息 - 发送邀请请求 - 返回邀请
> 进入聊天组： 选择聊天组 - 发送进入请求 - 返回请求
> 退出聊天组： 选择聊天组 - 点击退出 - 返回结果

	# 发送聊天信息
	- fn Chat.chat(gameaccount,channel,content) -> result
	# 同步聊天信息。通常在用户进入频道时，会主动拉取。
	- fn Chat.pull(gameaccount,channel,maxminutes) -> chathistory
	# 发送即时聊天信息
	- fn Chat.chat_im(gameaccount,channel,content) -> result

### 聊天组管理

聊天组是由用户自行创建，创建时，可选取一些用户为默认成员，之后可以再加入或也可由用户申请加入。聊天组的存在时间，最多只有一个星期，当用户对此聊天组进行申请永久保存之后，才能正式建立。

当用户申请加入聊天组时，会给聊天组管理员发送申请信息。聊天组管理员可以处理此请求。同样，当邀请成员加入聊天组时，被邀请人也可以处理此请求。

聊天组也是一个特殊的频道。

	# 打开聊天组。可以设定聊天组的准入权限、是否长久化等选项
	- fn ChatGroup.open(gameaccount,members,options) -> group
	# 关闭聊天组
	- fn ChatGroup.close(gameaccount,group) -> result
	# 检测聊天组是否存在
	- fn ChatGroup.check(gameaccount,group) -> group
	# 长久化聊天组
	- fn ChatGroup.perm(gameaccount,group) -> result
	# 查询聊天组信息
	- fn ChatGroup.inquiry(gameaccount,group) -> group
	# 列出所在的所有聊天组
	- fn ChatGroup.list(gameaccount) -> groups
	# 踢出聊天组
	- fn ChatGroup.kick(gameaccount,group,member) -> result
	# 禁言某个成员
	- fn ChatGroup.mute(gameaccount,group,member,reason) -> result

	# 邀请好友进入聊天组。可通过短信、朋友圈、论坛等邀请好友加入聊天组
	- fn ChatGroup.invite(gameaccount,group,friend,mode) -> applyinfo
	# 申请加入聊天组
	- fn ChatGroup.join(gameaccount,group) -> applyinfo
	# 处理邀请、加入聊天组的请求
	- fn ChatGroup.react_apply(gameaccount,invatation) -> result
	# 获取邀请、加入聊天组请求的状态
	- fn ChatGroup.status_apply(gameaccount,applyinfo) -> state
	# 拉取所有的请求
	- fn ChatGroup.pull_apply(gameaccount) -> applyinfos
	# 退出聊天组
	- fn ChatGroup.exit(gameaccount,group,reason) -> result


### 直播与回放

直播是一种特殊的聊天组(@see [聊天组]())，它是即时消息形式，由主播发起直播，当主播退出直播时，此聊天组关闭。

聊天组是频道的一种，同样，直播也是频道的一种。

聊天组所有的操作，直播中都有，所不同的是，进入直播间的用户，可以与主播进行交互。同样，主播可以在游戏中，直接开始直播。在直播中，用户发送的消息分为两种，一种为聊天消息，一种为弹幕消息。因为弹幕会影响其他观众的注意力，因此发送弹幕消息需要权限。

当打开直播时，主播可以屏幕、摄像机进行录制。录制之后，可以将此视频上传至论坛。

	# 与聊天组相同的API忽略 

	# 发送弹幕信息
	- fn Live.barry(gameaccount,live,content) -> result
	# 暂停直播
	- fn Live.pause(gameaccount,live,reason) -> result
	# 恢复直播
	- fn Live.resume(gameaccount,live) -> result

可以给主播刷礼物：@see [交易管理 Trade.gift]()

直播间与聊天组相同的操作: @see [聊天组]()

在直播间，观众可以查询主播的信息：@see [社交]()

也可以关注主播等：@see [社交#关系管理]()
	
	
#### 回放管理

任意用户都可在游戏中实时录制，录制之后，用户可以通过外部工具进行剪辑，剪辑后的视频可以上传至论坛中。其他用户可以直接通过游戏获取所有的论坛中的回放列表。

回放与论坛中的其他帖子操作相同 @see [论坛#动态文章管理]()

## 客服管理

客服，是用户直接和工作人员进行交互的手段。所有发送给客服的消息，都会存储至客服专用消息库中，由工作人员读取。

用户可以在论坛、游戏中，随时随地，以任何形式与客服通话。

当用户与客服进行对话时，会以服务单形式创建服务。服务单会记录存储，以供工作人员查询。

客服会话是即时会话的一种，当用户退出聊天时，终止会话。

	### 客户端API
	# 呼叫客服支持，直接通过电话或网络电话形式发起呼叫。
	- fn Support.call(gameaccount) -> service
	# 与客服进行对话
	fn Support.chat(gameaccount,content) -> service
	# 结束呼叫
	- fn Support.end_call(gameaccount) -> result

	# 获取服务单的状态。
	- fn Support.state(gameaccount,service) -> state
	# 获取常见问题列表
	- fn Support.faq(gameaccount) -> faq
	# 对服务进行评价
	- fn Support.rating(gameaccount,service) -> result

## 消息链接管理

消息链接是消息中存在的一种链接，用户可以直接通过点击此链接的形式，跟随到消息发起人所发送地方去。这样可以实现多种用途，如快速进入游戏、快速参加活动等等。

消息链接遵循URL资源格式，但更多的有自己的协议格式。如：game://<游戏名称>:<游戏房间>/<游戏场景>，当玩家点击时，可快速和此消息发起人组队进行游戏。

消息链接可嵌入任意消息中，包括聊天组、公告、直播等。

	# 创建mlink
	- fn Mlink.new(gameaccount,mlinkinfo) -> mlink
	# 跟随公告中包含的信息地址，这种跟随可能直接跳转进游戏、可能链接至活动地址等
	- fn Mlink.follow(gameaccount,mlink) -> result

## 排行榜机制

排行榜是提升竞争乐趣、增加奖励的通用机制。排行榜可以在论坛、圈子、游戏中展示。

排行榜包括论坛中设定的排行榜，圈子中设定的排行榜，游戏中设定的排行榜等。每个排行榜以域划分。

排行榜中的奖励，通常以周、月、年形式结算，结算后，通过邮件进行发放。

	# 获取所有榜单列表信息
	- fn RankBoard.fetch() -> boards
	# 获取榜单信息
	- fn RankBoard.info(board) -> info
	
	# 列出指定排行榜的数据
	- fn RankBoard.list(board,start,count) -> ranklist

	# 列出指定玩家在所有排行榜中的名次
	- fn RankBoard.rank(gameaccount,who) -> ranks
	# 列出指定玩家在指定排行榜中的名次
	- fn RankBoard.rank_of(gameaccount,who,board) -> rank
	
用户可以获取排行榜中用户的信息，关注用户等等。 @see [社交]()

## 抽奖机制

抽奖是提升活跃度、增加奖励的机制。抽奖不会涉及到实物奖励。所有的奖励实时发放。

抽奖是通用的机制，与排行榜一样，可以论坛、圈子、游戏中展示。

每个抽奖箱都有自己的所属域。奖励奖品可以跨域。

> 抽奖流程：选择抽奖类型 - 点击抽奖 - 返回结果

	# 获取所有抽奖箱信息
	- fn Lottery.fetch() -> boxs
	# 抽奖
	- fn Lottery.lot(gameaccount,box) -> result
	# 抽奖箱信息
	- fn Lottery.info(box) -> info


## 活动机制

活动是提升活跃度、增加奖励的通用机制。可在论坛、圈子、游戏中展示。

活动需要提前发布，发布后，可供任何人参加。参加的人，需要先报名；在活动开始之前进行通知。

	# 获取所有活动，不包含已经结束的
	- fn Activity.fetch() -> activities
	# 获取最近已结束的所有活动
	- fn Activity.fetch_last() -> activities
	# 报名参加活动
	- fn Activity.join(gameaccount,activity) -> result
	# 退出活动。已报名的，则取消报名；已开始的，则立即退出。
	- fn Activity.quit(gameaccount,activity) -> result
	# 获取当前报名参加的活动列表
	- fn Activity.actor_in(gameaccount,who) -> activities
	# 获取参与者列表
	- fn Activity.actors(activity) -> users
	# 获取活动的信息
	- fn Activity.info(activity) -> info
	

## 社交

社交，是用户之间扩散信息的便捷方式。社交，最核心的部分是交互。

用户与用户之间的交互是最重要的，其中，交互的最核心部分是快捷的了解最新动态。

社交的基本操作，是了解对方，沟通，组队等等。

	# 查询用户信息
	- fn Social.inquiry(gameaccount,user) -> uerprofile
	# 列出符合搜索条件的所有用户
	- fn Social.list(pattern) -> userprofiles
	# 列出新加入的用户
	- fn Social.list_new(pattern) -> userprofiles

社交中的沟通，参考@see [聊天]()
社交中的组队，参考@see [MLink]()
社交中的文章交互，参考@see [论坛#动态文章管理]()

### 关系管理

关系，是快速拉近关系的一种方式。无论是快速组队、快速分享，都可以通过此方式。

当用户之间相互关注时，即为好友。当只有一方关注时，两者不是好友。

	# 关注用户
	- fn Friends.follow(gameaccount,user) -> result
	# 是否好友
	- fn Friends.is_friends(gameaccount,user) -> result
	# 列出所有好友
	- fn Friends.list(gameaccount) -> userprofiles
	# 列出关注此用户的人列表
	- fn Friends.list_focus(gameaccount,user) -> userprofiles
	# 列出用户的关注列表
	- fn Friends.list_follow(gameaccount,user) -> userprofiles
	# 将用户分享给好友
	- fn Friends.share(gameaccount,user,friend) -> result

可以把某个用户的名片，分享给好友 @see [分享机制]()

可以获取所有关注用户的最新动态 @see [动态文章管理]()

### 分享机制

分享机制是与MLink机制类似的通用机制，主要用于内容推广。

分享的内容，可包含mlink。当处于外部分享时，则需要将mlink转换成http形式。

分享的内容分享方式，可内部分享给指定用户、通过外部分享。

	# 分享
	- fn Social.share(content,mode) -> result
	# 统计我的分享次数
	- fn Social.my_shares(gameaccount,pattern) -> shares

### 动态文章管理

用户的最新动态通常以文字（配图）、视频（短视频和回放）、音频形式发布，统称为文章。当发布时，会推送给所有关注者。

关注者可对此文章进行评论，或其他交互（如，赞、踩等）。

	# 获取用户的最新动态
	- fn Article.fetch(gameaccount,user) -> articles

	# 发布动态
	- fn Article.push(gameaccount,article) -> result
	# 评论动态
	- fn Article.comment(gameaccount,article,content) -> result
	# 查找符合条件的文章
	- fn Article.search(gameaccount,pattern) -> articles
	# 赞
	- fn Article.like(gameaccount,artice) -> result
	# 踩
	- fn Article.unlike(gameaccount,article) -> result
	# 获取可对帖子做出的评价行为(evaluation)
	- fn Article.fetch_eva(gameaccount)
	# 正面评价（用作扩展）
	- fn Article.good_eva(gameaccount,article,key,val) -> result
	# 负面评价（用作扩展）
	- fn Article.bad_eva(gameaccount,article,key,val) -> result
	# 获取帖子的信息，例如作者、创建日期、主题等等
	- fn Article.info(gameaccount,article) -> info

可关注文章作者 @see [社交关系]()

可打赏作者 @see [交易管理]()

# 论坛管理

论坛是作为用户交流想法的重要地方，是扩散、推广的最佳场所，是舆论集散地，与游戏本身同等重要。

论坛的功能包括：
* 聊天 
* 公告
* 直播
* 邮件
* 商城
* 排行榜
* 签到
* 抽奖
* 活动
* 客服
* 分享
* 账户管理
* ...
等等。

可以看出，论坛的功能，与游戏中非游戏阶段的所有功能都是相同的。游戏在游戏阶段才与论坛有所差别。当然，论坛也有游戏所没有的功能逻辑。

论坛是消息的集散地，与游戏的侧重点有所不同，但数据共享。论坛侧重用户、与用户之间，游戏侧重娱乐性。

所以论坛可以包含：
* 实物交易：如书籍、打赏、二手货
* 外卖

## 实物交易

实物交易，是与虚拟交易不同的部分，需要通过国家工商部允许的行为。

实物交易也是交易活动中的一种，遵循统一结算形式。

实物交易的部分，与商城类似： @see [商城]()

## 外卖管理

外卖是方便玩家进行进行游戏的一个功能，服务于游戏宅。

外卖也属于实物交易的交易活动之一，遵循统一结算形式。@see [商城]()

NOTE! 外卖功能可能成为鸡肋功能。