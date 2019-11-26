---
layout: post
title: {ISSUE}Object-C
categories: 
date: 2019-09-08 00:09:05 +0800
---

对反人类语法设计Object-C的总结。

Object-C是面向对象的C，因此，与C不一样的地方往往是其面向对象部分。而且Object-C面向对象的写法，不同于主流编程语言。

基本语法：`[object method:para]`和`[object method]`。对应主流语法为：`object.method(para)`和`object.method()`。

新建对象：`[classname alloc]`，对应主流写法：`new classname()`或`classname.new()`

克隆对象:`[o copy]`，对应主流写法：`o.clone()`或`o2 = o`

调用析构函数：`dealloc`，主流写法：`delete`,`destroy`,`Dispose`

类声明：`@interface c{..}..@end`，主流写法：`class c`

测试类成员关系：`IsKindOfClass`, 主流写法：`is_a?`,`is`, `instanceof`,`:?`

获取对象关联的类型：`class` ,主流写法：`typeof`

继承：`@interface child:parant{...}...@end`,主流写法：`class child:parent`

其他杂项：
```swift
self, super,
```