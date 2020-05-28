# Android 开发笔记

## Android

- Android Studio设置离线Gradle： 设置gradle的目录类似：`d:/gradle/gradle-*.zip`. 在Android项目的gradle.properties设置为 `file:///d\:/gradle/gradle-*.zip`



## Android Studio连Nox模拟器调试

- 先将Unity工程导出给AssetStudio
- 运行Nox安装目录下的`nox_adb.exe connect 127.0.0.1:62001`
- 在Android Studio项目，按下`Shift+F10`,打开模拟器列表
- 选择对应模拟器即可。




