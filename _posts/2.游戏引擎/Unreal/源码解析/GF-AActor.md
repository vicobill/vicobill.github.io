Actor是可放在关卡中的对象。可包含一系列ActorComponents——用于控制actor的行为。另一主要功能是在网络中同步属性和函数调用。

Actor的初始化顺序是：

- PostLoad/PostActorCreated:执行构造必须的一些设置。PostLoad用于序列化的Actor，PostActorCreated用于Spawned的Actor。
- Actor::OnConstruction：构造过程。Blueprint actor创建其组件，蓝图变量被初始化。
- Actor::PreInitializeComponents：初始化组件之前调用
- ActorComponent::InitializeComponent：actor的组件列表的每个组件都获得初始化
- Actor::PostInitializeComponents：组件初始化之后调用
- Actor::BeginPlay：在关卡开始时调用。

Actor包含的组件有：

- OwnedComponents
- BlueprintCreatedComponents

# 属性

| 属性名                                    | 描述                                                         |
| ----------------------------------------- | ------------------------------------------------------------ |
| PrimaryActorTick                          | 基础Tick函数调用                                             |
| hidden                                    | 是在Editor中显示或游戏中                                     |
| NetTemporary                              | 只在刷出时同步，之后不再同步                                 |
| NetStartup                                | 直接从地图加载，可通过完整路径名在网络上访问                 |
| OnlyRelevantToOwner                       | 只与其所有者有关，当在游戏中此值被改变，所有非所有者频道都要显式关闭 |
| AlwaysRelevant                            | 覆盖(OnlyRelevantToOwner)，一直相关                          |
| ReplicateMovement                         | 同步位置相关属性                                             |
| TearOff                                   | 不再同步到新的客户端，并在所有客户端扯掉此Actor              |
| ExchangedRoles                            | 是否客户端已经改变了角色。                                   |
| NetLoadOnClient                           | 此Actor在地图加载中在网络客户端上被加载                      |
| NetUserOwnerRelavancy                     |                                                              |
| RelevantForNetworkReplays                 | 此Actor被同步到网络回放                                      |
| ReplayRewindable                          | 回放可设置时间                                               |
| AllowTickBeforeBeginPlay                  | 在BeginPlay时间之前允许Tick                                  |
| AutoDestroyWhenFinished                   | 所有组件完成并无计时器正在运行时，自动销毁Actor              |
| BlockInput                                | 在Actor之下的所有对象都不可接收Input                         |
| CanBeDamaged                              | 是否能受伤害                                                 |
| CollideWhenPlacing                        | 当放置在世界中时，即碰撞。即使RootComponent的碰撞被禁用。    |
| FindCameraComponentWhenViewTarget         |                                                              |
| GenerateOverlapEventsDuringLevelStreaming | 当作为关卡流一部分刷出时，生成overlap事件                    |
| IgnoresOriginShifting                     | 是否不受世界原点转移影响                                     |
| EnableAutoLODGeneration                   | 自动生成LOD                                                  |
| IsEditorOnlyActor                         | 是否只在Editor中存在                                         |
| ActorSeamlessTraveled                     | 指示Actor是否被无缝切换                                      |
| Replicates                                | 是否同步到远程机器                                           |
| CanBeInCluster                            | 能否放到GC Cluster以提高垃圾回收效率                         |
| AllowReceiveTickEventOnDedicatedServer    | 在专有服务器上禁用Tick事件                                   |
| NetCheckedInitialPhysicsState             | 是否已检查初始模拟物理状态到网络化代理                       |
| HasFinishedSpawning                       | 是否已经完成刷出                                             |
| ActorInitialized                          | 已初始化                                                     |
| TickFunctionsRegistered                   | 是否尝试注册tick函数                                         |
| HasDeferredComponentRegistration          | 是否在刷出时延迟RegisterAllComponents函数调用                |
| RunningUserConstructionScript             | 运行用户构造脚本                                             |
| ActorEnableCollision                      | 启用任意碰撞                                                 |
| ActorIsBeingDestroyed                     | 被移除                                                       |
| ActorWantsDestroyDuringBeginPlay          | 是否在运行中将要移除                                         |
| ActorHasBegunPlay                         | BeginPlay是否被调用                                          |
| RemoteRole                                | 描述如何控制远程机器                                         |
| ReplicatedMovement                        | 用于同步位置和速度                                           |
| InitialLifeSpan                           | 在消亡前，Actor存在多久                                      |
| CustomTimeDilation                        | 允许每个Actor在不同时间速度下运行                            |
| CreationTime                              | 创建时时间                                                   |
| AttachmentReplication                     | 用于同步Actor附着组件同步                                    |
| Owner                                     | 所有者，用于同步和可见性                                     |
| NetDriverName                             | 指定网络同步的驱动形式                                       |
| Role                                      | 描述如何控制本机actor                                        |
| NetDormancy                               | 切断同步的休眠方式                                           |
| SpawnCollisionHandlingMethod              | 控制刷出时碰撞处理                                           |
| AutoReceiveInput                          | 从玩家接收输入的方式                                         |
| InputPriority                             | 输入优先级                                                   |
| InputComponent                            | 处理输入                                                     |
| NetCullDistanceSquared                    | 客户端的视口最大长度                                         |
| NetTag                                    | 网络标签                                                     |
| NetUpdateFrequency，MinNetUpdateFrequency | 此Actor的同步频率                                            |
| NetPriority                               | 在低带宽或饱和情况下时，此Actor的同步优先级                  |
| Instigator                                | 此Actor的伤害反馈Pawn                                        |
| Children                                  | Owner为此Actor的Actor表                                      |
| RootComponent                             | 定义变换的碰撞元                                             |
| PivotOffset                               | 本地空间的中心偏移                                           |
| ControllingMatineeActors                  | 控制此角色的matinee Actor列表                                |
| TimerHandle_LifeSpanExpired               | 处理LiefeSpanExpired计时器                                   |
| Layers                                    | actor所属的层列表                                            |
| ParentComponent                           | 父组件                                                       |
| GroupActor                                | 此Actor所属的组的Actor                                       |
| SpriteScale                               | 任何布告栏组件的缩放                                         |
| HiddenEditorViews                         | 被隐藏的view                                                 |
| ActorLabel                                | 友好名称                                                     |
| FolderPath                                | 在世界中的目录                                               |
| bHiddenEd                                 | 是否在编辑器视口中隐藏                                       |
| bIsEditorPreviewActor                     | 预览对象                                                     |
| bHiddenEdLayer                            | 被layer浏览器中隐藏                                          |
| bHiddenEdLevel                            | 关卡浏览器中隐藏                                             |
| bLockLocation                             | 锁定位置                                                     |
| bRunConstructionScriptOnDrag              |                                                              |
| bActorLabelEditable                       | 是否Label能被编辑                                            |
| bEditable                                 | 是否可被编辑                                                 |
| bListedInSceneOutliner                    | 是否在场景大纲中显示                                         |
| bHiddenEdTemporary                        |                                                              |
| Tags                                      | 标签列表                                                     |
| ReplicatedComponents                      | 保存已同步的组件                                             |
| OwnedComponents                           | 此Actor拥有的组件                                            |
| InstanceComponents                        | 由用户添加实例化的组件                                       |
| BlueprintCreatedComponents                | 蓝图创建的组件                                               |
| DetachFence                               | 渲染线程中被分离的命令Fence                                  |
|                                           |                                                              |
| 回调函数：                                |                                                              |
| OnTakeAnyDamage                           | 任意伤                                                       |
| OnTakePointDamage                         | 点伤                                                         |
| OnTakeRadialDamage                        |                                                              |
| OnActorBeginOverlap                       |                                                              |
| OnActorEndOverlap                         |                                                              |
| OnBeginCursorOver                         |                                                              |
| OnEndCursorOver                           |                                                              |
| OnClicked                                 |                                                              |
| OnReleased                                |                                                              |
| OnInputTouchBegin                         |                                                              |
| OnInputTouchEnd                           |                                                              |
| OnInputTouchEnter                         |                                                              |
| OnInputTouchLeave                         |                                                              |
| OnActorHit                                |                                                              |
| OnDestroyed                               |                                                              |
| OnEndPlay                                 |                                                              |
|                                           |                                                              |
| CurrentTransactionAnnotation              |                                                              |
|                                           |                                                              |
| bUsePercentageBasedScaling                |                                                              |



# 函数

| 功能     | 相关函数                                                     |
| -------- | ------------------------------------------------------------ |
| 变换管理 | GetTransform,<br />ActorToWorld<br />GetActorForwardVector<br />GetActorUpVector<br />GetActorRightVector<br />GetActorBounds<br />GetVelocity<br />SetActorLocation<br />SetActorRotation<br />SetActorLocationAndRotation<br />SetActorScale3D<br />GetActorScale3D<br />GetDistanceTo<br />GetSquaredDistanceTo<br />GetHorizontalDistanceTo<br />GetVerticalDistanceTo<br />GetHorizontalDotProductTo<br />AddActorWorldOffset<br />AddActorWorldRotation<br />AddActorWorldTransform<br />SetActorTransform<br />AddActorLocalOffset<br />AddActorLocalRotation<br />AddActorLocalTransform<br />SetActorRelativeLocation<br />SetActorRelativeRotation<br />SetActorRelativeTransform<br />SetActorRelativeScale3D<br />GetActorRelativeScale3D<br />GetActorTransform<br />GetActorLocation<br />GetActorRotation<br />GetActorScale<br />GetActorQuat<br />SetPivotOffset<br />GetPivotOffset |
|          | SetActorHiddenInGame                                         |
|          | SetActorEnableCollision<br />GetActorEnableCollision         |
|          | HasAuthority                                                 |
|          | AddComponent<br />AttachToComponent<br />AttachToActor<br />SnapRootComponentTo<br />AttachRootComponentTo<br />DetachFromActor<br />DetachAllSceneComponents |
|          | ActorHasTag                                                  |
|          | AddTickPrerequisiteActor<br />AddTickPrerequisiteComponent<br />RemoveTickPrerequisiteActor<br />RemoveTickPrerequisiteComponent |
|          | GetTickableWhenPaused<br />SetTickableWhenPaused             |
|          | GetGameTimeSinceCreation                                     |
|          | DispatchBeginPlay                                            |
|          | IsActorInitialized<br />IsActorBeginningPlay<br />HasActorBegunPlay<br />IsActorBeingDestroyed |
|          | ReceiveAnyDamage<br />ReceiveRadialDamage<br />ReceivePointDamage<br />ReceiveTick<br />ReceiveActorBeginOverlap<br />ReceiveActorEndOverlap<br />ReceiveActorBeginCursorOver<br />ReceiveActorEndCursorOver<br />ReceiveActorOnClicked<br />ReceiveActorOnReleased<br />ReceiveActorOnInputTouchBegin<br />ReceiveActorOnInputTouchEnd<br />ReceiveActorOnInputTouchEnter<br />ReceiveActorOnInputTouchLeave<br />ReceiveHit<br />ReceiveDestroyed<br />UserConstructionScript<br />ReceiveEndPlay |
|          | NotifyActorBeginOverlap<br />NotifyActorEndOverlap<br />NotifyActorEndCursorOver<br />NotifyActorOnClicked<br />NotifyActorOnReleased<br />NotifyActorOnInputTouchBegin<br />NotifyActorOnInputTouchEnd<br />NotifyActorOnInputTouchEnter<br />NotifyActorOnInputTouchLeave<br />NotifyHit |
|          | GetOverlappingComponents<br />GetOverlappingActors           |
|          | SetLifeSpan<br />GetLifeSpan<br />Destroy                    |
|          | OnActorChannelOpen<br />UseShortConnectTimeout<br />OnSerializeNewActor<br />OnNetCleanup<br />PreNetReceive<br />PostNetReceive<br />PostNetReceiveRole<br />PostNetInit<br />PostNetReceiveLocationAndRotation<br />PostNetReceiveVelocity<br />PostNetReceivePhysicState |
|          | TickActor<br />PostActorCreated<br />LifeSpanExpired         |
|          | Tick<br />ShouldTickIfViewportsOnly                          |
|          | IsWithinNetRelevancyDistance<br />IsNetRelevantFor<br />IsReplayRelevantFor<br />IsRelevancyOwnerFor |
|          | FinishSpawning<br />PostSpawnInitialize<br />PostActorConstruction |
|          | TeleportTo<br />TeleportSucceeded<br />                      |
| 组件管理 | UnregisterAllComponents<br />ResetOwnedComponents<br />GetRootComponent |

​	

