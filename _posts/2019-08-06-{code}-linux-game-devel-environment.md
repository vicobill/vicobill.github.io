---
layout: post
title: linux游戏开发环境
categories: linux,coding
date: 2019-08-06 07:38:32 +0800
---
# linux与包管理
linux是由全世界的geek创建，其设计理念就是为方便编程而生，所以如果想要学编程或为日常编程找个得力平台，Linux当之无愧为其中翘楚。

Linux下的可视化图形环境，是以服务形式提供，称之为X，X之上，存在KDE，Gnome，Xfce等桌面环境。桌面环境可以随意替换，因此无论何种Linux发行版，并不会影响开发。

不同Linux发行版，包含不同的包管理器。包管理器可以快速从网络中，获取所需的软件。安装的软件，通常放在/usr/目录下，包括/usr/bin,/usr/include,/usr/lib 三个目录，统一管理编程环境。这不同于Windows，Windows需要自行管理开发库的下载目录。现在Windows下的开发渐渐改善，存在conan,vcpkg等统一开发包管理工具。

Linux下存在很多既有工具，能有效提高开发效率。Linux的设计哲学是多个小工具一起协作，达到目的。这样的零件式工具有个好处，即如果想要定制其中某一工具，完全是可以的，如果你会编码，甚至可以自行实现。

Linux上，还有一个非常优秀的工具，man，man几乎能获取任何你在开发中所需API的说明文档，甚至内核文档。

# gcc
gcc是通用的C/C++编译器，几乎每个Linux发行版都自带gcc，一边与

# makefile
makefile是通过target,dependencies,rules定义。
```makefile
program: file1.c file2.c graphic.a  # 此行定义了目标:program,其依赖file1.c,file2.c,graphic.a三项。当要生成program时，如果其依赖发生变化，则会同时重新编译依赖项。
    # 缩进项定义的是生成规则
    gcc -c file1.c file2.c
    gcc file1.o file2.o graphic.a -lSDL -o program

# 下面定义了目标graphic.a，其依赖项以及生成规则
graphic.a: graphic.c draw.c
    gcc -c graphic.c draw.c 
    ar rcs graphic.a graphic.o draw.o
    ranlib graphic.a
```
[未完待续]