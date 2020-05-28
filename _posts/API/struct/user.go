package user;

/**
 * 通用于整个公司所有产品的通行证，不特定于某一种产品。如：游戏、应用程序、论坛、客服系统等。
 * 用户账户，无分内部与外部，内外之分仅仅是权限不同而已。
 * 用户的货币是通用币，可以在任意产品中使用。
 * 用户的每次重要信息的通信，都有对应的Session作为保障
 * 用户的基本谁社交信息用于在GameCenter中，进行排行榜比拼所需
 * 用户的私人信息，则用于更加私密的用途：如订购产品，需要知晓手机号和通信地址等
 * 通用货币有两种：人民币和比特币。其他的有价值的物品有：金币、分数、物品等等不一而足，由每个游戏内部确定。
 */

/// 通行证账号
type UAccount struct {
    id      uint64;     // 通行证ID
    name    string;     // 在创建游戏账户时生成的名称
    passwd  string;     // 在创建游戏账户时生成的密码
    level   int32;      // 等级，用于标识账户的权限
    flag    int32;      // 标识，可用来标记账户状态
    locale  int32;      // 语言标记
}

/// 通行证账号私人信息
type UAccountPriv struct {
    aid     uint64;     // 私人信息对应的账户ID
    name    string;     // 姓名
    birthday int32;     // 出生日期
    gender  int8;       // 性别
    addrs   []string;   // 地址
    phones   []string;  // 手机
    emails   []string;  // emails
    idcard  string;     // 身份证号
    gps     []float32;  // GPS定位
    ip      string;
}

///! 登录、注册信息
type SignInfo struct {
    from    int32;
    platform int32;
    time    string;
    ip      string;
}

type BindAccount struct{
    account     string;
    platform    int16;
}

/// 游戏账户
type  GameAccount struct{
    UAccount
    flag       int32;
    locale     int32;    // 语言标记

    join_info   SignInfo;   // 注册信息
    login_info  SignInfo;   // 登录信息
    
    bind_accounts []BindAccount;
}

/// 用户个人信息
type  UserProfile struct {
    name        string; // 用户的昵称
    icon_url    string; // 头像
    gender      int8;   // 性别
    level       int32;  // 等级
    state       int16;  // 状态
    locale      int16;  // 使用的语言设置
}

type User struct {
    GameAccount
    UserProfile
    
}
