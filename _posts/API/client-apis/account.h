

/// 账户
int fr_account_new_async(const void* info);
int fr_account_is_valid_async(const char* account);

int fr_account_login_async(const char* account,const char* password);
int fr_account_login3_async(const char* account,int provider);
int fr_account_logout_async(const char* account);

int fr_account_freeze_async(const char* account);
int fr_account_unfreeze_async(const char* account);

int fr_account_stat_async(const char* account); // 获取账户基本状态

int fr_account_change_password_async(const char* account, const char* newpsw);

int fr_account_get_user_async(const char* account);

int fr_account_alias_async(const char* aliasAccount); // 创建可另外登录的账户名
