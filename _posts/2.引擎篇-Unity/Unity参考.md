# Unity开发参考

## Unity基础

* RGB = XYZ
* 资源导入：

| 资源          | 格式                                                         |
| ------------- | ------------------------------------------------------------ |
| 图片          | BMP,TIF,TGA,JPG,PSD.                                         |
| FBX和模型文件 | 也可导入SketchUp文件。3D文件可保存为：.max,.blend,.mb,.ma。当Unity遇到这些文件，会调用基本的导出插件，进行导出为fbx |
| 音频文件      | MP3,ogg,wav,aif/aiff,mod,it,s3m,xm                           |

* 基本内置对象：

| 对象     | 作用                                                         |
| -------- | ------------------------------------------------------------ |
| Cube     | 一个单元大小的立方体，当缩放时，通常用在墙、盒子、梯子、邮箱等类似物体。也可用作游戏开发时的原型物体。因为其为1单元大小，也通常用于比较导入的Mesh在场景中的大小。 |
| Sphere   | 1个单位直径。可以表示球、星球、子弹。半透明的球体，也可以给GUI做出一些特效。 |
| Capsule  | 胶囊体。1个单位直径和2个单元高。通常用于原型开发。如人物角色等。 |
| Cylinder | 圆柱体。2个单位高，1单位直径。非常适合做棒条体、轮子等。     |
| Plane    | 10个单位的xz轴平面。适合做平整表面，如地板、墙等。平面有时也用于显示图片或GUI中的Movie，或特效。 |
| Quad     | 1单位的xy轴平面。Quad只有2个三角形，但Plane有200个三角形。非常适合用于显示图片或movie。简单的GUI或显示信息、粒子、精灵、远景（伪装）对象等。 |

* Unity包：

AssetPackage：AssetStore上提供的包，可供分享和重复使用的Unity项目和资源集合。如同zip文件，保留原有目录结构和meta数据。

UnityPackage：可导入大部分范围的资源，包括插件。



* Unity工具栏：

位置：

	Pivot：Gizmo对应于Mesh的枢轴位置。
	
	Center：Gizmo对应于对象的渲染框中点。

旋转：

	Local: Gizmo的旋转相对于对象。
	
	Global: Gizmo clamp到世界空间

Snapping（瞬拉）

表面：Move或Transform工具，按下Shift+Ctrl

Look-at旋转：Rotate或Transform工具，按下Shit+Ctrl

Vertex：选中Mesh，选择Move或Transform工具；按下V键；移动鼠标；按下Shift+V

屏幕空间的Transform：选中Transform工具，按着Shift键，此时所作的任意变换都是基于屏幕而非场景。



Gizmo可以设定Icon；自定绘制（OnDrawGizmos）；自定绘制选中的对象（OnDrawGizmoSelected）

Inspector可以给游GameObject或Script设置Icon；



## Unity快捷键

工具：

| 键       | 命令                               |
| -------- | ---------------------------------- |
| Q        | pan 爿移                           |
| W        | move 移动                          |
| E        | Rotate 旋转                        |
| R        | Scale 缩放                         |
| T        | Rect Tool 矩形工具                 |
| Z        | Pivot Mode Toggle 枢轴模式切换     |
| X        | Pivot Rotation Toggle 枢轴旋转切换 |
| V        | vertex snap 顶点瞬拉               |
| Ctrl+ LB | Snap 瞬拉                          |

GameObject：

| 键               | 命令                         |
| ---------------- | ---------------------------- |
| Ctrl + Shift + N | 新建空GameObject             |
| Alt+Shift+N      | 新建当前选中的空的子对象     |
| Ctrl+Alt+F       | 移到视图中央                 |
| Ctrl+Shift+F     | 对齐到当前视图               |
| Shift+F / F+F    | 将视图摄像机锁定到选中对象处 |

窗口：Ctrl + 数字分别对应：场景、游戏、检视、层级、项目、动画、剖析、资源商店、版本控制等窗口。

Ctrl+Shift+C : Console等窗口。

编辑

| 键           | 命令           |
| ------------ | -------------- |
| Ctrl+Z       | Undo           |
| Ctrl+Y       | Redo           |
| Ctrl+X       | Cut            |
| Ctrl+C       | Copy           |
| Ctrl+V       | Paste          |
| Ctrl+D       | Duplicate 克隆 |
| Shift+Del    | 删除           |
| F            | 帧选择         |
| Ctrl+F       | 查找           |
| Ctrl+A       | 选中所有       |
| Ctrl+P       | 播放           |
| Ctrl+Shift+P | 暂停           |
| Ctrl+Alt+P   | 逐步播放       |

Ctrl+R 刷新资源

Animation：

| 键           | 操作         |
| ------------ | ------------ |
| Shift+,      | 第一关键帧   |
| Shift+K      | Key改变      |
| K            | 选择Key      |
| Shift+Period | 最后关键帧   |
| Period       | 下一帧       |
| Alt+Period   | 下一关键帧   |
| Space        | 播放动画     |
| ，           | 前一帧       |
| Alt+,        | 前一个关键帧 |



## Unity GamePlay 概念：

* Scene

  场景包含游戏的环境和菜单。场景也是独立的关卡。你可以放置环境、障碍物、装饰物、基础设计并将游戏分片构建。

* GameObject

  游戏中的每个对象都是GameObject，从角色和可搜集物品到光源、摄像机、特效等。可是GameObject自身不做任何事情，当它称为角色、环境、特效之前，你需要给与它属性。以此，你需要给它添加Component。你添加不同的组件，得到的对象也不同。它们是组件容器，由组件完成真正的功能。例如，光对象，是添加了Light组件的GameObject。Cube存在一个MeshFilter和MeshRenderer组件，以渲染表面，以及一个BoxCollider组件，以表示其物理体。GameObject总是有一个Transform组件且不可删除。

* Component

  每个对象都有一个Transform组件，也是GameObject的父节点概念的重要部分。当创建一个脚本附加到GameObject时，它也如内建Component一样显示在Inspector中。

游戏对象可以通过activeSelf使自己失活。当父对象deactive时，其自身和所有子对象都会deactive（但子对象的activeSelf属性不变）。可以使用activeInHierarchy属性，同时改变所有子对象的activeSelf属性。

* Tag

  是可分配到对象的引用词。用于在脚本中分辨对象。也可用于Collider控制的脚本中，如player是和敌人、道具、或可搜集对象交互等。可通过GameObject.FindWithTag()函数查找。

* 静态对象

  在游戏优化中，对象在游玩中是静态的，通常可以被预计算。多个静态对象，可优化渲染成单个、大的对象，即批次（batch）。可在Inspector中勾选Static选项。

* Prefab

  保存完整的GameObject（包括组件和属性）。Prefab似模版，可在场景中创建新的实例。对于Prefab的修改将直接影响到所有的实例上。

* 实时创建Prefab(Instantiate)

  Prefab可以被重复使用，也以实时增删组件。

输入：

	可以在InputManager中创建虚拟轴和按钮。在脚本中，所有虚拟轴都通过名称创建。在所有项目中，都有默认创建的几个虚拟轴：

| 轴                             | 作用                            |
| ------------------------------ | ------------------------------- |
| Horizontal,Vertical            | 映射到w,a,s,d和上、下、左、右键 |
| Fire1,Fire2,Fire3              | 对应于Ctrl,Alt,Cmd              |
| Mouse X,Mouse Y                | 对应于鼠标移动量                |
| Windows Shake X,Window Shake Y | 对应于窗口的移动                |

	可以通过Edit-Project Settings-Input添加新的虚拟轴。
	
	脚本中可以通过Input.GetAxis("Horizontal")获取虚拟轴的值。
按键命名方式：普通的，“a”,"b"等，数字:“1”，“2”，方向：up,down,left,right,小键盘：[1],[2],[+],[equals];控制键：right shift,left ctrl,right cmd..., 鼠标按键：mouse 0, mouse 1... 

摇杆按键：joystick button 0, joystick button 1...

特殊键： backspace ,tab, return ,escapee,space, delete, enter, insert, home, end, page up ,page down

功能键：f1,f2,f3等

获取方式：Input.GetKey("[+]");



移动平台的键盘：

使用TouchScreenKeyboard.Open()函数打开键盘。



旋转：

欧拉角：人类可读可理解的3个角度X为俯仰角度，Y为左右旋转角度，Z为倾斜角度。可以旋转超过180度的角度。但容易出现万向节锁（通过旋转3个轴，Y轴与Z轴同心时，此时旋转Z或Y轴，都只能改变倾斜角而不可再改变俯仰角度）当依次执行3个旋转时，可能第一、二个旋转结果，在第三轴上与之前轴有相同的方向。这意味着自由角度丢失了，因为第三个旋转的值，不能通过单轴进行应用。

四元组：它们 不代表角度或轴，所以不可直接修改。四元组可表示朝向或旋转。四元组旋转的意义是从origin量到identity，所以不可表示超过180度的旋转。在Unity内部，所有的旋转都用四元组表示。但在Inspector中，使用欧拉角以便于编辑。

四元组中的欧拉角度操作：从四元组中读取欧拉角度再应用回去，是不可能得到正确结果的。

| 函数                  | 意义 |
| --------------------- | ---- |
| LookRotation          |      |
| AngleAxis             |      |
| FromToRotation        |      |
| 操作：                |      |
| Slerp                 |      |
| Inverse               |      |
| RotateTowards         |      |
| Rotate / RotateAround |      |

正确使用欧拉角度脚本示例：

```c#
float x;
void Update() {
     x += Time.deltaTime * 10;
    transform.rotation = Quaternion.Euler(x,0,0);
}
```

光：是场景中最基本的部分。Mesh和Texture定义形状和外观，光定义3D环境的颜色和情感。一个场景中可能不止一个光。Unity支持RenderingPath.这些路径影响光和影。

摄像机：在Unity中用于向玩家呈现游戏世界。在一个场景中也可以存在不止1个摄像机，多摄像机可提供多玩家分屏或创建高级特殊效果。你可以让摄像机动起来，或用物理控制他们。

创建随机游戏元素：使用Random类。

跨平台：Input.GetAxis可以通用于键盘和摇杆，但无法应用至移动端touch输入。Input.GetMouseButtonXXX函数，可用于移动设备，即使它们没有mouse。Input.mousePosition可指示touch位置。



发布构建：每个场景都有对应的索引值，可通过脚本：SceneManager.LoadScene函数加载场景。

在发布中，所有标记为EditorOnly的对象，都不会发布。当新场景加载时，前一个关卡的所有对象都被销毁。可使用DontDestroyOnLoad()到对象上，以避免销毁。使用SceneManager.sceneLoaded在新关卡加载完毕后，给所有active的游戏对象发送消息。



unity的Network模拟器，只改变Network和NetworkView类，不会改变使用.Net socket的网络代码。



运行时加载资源：

* AssetBundle：外部资源集合。可通过BuildPipeline.BuildAssetBundles()构建AssetBundle，通过AssetBundle.LoadAsset()实时加载。AssetBundle.Unload()卸载。
  * AssetBundle创建：
    1. 从Project视图中选中资源
    2. 在Inspector最底部，可见AssetBundles块。
    3. 可创建AssetBundle资源。
* Resource文件夹。是内建在Unity中的资源，但不必关联至任何游戏对象。当需要用到资源时，可以通过Resources.Load()进行加载。Resource文件夹的内容都会存储在resources.assets文件中，如果在其他场景中被使用，则会存储在.sharedAssets文件中。可通过Resources.UnloadUnusedAssets()卸载资源。



插件：在Unity，可使用脚本创建功能，也可以通过插件在Unity外部添加功能。Unity支持两种插件：托管插件和本地插件。

托管插件：通过.Net汇编管理。

本地插件：平台特定的本地代码库。

支持的插件文件后缀：.dll,.winmd,.so,.jar,.aar,.xex,.def,.suprx,.prx,.sprx,.rpl,.cpp,.cc,.c,.h,.jslib,.jspre,.bc,.a,.m,.mm,.swift,.xlib.

对应托管插件：可通过using DLLName直接导入。对于本地插件，可通过[DllImport("DllName")]导入。

C++的dll存在name mangling,所以，如果需要导出并使用，使用c linkage声明。

底层本地插件接口：插件需要导出UnityPluginLoad和UnityPluginUnload函数@see IUnityInterface.h。



在Assets目录下，创建Editor目录，将以下代码放入目录：

``` C#
using UnityEditor;

public class CreateAssetBundles
{
    [MenuItem("Assets/Build AssetBundles")]
    static void BuildAllAssetBundles()
    {
        string assetBundleDirectory = "Assets/AssetBundles";
        if(!Directory.Exists(assetBundleDirectory))
{
    Directory.CreateDirectory(assetBundleDirectory);
}
BuildPipeline.BuildAssetBundles(assetBundleDirectory, BuildAssetBundleOptions.None, BuildTarget.StandaloneWindows);
    }
}
```

加载AssetBundle：

* 加载本地资源：

  ``` C#
  public class LoadFromFileExample extends MonoBehaviour {
      function Start() {
          var myLoadedAssetBundle = AssetBundle.LoadFromFile(Path.Combine(Application.streamingAssetsPath, "myassetBundle"));
          if (myLoadedAssetBundle == null) {
              Debug.Log("Failed to load AssetBundle!");
              return;
          }
          var prefab = myLoadedAssetBundle.LoadAsset.<GameObject>("MyObject");
          Instantiate(prefab);
      }
  }
  ```

* 加载网络资源：

  ```c#
  IEnumerator InstantiateObject()
  
      {
          string uri = "file:///" + Application.dataPath + "/AssetBundles/" + assetBundleName;        
          UnityEngine.Networking.UnityWebRequest request = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(uri, 0);
          yield return request.Send();
          AssetBundle bundle = DownloadHandlerAssetBundle.GetContent(request);
          GameObject cube = bundle.LoadAsset<GameObject>("Cube");
          GameObject sprite = bundle.LoadAsset<GameObject>("Sprite");
          Instantiate(cube);
          Instantiate(sprite);
      }
  ```


Social API:社交平台。需要导入UnityEngine.SocialPlatforms.通过Social类进行处理。

Json：使用它JsonUtility.ToJson/FromJson 来导出导入Json。支持所有MonoBehaviour和ScriptableObject子类，或标记为[Serializable]的原生类或结构体。



AssetDatabase可以访问在项目中包含的资源。、



场景文件也可通过text形式进行存储，以便于多人协作。





编辑器扩展：可以继承EditorWindow。



## Unity2D

Sprite：unity提供Sprite Creator,Sprite Editor,Sprite Renderer,Sprite Packer.

Tilemap:可以通过网格快速创建2D关卡。

物理：包括Collider，Physic Material，Effector等。

# 图形

图形内容包括：光照、摄像机、材质、着色器&纹理、粒子&可视效果以及其他。

## 光

Unity中的光，默认都是实时的。实时光照用于点亮角色或其他可移动的几何体。但是，Unity的光线被它们自己使用时不会反弹。为了创建更真实的场景，如全局照明，我们需要启用Unity预计算光解决方案。

光照技术：

* 实时光照：表示，投出直接光到场景中，并每帧更新。当光和GameObject移动时，光照会立即改变。

* 烘焙光图：Unity可以计算复杂的静态光效（GI）并将它们存在称为lightmap的纹理图中，此计算过程称为烘焙。lightmap可以包含直接光照和间接光照（其他物体反弹的光）。这些光贴图可以一起使用，由shader使用其表面信息如颜色（反射率）和浮雕（法线），通过其关联的material。烘焙后的光照，在游戏中无法改变。实时光照可以通过复合lightmap，但不可直接修改lightmap自身。
* 预计算实时全局照明：静态光图在场景中不变，预计算GI提供了更新复杂交互式光的技巧。这可以创建环境特性丰富的全局照明，通过实时反映反弹的光，使光照改变。例如timeofday，光的颜色和位置发生改变，如果以烘焙光图则无法做到。

| 类型     | 作用                                                         |
| -------- | ------------------------------------------------------------ |
| 点光     | 有限发散光。可模拟萤火或场景中火花或爆炸照明等               |
| 聚光     | 锥形发散光。通常用于人造光如：闪光，汽车灯，探照灯等。       |
| 平光     | 主要用于营造太阳光。                                         |
| 域光     | 一个发光矩形，只朝一个方向。只能烘焙至lightmap中，在实时中不可用。 |
| 放射材质 | 如同域光，它们贡献了反弹光。软效果的放射材质可实时使用。     |
| 氛围光   | 不从任何物体而来，可让场景看起来光亮一点。氛围光通常用于风格化艺术氛围营造。 |

实时光照都是光组件。GI可以用Baked或Realtime。通过Window-Lighting-Settings设置。全局照明的核心是光如何从一个表面反弹至另外一个表面。



Lighting窗口是Unity的GI主控制点。光决定了对象的阴影着色。

Cookie用于丛林透光、窗户透光等，它是原纹理，但alpha通道被改变。当导入cookie时，Unity提供选项用于设置图片的alpha值。

阴影：阴影通常使用Shadow Map（阴影贴图）和Bias技术，当场景渲染至摄像机视图中时，每个像素位置都会转换到光的坐标空间。像素离光的位置，将会通过shadow map比较。如果像素离shadow map中的像素太远，它将被遮挡而且没有照明。Bias用于羽化边光。当Normal Bias设置太高，阴影区域则看起来小。Bias太高，则阴影看似偏离了GameObject。



定向光通常模拟太阳光，可以照亮整个场景。Shadow Map通常同时覆盖大部分场景，这使得锯齿问题严重，意味着靠近摄像机的阴影贴图像素更大更粗糙。当然，如果使用高分辨率的阴影贴图，锯齿不太明显，但会增加硬件要求。这是由于光投射的阴影的视椎体效果，使得阴影贴图进行了不成比例的缩放。Shadow Cascade（阴影级联）的产生，可以通过阴影贴图大小，分阶段缩减，也称为平行分割阴影贴图。使用的级联越多，锯齿印象的阴影就越少，但也会带来消耗。通常搭配Shadow距离，因为距离远的物体，很少受关注，可根据远近提高渲染效率。



## 摄像机

## 材质，着色器和纹理

## 视频

## 地形引擎

## 树木编辑器

## 粒子系统

## 后期处理

## 反射探头

## 高级渲染特性

## 过程式材质

## 过程式网格几何体

## 优化图形性能

## 层

# 物理系统

## 常用物理组件：

| 组件                 | 作用                                                         |
| -------------------- | ------------------------------------------------------------ |
| RigidBody            | 主要的物理组件，用于启用物体的物理行为。RigidBody在加上后，立即受重力作用。对于附加了RigidBody的对象，无需通过脚本改变其位置或旋转，只需要给予一定的力（Force)即可，物理系统会进行模拟。也有很多情况是直接通过脚本控制，而不需要物理模拟的情况，如此则需要将RigidBody设为Kinematic可将RigidBody从物理引擎中移除。<br />当RigidBody的速度小于最小直线或旋转速度，则会被认定为停止（Sleep)，如果需要再次动起来，需要WakeUp。 |
| Collider             | 定义对象的物理碰撞形状。不可见，也无需和对象相同大小。<br />通常可以设置其PhysicsMaterial如：摩擦力和弹力。Trigger是可穿过的，不会产生固体碰撞。<br />静态Collider会与射来的RigidBody进行碰撞，但自身不会改变。物理引擎假设静态碰撞体不会变化，以此进行优化。<br />Rigidbody碰撞体会在物理引擎中完整模拟。并对力和碰撞作出反应。<br />Kinematic刚体碰撞器可通过脚本变换，如：滑动门。不同于静态碰撞器，它们会应用摩擦力到其他对象上，并唤醒碰撞到的刚体。通过设置IsKinematic，通常用于：布娃娃。 |
| Joint                | 可将刚体附着到其他刚体或空间上的点。                         |
| Character Controller | 角色移动通常非真实物理，它会中途转向、停止等。不需要刚体。   |
| ConstantForce        | 恒力。如果不想给物体比较大的初始速度，但可以给予加速度时，可选用此。<br />如果使用向上，添加Y轴Force；如果前飞，Z轴添加Relative Force。<br />通常和RigidBody里的Drag配合使用。Drag越大，最终速度越小。 |
| Cloth                | 使用SkinnedMeshRender，模拟纤维织物的物理。如果给非SkinnedMesh添加Cloth，将会移除非SkinnedMesh，添加一个SkinnedMesh。 |

Collider种类：

| Collider             | 作用                                                         |
| -------------------- | ------------------------------------------------------------ |
| Box                  | 简单方体碰撞体                                               |
| Capsule              | 胶囊体                                                       |
| Character Controller | 无需Rigidbody，控制角色物理碰撞。                            |
| Mesh                 | 与网格相同的碰撞体，只有凸面体才能发生碰撞。                 |
| Sphere               | 球体                                                         |
| Wheel                | 用于模拟触地交通工具。具有内置碰撞检测、滚轮物理，以及基于滑动的轮胎摩擦模型。 |
| Terrain              | 实现碰撞表面                                                 |

Joint种类：

| Joint        | 作用                                           |
| ------------ | ---------------------------------------------- |
| Character    | 主要用于纸娃娃效果。                           |
| Configurable | 可自定                                         |
| Fixed        | 固定位置关系                                   |
| Spring       | 弹簧，让它们如弹簧连接着运动。                 |
| Hinge        | 铰链类，将两个刚体作为一组，如门，钟摆、链子等 |
|              |                                                |

* PhysicMaterial： 摩擦力[0,1],弹力[0-1]

## Ragdoll

Ragdoll使用SkinnedMesh，这是在3D应用中制作的，受骨骼操纵的角色Mesh。所以需要在maya或Cinema4D等软件中创建ragdoll角色。



# 脚本系统

脚本通过继承自MonoBehaviour与Unity内部联系。可将类当做蓝图，用于创建新的组件，并可附加到GameObject。当添加脚本组件到GameObject，将会创建通过蓝图定义对象的实例。附加到GameObject的脚本组件，其名称与文件名必须保持一致。

物体的初始化放在Start而非构造函数中，因为物体的构造是由编辑器处理，在游戏开始前不会存在。

访问组件通过GetComponent\<T\>形式获取。使用其他脚本组件，也可通过此方式。如果定义了public 组件的变量，可以拖放任意包含此组件的GameObject，如此可直接访问组件，而非GameObject。

消息/事件型函数，由Unity调用。

在游戏中，帧率是受CPU影响的，Update事件是每帧执行，会相应受到影响。在移动中，最好与Time.deltaTime进行计算。这样帧率改变时，移动步幅将会改变，但对象的速度将会恒定。物理的模拟是通过fixedTime进行更新。如果需要实现子弹时间这种特殊的效果，可以使用timeScale。如果要截屏，可以使用captureFramerate。

在Unity中，对于函数调用会在单帧内完成，当实现：图片逐渐消失这种功能时，如果采用循环，图片将会立即消失。此时可采用Coroutine。Coroutine的作用：暂停执行并返回控制权给Unity，然后在下一帧再继续执行。默认Coroutine将会在下一帧运行，但也可通过延时调用：yield return new WaitForSeconds(2.3f);延时调用可以减少消耗。

## Unity事件函数执行顺序

* 当第一个场景加载时：将会调用场景内的所有物体的：
  1. Awake
  2. OnEnable
  3. OnLevelWasLoaded

* 第一帧update前：Start
* 帧之间：OnApplicationPause
* 更新顺序：
  1. FixedUpdate：通常比Update调用的更频繁。它能在一帧内执行多次。
  2. Update：每帧更新
  3. LateUpdate：每帧更新，在Update完成后执行。
* 渲染：
  1. OnPreCull:摄像机Cull场景之前。决定某些物体能在Camera中显示。
  2. OnBecameVisible/Invisible: 当物体在摄像机消失或出现
  3. OnWillRenderObject:物体如果可见，每Camera调用一次。
  4. OnPreRender:在摄像机渲染场景之前
  5. OnRenderObject: 在常规场景渲染完成后，可使用GL类或Graphics.DrawMeshNow绘制自定义的几何体
  6. OnPostRender:结束渲染场景后
  7. OnRenderImage: 场景渲染接触，允许对图像进行后期处理。
  8. OnGUI:每帧多次反馈GUI事件。Layout和Rapaint事件最先处理，接着是layout和Input事件。
  9. OnDrawGizmos：用于绘制Gizmo用作可视化目的
* Coroutines：通常在Update函数返回后执行。
  1. yield: 所有Update函数在下一帧执行后。
  2. yield WaitForSeconds: 在所有Update之后，延迟一段时间
  3. yield WaitForFixedUpdate: 在FixedUpdate执行后
  4. yield WWW: 在WWW下载完成后
  5. yield StartCoroutine: 链式调用Coroutine
* 当对象被销毁：OnDestroy：对象存在的最后一帧帧更新完毕后。
* 当退出时：
  1. OnApplicationQuit: 在游戏退出前。在Editor退出playmode前。
  2. OnDIsable：当behaviour变成diabled或inactive。

![MonoBehaviour完整生命周期](./monobehaviour_flowchart.svg)

## 特殊文件夹和脚本编译顺序：

Unity有一些预留的项目目录名称以指示特殊用途的内容。

Assets，Editor，Gizmos，Plugins，Resources，Standard Assets，StreamingAssets.

编译顺序：

 	1. 运行时脚本：Standard Assets，ProStandardAssets，Plugins
 	2. 编辑器脚本：Editor以及StandardAssets，Standard Assets，ProStandardAssets，Plugins
 	3. 其他所有不在Editor目录的脚本
 	4. 其他剩余的脚本

## 脚本序列化

自动处理数据结构或对象状态转换到Unity能存储和重新构建的格式。Unity使用序列化以加载和保存场景、Assets、AssetBundle。

序列化规则：序列化在实时游戏环境中运行。

确保脚本字段被序列化：

* public，或有SerializeField属性
* 不是static
* 不是const
* 不是readonly
* 有可被序列化的fieldtype
  * Serializable属性描述的自定非抽象、非泛型的类；
  * Serializable属性描述的自定struct
  * 从UnityEngine.Object派生的对象引用
  * 基本数据类型：int,float,double,bool,string等
  * enum
  * unity内部类型：Vector2,Vector3,Vector4,Rect,Quaternion,Matrix4x4,Color,Color32,LayerMask,AnimationCurve,Gradiant,RectOffset,GUIStyle
* 简单的数组
* List\<T\>

## UnityEvent

允许用户驱动的Callback，而无需添加额外的编码和脚本配置。

UnityEvent的用处：

 * 内容驱动的callback
 * 系统解耦
 * 持久化的callback
 * 预配置的调用事件

## 重要的类：

| 类            | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| MonoBehaviour | 所有新Unity脚本的基类。提供附加到GameObject的所有函数和事件。 |
| Transform     | 提供空间位置、旋转、缩放信息，以及移动、旋转、变换等功能，也包含坐标转换功能。 |
| Rigidbody     | 物理刚体，提供移动、触发器、碰撞、应用力等。                 |
| Vector        | 矢量相加：第一个表示点，第二个表示offset，可以得到最终结果，如找到地面上某点上方距离5个单位的点：a + new Vector(0,5,0);用在力上面，表示两个力的合力。<br />减法：通常用于获取两个对象的方向和距离。注意，有先后。<br />与scalar相乘，是对大小进行缩放，但不改变方向。在vector表示移动偏移或力时很有用。<br />点乘：得到两矢量的cos夹角。<br />叉乘：得到与两矢量垂直的矢量。 |
|               |                                                              |

## EventSystem

在游戏中发送事件给对象。当给GameObject添加EventSystem组件，需要注意它不会有很多功能暴露，因为EventSystem自身设计为管理器，用于与EventSystem模块之间联系。EventSystem的主要角色：

* 管理哪个GameObject被考虑已选中
* 管理哪个Input模块被使用
* 管理Raycasting
* 更新所有Input模块。

Input模块在EventSystem中启用一个，而且必须是某个作为EventSystem的GameObject的组件。Input模块的主要用途：

* 处理输入

* 管理事件状态

* 发送事件给场景对象。


# 网络系统

有两种网络特性：

* 用户在Unity内创建多人游戏。使用NetworkManager或高级API
* 用户创建网络基础设施或高级多人游戏。使用NetworkTransport API

高级脚本API：可以专注逻辑，而不用关注底层实现细节：

* 通过Network管理器控制游戏的网络化状态
* 操纵客户端Host的游戏，Host也是客户端
* 序列化数据
* 发送和接受网络消息
* 从客户端发送网络化的命令到服务器
* 从服务器引发RPC给客户端
* 从服务器发送网络化的事件给客户端

Unity的网络集成至引擎和Editor，允许通过组件和可视化辅助构建多人游戏，它提供：

* NetworkIdentity组件，用于网络化的对象
* NetworkBehaviour，用于网络化脚本
* 配置自动同步对象的transform
* 自动同步脚本变量
* 支持放置网络化对象到Unity场景
* Network组件。

网络服务：

* 匹配服务
* 创建比赛以及比赛建议
* 列出可用的比赛，以及加入比赛
* 转播服务器
* 无专有服务器形式的Gameplay
* 路由比赛的消息

也包含实时运输层：

* 优化的基于UDP协议
* 多通道设计，以避免head-of-line阻塞问题
* 支持每通道的Qos
* 灵活的网络拓扑，p2p-cs架构。

unity通过NetworkManager组件封装了管理多人游戏的所有特性。如果默认的NetworkManager没有涉及到必须的功能，可以编写自定的NetworkManager.

对于创建游戏、寻找Hosts等UI界面，Unity提供了默认的NetworkManagerHUD，提供默认、简单的GUI。但是记住，它非常非常基础，并且不那么炫酷。

## NetworkManager

提供的特性：

* 游戏状态管理
* 刷出管理
* 场景管理
* 调试信息
* Matchmaking
* 自定义 

每个场景都需要有一个活动的Network Manager，不要将NetworkManager组件给一个网络化的GameObject（有NetworkIdentity组件）。

NetworkManager是多人游戏中核心控制组件。使用：在开始场景中创建新的GameObject，添加NetworkManager组件。在Inspector中可以设置和控制网络相关。网络多人游戏可以运行在三种模式下：客户端；专用服务器；Host（既是客户端又是服务器）。NetworkManager.StartClient/StartServer/StartHost;无论某种，都需设置网络地址和网络端口。当在客户端模式，游戏尝试连接此网络地址和接口。当在服务器或Host模式，游戏侦听此端口。在开发过程中，使用固定地址和端口很有用。可是通常你希望玩家选择连接的Host，当到此阶段时，NetworkDiscoverty组件可用于广播和查找LAN的地址和端口，Matchmaker服务可以用于查找网络比赛。可食用NetworkManager管理从Prefab刷出网络化GameObject。大多数游戏有代表玩家的Prefab，所以NetworkManager有一个Player Prefab槽。当你设置了Player Prefab，游戏中的用户将会自动以此刷出玩家GameObject。这会应用到host服务器的本地Player、远程客户端的远程玩家。你必须添加NetworkIdentity组件到你的Player Prefab。分配PlayerPrefab后，可以host开始游戏然后看到刷出的GameObject。停止游戏将会销毁Player GameObject。你可以指定RegisteredSpawnablePrefabs用以在游戏中动态刷出的其他GameObject，也可以通过脚本ClientState.RegisterPrefab()指定。NetworkManager使用NetworkManager.OnServerAddPlayer()刷出玩家GameObject。如果希望自定，可重载此函数，重载时，必需调用NetworkServer.AddPlayerForConnection()与客户端连接产生关联，此函数还刷出GameObject，所以不需要使用NetworkServer.Spawn().NetworkStartPoint组件可设置玩家的刷出点。在场景中可以添加任意个刷出点。NetworkManager将会探测场景中的所有刷出点。NetworkManager也有PlayerSpawnMethod属性，这可以允许你选择刷出点：1. 选择Random将会随机选择刷出点 2. RoundRobin将会循环选择。如果此两种不适合你的游戏，可以在OnServerAddPlayer实现中，通过NetworkManager.startPositions 和GetStartPosition()函数实现自定刷出逻辑。

### 场景管理

许多游戏有多于1个场景。而且附加title screen或开始菜单场景，NetworkManager被设计为自动管理场景状态和场景过渡。Offline和Online场景激活网络化场景管理。当主机或服务器开始，Online场景被加载，此场景接着会称为当前网络场景，任意连接到此服务器的客户端被指定加载此场景。此场景的名称存储在networkSceneName属性中。当网络停止或停止服务器或主机或客户端断开连接，Offline场景将被加载。这允许游戏在丢失连接时自动返回到Menu场景。你也可以通过NetworkManager.ServerChangeScene()切换场景，这将会使所有连接的客户端切换到指定场景，并更新networkSceneName由此新客户端也会加载新场景。当网络化场景管理被激活，所有调用游戏状态管理的函数如NetworkManager.StartHost()或NetworkManager.StopClient将会引发场景切换。这应用到实时控制UI。通过设置场景和调用这些方法，你可以控制多人游戏的流程。要注意：场景切换将会销毁前一场景的所有游戏对象。[Unity网络部分的实现代码可访问](https://bitbucket.org/Unity-Technologies/networking)

# 音频系统



# 动画系统



# UI系统



# AI寻路



# Unity服务



# XR



# 平台特定





## Unity工作流程



* 通常流程：1. 改变游戏中的一些东西 2. 测试这些改变。然后重复这个过程。

* 游戏中的对象脚本通常放在最上层的父GameObject上。这样在其他人协作时，能快速定位脚本的使用依赖。
* RigidBody会受重力影响，在Unity中默认是有物理模拟的。

事件可使用UnityEvent和UnityAction。