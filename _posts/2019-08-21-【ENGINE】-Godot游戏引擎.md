---
layout: post
title: 【ENGINE】Godot游戏引擎
categories: engine, godot
date: 2019-08-21 11:46:37 +0800
---

# 前提

## 编译源代码

1. 从国内镜像地址下载 `git clone -b 3.1 https://gitee.com/mirrors/godot.git`
2. 安装 python，并添加至 PATH
3. 安装 SCons:`pip install scons`
4. 安装 Visual studio 或 mingw
5. 使用 Scons 编译源代码： `scons p=windows -j8`。 将会在`bin`目录下生成目标平台可执行文件。
   > scons 参数：可通过 scons --help 了解。
   >
   > bits=default/32/64 目标平台的位数
   >
   > platform/p=android/javascript/server/windows/x11 编译的目标平台
   >
   > target=debug/release_debug/release 用于目标文件的构建，建议使用 release_debug
   >
   > tools=yes/no 是否构建工具。如果不包括编辑器和项目管理器，则不启用，可使构建得到的二进制更小。
   >
   > use_mingw=yes use_lto=yes 用于指定构建的编译器，并使二进制更小更快
   > vsproj=yes 可使用 VisualStudio 开发，以自添加 C++模块扩展引擎

通常如果需要裁切包体大小，可选择：

> scons target=release optimize=size use_lto=yes deprecated=no disable_3d=yes disable_advanced_gui=yes module_visual_script_enabled=no
> scons p=windows target=release tools=no module_bmp_enabled=no module_bullet_enabled=no module_csg_enabled=no module_dds_enabled=no module_enet_enabled=no module_etc_enabled=no module_gdnative_enabled=no module_gridmap_enabled=no module_hdr_enabled=no module_mbedtls_enabled=no module_mobile_vr_enabled=no module_opus_enabled=no module_pvr_enabled=no module_recast_enabled=no module_regex_enabled=no module_squish_enabled=no module_tga_enabled=no module_thekla_unwrap_enabled=no module_theora_enabled=no module_tinyexr_enabled=no module_vorbis_enabled=no module_webm_enabled=no module_websocket_enabled=no

### linux 平台下编译：

```bash
pacman -S scons pkgconf gcc libxcursor libxinerama libxi libxrandr mesa glu alsa-lib pulseaudio yasm

scons -j8 platform=x11 use_llvm=yes target=release_debug
```

## 构建导出模板：

```shell
scons platform=android tools=no android_arch=armv7
scons platform=<platform> tools=no android_arch=arm64v8
scons platform=<platform> tools=no android_arch=x86

cd platform/android/java
./gradlew build


将目标文件拷贝到$HOME/.local/share/godot/templates/[gd-version]/linux_x11_<32|64|_<debug|release>
```

并将目标文件，copy 至`%APPDATA%/Godot/templates/<version>/windows_<32|64>_<debug|release>.exe`。在 Godot 引擎导出选项中，`Custom Template`中选择此文件。

## 从 linux 交叉编译：

> pacman -S mingw-w64 并确保 mingw-64 在 PATH 中。如无：export MINGW32_PREFIX="/path/to/i686-w64-mingw32-"
> user@host:~$ ${MINGW32_PREFIX}gcc --version 进行验证

## 导出到 Android：

1. 安装 Android SDK ,JDK
2. 设置 ANDROID_HOME,ANDROID_NDK_ROOT,ANDROID_NDK_HOME,JAVA_HOME
3. 创建一个 debug.keystore: `keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999` 或者创建一个正式 keystore:`keytool -v -genkey -v -keystore mygame.keystore -alias mygame -keyalg RSA -validity 10000`
4. 在 Godot 的 Editor Settings 的 Export 栏下，设置 Android 设置。abd 目录%ANDROID_SDK_HOME%/platform-tools/; jarsigner:%JAVA_HOME%/bin/

## 脚本加密

openssl enc -aes-256-cbc -k secret -P -md sha1 > godot.gdkey

## vscode 编辑器设置

安装 godot-tools，将 Godot 编辑器的外部设置勾选，选定为 vscode，并 exec flag 设置：`{project} --goto {file}:{line}:{col}`

# GDScript

GDScript 类似 Boo，Python。

## 基本语法

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

基本类型(int,float,string,vector)通过传值调用，其他所有作为引用传递。继承自 Reference 的类会自动释放，继承自 Object 的类，则允许手动释放。

## 复合数据结构：

```python
# 数组
var arr = []
arr.append(4)
arr.resize(5)
arr.pop_front()

var a = 20
if a in [10,20,30]:
    print("Winner")
elif:
    print("Loser!")
else:
    print("do'nt know!")



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

```python
# 条件判断
var paid = false
var x = 9.9 if paid else 1.0

if i > 10:
elif:
else:

# 匹配
match x:
    1:
        print("1")
        continue    # fallthrough
    2:
        print("2")
    "test":
        print("test")
    _:
        print("other")
    var v:
        print("v is ", v)
    [var start,_,"test"]:
        print("匹配数组")
    [42,..]:
        print("匹配开放结尾数组")
    {"name": "Dennis", "age": var age}:
        print("匹配Dennis，取其年龄", age)
    1,2,3:
        print("多匹配")



for s in iterable:

for i in range(10):     # 对应的是：for(int i =0; i < 10; ++i)
for i in range(1,10):     # 对应的是：for(int i =1; i < 10; ++i)
for i in range(1,10,3):     # 对应的是：for(int i =1; i < 10; i+=3)
for i in range(10,0,-1):     # 对应的是：for(int i =10; i > 0; --i)
for i in 3: # 类似 for i in range(3)
for i in 2.2: # 类似 for i in range(ceil(2.2))

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

静态类型注解有助于整个编译器 hint。当需要类型转换时，可使用`as`进行转换。

类型注解不可用于：

- Enum
- 数组成员
- for 循环中变量类型
- 循环依赖的脚本中

## 鸭子类型：灵感来自于 RUBY

常规静态语言中，实现“石头砸下，砸碎了路上的一切”，可能的实现为：

```c++
void BigRock::on_object_hit(Smashable *entity) {
    entity->smash();
}
```

这样，所有能被砸碎的东西，都需继承自`Smashable`。人、敌人、家具、小石块都需继承`Smashable`，可能需要多重继承。如果不希望多重继承，则必须继承如 Entity 这样的类。但只有其中几个能被粉碎的话，在 Entity 中添加`smash()`方法并不优雅。

对于鸭子类型而言，要简单的多，只要实现了`smash()`，那么它就是可被粉碎的：

```python
func on_object_hit(entity):
    if entity.has_method("smash"):
        entity.smash()

func heal(amount: int) -> void:
    hp += amount

```

## 导出

类成员可被导出，由编辑器编辑。语法：

```py
# If the exported value assigns a constant or constant expression,
# the type will be inferred and used in the editor.

export var number = 5

# Export can take a basic data type as an argument, which will be
# used in the editor.

export(int) var number

# Export can also take a resource type to use as a hint.

export(Texture) var character_face
export(PackedScene) var scene_file
# There are many resource types that can be used this way, try e.g.
# the following to list them:
export(Resource) var resource

# Integers and strings hint enumerated values.

# Editor will enumerate as 0, 1 and 2.
export(int, "Warrior", "Magician", "Thief") var character_class
# Editor will enumerate with string names.
export(String, "Rebecca", "Mary", "Leah") var character_name

# Named Enum Values

# Editor will enumerate as THING_1, THING_2, ANOTHER_THING.
enum NamedEnum {THING_1, THING_2, ANOTHER_THING = -1}
export (NamedEnum) var x

# Strings as Paths

# String is a path to a file.
export(String, FILE) var f
# String is a path to a directory.
export(String, DIR) var f
# String is a path to a file, custom filter provided as hint.
export(String, FILE, "*.txt") var f

# Using paths in the global filesystem is also possible,
# but only in tool scripts (see further below).

# String is a path to a PNG file in the global filesystem.
export(String, FILE, GLOBAL, "*.png") var tool_image
# String is a path to a directory in the global filesystem.
export(String, DIR, GLOBAL) var tool_dir

# The MULTILINE setting tells the editor to show a large input
# field for editing over multiple lines.
export(String, MULTILINE) var text

# Limiting editor input ranges

# Allow integer values from 0 to 20.
export(int, 20) var i
# Allow integer values from -10 to 20.
export(int, -10, 20) var j
# Allow floats from -10 to 20, with a step of 0.2.
export(float, -10, 20, 0.2) var k
# Allow values y = exp(x) where y varies between 100 and 1000
# while snapping to steps of 20. The editor will present a
# slider for easily editing the value.
export(float, EXP, 100, 1000, 20) var l

# Floats with Easing Hint

# Display a visual representation of the ease() function
# when editing.
export(float, EASE) var transition_speed

# Colors

# Color given as Red-Green-Blue value
export(Color, RGB) var col # Color is RGB.
# Color given as Red-Green-Blue-Alpha value
export(Color, RGBA) var col # Color is RGBA.

# Another node in the scene can be exported, too.
export(NodePath) var node

# Individually edit the bits of an integer.
export(int, FLAGS) var spell_elements = ELEMENT_WIND | ELEMENT_WATER

# Set any of the given flags from the editor.
export(int, FLAGS, "Fire", "Water", "Earth", "Wind") var spell_elements = 0

# Exported array, shared between all instances.
# Default value must be a constant expression.

export var a = [1, 2, 3]

# Exported arrays can specify type (using the same hints as before).

export(Array, int) var ints = [1,2,3]
export(Array, int, "Red", "Green", "Blue") var enums = [2, 1, 0]
export(Array, Array, float) var two_dimensional = [[1.0, 2.0], [3.0, 4.0]]

# You can omit the default value, but then it would be null if not assigned.

export(Array) var b
export(Array, PackedScene) var scenes

# Typed arrays also work, only initialized empty:

export var vector3s = PoolVector3Array()
export var strings = PoolStringArray()

# Regular array, created local for every instance.
# Default value can include run-time values, but can't
# be exported.

var c = [a, 2, 3]
```

## 信号

信号是对象发出消息的工具，以让其他对象响应。信号是回调机制，也是观察者模式。例如：

```py
# 在Game.gd中
func _ready():
   var character_node = get_node('Character')
   var lifebar_node = get_node('UserInterface/Lifebar')

   character_node.connect("health_changed", lifebar_node, "_on_Character_health_changed")

# 在Role.gd中
signal health_changed

func take_damage(n):
    var old_hp = hp;
    hp -= n

    emit_signal("health_changed", old_hp, hp)


# 在Lifebar.gd中
func _on_Character_health_changed(old_value, new_value):
    if old_value > new_value:
        progress_bar.modulate = Color.red
    else:
        progress_bar.modulate = Color.green

    # Imagine that `animate` is a user-defined function that animates the
    # bar filling up or emptying itself
    progress_bar.animate(old_value, new_value)

```

## yield：让权函数

可将当前函数执行权让出。yield 包含两个参数：(object, signal)。例如

```py
func my_func():
    yield(button_func(), "completed")
    print("All buttons were pressed, hurray!")

func button_func():
    yield($Button0, "pressed")
    yield($Button1, "pressed")
```

## 内置数据类型：

- null, true,false
- int,float
- String
- Vector2,Rect2,Vector3
- Transform2D : 3x2 矩阵
- Plane: 平面，包含法线：normal 和距离：d
- Quat：四元组，表示 3D 旋转
- AABB：包围盒
- Basis：3x3 矩阵
- Transform: 3D 变换，包含 basis 和 origin
- Color:
- NodePath:编译过的节点路径，主要用于场景系统中。本身是一个字串
- RID: ResourceID
- Object： 一切类的基类
- Array： 任意类型数组集合
- Pool[Byte|Int|Real|String|Vector2|Vector3|Color]Array: 同类型数组
- Dictionary：

### 附：关键字列表

| 关键字                                                | 作用                                 |
| ----------------------------------------------------- | ------------------------------------ |
| if,elif,else                                          | 条件判断                             |
| match                                                 | 模式匹配                             |
| for,while                                             | 循环                                 |
| break,continue                                        | 跳转                                 |
| pass                                                  | 用于暂无实现代码的函数结构           |
| return                                                | 从函数返回值                         |
| class                                                 | 定义类                               |
| extends                                               | 扩展类                               |
| is                                                    | 变量是否扩展自指定类或给定的内置类型 |
| in                                                    | 内容测试                             |
| and ,not, or                                          | 逻辑判断                             |
| as                                                    | 尝试类型转换                         |
| self                                                  | 当前类实例                           |
| tool                                                  | 在编辑器中执行脚本                   |
| signal                                                | 定义信号                             |
| func                                                  | 定义函数                             |
| static                                                | 定义静态函数                         |
| const                                                 | 定义常量                             |
| enum                                                  | 定义枚举                             |
| var                                                   | 定义变量                             |
| onready                                               | 当脚本附着到节点时，初始化一次       |
| export                                                | 导出类成员，可被编辑器编辑。         |
| setget                                                | 定义变量的 setget 函数               |
| breakpoint                                            | 编辑器辅助的调试器断点               |
| preload                                               | 预加载类或变量                       |
| yield                                                 | 协程支持                             |
| assert                                                | 断言                                 |
| remote,master,puppet,remotesync,mastersync,puppetsync | 网络 RPC 相关                        |
| PI,TAU,INF,NAN                                        | 数学辅助常量                         |
| null,true,false                                       | 默认类型                             |

### 附：字面量：

- """ : 多行字串
- @"Node/Label" : NodePath 或 StringName
- \$NodePath: get_node("NodePath")的缩写

## GDScript 代码结构

- 代码入口点：

内置函数都前缀下划线`_`

```python
_ready : 这是由引擎调用的，当每个节点进入场景树时自动调用，也可自定义覆盖此函数
_process(dt) ： 这由引擎调用，每帧调用

_enter_tree: 进入场景树时调用
_exit_tree: 退出场景树时调用
_physics_process: 处理物理模拟

_init: 类的构造函数
```

- 函数引用：在 GD 中，不是第一类对象，即函数不可存于变量、作为参数传递、由其他函数返回。这是为了性能考虑。在运行时引用函数名称（如存于变量、作为参数传递—），应使用 call 或 funcref 辅助：

```py
# Call a function by name in one step.
my_node.call("my_function", args)

# Store a function reference.
var my_func = funcref(my_node, "my_function")
# Call stored function reference.
my_func.call_func(args)
```

## GDScript 编码风格

- 使用 4 个大小的 tab
- 如果是续行，缩进 2 次
- 函数和类定义之间，空 2 行
- 一行一条语句
- 表达式和条件语句中的括号，如无必要则去掉：`if is_colliding():`
- 运算符和逗号之后，使用空格隔开。不要使用列对齐。
- 类和节点命名，使用`PascalCase`方式：`const Rifle = preload('res://player/weapons/Rifle.gd')`
- 函数和变量：使用`snake_case`
- 虚拟方法（用户必须覆盖的函数）中，私有函数和私有变量之前前缀:`func _ready()`
- 信号：使用过去时`signal door_opened`,`signal score_changed`
- 常量：使用`const MAX_SPEED = 200`
- 节点建议添加类型提示，否则，所有节点均被编译器推断为 Node：`onready var hp_bar: ProgressBar = get_node("UI/LifeBar")`

## 字符串操作

- 字符串占位符： 与 C 语言占位符类似

```python
# %s, 作为字串占位符，占位符总是以%开始。
var str = "%s waiting for %s"
var actual_string = str % ["Amual" ,"Godot" ]
```

其他的占位符：

- c 单个 unicode 字符
- d 十进制整数
- o 八进制整数
- x 小写十六进制整数
- X 大写十六进制整数
- f 十进制实数
  占位符前缀：
- - 加号
- 数字： 空格填充的
- . 精度
- - 右填充
- - 动态填充
    string.format 拥有类似 C#中的占位符：` "{0} waiting for {1}".format(["Amual", 'Godot'])

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

<!-- [参见](https://docs.godotengine.org/zh_CN/latest/getting_started/workflow/best_practices/what_are_godot_classes.html) -->

在 Godot 中，脚本和场景都对应 OOP 中的类。最大的不同是：场景是描述型代码，而脚本包含命令型代码。即：以文件存储的类，被当作资源。在其他类中访问它们，必须从磁盘载入。可使用`load`和`preload`函数。实例化加载的类资源，通过调用`new`函数实例化：

```py
# 当调用load()时加载类资源
var my_class = load("myclass.gd")
# 在编译时只预加载类一次
const MyClass  = preload("myclass.gd")

func _init():
    var a = MyClass.new()
    a.some_func()
```

Godot 提供内置类，从技术角度而言，用户创建的类型，并非类。取而代之的是，它们是资源，告知引擎执行对内置类的一系列初始化。

Godot 内部类注册至`ClassDB`。此数据库提供运行时访问类信息的功能。`ClassDB`包含类的信息：

- 属性
- 方法
- 常量
- 信号

当执行访问属性或调用函数这样的操作时，会从`ClassDB`中检测这项纪录，以确保当前操作是否被支持。在引擎方面，每个类定义了静态的`_bind_methods`函数以描述注册哪些 C++内容以及如何注册到数据库中。当使用引擎时，可通过附着脚本到节点，以扩展方法、属性、信号。

对象先于数据库检测它们附着的脚本，这也是为什么脚本能覆盖内置函数。如果脚本定义了`_get_property_list()`方法，Godot 将会附加此属性至从 ClassDB 中找到的对象属性列表中。这也适用于描述型代码。

即使脚本不是继承自内置类型，如，脚本不以`extends`开头，隐式继承自`Reference`，则此脚本也可实例化，但不能附加到节点上。

场景和脚本都是对象，最常用的情形是，脚本附着在场景的根节点，用于控制场景中的子节点。即可以这样理解，场景通常是脚本的描述型代码的扩展。场景的内容，用于辅助定义：

- 哪些节点可供脚本使用
- 它们被如何组织起来
- 它们怎么被初始化
- 每个节点都连接到哪些信号
  场景也通常是脚本附着于根节点的扩展。你可看到，场景包含的所有节点都作为单独类的一部分。所有的概念都基于此。
