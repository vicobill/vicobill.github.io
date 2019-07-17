---
layout: post
title: Powershell 集锦
category: powershell
date: 2019-05-23 11:57:10 +0800
---



当运行ps脚本，提示“此系统禁止运行脚本”时，解决方式：`set-executionpolicy remotesigned`



安装WSL:以管理员身份打开PS：`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

