Actor是能放置在关卡中的任意对象。Actor是支持3D变换的通用类。Actor能通过游戏代码（C++/BP)创建和销毁。在C++中，AActor是所有Actor的基类。

有很多不同的Actor：StaticMeshActor,CameraActor,PlayerStartActor等

记住，Actor不直接存储Transform数据，如果不存在，使用的是Actor的Root Component的Transform数据。

## 创建Actor

创建Actor的实例，称之为Spawning。这可通过通用的SpawnActor()函数或其模版特例化版本函数完成。

## 组件Component

Actor可看成保存称之为Component的特殊类型对象。不同类型Component可用于控制Actor怎么移动、怎么渲染等。另一个Actor的主功能是在游玩中，通过网络replication属性和函数调用。

Compoent在创建时关联到包含它的Actor。

一些重要的Component是：

* UActorComponent：是基组件。可作为Actor一部分包含。可Tick。ActorComponent都关联到特定的Actor，但不在世界中存在于任何位置。常用于概念性功能，如AI或解释玩家输入。
* USceneCompoent：是ActorComponent，拥有Transform。Transform是世界中的一个位置，由location、rotation、scale定义。SceneComponent能以层级形式彼此附着。Actor的location、rotation和scale从层级的根SceneComponent得到。
* UPrimitiveComponent：是SceneComponent，拥有图形化表述（如Mesh或粒子系统）。一些有趣的物理和碰撞设置于此。

Actor支持层级SceneComponent。每个Actor拥有RootComponent属性指明哪个Component担任Root。Actor自身没有Transform，即没有location、rotation、scale。而是，Actor基于其Component的transform，更明确，其根Component。如果此Component是SceneCompoent，它为Actor提供Transform信息。否则，Actor将没有Transform。其他附着组件的Transform是与所附着的组件相关。

例如：GoldPickupActor其层级为：

* Root-SceneComponent：设置Actor在世界的基本位置
  * StaticMeshComponent：表示黄金的Mesh
    * ParticleSystemComponent：闪闪发光的粒子效果
    * AudioComponent：发光的音效
    * BoxComponent：碰撞触发拾取



## Ticking

表示Actor如何在引擎中更新。所有Actor都有在每帧tick的能力，或至少，用户定义的时间间隔，允许执行任意更新计算或行为。Actor的tick能力默认通过Tick()函数实现。

ActorComponent同样默认有更新的能力，但它们使用TickCompoent()函数达到。

## Lifecycle

![img](assets/ActorLifeCycle1.png)

上图发生于Actor已存在于关卡，如当LoadMap发生，或AddToWorld被调用。

1. 在包/关卡的Actor被从磁盘加载
2. PostLoad() 被序列化的Actor调用，在从磁盘加载结束后。任何自定版本和修正行为应在此。PostLoad与PostActorCreated是互相排斥的。
3. InitializeActorsForPlay
4. RouteActorInitialize :用于任意未初始化的Actor（覆盖无缝穿越携带）
   1. PreInitializeComponents:在Actor 的组件上调用InitializeComponent之前调用
   2. InitializeComponent：辅助函数，用于Actor上定义的每个组件的创建
   3. PostInitializeComponents：当Actor上的所有组件初始化之后调用
5. BeginPlay：当关卡开始时

### 在编辑器中运行Play In Editor

与从磁盘加载类似，但Actor不是从磁盘加载，而是从编辑器复制。

1. 在Editor中的Actor复制到新World中
2. PostDuplicate被调用
3. InitializeActorsForPlay
4. RouteActorInitialize：与上同
   1. PreInitializeComponents
   2. InitializeComponents
   3. PostInitializeComponents
5. BeginPlay

### 生成（Spawning）

当生成（实例化）Actor时，其路径如下：

1. 调用SpawnActor
2. PostSpawnInitialize
3. PostActorCreated：当Actor生成完毕，行为的构造应在此处。PostActorCreated与PostLoad互斥
4. ExecuteConstruction：
   - OnConstruction：Actor的构造，蓝图类Actor的Component被创建，以及蓝图变量初始化
5. PostActorConstruction：
   1. PreInitializeComponents：如上
   2. InitializeComponent
   3. PostInitializeComponents
6. 在UWorld广播OnActorSpawned消息
7. BeginPlay被调用。

### 延迟生成

1. SpawnActorDefferred：表明生成过程式Actor，允许在Blueprint构造脚本之前添加设置
2. SpawnActor中所有产生的步骤都发生，但在PostActorCreated之后会发生：
   1. 通过有效但不完全的Actor实例，调用系列初始化函数
   2. FinishSpawningActor：在SpawnActor这条线上的ExecuteConstruction处，调用Actor的Finalize。

### 结束

Destroy：在游戏的任意时刻手动调用，表明移除此Actor，但游戏继续。Actor被标记为KILL，并从Level的Actor数组中移除。

EndPlay：在很多地方调用，保证Actor结束。在游戏中，Destroy将触发此函数，同样关卡切换时、流式关卡被卸载也会调用此函数。所有EndPlay的调用位置：

- 显式调用Destroy
- PIE结束
- 关卡切换（无缝旅行或加载地图）
- 包含Actor的流式关卡被卸载
- Actor的lifetime过期
- Application关闭（所有Actor被销毁）

无论怎么样发生，Actor都会被标记为RF_PendingKill，这样在下一个垃圾回收周期会被释放。同样，可手动检测pending kill，考虑使用FwekObjectPtr\<AActor>作为其cleaner。

OnDestroy：这是旧式响应Destroy函数。

### 垃圾回收

当对象标记为析构，垃圾回收将从内存中移除，释放其使用的任意资源。以下是在对象析构中调用的函数：

1. BeginDestroy：释放内存，处理多线程资源（如图形线程代理对象）。
2. IsReadyForFinishDestroy：将决定对象是否已准备释放。当返回False时，此函数将延迟析构直到下一个垃圾收集通过。
3. FinishDestroy：最后，对象被销毁，释放内部数据结构。这是在内存被销毁之前的最后一个调用。



## Replication

多人网络游戏中，用于在游戏世界中同步Actor。属性值和函数调用都可被replicate，允许在所有客户端完全控制游戏状态。

## Destroy

Actor通常不被垃圾回收，World对象保存Actor引用列表。Actor可通过Destroy()函数，显式销毁。这将它们从关卡移除，并标记为pending kill，即挂起，直到下个垃圾回收周期。

