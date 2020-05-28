UGameEngine:管理支持游戏的核心系统。扩展自UEngine。

UEngine：所有引擎类抽象基类，负责管理对editor或游戏而言极其重要的系统。也为定义某些引擎系统默认类。



继承自UEngine：

- 字体
- 游戏控制台类（UConsole）
- 游戏viewport客户端类(UGameViewportClient)
- 本地玩家类(ULocalPlayer)
- 世界设置类(AWorldSettings)
- 导航系统类(UNavigationSystem)
- 导航系统配置类(UNavivgationSystemConfig)
- 避障管理类(UAvoidanceManager)
- 物理碰撞处理器类(UPhysicsCollisionHandler)
- 游戏用户设置类(UGameUserSettings)
- 关卡脚本类(ALevelScriptActor)
- 默认蓝图基类名
- 游戏单例类名
- AssetManager
- 默认纹理（漫反射、BSPVertex,Noise,Bokeh,Bloom)
- 默认材质（Wireframe,Geom,DebugMesh,LevelColorationLit,LevelColorationUnlit,LightingTexelDensity,ShadedLevelColorationLit,ShadedLevelColorationUnlit,RemoveSurface,VertexColor,VertexColorViewMode....)
- 默认材质实例(MaterialInstance)
- 默认线性颜色组
- 编辑器Brush材质
- 默认物理材质
- 名称重定向(GameNameRedirects,ClassRedirects,PluginRedirects,StructRedirects)
- EngineLoop：用于从启动器回调引擎模块
- GameViewport：表示当前游戏实例的view port。
- 延迟命令组：在帧之后执行的延迟命令
- 



| 函数                                                         | 作用                                         |
| ------------------------------------------------------------ | -------------------------------------------- |
| CreateGameViewport                                           |                                              |
| SwitchGameWindowToUseGameViewport                            | 使用game viewport而不是loading screen或movie |
| OnGameWindowClosed<br />OnGameWindowMoved<br />OnViewportResized |                                              |
| HandleCommand<br />HandleExitCommand<br />HandleCancelCommand... |                                              |

