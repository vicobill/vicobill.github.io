---
layout: post
title: {ISSUES}git.md
categories: 
date: 2019-08-21 11:22:09 +0800
---

# git 设置和取消代理
```bash
# 设置ss

git config --global http.proxy 'socks5://127.0.0.1:1080'

git config --global https.proxy 'socks5://127.0.0.1:1080'

# 设置代理
git config --global https.proxy http://127.0.0.1:1080

git config --global https.proxy https://127.0.0.1:1080

# 取消代理
git config --global --unset http.proxy

git config --global --unset https.proxy
```