---
layout: post
title: 【DailyGfx】2-Shader
categories: render, shader
date: 2019-07-17 19:51:22 +0800
---

在现代渲染管线中，硬件GPU常常由显卡驱动程序驱动。显卡驱动常常适配至操作系统，以使操作系统能操纵显卡显示出图形。操作系统主要职能就是控制计算机所有的硬件资源，并提供接口给程序员使用。显卡也是硬件资源之一，当然也不例外。所以，我们常说的图形API OpenGL，Vulkan，DirectX等，都是由标准制定机构进行制定，与显卡驱动提供商进行约定，制定出标准。接着操作系统、显卡驱动商协商一致之后，提供给程序员用的接口，即是图形API。

程序员通过图形API，可以让显卡供我们工作。

那Shader是什么呢？Shader并非是GPU直接处理的资源，而是由图形API自行解释，并能在渲染管线对应的Shader中进行使用的语言。Shader最大的作用，是将渲染任务最大限度地交给了程序员，程序员可以定制渲染的几乎每个过程(Rasterization除外)，这极大赋予了程序员自由。

Shader常常由图形API组织制定。例如，DirectX图形API制定了对应的HLSL着色器语言；OpenGL图形API制定了GLSL着色器语言；NVIDIA卡图形驱动提供者并显卡提供者，提供CG着色器语言等等不一而足。种种Shader语言虽然不同，但最终目的一致——即赋予程序员自由。

所以Shader在某种意义上说，是中间语言，立于程序员和显卡间。既然是中间语言，那么Shader程序必须经过编译，编译成GPU指令集，就如同C++程序一样，如果运行于CPU，则必须是编译成CPU指令集。无论是CPU还是CPU，它们只认它们范围域中的指令集，不认识什么C++或者Shader。因此，图形API必须提供了编译Shader的接口，如OpenGL中有`glCompileShader`,DirectX中有D3DXCompileShader。Vulkan则提供了一种称为SPIR-V的东西，这是字节代码，如同C#编译之后形成的中间字节代码一样。字节代码有其好处，即只需要提供虚拟机即可跨平台运行。Vulkan通常会提供glslangValidator程序，将GLSL转换成SPIR-V字节码。SPIR-V可避免实时编译，这提高了着色器的效率。

着色器不可避免地需要编译，但每次都编译则会很耗时间，所以最常见的优化是预编译。在CryEngine中，会创建ShaderCache，缓存编译后的Shader；有些则是通过外部程序，如UE4在游戏之前会编译所有的Shader，然后再使用。Vulkan的SPIR-V也是类似的操作，它提供外部程序编译Shader，然后再使用。也有些是通过Shader Thread来编译，但其本质上来说，仍然是预编译。

在实际运行中，不同的Shader有自己的入口函数，就如同C语言一样。Vertex Shader、Fragment Shader、Geometry Shader都有其自身的入口函数。Shader语言中，通常会有许多内置的变量可供使用，这些内置变量往往是当前Shader能处理的数据。例如，Vertex Shader需要得到顶点的位置数据，在OpenGL中存在`gl_Position`这样的变量。同样Shader中也可以自定义变量进行处理；应用程序也可以将数据传到Shader中，Shader也可把数据传出来。这个过程就如同C语言与Lua语言交互一样，Lua 语言里有一些内置的变量，它们有自己的用途，而程序员可通过C访问Lua里的变量，也可通过Lua访问C里的变量。在理解Shader过程中，可以将其当作特定于图形的Lua语言，有助于理解。

所以，当有大量数据要处理时，可交给Shader，由GPU来处理Shader任务。这样则能把消耗大的任务，交给硬件处理。也就是GPGPU，常见应用即是“挖矿”。“挖矿”常常借助显卡来实现并行处理。

在不同的游戏引擎中，很多又有自身的Shader程序编写方式。如Unity有ShaderLab，UE4有Blueprint。这是为了跨平台采取的措施，如Source引擎会有HLSL to GLSL的程序，应对不同图形API时的Shader应用。在跨平台引擎中，自定义Shader语言犹为常见。跨平台引擎直接面对的是不同的硬件，程序员不该为各个硬件编写不同的Shader语言，如在Linux下编写HLSL，在Windows下编写GLSL等等，所以跨平台引擎抽象出Shader语言，即使应对不同平台不同硬件时，也能自由处理。所以，可以得出一种结论，只要引擎是跨平台的，那么必定会有跨图形API的Shader语言存在。

那么，说了这么多，Shader到底怎么用呢？给个示例***伪代码***：
``` c
vec3    in_position;
vec4    out_color;


void vs_main(){
    in_position.x += 10;
    out_color = vec4(.5,.5,.5,.5);
}
```
``` c
vec4    out_color;

void fs_main() {
    out_color = awesome_process()
}
```
``` c
加载Shader文件
vs = LoadVertexShaderSource();
fs = LoadFragmentShaderSource();

编译Shader文件
vsprog = glCompileShader(vs);
fsprog = glCompileShader(fs);

使用Shader处理任务
glUseProgram(vsprog);

与Shader互通变量
color = glGetShaderVar("out_color");
glSetShaderVar("out_color",COLOR_WHITE);
```

注意，以上代码是伪代码，不要直接复制粘贴！它们存在的意义只是阐述其使用方式。

图形API的Shader语言通常脱胎于C语言(HLSL,GLSL,CG皆是)，原因之一是c语言具有很好的跨平台，常用于嵌入式设备中，显卡也不例外，当然是图形驱动开发者最熟悉的语言；其次，c语言很简单，图形API的Shader语言则是简化版的c语言，其编译器很容易实现。

通常使用游戏引擎，那么最好是学习游戏引擎的Shader为好，无需再接触GLSL或HLSL或SPIR-V等，因为它们雨女无瓜;)。但一定要放轻松，Shader就是简化的中间语言/脚本语言，比起新学一门编程语言，Shader语言要简单多了！SO,TAKE IT EASY!
