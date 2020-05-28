* 光：Mesh和Texture定义场景中的形状和样貌，光定义3D环境的颜色和情感。
* 相机：用于向玩家展示游戏世界。在Unity中，可以有多个相机。
* 特殊文件夹：Resources-资源动态加载；Plugins-插件
* 当构建plugins时，一定要避免name mangling。使用extern "C" {}
* AssetBundle是包含平台特定资源（Models,Prefabs,AudioClips,完整Scenes）等的归档文件，可以在运行时加载。可用于DLC(Downloadable Content)，以减少初始安装包大小加载终端平台优化资源，减少运行时内存压力等。
* ScriptableObject是Unity内部可配置的大量数据。
* 游戏编程中关键概念是：渲染每帧之前改变游戏对象位置、状态和行为。
* FixedUpdate是以固定频率更新。Update是每帧之前更新。
* 游戏帧率不是恒定的，Update函数调用之间的时间间隔也是不定的。如果需要按恒定帧率调用，应按照时间而变（Time.deltaTime）。timeScale可改变时间，但并非真正改变执行速度，而是改变Time.deltaTime,Time.fixedDeltaTime。
* 禁用MonoBehaviour时，协程不会停止，只有明确销毁后才会停止。
* 数组是引用类型。
* 可以通过Assets/mcs.rsp 定义宏：`-defing:UNITY_DEBUG`
* 可序列化：
  * public，或SerialzeField
  * 不是static
  * 不是const
  * 不是readonly
  * 具有Serializable属性
  * 不是抽象的
  * 不是static
  * 非泛型