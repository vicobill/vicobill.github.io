---
layout: post
title: {ENGINE}Godot
categories: engine
date: 2019-08-21 11:46:37 +0800
---
# 前提
## 编译源代码
1. 从国内镜像地址下载 `git clone -b 3.1 https://gitee.com/mirrors/godot.git`
2. 安装python，并添加至PATH
3. 安装SCons:`pip install scons`
4. 安装Visual studio或mingw
5. 使用Scons编译源代码： `scons p=windows -j8`。 将会在`bin`目录下生成目标平台可执行文件。
> scons参数：可通过scons --help了解。
> 
> bits=default/32/64 目标平台的位数
> 
> platform/p=android/javascript/server/windows/x11 编译的目标平台
> 
> target=debug/release_debug/release 用于目标文件的构建，建议使用release_debug
> 
> tools=yes/no 是否构建工具。如果不包括编辑器和项目管理器，则不启用，可使构建得到的二进制更小。
> 
> use_mingw=yes use_lto=yes 用于指定构建的编译器，并使二进制更小更快
> vsproj=yes 可使用VisualStudio开发，以自添加C++模块扩展引擎

通常如果需要裁切包体大小，可选择：
> scons target=release optimize=size use_lto=yes deprecated=no disable_3d=yes disable_advanced_gui=yes module_visual_script_enabled=no 
> scons p=windows target=release tools=no module_bmp_enabled=no module_bullet_enabled=no module_csg_enabled=no module_dds_enabled=no module_enet_enabled=no module_etc_enabled=no module_gdnative_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_mbedtls_enabled=no module_mobile_vr_enabled=no module_opus_enabled=no module_pvr_enabled=no module_recast_enabled=no module_regex_enabled=no module_squish_enabled=no module_tga_enabled=no module_thekla_unwrap_enabled=no module_theora_enabled=no module_tinyexr_enabled=no module_vorbis_enabled=no module_webm_enabled=no module_websocket_enabled=no



### linux平台下编译：
``` bash 
pacman -S scons pkgconf gcc libxcursor libxinerama libxi libxrandr mesa glu alsa-lib pulseaudio yasm

scons -j8 platform=x11 use_llvm=yes target=release_debug
```

## 构建导出模板：
``` shell
scons platform=android tools=no android_arch=armv7
scons platform=<platform> tools=no android_arch=arm64v8
scons platform=<platform> tools=no android_arch=x86

cd platform/android/java
./gradlew build


将目标文件拷贝到$HOME/.local/share/godot/templates/[gd-version]/linux_x11_<32|64|_<debug|release>
```

并将目标文件，copy至`%APPDATA%/Godot/templates/<version>/windows_<32|64>_<debug|release>.exe`。在Godot引擎导出选项中，`Custom Template`中选择此文件。

## 从linux交叉编译：
> pacman -S mingw-w64 并确保mingw-64在PATH中。如无：export MINGW32_PREFIX="/path/to/i686-w64-mingw32-"
> user@host:~$ ${MINGW32_PREFIX}gcc --version 进行验证

## 导出到Android：
1. 安装Android SDK ,JDK
2. 设置ANDROID_HOME,ANDROID_NDK_ROOT,ANDROID_NDK_HOME,JAVA_HOME
3. 创建一个debug.keystore: `keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999` 或者创建一个正式keystore:`keytool -v -genkey -v -keystore mygame.keystore -alias mygame -keyalg RSA -validity 10000`
4. 在Godot的Editor Settings的Export栏下，设置Android设置。abd目录%ANDROID_SDK_HOME%/platform-tools/; jarsigner:%JAVA_HOME%/bin/ 

## 脚本加密
openssl enc -aes-256-cbc -k secret -P -md sha1 > godot.gdkey


## vscode编辑器设置
安装godot-tools，将Godot 编辑器的外部设置勾选，选定为vscode，并exec flag设置：`{project} --goto {file}:{line}:{col}`

# GDScript
GDScript类似Boo或JS。

```python
# 一个文件即一个类

# 继承
extends BaseClass

# （可选）类定义，绑定自定义的icon。当使用class_name指定名称时，会在注册一个全局类型，可直接使用静态注解，而无需preload
class_name MyClass,"res://myclass.svg"

# 成员变量
var a = 5
var s = "hello"
var arr = [1,2,"hello"]
var dict = {"key": "value", 2: 3} 
var typed_var: int              # 为变量指定类型，类似Rust中的类型指定
var inferred_type := "String"   # 类型自动推导，类似Go语言中的推导

# 常量
const ANSWER = 42
const THE_NAME = "Charly"

# 枚举：类似与C语言中的枚举
enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# 内置向量类型
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

# 函数：类似Python中的函数定义

func some_function(param1, param2):
    var local_var = 5

    if param1 < local_var:
        print(param1)
    elif param2 > 5:
        print(param2)
    else:
        print("Fail!")

    for i in range(20):
        print(i)

    while param2 != 0:
        param2 -= 1

    var local_var2 = param1 + 3
    return local_var2

# 覆盖基类函数，如果需要调用基类的函数，则使用 .（如同其他语言里的super）
func something(p1, p2):
    .something(p1, p2)

# 嵌套类。因为脚本本身是一个类，在脚本文件里定义类，即相当于嵌套类

class Something:
    var a = 10

# 构造函数
func _init():
    print("Constructed!")
    var lv = Something.new()
    print(lv.a)
```

基本类型(int,float,string,vector)通过传值调用，其他所有作为引用传递。继承自Reference的类会自动释放，继承自Object的类，则允许手动释放。

## 复合数据结构：
``` python
# 数组
var arr = []
arr.append(4)
arr.resize(5)
arr.pop_front()

var a = 20
if a in [10,20,30]:
    print("Winner");

# 字典：无需考虑键值的数据类型，它们是以哈希表实现，非常高效，所以放心用吧。

var d = {"name": "John", "age": 22} # Simple syntax
print("Name: ", d["name"], " Age: ", d["age"])

d["mother"] = "Rebecca" # Addition
d["age"] = 11 # Modification
d.erase("name") # Removal

# 也可使用Lua风格的表，这种语法更可读、易用。但这种的key为标识，不可以数字开头
var d = {
    name = "John",
    age = 22
}

print("Name: ", d.name, " Age: ", d.age) # Used "." based indexing

# Indexing

d["mother"] = "Rebecca"
d.mother = "Caroline" # This would work too to create a new key

# range
range(n) # 对应的值为[0,n) 
range(b,n) # 对应为[b,n)
range(b,n,s) # 对应为[b,n),每步进s
```
## 控制结构
``` python
for s in iterable:

for i in range(10):     # 对应的是：for(int i =0; i < 10; ++i)
for i in range(1,10):     # 对应的是：for(int i =1; i < 10; ++i)
for i in range(1,10,3):     # 对应的是：for(int i =1; i < 10; i+=3)
for i in range(10,0,-1):     # 对应的是：for(int i =10; i > 0; --i)

while i < n:
    i+=1

# 自定义迭代器，需要覆盖：_iter_init, _iter_next, _iter_get三个函数。
class ForwardIterator:
    var start
    var current
    var end
    var increment

    func _init(start, stop, increment):
        self.start = start
        self.current = start
        self.end = stop
        self.increment = increment

    func should_continue():
        return (current < end)

    func _iter_init(arg):
        current = start
        return should_continue()

    func _iter_next(arg):
        current += increment
        return should_continue()

    func _iter_get(arg):
        return current

# 自定迭代器的使用
var itr = ForwardIterator.new(0, 6, 2)
for i in itr:
    print(i) # Will print 0, 2, and 4

```

## 静态注解与类型转换
静态类型注解有助于整个编译器hint。当需要类型转换时，可使用`as`进行转换。

类型注解不可用于：
- Enum
- 数组成员
- for循环中变量类型
- 循环依赖的脚本中

## 鸭子类型：灵感来自于RUBY
常规静态语言中，实现“石头砸下，砸碎了路上的一切”，可能的实现为：
``` c++
void BigRock::on_object_hit(Smashable *entity) {
    entity->smash();
}
```
这样，所有能被砸碎的东西，都需继承自`Smashable`。人、敌人、家具、小石块都需继承`Smashable`，可能需要多重继承。如果不希望多重继承，则必须继承如Entity这样的类。但只有其中几个能被粉碎的话，在Entity中添加`smash()`方法并不优雅。

对于鸭子类型而言，要简单的多，只要实现了`smash()`，那么它就是可被粉碎的：
``` python
func on_object_hit(entity):
    if entity.has_method("smash"):
        entity.smash()

func heal(amount: int) -> void:
    hp += amount

```



## GDScript编码风格
* 使用4个大小的tab
* 如果是续行，缩进2次
* 函数和类定义之间，空2行
* 一行一条语句
* 表达式和条件语句中的括号，如无必要则去掉：`if is_colliding():`
* 运算符和逗号之后，使用空格隔开。不要使用列对齐。
* 类和节点命名，使用`PascalCase`方式：`const Rifle = preload('res://player/weapons/Rifle.gd')`
* 函数和变量：使用`snake_case`
* 虚拟方法（用户必须覆盖的函数）中，私有函数和私有变量之前前缀:`func _ready()`
* 信号：使用过去时`signal door_opened`,`signal score_changed`
* 常量：使用`const MAX_SPEED = 200`
* 节点建议添加类型提示，否则，所有节点均被编译器推断为Node：`onready var hp_bar: ProgressBar = get_node("UI/LifeBar")`

## 字符串操作
- 字符串占位符： 与C语言占位符类似
``` python
# %s, 作为字串占位符，占位符总是以%开始。
var str = "%s waiting for %s"
var actual_string = str % ["Amual" ,"Godot" ]
```
其他的占位符：
- c 单个unicode字符
- d 十进制整数
- o 八进制整数
- x 小写十六进制整数
- X 大写十六进制整数
- f 十进制实数
占位符前缀：
- + 加号
- 数字： 空格填充的
- . 精度
- - 右填充
- * 动态填充
string.format拥有类似C#中的占位符：` "{0} waiting for {1}".format(["Amual", 'Godot'])

# 项目组织方式：
将资源按照场景分组。例如：
> /project.godot
> /docs/.gdignore
> /docs/learning.html
> /models/town/house/house.dae
> /models/town/house/window.png
> /models/town/house/door.png
> /characters/player/cubio.dae
> /characters/player/cubio.png
> /characters/enemies/goblin/goblin.dae
> /characters/enemies/goblin/goblin.png
> /characters/npcs/suzanne/suzanne.dae
> /characters/npcs/suzanne/suzanne.png
> /levels/riverdale/riverdale.scn

# 最佳实践：
[参见](https://docs.godotengine.org/zh_CN/latest/getting_started/workflow/best_practices/what_are_godot_classes.html)
在Godot中，脚本和场景都对应OOP的类。最大的不同是：场景是描述型代码，而脚本包含命令型代码。