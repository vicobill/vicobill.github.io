---
layout: post
title: 【ISSUES】创建Ruby Jekyll个人日志环境
categories: ruby,jekyll
date: 2019-05-29 11:57:10 +0800
---

# 安装 ruby

- 安装 ruby 和 rvm

```bash
sudo apt install build-essential # 出现gem install 失败时需要
sudo apt install software-properties-common # 添加apt-add-repository时需要

sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm gem

rvm install ruby-2.6.3
```

- 切换源：

```bash
gem update --system
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/

gem install bundler rails
```

注意，在UBUNTU上，需要先安装：
```bash
sudo apt install ruby ruby-dev 
```

# 安装 Jekyll

```bash
gem instal bundler jekyll

bundle install
```

- 替换 bundle 镜像

```bash
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

# 使用 Jekyll

```bash
jekyll new myblog
cd myblog
jekyll serve
```

在浏览器输入 localhost:4000 即可预览。此时如果修改`_posts`里的文本，会实时显示更新。
