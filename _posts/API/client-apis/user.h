
/// 用户
int fr_user_new(const void* userinfo);
int fr_user_destroy();
int fr_user_destroy_async(const char* username);

int fr_user_freeze_async(const char* username); // 冻结用户
int fr_user_unfreeze_async(const char* username);

int fr_user_get_priv_async(const char* key);    // 获取私人信息
int fr_user_set_priv_async(const char* key,const char* val);
int fr_user_clear_priv_async(void*);

int fr_user_get_meta(const char* key);      // 获取其他信息
int fr_user_set_meta(const char* key,const char* val);
int fr_user_clear_meta(void*);

int fr_user_get_async(const char* userid);    // 获取用户信息

int fr_user_is_valid_async(void*);
int fr_user_vip(void*);
int fr_user_level(void*);
int fr_user_is_idle(void*);
int fr_user_is_gaming(void*);
int fr_user_is_online(void*);
int fr_user_set_nickname_async(void*);
int fr_user_inviter(void*);
int fr_user_get_at_gameid(void*);
int fr_user_get_at_roomid(void*);

int fr_user_is_guest(void*);
int fr_user_to_member_async(void*);

int fr_user_tipoff(void*);



