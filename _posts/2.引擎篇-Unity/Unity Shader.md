Unity Shader 是通过称为ShaderLab的语言实现。ShaderLab是基于CG的描述性语言，但扩展了CG，具有自己的语法特征。

ShaderLab以描述为主，主要用于集成自UNITY、不同硬件平台适配等。其语法如下：

``` cg
Shader "着色器名称/子名称" {
    [Properties]  # 属性列表，能显示在unity Inspector中。
    SubShaders # 子Shader块。不同的子Shader对应不同硬件平台
    [Fallback] # 不支持时的回滚
    [CustomEditor] # 
}
```

# Properties

属性是能在Inspector中显示，能供艺术师直接设置的属性。

语法如下：

``` shaderlab
Properties {
    Property
    [Property ...]
}
```

每个属性由名称引用，使用方式是：`[PropertyName]`，如：`Blend [\_SrcBlend] [\_DstBlend]`。

| 属性类别   | 语法                                                         | 示例                                |
| ---------- | ------------------------------------------------------------ | ----------------------------------- |
| 数值       | name ("显示名称",Range(min,max)) = number<br />name("显示名称",Float) = number<br />name("显示名称",Int) = number | _SrcBlend("Source Blend", Int) = 20 |
| 颜色和矢量 | name("显示名称",Color) = (n,n,n,n)<br />name("显示名称",Vector) = (n,n,n,n) |                                     |
| 纹理       | name("显示名称",2D) = "default texture" {}<br />name("显示名称",Cube) = "default texture" {}<br />name("显示名称",3D) = "default texture" |                                     |

属性也可有Attribute和绘制方式：

| Attribute         | 作用                                                         |
| ----------------- | ------------------------------------------------------------ |
| [HideInInspector] | 不在Inspector中显示                                          |
| [NoScaleOffset]   | 不显示纹理tilling/offset字段                                 |
| [Normal]          | 指示纹理为法线纹理                                           |
| [HDR]             | 指示纹理为HDR纹理                                            |
| [Gamma]           | 指示float/vector属性在UI中为sRGB值，并且可能使用颜色空间转换 |
| [PerRendererData] | 指示纹理属性从per-renderer data而来。Inspector为这些属性改变纹理UI |

访问这些属性，需要在CG代码中声明这些类型数据

| shaderlab数据 | cg数据              |
| ------------- | ------------------- |
| Color,Vector  | float4,fixed4,half4 |
| Range,Float   | float,fixed,half    |
| 2D            | sampler2D           |
| Cube          | samplerCUBE         |
| 3D            | sampler3D           |

使用属性，则需要在Cg中定义对应类型的同名属性。

例如：

``` shaderlab
// 水Shader的属性
Properties {
    _WaveScale ("Wave Scale", Range(0.02,0.15)) = 0.07
    _ReflDistort("Reflection Distort",Range(0,1.5))=0.5
    _RefrDistort("Refraction Distort",Range(0,1.5)) = 0.5
    _RefrColor("Refraction Color",Color) = (.13,.85,.92,1)
    _ReflTex("Environment Reflection Texture",2D) = "" {}
    _RefrText("Environment Refraction Texture",2D) = "" {}
    _Fresnel("Fresnem (A)", 2D) = "" {}
    _BumpMap("Bummap(RGB)",2D) = "" {}
}
```



# Subshader

Subshader用于适配不同显卡。定义了一系列渲染通道，并且设置可选的用于所有通道的渲染状态。当Unity选择subshader渲染时，使用每个通道对物体进行渲染。

语法：

``` cg
Subshader {
    [Tags]
    [CommonState]
    Passdef
    [Passdef ...]
}
```

通道可定义为常规、使用、Grab通道。

状态类似于共享状态，每个通道都会使用它们。例如：

``` shader
/// 只定义1个Pass，关闭光照，并只用_MainTex显示物体
SubShader {
    Pass {
        Lighting Off /// 定义状态，关闭光照
        SetTexture [_MainTex] {}
    }
}
```

## Pass

通道块引发对象的几何体渲染。

语法：

``` shaderlab
Pass {
    [Name and Tags]
    [RenderSetup]
}
```

通道命令包含一系列渲染状态设置命令。

通道可定义其名称和任意数量的Tag。

通道设置显卡的状态，诸如是否开启Alpha测试，是否使用Depth测试等。

| 命令                                                         | 作用                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Cull Back \| Front \| Off                                    | 设置多边形裁切模式                                           |
| ZTest (Less\|Greater\|LEqual\|GEqual\|Equal\|NotEqual\|Always) | 设置深度缓冲测试模式                                         |
| ZWrite On\|Off                                               | 设置深度缓冲写入模式                                         |
| Offset factor,units                                          | 设置Z缓冲深度偏移                                            |
| Blend src,dst<br />Blend src,dst,alphaSrc,alphaDst<br />BlendOp colorOp<br />BlendOp colorOp,alphaOp<br />AlphaToMask On\|Off | 设置Alpha混合、Alpha操作和Alpha覆盖模式。                    |
| ColorMask RGB\|A\|O\|any Combination of R,G,B,A              | 设置颜色通道写掩码。ColorMask 0关闭渲染所有颜色通道。默认是写入所有通道，但有些特效需要保持某些通道不变或禁止颜色写入。 |
|                                                              |                                                              |

Culling：剔除，是一个优化手段，不渲染背向查看者的多边形。发生在光栅化之前。所有多边形都有前后两面。剔除基于多数对象都是封闭的事实。如果你有立方体，你永远不会背向你的面所以不需要绘制这些背向面。术语为：背面剔除。另一个可使渲染看起来正确的是深度测试（Depth Testing）。深度测试确保最近的表面被绘制。

剔除有3种模式：

- Back：默认。不渲染背面。
- Front：不渲染前面。用于将内部显示。
- Off：禁止剔除，所有面都会绘制。用于特殊效果。

ZWrite：控制从此对象的像素是否写入到深度缓冲区。如果绘制固体对象，则设置为ON，如果绘制半透明效果，可将此设为OFF。

ZTest：指定如何执行深度测试。默认为LEQUAL(绘制对象在范围内存在的物体，隐藏范围后的对象)。

Offset：允许指定深度偏移：factor和units。factor缩放相对于X或Y的最大Z斜率，units缩放最小可分解深度缓冲值。这允许即使两个多边形都在同一位置，也可使一个多边形绘制在另一个上面。例如Offset 0,-1将多边形更拉近相机，而Offset -1,-1将以掠射角形式更近。

通常半透明着色器不写入深度缓冲。可是，这可引发绘制顺序问题，特别是特别非凸面网格。如果希望渐隐网格，需在使用着色器前填充深度缓冲。

