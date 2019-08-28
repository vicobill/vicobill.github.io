---
layout: post
title: {ISSUE}Unity-C#-Whole-Review
categories: 
date: 2019-08-27 18:24:03 +0800
---

.NetCore是开放源代码的通用开发平台，由Microsoft和.NET社区共同维护，跨平台。.Net Core是整个平台，而不仅仅只对应C#。如同JVM一样，其上不仅仅只有Java。.Net Core也可视为是虚拟机。C#也是编译为中间字节码，供.Net运行，其运行原理与JVM如出一辙。

C#是.Net平台首推语言，其重要程度与Java之于JVM一样。C#是一门精心设计过的语言，精巧（但不简洁）。

C#内置标准库以System开始，是组建整个C#生态圈的核心。Unity底层采用C++编写，其脚本语言环境集成了.Net平台，在其上构筑了Boo,Javascript等语言环境，当然，还可以构建更多的语言环境，但要考虑中间层.Net带来的解析或编译消耗。

C#简短回顾：
- 静态语言，面向对象，语法如同C++
- 具有模板特性，写法如同C++，但更简洁
- 偏重接口继承，避免多重继承
- 以Namespace作为包管理单元

C#标准库：
- Runtime: 是最基础的包，提供最基本的数据类型。
  - 
  