---
layout: post
title: {ISSUE}XCode
categories: 
date: 2019-08-28 15:47:23 +0800
---

unity导出ios项目所需做的几个操作：
1. 在unity的Player Settings中设置包名（Builde Identifier)
2. 支持的脚本兼容特性为：.Net Standard 2.0
3. 导入Google Admob:导入所含的Framework或者使用pod install
<!-- 4. 在Build Settings的Linking - Other Linker Flags 中，添加`-ObjC`编译命令参数 -->

导入第三方Framework之后，无法引入头文件：原因是无法找到头文件目录。
> 选择build setting -> user header search paths 
> * 如果使用cocoapods管理，则添加`$PODS_ROOT`，选择`recursive` 即可。 
> * 如果自行管理，则需要下载 [GoogleMobileAdsSDKiOS.zip](http://dl.google.com/googleadmobadssdk/googlemobileadssdkios.zip​​)，解压至项目Frameworks目录之后，添加`$(SRCROOT)`，选择`recursive`即可。


使用POD管理XCode的Framework：
```sh
gem sources --remove https://rubygems.org/
gem sources -a http://gems.ruby-china.com/

sudo gem install cocoapods

cd ~/Projects/iOS/
pod install
```