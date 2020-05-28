//! encoding: utf8
//! 以下是客户端可以直接调用的API列表 
//! 

// 获取远端版本
int fr_app_version();
// 获取本机的appid
int fr_app_id(char* appid);




int fr_client_touch(const char* svradr);//! 连接服务器
int fr_client_untouch();//! 与服务器断开连接
int fr_client_destroy();//! 销毁客户端


int fr_session_new();
int fr_session_destroy();
int fr_session_freeze(); 
int fr_session_unfreeze();

int fr_app_check_update();
int fr_app_update();

int fr_storage_write(const void* data,int len);
int fr_storage_read(void* data, int len);

/// 账户
int fr_account_login(const char* account,const char* password);
int fr_account_login3(const char* account,int provider);
int fr_account_logout(const char* account);
int fr_account_freeze(const char* account);
int fr_account_unfreeze(const char* account);
int fr_account_status(const char* account);
int fr_account_change_password(const char* account, const char* newpsw);

/// 用户
int fr_user_new(const void* userinfo);
int fr_user_destroy(const char* username);
int fr_user_freeze(const char* username);
int fr_user_unfreeze(const char* username);
int fr_user_get_priv(const char* key);
int fr_user_set_priv(const char* key,const char* val);
int fr_user_get_meta(const char* key);
int fr_user_set_meta(const char* key,const char* val);


/// 好友
int fr_friend_add();
int fr_friend_remove();

/// 邮件
int fr_mail_send();
int fr_mail_recv();
int fr_mail_new();
int fr_mail_destroy();




