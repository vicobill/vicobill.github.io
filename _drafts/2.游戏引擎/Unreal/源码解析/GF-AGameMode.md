定义游戏玩法，管理游戏规则、得分，在此游戏类型下，允许哪些Actor，谁能进入游戏等。

它只在服务器实例化，不存在于客户端。

当关卡被初始化UGameEngine::LoadMap()时实例化。

GameMode由`?game=xxx`、World Settings中的值或项目设置中的DefaultGameMode设置。

# 变量：

| 变量                                 | 描述                                         |
| ------------------------------------ | -------------------------------------------- |
| OptionsString                        | 选项，可供解析                               |
| GameSessionClass                     | GameSession类，处理登录批准和在线游戏接口    |
| GameStateClass                       | 此游戏模式对应的GameState类                  |
| PlayerControllerClass                | spawn玩家以登录                              |
| PlayerStateClass                     | 关联的每个玩家以同步相关玩家信息到所有客户端 |
| HUDClass                             | 游戏使用的HUD类                              |
| DefaultPawnClass                     | 玩家使用的默认Pawn类                         |
| SpectatorClass                       | 观众默认的Pawn类                             |
| ReplaySpectatorPlayerControllerClass | 当观看网络回放时使用的PlayerController类     |
| ServerStatReplicatorClass            | 服务器数据同步的类                           |
|                                      |                                              |
| GameSession                          | GameSession处理登录批准、仲裁、在线游戏接口  |
| GameState                            | 用以同步游戏状态相关属性到所有客户端         |
| ServerStatReplicator                 |                                              |
| DefaultPlayerName                    | 默认玩家名字                                 |
| bUseSeamlessTravel                   | 是否使用无缝旅行，不会断开客户端连接         |
| bStartPlayersAsSpectators            | 是否在刷出时，以观众形式观看                 |
| bPauseable                           | 游戏是否能暂停                               |
| Pausers                              | 在取消暂停之前的·委托列表                    |
|                                      |                                              |



# 函数：

| 功能                                                         | 描述                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| InitGame                                                     | 在PreInitializeComponents之前调用，用于GameMode初始化参数以及刷新辅助类。创建GameSession，并由Options初始化； |
| PreInitializeComponents                                      | 创建GameState，并创建GameNetworkManager                      |
| InitGameState                                                |                                                              |
| GetNumPlayers                                                | 获取玩家数量（非观众）                                       |
| GetNumSpecators                                              |                                                              |
| StartPlay                                                    | GameState::HandleBeginPlay()                                 |
| HasMatchStarted                                              |                                                              |
| SetPause,ClearPause,IsPaused                                 |                                                              |
| Reset,ResetLevel                                             |                                                              |
| ReturnToMainMenuHost                                         | 服务器端回到主界面，断开所有客户端                           |
| ProcessClientTravel，<br />CanServerTravel<br />ProcessServerTravel<br />GetSeamlessTravelActorList | 处理客户端漫游                                               |
| SwapPlayerControllers                                        | 交换玩家控制器                                               |
| HandleSeamlessTravelPlayer<br />PostSeamlessTravel<br />StartToLeaveMap<br />InitSeamlessTravelPlayer | 处理玩家的无缝漫游                                           |
| GameWelcomePlayer                                            |                                                              |
| PreLogin<br />Login<br />PostLogin<br />Logout               |                                                              |
| SpawnPlayerController                                        |                                                              |
| HandleStartingNewPlayer                                      |                                                              |
| MustSpectate<br />CanSpectate                                |                                                              |
| ChangeName                                                   |                                                              |
| ChoosePlayerStart<br />FindPlayerStart                       |                                                              |
| PlayerCanRestart<br />RestartPlayer<br />RestartPlayerAtPlayerStart<br />RestartPlayerAtTransform<br />InitStartSpot<br />FinishRestartPlayer |                                                              |
| SpawnDefaultPawnFor<br />SpawnDefaultPawnAtTransform<br />SetPlayerDefaults |                                                              |
| AllowCheats                                                  |                                                              |
| SpawnPlayerFromSimulate                                      |                                                              |
| UpdateGameplayMuteList                                       |                                                              |
| InitNewPlayer                                                |                                                              |
| InitializeHUDForPlayer                                       |                                                              |
| GenericPlayerInitialization                                  |                                                              |

