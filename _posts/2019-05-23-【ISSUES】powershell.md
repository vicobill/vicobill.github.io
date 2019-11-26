---
layout: post
title: 【ISSUES】Powershell 集锦
category: powershell
date: 2019-05-23 11:57:10 +0800
---

- 当运行 ps 脚本，提示“此系统禁止运行脚本”时，解决方式：`set-executionpolicy remotesigned`

- 安装 WSL:以管理员身份打开 PS：`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

- 安装 Chocolately：
  `Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`
