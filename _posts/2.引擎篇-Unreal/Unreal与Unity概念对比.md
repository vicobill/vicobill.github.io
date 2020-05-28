| 类目       | Unity           | UE4                          |
| ---------- | --------------- | ---------------------------- |
| 游戏性类型 | Compoent        | Component                    |
|            | GameObject      | Actor，Pawn                  |
|            | Prefab          | Blueprint Class              |
| 编辑器UI   | Hierarchy       | World Outliner               |
|            | Inspector       | Details                      |
|            | Project         | Content                      |
|            | Scene           | Viewport                     |
| 网格模型   | Mesh            | Static Mesh                  |
|            | Skinned Mesh    | Skeletal Mesh                |
| 材质       | Shader          | Material，Material Editor    |
|            | Material        | Material instance            |
| 特效       | Particle Effect | Effect,Particle,Cascade      |
|            | Shuriken        | Cascade                      |
| 游戏UI     | UI              | UMG（Unreal Motion Graphics) |
| 动画       | Animation       | Skeletal Animation System    |
|            | Mecanim         | Persona,Animation Blueprint  |
| 2D         | 精灵编辑器      | Paper2D                      |
| 编码       | C#              | C++                          |
|            | 脚本            | Blueprint                    |
| 物理       | Raycast         | Line Trace,Shape Trace       |
|            | RigidBody       | Collision,Physics            |
| 运行时平台 | ios,Webplayer   | Platforms                    |



可Spawn到World中的才是Actor，



* 创建对象：

  Unity：Instantiate

  Unreal4: NewObject创建UObject，SpawnActor创建AActor

* 添加组件：

  Unity：AddComponent<>

  Unreal4：CreateDefaultSubobject<>

* 类型转换：

  Unity：as

  Unreal4: Cast<>

* 销毁对象：

  Unity:Destroy

  Unreal4:Actor->Destroy()

* 延时销毁：

  Unity:Destroy(n)

  Unreal4:Actor->SetLifespan(n)

* 禁用对象：

  Unity：SetActive(false)

  Unreal4:SetActorHiddenInGame(true);SetActorEnableCollision(false);SetActorTickEnabled(false)

* 访问组件：

  Unity：GetComponent<>

  Unreal4:FindComponentByClass<>

  

