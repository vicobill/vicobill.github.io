
package social;

/// 排行榜记录
type RankRec struct {
	rt_appid 		string;
	rt_platform 	int16;
	score 			int32;
	gold 			int32;
	metas 			map[string]int32;

	next 			*RankRec;
}

/**
 * 用于统计的数据，可用于数据分析
 * 如：玩家留存率等
 */
 type GameStats struct{
    total_login_days	int32;  /** 总登录天数  */
    clogin_days   		int32;  /** 连续登录天数 */
    total_play_hours	int32;  /** 总游玩小时  */
    cplay_hours   		int32;  /** 连续游玩小时 */
    total_play_games	int32;  /** 总游玩过游戏 */
    total_likes   		int32;  /** 总赞数    */
    total_dislikes		int32;  /** 总嘘数    */
	
	metas 	map[string]int32;
};