---
layout: post
title: 【集锦】unity 知识 - Misc
categories: unity
date: 2019-08-24 16:21:29 +0800
---



# UnityHub破解

1.退出UnityHub,安装好nodejs后，用Win+R输入"cmd"执行以下命令

npm install -g asar
2.打开UnityHub安装目录如 C:\Program Files\Unity Hub\resources
3.在C:\Program Files\Unity Hub\resources打开命令行,执行以下命令解压app.asar

C:\Program Files\Unity Hub\resources> asar extract .\app.asar app
解压后删除C:\Program Files\Unity Hub\resources\app.asar
4.修改C:\Program Files\Unity Hub\resources\app\src\services\licenseService\licenseClient.js

```js
  getLicenseInfo(callback) {
    // load license
    // get latest data from licenseCore
    //licenseInfo.activated = licenseCore.getLicenseToken().length > 0;//注释这行
    licenseInfo.activated = true;//新增这行
    licenseInfo.flow = licenseCore.getLicenseKind();
```

5.C:\Program Files\Unity Hub\resources\app\src\services\licenseService\licenseCore.js

```js
  verifyLicenseData(xml) {
    return new Promise((resolve, reject) => {
        resolve(true);//新增这行
      if (xml === '') {
```


# Assembly Definitions
Assembly（程序集）是C#中的概念，是代码模块的逻辑性（非物理性）分组，它在VS中表现为Project。exe和dll都可是Assembly。

C#中的应用结构如下：AppDomain由N个Assembly组成；每个Assembly由N个Module组成；每个Module由N个Type组成；每个Type由N个Member组成。这些信息都可通过System.Reflection查找到。