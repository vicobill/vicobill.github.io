---
layout: post
title: Ue4 Engine Flow
date: 2019-05-20 01:35:26 +0800
---

入口点：不同平台调用GuardMain入口函数。

# GuardMain：

- EnginePreInit()：引擎预先初始化。=>GEngineLoop::PreInit()
- EngineInit/EditorInit(GEngineLoop)：引擎或编辑器初始化。=>GEngineLoop::Init()
- EngineTIck()：主循环每次调用的函数。=> GEngineLoop::Tick()
- EngineExit/EditorExit()：引擎或编辑器退出。=> GEngineLoop::Exit()

## GEngineLoop::PreInit

主要负责解析命令行参数，初始化环境变量。

- 尝试启动Launcher；
- 从命令行读取游戏名称；
- 创建控制台输出设备；
- 加载ProjectFile；
- 加载Enterprise文件目录；
- 获取dll目录；加载核心模块-CoreUObject模块；
- 创建线程池；
- 加载PreInit模块：Engine,Renderer,AnimGraphRuntime,平台特定的模块（D3D12,OpenGLDrv),SlateRHIRenderer,Landscape,RenderCore,TextureCompressor,AudioEditor,AnimationModifiers
- AppInit：初始化Text本地化
- 创建日志
- 初始化配置系统，加载Engine、Game、Input、Editor等ini
- 加载Plugin和Module
- 检测模块或插件是否过期，并编译模块
- 初始化HMD设备
- 初始化Session

## GEngineLoop::Init

主要涉及子系统的初始化，特别是引擎的初始化。

- 检测/Script/Engine.Engine 的GameEngine/UnrealEdEngine类名称，加载UGameEngine/UUnrealEdEngine类，并创建UGameEngineUUnrealEdEngine的实例GEngine。
- MoviePlayer切换PreloadScreen
- GEngine解析命令行
- GEngine::Init()：引擎初始化
- SessionServicesModule::Start()；创建EngineService实例
- GEngine::Start()
- 加载Media模块
- 加载AutomationWorker、AutomationController模块
- 加载ProfilerClient模块
- 加载SequenceRecorder，SequenceRecorderSections模块
- 线程心跳

## GEngineLoop::Tick

- 底层内存追踪器每帧更新stats信息
- 线程心跳、游戏线程心跳
- 更新热更新内容
- 更新渲染
- 当CVar更新时，执行回调
- 刷新渲染命令；确保GPU命令执行
- 刷新线程日志
- GEngine::UpdateTimeAndHandleMaxTickRate()
- 开始帧渲染线程
- 每个场景更新一帧
- 平台PumpMessages
- 超时，Sleep
- 平台文件更新
- 处理Slate输入事件
- Media模块更新
- GEngine::Tick(deltaTime)
- 等待影片播放完毕，之后切换到Viewport
- Shader异步编译
- 处理并行Slate任务
- 模块更新
- 同步每帧结束
- 线程更新
- GEngine::TickDeferredCommands()
- Media模块渲染后更新(PostRender)
- 帧渲染结束



### virtual UEngine::Init()

- 初始化引擎子系统
- 设置默认游戏地图
- 初始化HMD和手势控制、EyeTrackingDevice
- 初始化Sound
- 加载Engine.ini文件
- 从配置文件，加载所有用到的引擎对象引用，如默认Material、Texture、Font；根据类名创建对应引擎类实例，初始化Timecode Provider，创建GameSingleton类实例，创建AssetManager类实例并初始加载
- 创建World（UWorld）
- 初始化Audio device
- 执行命令行中额外的命令
- 绑定网络事件回调
- 初始化PortableServices（RPC）
- 初始化引擎分析
- 加载ImageWriteQueue,StreamingPauseRendering,MovieScene,MovieSceneTracks,LevelSequence，LiveCoding等模块。
- AssetManager结束初始加载
- 添加引擎统计数据，并传播统计数据
- 记录HMD设备分析

### virtual UEngine::Start()

### virtual UEngine::Tick()=0



#### override UGameEngine::Init()

游戏引擎初始化。扩展自UEngine。

- UEngine::Init
- 加载GameUserSettings，应用分辨率设置
- 创建GameInstance，并初始化.
  - 创建UWorld
- 创建GameViewportClient，并初始化
- 创建游戏窗口，并将此窗口与上一步创建的Viewport关联

#### override UGameEngine::Start()

- GameInstace::StartGameInstance()
  - 播放回放
  - Engine::Browse：切换地图
  - 调用virtual GameInstace::OnStart

#### override UGameEngine::Tick()

- 更新日志
- 清理关闭的Viewport
- 所有Viewport都关闭，执行退出
- TickWorldTravel()
- UWorld::Tick()
- SkyLightComponent::UpdateSkyCaptureContents
- ReflectionCaptureComponent::UpdateReflectionCaptureContents
- GamePlayer::Exec()
- 更新过渡类型
- 等待LevelStreaming完成
- World::UpdateLevelStreaming
- 异步改变Map
- FTickableGameObject::TickObjects：更新计时对象
- GameViewport::Tick
- RedrawViewports()：渲染一切
- StreamingManager::Tick()
- AudioDeviceManager更新音频设备
- 渲染模块更新

