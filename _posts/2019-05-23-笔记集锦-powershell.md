---
layout: post
title:  笔记集锦-Powershell&Windows
category: powershell
date: 2019-05-23 11:57:10 +0800
---

- 当运行 ps 脚本，提示“此系统禁止运行脚本”时，解决方式：`set-executionpolicy remotesigned`

- 安装 WSL:以管理员身份打开 PS：`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

- 安装 Chocolately：
  `Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`


## Windows
### 添加开机启动项

`%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

将要启动自启动的程序的快捷方式加入此目录即可

也可添加vbs脚本，如自启动wsl：
```
Set ws = WScript.CreateObject("WScript.Shell")
ws.run "wsl -d ubuntu -u root /etc/init.wsl"
```