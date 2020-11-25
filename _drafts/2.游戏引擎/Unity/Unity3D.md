# Unity3D
只使用LTS版本，不要图新。

## 协程

Unity3D协程通过IEnumerator实现。

``` c#
// 这里是直接在Start函数中，无需显式调用StartCoroutine
IEnumerator Start() {
    WWW www = new WWW(url);
    // 这里将会执行协程，直到协程完成，接着执行下面的代码
    // 返回的是一个YieldInstruction
    // YieldInstruction是让权指令，在帧完成之后执行。
    yield return www; 
    
    renderer.material.materialTexture = www.texture;
}
```

StartCoroutine开始运行一个协程函数。通常直接调用一个协程函数是不会被执行的，只能通过StartCoroutine。

IEnumerator有2个函数：bool MoveNext(),void Reset(),和一个字段：Current.

``` c#
static void Main() {
    foreach(var x in GetEnumTest()){
        Console.WriteLine(x)
    }
}
static IEnumerable<string> GetEnumTest() {
    yield return "begin"; 	
    for (int i = 0; i < 5; ++i) {
        yield return i.ToString();
    }
    yield return "end";
}
```

当调用Main函数时，会获取迭代器内容，此时碰到第一个yield，GetEnumTest()函数让出执行权，Main继续执行。当foreach继续下次迭代时，进入GetEnumTest()函数，从上次让权地方继续执行：GetEnumTest()中的for循环得以继续执行。



## 常用

1. 发布时，固定分辨率： buildsetting->defaullt is native resolution 去掉勾选。
2. 播放影片：MovieTexture。能使用的视频格式有：mov,mpg,mpeg,mp4,avi等。

* 启用unsafe: 在Assets目录下新建mcs.rsp/smcs.rsp/gmcs.rsp，添加`-unsafe`保存即可。
* 4.x->5.x:
* Unity默认persistentDataPath => window:%appdata%localLow/公司名/产品名/
* 在脚本中直接修改读取Quaternion的欧拉角是有问题的，每个新的Quaternion都会产生非常不同的欧拉角。



## # 快捷键

* 工具：

  | 键      | 作用         |
  | ------- | ------------ |
  | Q       | 扳动         |
  | W       | 移动         |
  | E       | 旋转         |
  | R       | 缩放         |
  | T       | 矩形工具     |
  | Z       | 重心模式切换 |
  | X       | 重心旋转切换 |
  | V       | 顶点瞬拉     |
  | Ctl-Lmb | 瞬拉         |

* GameObject：

  | 键          | 作用                         |
  | ----------- | ---------------------------- |
  | Ctl-Shf-N   | 新建空对象                   |
  | Alt-Shf-N   | 新建选中对象的空子对象       |
  | Ctl-Alt-F   | 移至view                     |
  | Ctl-Shf-F   | 对齐至view                   |
  | Shf-F / F-F | 将场景view相机锁定至选中对象 |

* 编辑：

  | 键        | 作用           |
  | --------- | -------------- |
  | Ctl-Z     | 撤销           |
  | Ctl-Y     | 重做           |
  | Ctl-X     | 剪切           |
  | Ctl-C     | 复制           |
  | Ctl-V     | 粘贴           |
  | Ctl-D     | 原样复制       |
  | Shf-Del   | 移除           |
  | F         | 帧（正中）选择 |
  | Ctl-F     | 查找           |
  | Ctl-A     | 选择所有       |
  | Ctl-P     | 播放           |
  | Ctl-Shf-P | 暂停           |
  | Ctl-Alt-P | 逐步播放       |

* 资源：

  | 键    | 作用 |
  | ----- | ---- |
  | Ctl-R | 刷新 |

* 动画

  | 键    | 作用       |
  | ----- | ---------- |
  | Shf-, | 第一帧     |
  | Shf-K | 已改键     |
  | K     | 选中键     |
  | ,     | 前一帧     |
  | Space | 播放动画   |
  | Alt-, | 前一关键帧 |
  | Shf-. | 最后关键帧 |
  | .     | 下一帧     |
  | Alt-. | 下个关键帧 |

  

# 输入：

## 虚拟轴：

适用于按键和摇杆输入。

- Horizontal和Vertical：对应w,a,s,d和上下左右键
- Fire1,Fire2,Fire3对应：Ctrl,Alt,Cmd键
- Mouse X和Mouse Y对应鼠标移动
- Window Shake X 和Window Shake Y对应窗口移动
- 创建虚拟键盘：TouchScreenKeyboard.Open()





- 运行时创建基础模型：GameObject.CreatePrimitive(PrimitiveType.Cube)

- 当触摸屏幕时，创建Particle：

  ```c#
  void Update() {
      foreach(var touch in Input.touches) {
          var ray = Camera.main.ScreenPointToRay(touch.position);
          if(Physics.Raycast(ray)){
              Instantiate(particle,transform.position,transform.rotation);
          }
      }
  }
  ```

- 打开Mobile Keyboard：`TouchScreenKeyboard.Open()`

- 正确使用欧拉角：

  ```c#
  /*Unity 中，不可直接修改旋转量quternion的分量值；旋转量欧拉角由Quaternion计算得来，直接修改是无效的。正确的方式，是由Quaternion计算得到旋转量，再赋值。
  */
  float x;
  void Update() {
      x += Time.deltaTime * 10;
      transform.rotation = Quaternion.Euler(x,0,0);
  }
  
  ```

- 打乱列表：

  ``` c#
  void Shuffle(int[] deck) {
      for (int i = 0; i < deck.Length; i++) {
          int temp = deck[i];
          int randIndex = Random.Range(0,deck.Length);
          deck[i] = deck[randIndex];
          deck[randIndex] = temp;
      }
  }
  ```

- 随机选择刷怪：

  ``` c#
  Transform[] spawnPoints;
  Transform[] ChooseSet(int numRequired) {
      Transform[] result = new Transform[numRequired];
      
      int numToChoose = numRequired;
      for(int numLeft = spawnPoints.Length; numLeft >0; numLeft--) {
          float prob = (float)(numToChoose) / (float)numLeft;
          if(Random.value <= prob) {
              numToChoose--;
              result[numToChoose] = spawnPoints[numLeft - 1];
              if (numToChoose == 0) break;
          }
      }
  }
  ```

- 随机球半径：`var randWithinRadius = Random.insideUnitSphere * radius;`

- 动态加载资源:Resources目录可以有多个。

  ``` c#
  1. 
      BuildPipeline.BuildAssetBundles();
  	AssetBundle.LoadAsset();
  	AssetBundle.Unload();
  2. Resources.Load();
  	Resources.UnloadUnuesedAssets();
  ```

- Unity使用Native Plugin:

  ``` c#
  [DllImport("PluginName")]
  private static extern float FooPluginFunction();
  ```

- 主要的yieldInstruction：

  | 指令                   | 作用 |
  | ---------------------- | ---- |
  | AsyncOperation         |      |
  | WaitForEndOfFrame      |      |
  | WaitForFixedUpdate     |      |
  | WaitForSeconds         |      |
  | WaitForSecondsRealtime |      |
  | WaitUntil              |      |
  | WaitWhile              |      |

  ## Classes Ordered by ID Number

  | ID       | Class                        |
  | -------- | ---------------------------- |
  | **1**    | GameObject                   |
  | **2**    | Component                    |
  | **3**    | LevelGameManager             |
  | **4**    | Transform                    |
  | **5**    | TimeManager                  |
  | **6**    | GlobalGameManager            |
  | **8**    | Behaviour                    |
  | **9**    | GameManager                  |
  | **11**   | AudioManager                 |
  | **12**   | ParticleAnimator             |
  | **13**   | InputManager                 |
  | **15**   | EllipsoidParticleEmitter     |
  | **17**   | Pipeline                     |
  | **18**   | EditorExtension              |
  | **19**   | Physics2DSettings            |
  | **20**   | Camera                       |
  | **21**   | Material                     |
  | **23**   | MeshRenderer                 |
  | **25**   | Renderer                     |
  | **26**   | ParticleRenderer             |
  | **27**   | Texture                      |
  | **28**   | Texture2D                    |
  | **29**   | SceneSettings                |
  | **30**   | GraphicsSettings             |
  | **33**   | MeshFilter                   |
  | **41**   | OcclusionPortal              |
  | **43**   | Mesh                         |
  | **45**   | Skybox                       |
  | **47**   | QualitySettings              |
  | **48**   | Shader                       |
  | **49**   | TextAsset                    |
  | **50**   | Rigidbody2D                  |
  | **51**   | Physics2DManager             |
  | **53**   | Collider2D                   |
  | **54**   | Rigidbody                    |
  | **55**   | PhysicsManager               |
  | **56**   | Collider                     |
  | **57**   | Joint                        |
  | **58**   | CircleCollider2D             |
  | **59**   | HingeJoint                   |
  | **60**   | PolygonCollider2D            |
  | **61**   | BoxCollider2D                |
  | **62**   | PhysicsMaterial2D            |
  | **64**   | MeshCollider                 |
  | **65**   | BoxCollider                  |
  | **66**   | SpriteCollider2D             |
  | **68**   | EdgeCollider2D               |
  | **72**   | ComputeShader                |
  | **74**   | AnimationClip                |
  | **75**   | ConstantForce                |
  | **76**   | WorldParticleCollider        |
  | **78**   | TagManager                   |
  | **81**   | AudioListener                |
  | **82**   | AudioSource                  |
  | **83**   | AudioClip                    |
  | **84**   | RenderTexture                |
  | **87**   | MeshParticleEmitter          |
  | **88**   | ParticleEmitter              |
  | **89**   | Cubemap                      |
  | **90**   | Avatar                       |
  | **91**   | AnimatorController           |
  | **92**   | GUILayer                     |
  | **93**   | RuntimeAnimatorController    |
  | **94**   | ScriptMapper                 |
  | **95**   | Animator                     |
  | **96**   | TrailRenderer                |
  | **98**   | DelayedCallManager           |
  | **102**  | TextMesh                     |
  | **104**  | RenderSettings               |
  | **108**  | Light                        |
  | **109**  | CGProgram                    |
  | **110**  | BaseAnimationTrack           |
  | **111**  | Animation                    |
  | **114**  | MonoBehaviour                |
  | **115**  | MonoScript                   |
  | **116**  | MonoManager                  |
  | **117**  | Texture3D                    |
  | **118**  | NewAnimationTrack            |
  | **119**  | Projector                    |
  | **120**  | LineRenderer                 |
  | **121**  | Flare                        |
  | **122**  | Halo                         |
  | **123**  | LensFlare                    |
  | **124**  | FlareLayer                   |
  | **125**  | HaloLayer                    |
  | **126**  | NavMeshAreas                 |
  | **127**  | HaloManager                  |
  | **128**  | Font                         |
  | **129**  | PlayerSettings               |
  | **130**  | NamedObject                  |
  | **131**  | GUITexture                   |
  | **132**  | GUIText                      |
  | **133**  | GUIElement                   |
  | **134**  | PhysicMaterial               |
  | **135**  | SphereCollider               |
  | **136**  | CapsuleCollider              |
  | **137**  | SkinnedMeshRenderer          |
  | **138**  | FixedJoint                   |
  | **140**  | RaycastCollider              |
  | **141**  | BuildSettings                |
  | **142**  | AssetBundle                  |
  | **143**  | CharacterController          |
  | **144**  | CharacterJoint               |
  | **145**  | SpringJoint                  |
  | **146**  | WheelCollider                |
  | **147**  | ResourceManager              |
  | **148**  | NetworkView                  |
  | **149**  | NetworkManager               |
  | **150**  | PreloadData                  |
  | **152**  | MovieTexture                 |
  | **153**  | ConfigurableJoint            |
  | **154**  | TerrainCollider              |
  | **155**  | MasterServerInterface        |
  | **156**  | TerrainData                  |
  | **157**  | LightmapSettings             |
  | **158**  | WebCamTexture                |
  | **159**  | EditorSettings               |
  | **160**  | InteractiveCloth             |
  | **161**  | ClothRenderer                |
  | **162**  | EditorUserSettings           |
  | **163**  | SkinnedCloth                 |
  | **164**  | AudioReverbFilter            |
  | **165**  | AudioHighPassFilter          |
  | **166**  | AudioChorusFilter            |
  | **167**  | AudioReverbZone              |
  | **168**  | AudioEchoFilter              |
  | **169**  | AudioLowPassFilter           |
  | **170**  | AudioDistortionFilter        |
  | **171**  | SparseTexture                |
  | **180**  | AudioBehaviour               |
  | **181**  | AudioFilter                  |
  | **182**  | WindZone                     |
  | **183**  | Cloth                        |
  | **184**  | SubstanceArchive             |
  | **185**  | ProceduralMaterial           |
  | **186**  | ProceduralTexture            |
  | **191**  | OffMeshLink                  |
  | **192**  | OcclusionArea                |
  | **193**  | Tree                         |
  | **194**  | NavMeshObsolete              |
  | **195**  | NavMeshAgent                 |
  | **196**  | NavMeshSettings              |
  | **197**  | LightProbesLegacy            |
  | **198**  | ParticleSystem               |
  | **199**  | ParticleSystemRenderer       |
  | **200**  | ShaderVariantCollection      |
  | **205**  | LODGroup                     |
  | **206**  | BlendTree                    |
  | **207**  | Motion                       |
  | **208**  | NavMeshObstacle              |
  | **210**  | TerrainInstance              |
  | **212**  | SpriteRenderer               |
  | **213**  | Sprite                       |
  | **214**  | CachedSpriteAtlas            |
  | **215**  | ReflectionProbe              |
  | **216**  | ReflectionProbes             |
  | **218**  | Terrain                      |
  | **220**  | LightProbeGroup              |
  | **221**  | AnimatorOverrideController   |
  | **222**  | CanvasRenderer               |
  | **223**  | Canvas                       |
  | **224**  | RectTransform                |
  | **225**  | CanvasGroup                  |
  | **226**  | BillboardAsset               |
  | **227**  | BillboardRenderer            |
  | **228**  | SpeedTreeWindAsset           |
  | **229**  | AnchoredJoint2D              |
  | **230**  | Joint2D                      |
  | **231**  | SpringJoint2D                |
  | **232**  | DistanceJoint2D              |
  | **233**  | HingeJoint2D                 |
  | **234**  | SliderJoint2D                |
  | **235**  | WheelJoint2D                 |
  | **238**  | NavMeshData                  |
  | **240**  | AudioMixer                   |
  | **241**  | AudioMixerController         |
  | **243**  | AudioMixerGroupController    |
  | **244**  | AudioMixerEffectController   |
  | **245**  | AudioMixerSnapshotController |
  | **246**  | PhysicsUpdateBehaviour2D     |
  | **247**  | ConstantForce2D              |
  | **248**  | Effector2D                   |
  | **249**  | AreaEffector2D               |
  | **250**  | PointEffector2D              |
  | **251**  | PlatformEffector2D           |
  | **252**  | SurfaceEffector2D            |
  | **258**  | LightProbes                  |
  | **271**  | SampleClip                   |
  | **272**  | AudioMixerSnapshot           |
  | **273**  | AudioMixerGroup              |
  | **290**  | AssetBundleManifest          |
  | **1001** | Prefab                       |
  | **1002** | EditorExtensionImpl          |
  | **1003** | AssetImporter                |
  | **1004** | AssetDatabase                |
  | **1005** | Mesh3DSImporter              |
  | **1006** | TextureImporter              |
  | **1007** | ShaderImporter               |
  | **1008** | ComputeShaderImporter        |
  | **1011** | AvatarMask                   |
  | **1020** | AudioImporter                |
  | **1026** | HierarchyState               |
  | **1027** | GUIDSerializer               |
  | **1028** | AssetMetaData                |
  | **1029** | DefaultAsset                 |
  | **1030** | DefaultImporter              |
  | **1031** | TextScriptImporter           |
  | **1032** | SceneAsset                   |
  | **1034** | NativeFormatImporter         |
  | **1035** | MonoImporter                 |
  | **1037** | AssetServerCache             |
  | **1038** | LibraryAssetImporter         |
  | **1040** | ModelImporter                |
  | **1041** | FBXImporter                  |
  | **1042** | TrueTypeFontImporter         |
  | **1044** | MovieImporter                |
  | **1045** | EditorBuildSettings          |
  | **1046** | DDSImporter                  |
  | **1048** | InspectorExpandedState       |
  | **1049** | AnnotationManager            |
  | **1050** | PluginImporter               |
  | **1051** | EditorUserBuildSettings      |
  | **1052** | PVRImporter                  |
  | **1053** | ASTCImporter                 |
  | **1054** | KTXImporter                  |
  | **1101** | AnimatorStateTransition      |
  | **1102** | AnimatorState                |
  | **1105** | HumanTemplate                |
  | **1107** | AnimatorStateMachine         |
  | **1108** | PreviewAssetType             |
  | **1109** | AnimatorTransition           |
  | **1110** | SpeedTreeImporter            |
  | **1111** | AnimatorTransitionBase       |
  | **1112** | SubstanceImporter            |
  | **1113** | LightmapParameters           |
  | **1120** | LightmapSnapshot             |

- 自定EditorWindow:`EditorWindow,PropertyDrawer,`

- 可使用UnityEvent以便用户自定义回调。

- 查找GameObject:`GameObject.Find(name);GameObject.FindWithTag(tag);`

- 创建和销毁：`Instantiate(go);Destroy(go);`

- 垃圾回收：

  ``` c#
  if (Time.frameCount % 30 == 0)
  {
     System.GC.Collect();
  }
  ```

  

  

  

## 事件函数执行顺序：

1. 第一个场景加载：

   1. Awake：在任何Start之前、Prefab被创建之后调用。当GameObject是inactive时，不会调用，直到其active。

   2. OnEnable：（只在Object active时调用）。当MonoBehaviour实例被创建，例如当关卡加载，或带脚本的GO被实例化时。

   3. OnLevelWasLoaded：当关卡被加载时。

      

2. Editor：

   1. Reset：当附着在GO上时，初始化脚本属性；或者Reset命令执行时调用。

3. 当第一帧更新前：

   1. Start：当脚本实例启用时，在第一帧更新前调用。

4. 帧之间：

   1. OnApplicationPause：在帧之后，检测到pause时调用。在OnAppliccationPause之后，会有额外的一帧用于显示图形以指示暂停状态。

5. 更新：

   1. FixedUpdate：比Update更频繁调用。帧率低时，可一帧调用多次；帧率高时可能在帧间不会被调用。所有物理计算和更新都在FixedUpdate之后；当在FixedUpdate内应用移动计算时，不许乘以Time.deltaTime，因为FixedUpdate是运行在可靠计时器上，独立于帧率。
   2. Update：一帧一调用。
   3. LateUpdate：一帧一调用，在Update之后。在Update中的计算会在LateUpdate之前结束。一个常见应用是第三人称相机的跟踪。角色在Update内移动变化，可在LateUpdate处理相机移动和旋转计算。这保证在相机跟踪其位置时，角色移动完成。

6. 渲染：

   1. OnPreCull：相机cull场景之前。cull决定哪些对象可视于相机。
   2. OnBecame[In]Visible:当物体可视或不可视于任意相机
   3. OnWillRenderObject：对象可视时，只调用一次。
   4. OnPreRender：相机开始渲染场景之前。
   5. OnRenderObject：所有场景渲染完毕。此时可使用GL或Graphics.DrawMeshNow绘制自定几何体。
   6. OnPostRender：结束渲染场景。
   7. OnRenderImage：渲染完成，运行对image的后期处理。
   8. OnGUI：每帧调用多次以反馈GUI事件。Layout和Repaint事件优先处理，接着键鼠事件。
   9. OnDrawGizmos：在场景视图中绘制Gizmo，以用于可视化目的。

7. 协程：协程在Update返回之后更新。协程是可挂起的函数，直到其给定的YieldInstruction完成。

   1. yield：在下一帧所有Update函数调用后继续
   2. yield WaitForSecons：指定时间后继续，在当前帧所有Update函数之后
   3. yield WaitForFixedUpdate：所有脚本的所有FixedUpdate调用之后继续
   4. yield WWW：WWW下载完成之后继续
   5. yield StartCoroutine：当前协程函数执行后继续下一个协程链。

8. 对象被销毁：

   1. OnDestroy：所有帧更新之后调用的最后一帧里调用。

9. 退出：

   1. OnApplicationQuit：当app退出前在所有go上调用。在editor中，在停止playmode时调用。
   2. OnDisable：behaviour被disable或inactive时调用。

参看：![img](file:///D:/dew/Unity/Editor/Data/Documentation/en/uploads/Main/monobehaviour_flowchart.svg)

## 特殊文件夹与脚本编译顺序

保留的目录：

* Assets：资源主文件夹。
* Editor：视为编辑器脚本而不是运行时脚本。发布时不参与构建。可在Assets文件夹中任何位置放置多个Editor。
* Gizmos
* Plugins：只能有1个Plugins目录，而且必须放在项目根目录，直接在Assets下。
* Resources：按需加载的资源。通过Resources.Load。可有任意个Resources目录分散在Assets目录任意地方。
* StandardAssets
* StreamingAssets
* 隐藏的资源：Unity会忽略Assets目录下的这些文件或目录：
  * 隐藏目录
  * 以.开始的
  * 以~结尾的
  * cvs命名的文件和目录
  * *.tmp文件



## 事件系统

事件系统 在应用中基于输入发送事件给对象，可是键盘、鼠标、触屏或自定输入。EventSystem包含一些组件一起工作发送事件。

EventSystem自身被设计为Manager和其他EventSystem模块之间的桥梁。

EventSystem的角色：

- 管理哪个GameObject被选中
- 管理哪个输入模块被使用
- 管理Raycasting（如果必需）
- 必要时更新所有输入模块

Input模块用于：

- 处理输入
- 管理事件状态
- 发送事件给场景对象
