# Unity 开发笔记

## 对待破解游戏制作流程（Unity）
1. 从破解游戏中，获得资源或代码，或两者皆有

2. 导入到引擎中，进行还原。
    - 还原场景：场景布局；场景中物体挂载的脚本；
    - 还原代码：物体挂载的脚本代码。主要是逻辑代码（C# AssemblySharp，Lua）
    - 导入原插件：NGUI，LuaFramework，EasyTouch，Spine， Protobuf 等等常见插件。
    - 还原属性：GameObject属性取值的还原.
        - NGUI的UITexture的width和height导入后为0， 需要在脚本中调整为1.Material
        - 还原着色器：Material 和 Shader；有些Shader（特别是Particlesystem）采用的Legency，需要自动切换为Mobile。

3. Prefab重制。
   
    导入的Prefab可能会与当前引擎版本不兼容，出现单独打不开的情况，则需要重新拖入场景再制成Prefab。

4. 调试网络协议

5. Bundle资源重新打包

    将从Bundle解出的资源，要么原封不动使用它；要么重新打包成Bundle。

6. 发布平台SDK接入（GooglePlay，AppStore，FaceBook，Steam）
   
    发布时接入Google，通常只需要配置AppID和通信服务器即可


## Unity 内置Shader编号
fileID编号 | Shader
--- | ---
基本shader | |
1 | legacy/diffuse fast
2 | Legacy/Bumped Diffuse 
3 | legacy/specular
4 | Legacy/Bumped Specular
5 | legacy/diffuse detail
6 | legacy/vertexlit
7 | legacy/Diffuse
8 | legacy/parrallax diffuse
9 | legacy/parrallax specular
自发光 | |
10 | legacy/self-illumin/diffuse
11 | legacy/self-illumin/bumped diffuse
12 | legacy/self-illumin/specular
13 | legacy/self-illumin/bumped specular
14 | legacy/self-illumin/vertexlit
15 | legacy/self-illumin/parallax diffuse
16 | legacy/self-illumin/parallax specular
反照| |
20 | legacy/reflective/diffuse
21 | legacy/reflective/bumped diffuse
22 | legacy/reflective/specular
23 | legacy/reflective/bumped specular
24 | legacy/reflective/vertexlit
25 | legacy/reflective/bumped unlit
26 | legacy/reflective/bumped vertexlit
27 | legacy/reflective/parallax diffuse
28 | legacy/reflective/parallax specular
渲染透明物体 | |
30 | legacy/transparent/diffuse
31 | legacy/transparent/bumped diffuse
32 | legacy/transparent/specular
33 | legacy/transparent/bumped specular
35 | legacy/transparent/parallax diffuse
34 | legacy/transparent/vertexlit
36 | legacy/transparent/parallax specular
光照贴图 | |
40 | legacy/lightmaped/vertexlit
41 | legacy/lightmaped/diffuse
42 | legacy/lightmaped/bumped diffuse
43 | legacy/lightmaped/specular
44 | legacy/lightmaped/bumped specular
45 | Standard (Specular Setup)
46 | Standard
47 | Autodesk Interactive 
渲染透明刻画|  |
50 | legacy/transparent/cutout/vertexlit
51 | legacy/transparent/cutout/diffuse
52 | legacy/transparent/cutout/bumped diffuse
53 | legacy/transparent/cutout/specular
54 | legacy/transparent/cutout/bumped specular
52 | legacy/transparent/cutout/vertexlit
10512 | legacy/transparent/cutout/soft edge unlit
大气 | |
100 | Legacy/Decal
101 | FX/flare
103 | skybox/cubemap
104 | skybox/6 sided
106 | skybox/procedural
108 | skybox/panoramic
粒子特效| |
200 | Legacy/Particles/Additive
201 | Legacy/Particles/~Additive-multiply
201 | Legacy/Particles/Additive(Soft)
203 | Legacy/Particles/Alpha Blend
205 | Legacy/Particles/Multiply
206 | Legacy/Particles/Multiply(double)
207 | Legacy/Particles/Alpha Blend Premultiply
208 | Legacy/Particles/VertexLit Blended
209 | Legacy/Particles/Anim Alpha Blend
210 | particles/standard surface
211 | particles/standard unlit
其他 | |
10101 | GUI/text shader
10505 | nature/terrain/diffuse
10509 | nature/tree soft occlusion bark
10511 | nature/tree soft occlusion leaves
10600 | nature/tree creator bark
10601 | nature/tree creator leaves
10602 | nature/terrain/specular
10606 | nature/tree creator leaves fast
10623 | nature/terrain/standard
移动平台 | |
10700 | mobile/skybox
10701 | mobile/vertexlit
10703 | mobile/diffuse
10704 | mobile/bumped diffuse
10705 | mobile/bumped specular
10706 | mobile/bumped specular(1 directional realtime light)
10707 | mobile/vertexlit(only directional lights)
10708 | mobile/unlit (support lightmap)
移动平台粒子特效 | |
10720 | mobile/particles/additive
10721 | mobile/particles/alpha blended
10722 | mobile/particles/vertexlit blended
10723 | mobile/particles/multiply
2D渲染 | |
10750 | unlit/transparent
10751 | unlit/transparent cutout
10752 | unlit/texture
10753 | sprites/default
10755 | unlit/color 
10757 | sprites/mask
10760 | ui/unlit/transparent
10761 | ui/unlit/detail
10763 | ui/unlit/text detail
10762 | ui/unlit/text
10764 | ui/lit/transparent
10765 | ui/lit/bumped
10766 | ui/lit/detail
10767 | ui/lit/refraction
10768 | ui/lit/refraction detail
10770 | ui/default
10782 | ui/default font
10783 | ui/defaultETC1
10800 | sprites/diffuse 
speed tree | |
14000 | nature/speedtree
14001 | nature/speedtree billboard
14002 | nature/speedtree8
VR AR | |
15300 | VR/spatialmapping/occlusion
15301 | VR/spatialmapping/wireframe
15401 | AR/tangoARrender

### Facebook for Unity
- 使用7.16.1版本为稳定版。涉及到PlayServiceResolvers时，不要升级为AndroidX，同时`targetSDKVersion=28`
> 禁用 android.useJetifier=false


## Unity 报错处理：
- TMPro找不到：导入TMPro -> Edit-Project Settings-Editor- Version Control Mode设为`Visible Meta Files`
- UnityPurchase 报错：导入UnityIAP -> 添加脚本预定义宏：`UNITY_PURCHASING` -> 将脚本后端设为`.NET 4.x` -> 重开Unity

## Unity Physic.Raycast 失败：
- 目标对象必须存在`Collider`，否则不会发生碰撞。

## Unity导入2D骨骼动画
（Dragon）Spine包含资源：
- drogon.png:图集
- dragon.json:动画数据
- dragon.atalas.txt:骨骼数据
- dragon_Atlas.asset:（SpineAtlasAsset）Unity可用的资源，会引用dragon.atlas.txt骨骼数据，同时其Materials会引用必须的材质
- dragon_dragon.mat:材质，会引用drogon
- dragon_SkeletonData:(SkeletonDataAsset)Unity使用骨骼数据资源。会引用Atlas资源(dragon_Atlas.asset)、SkeletonJson(dragon.json)。

### Unity vscode 默认命令行：
`"$(ProjectPath)" -g "$(File)":$(Line):$(Column)`