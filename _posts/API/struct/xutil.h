
#ifndef XGAME_UTIL_H
#define XGAME_UTIL_H

/*
 * 通用定义。可以适用于任何客户端和服务器。
 * 
 */

/* 性别 */
#define GENDER_FEMALE 0
#define GENDER_MALE 1
#define GENDER_NATURAL 2


/* 支付平台 */
typedef enum {
    PAY_PT_ZHIFUBAO = 0,
    PAY_PT_WECHAT,
    PAY_PT_PAYPAL,
    PAY_PT_BANKCARD,
    PAY_PT_PAYCARD,

    PAY_PT_MAX,
} EPayPlatform;

/* 游戏运行的平台 */
typedef enum {
    RT_OS_WINDOWS = 0,
    RT_OS_LINUX,
    RT_OS_MACOS,
    RT_OS_PC_LIKE,

    RT_OS_ANDROID,
    RT_OS_IOS,
    RT_OS_MOBILE_LIKE,

    RT_OS_WEB,
    RT_OS_WEBLIKE,
} ERuntimeOS;


#endif