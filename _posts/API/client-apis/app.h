
// app信息
int     fr_app_version();
void    fr_app_id(char* appid);
int     fr_app_is_valid_async(const char* appid);

// 配置
void    fr_app_conf_dir(char* confDir);
void    fr_app_conf_get(const char* key,char* val);
void    fr_app_conf_set(const char* key,const char* val);
void    fr_app_conf_load(const char* filename);
void    fr_app_conf_save(const char* filename);

// 生命周期
void    fr_app_open_async();
void    fr_app_reopen();
void    fr_app_close();
void    fr_app_gc(); // 移除旧资源

// 更新
int     fr_app_update_check_async();
int     fr_app_update_async();
int     fr_app_update_progress();
bool    fr_app_update_finished();
int     fr_app_update_verify(const void* asset);
void    fr_app_update_gc(); // 移除更新下载的资源

// 下载
void    fr_app_dl_dir(char* downloadDir);
int     fr_app_dl_asset_async(const char* url);
int     fr_app_dl_progress();
int     fr_app_dl_pause();
int     fr_app_dl_resume();
int     fr_app_dl_verify(const void* asset);
int     fr_app_dl_gc(); // 清理下载缓存区

// 小游戏管理
int     fr_app_game_list_async();
int     fr_app_game_install_async(const char* gameid);
int     fr_app_game_uninstall(const char* gameid);
int     fr_app_game_clear();    // 移除所有本体之外的小游戏







