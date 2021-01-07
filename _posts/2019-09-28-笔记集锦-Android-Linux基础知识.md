---
layout: post
title: 笔记集锦-Android-Linux基础知识
categories: linux,android
date: 2019-09-28 13:02:46 +0800
---

## 目录结构：
Linux基本目录结构：
![linux-fs](../../../assets/images/linux-fs.png)

Android 基本目录结构：
![android-fs](../../../assets/images/android-fs.png)

## 常见命令与注意事项

- 可使用adb connect连接指定设备。
- Android9以上只支持https协议，不支持http
# 逆向工程工具：
- 反编译器：将二进制反编译成高级语言，如C++
  - JEB Decompiler
- 反汇编器：与汇编器相反，它试图将机器语言转换成汇编语言(ASM)。
  - IDA Pro
  - [ ] Ghidra
  - Binary Ninja 
  - W32DASM
  - [ ] Evan's Debugger
  - Apktool
  - Hopper Disassembler
  - Radare2
  - [ ] ILSpy,dnSpy
- 保护扫描器：可扫描App，检测是否受其他程序保护
  - [ ] DIE(Detect It Easy)
  - Scylla
  - RDG Packer Detector
  - API Monitor
  - PEiD
- 调试器：在反汇编之后，可逐步执行代码，一次执行一行，编辑并查看代码运行状态。
  - gdb
  - Windbg
  - [ ] x64dbg 
  - Ollydbg
- 十六进制编辑器：查看二进制文件实际字节并根据需要直接修改文件内容。
  - Hex Calculator
  - WinHex
  - Hiew
  - 
- 脱壳器：可将程序进行脱壳，还原真实的二进制文件。
  - CFF Explorer
  - Relocation Section Editor
- 网络调试器：可剖析网络消息
  - WireShark
  - Fiddler
- 安全环境：通常使用虚拟机进行操作。
  - Virtual Box



## 逆向步骤：
1. 使用保护扫描器扫描App，了解其是否受其他程序保护
2. 如果App受到保护，则必须首先删除该保护(拆包/脱壳)。（现今App通常受到多层保护，以防被逆向）
3. 移除保护后，将软件加载到调试器中
4. 在调试器的帮助下，对程序进行必要的修改（这是最困难的部分之一）
