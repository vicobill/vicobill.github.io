

/// 好友
int fr_friend_add_async(int userid);
int fr_friend_remove_async(int userid);
int fr_friend_state_async(int userid);
int fr_friend_list_async(void*);


/// 邮件

int fr_mail_new(const char* conent);
int fr_mail_destroy();

int fr_mail_remove_async(); // 删除邮件
int fr_mail_send_async(const void* mail); // 发送邮件
int fr_mail_recv_async(void* mail); // 收取邮件
int fr_mail_fetch_async();  // 检查信箱
int fr_mail_clear_async(int flag);  //清理所有邮件

int fr_mail_add_accelories(void*);  // 添加附件
int fr_mail_get_accelories_async(); // 领取附件
int fr_mail_has_accelories();       // 检测邮件是否包含附件
int fr_mail_quick_get_accelories_async(); // 快速领取所有新邮件的附件

int fr_mail_ban_users_async(void*);  // 不接受指定用户的邮件
int fr_mail_unban_user_async(void*);    
int fr_mail_tipoff_user(void*);     // 举报用户
int fr_mail_is_junk();  // 是否垃圾邮件
int fr_mail_ban_list(); // 获取被禁列表

int fr_mail_options();




/// 聊天
int fr_chat_new();
int fr_chat_destroy();

int fr_chat_send_async(void*);      // 发送消息
int fr_chat_filter_async(void*);    // 过滤频道
int fr_chat_open_async(void*);      // 开启聊天
int fr_chat_close_async(void*);     // 关闭聊天
int fr_chat_invite_async(void*);    // 邀请进入聊天
int fr_chat_kickout_async(void*);   // 踢出
int fr_chat_enter_async(void*);     // 进入聊天
int fr_chat_exit_async(void*);      // 退出聊天
int fr_chat_mute_user_async(void*); // 禁言
int fr_chat_unmute_user_async(void*);  
int fr_chat_mono_user_async(void*); // 主讲，其他人不可发言
int fr_chat_unmono_async(void*);

int fr_chat_options(void*);




/// 直播。直播是特殊的聊天组
int fr_live_new(void*);
int fr_live_destroy(void*);
int fr_live_options(void*);

int fr_live_rec(void*);
int fr_live_save(void*);
int fr_live_upload(void*);

int fr_live_stat(void*);    // 当前直播的状态，如观众数、评论数

int fr_live_list_async(void*);  // 感兴趣的直播
int fr_live_order_async(void*); // 预约直播
int fr_live_unorder_async(void*);

int fr_live_comment(void*); // 评论，弹幕


/// 交互
int fr_ia_gift_user_async(void*);   // 给用户刷礼物
int fr_ia_ban_user_async(void*);    // 不要用户的交互
int fr_ia_unban_user_async(void*);

int fr_ia_share_user(void*);        // 分享用户
int fr_ia_share_chat(void*);        // 分享聊天
int fr_ia_share_live(void*);        // 分享直播
int fr_ia_share_game(void*);
int fr_ia_share_app(void*);
int fr_ia_share(void*);             // 通用分享

int fr_ia_follow_async(void*);            // 跟随用户
int fr_ia_focus_async(void*);             // 关注用户
int fr_ia_unfocus_async(void*);           // 取消关注

int fr_ia_response(void*);      // 对某个交互进行反馈
int fr_ia_request(void*);       // 进行某个交互申请

int fr_ia_tipoff(void*);        // 举报
int fr_ia_tipoff_article(void*);
int fr_ia_tipoff_comment(void*);
int fr_ia_tipoff_chat(void*);
int fr_ia_tipoff_user(void*);


/// 朋友圈
// 帖子
int fr_article_new(void*);
int fr_article_destroy(void*);

int fr_article_add_async(void*);
int fr_article_remove_async(void*);

int fr_article_stat(void*);

int fr_article_tipoff_async(void*); // 举报帖子

// 评论
int fr_article_comment_async(void*);
int fr_article_uncomment_async(void*);
int fr_article_comment_list_async(void*);

int fr_article_comment_stat(void*);

int fr_article_comment_tipoff(void*);


/// 排行榜
int fr_rank_new(void*);
int fr_rank_destroy(void*);

int fr_rank_list_async(void*);  // 列出排行榜
int fr_rank_me_async(void*);    // 列出我的排行
int fr_rank_user_async(void*);  // 列出指定用户的排行


/// 反馈与客服支持

int fr_support_call_async(void*);   // 寻求支持
int fr_support_send_async(void*);
int fr_support_stat_async(void*);   // 状态
int fr_support_giveup_async(void*); // 放弃支持
int fr_support_score_async(void*);  // 对支持进行评分
