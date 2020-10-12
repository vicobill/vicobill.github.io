# 编码约定
编写代码归根结底，是编写文字的过程，与写作类似。通用的术语和通用的处理方式，能快速进行多人协作的融合。
## 前言
> 警告: 如果已经存在编码风格，请遵守原有编码风格。

编码风格的意义在于:
- 降低软件管理成本：软件的维护，基本以阅读代码为主
- 提升软件质量：软件同行审查主要检测代码缺陷。代码风格一致可让同行更易接纳、理解、吸收，提高缺陷审查过程效率。
- 降低软件复杂度：最小化代码复杂度的方式是——直接，而非高度抽象。这会产生容易阅读和遵循的最优代码，代码越复杂，越难找到隐藏错误。
- 易于重构：重构活动是软件维护行为，以修改代码来改善可读性和结构，不改变软件现有行为的改变，可视为重构。常见重构包括：改善变量名、函数名、移动整个类或分解大方法等。
- 任务自动化：典型的如通过注释来生成文档。
## 编程理念：
- 简洁、清晰
- 简单、直接
- 无原型。只做游戏。当你做时就打磨。不要依赖之
后的打磨。永远维护一份可发布的代码

- 当出现错误时回滚。游戏始终可运行对团队至关重要。

- 简洁。保持代码简洁。

- 关注工具。好的工具可帮助制作好的游戏。尽可能花时间在工具上。

- 立即修复BUG。当你看到bug时，你应修复它。不应让它继续，你不修复它，你们整个团队的代码基都会建立在BUG之上。

- Target less powerful systems. Use a superior development system than your target.

- 不要写未来的代码。只为你现在的游戏写代码！你将会编写新代码，因为你将会更聪明。

- 编写模块化代码。封装功能以确保设计一致性。这会极少出错并节约设计时间。

- 透明编程。尝试编码透明性。准确告诉你的上司和同僚你将如何解决当前任务并获得反馈与建议。不要把游戏编程当成每个编码人员都在一个黑盒子里。否则项目会脱线并延迟。

- 拥抱变化。编程是逻辑创意性艺术。每个编码者都不同并且编写不同的代码。



## 约定基本准则：

* 代码: 编写一次，阅看无数次。所以，清晰明了是编写代码的第一准则。
* 团队代码: 注重协作。因此遵守约定俗成的规则，有利于他人顺利与自己协作。
* 代码功能管理: 应做到自己管理自己，各家自扫门前雪。只公开该公开的，无需公开的，尽量不公开。

## 术语：

* 驼峰(camelCase)命名法：首字母小写，其他单词首字母大写，如骆驼一般。例如 `camelCaseVariableName` 
* 帕斯卡(PascalCase)命名法：所有单词首字母大写。例如 `PascalCaseClassName` 
* 蛇形(snake_case)命名法：所有单词全小写，以下划线连接单词，如一条蛇一样。例如 `snake_case_function_name` 
* 尖叫蛇(SCREAM_SNAKE_CASE)命名法：是蛇形命名法的大写形式，所有字母皆大写，常用于常量、宏等不可变的地方。
* 蜈蚣(centipedecase)命名法：所有单词全部小写，且没有下划线连接。例如 `centipedecasenamespacename` 

### 通用命名方式：
#### 基本准则
* 定义变量应尽可能近。如只在if表达式中用到的变量，最好放在if中，而不是其外。
* **避免**使用魔数
* **避免**使用可修改的全局变量。全局变量应只读。
* 函数名字要简洁、清晰，言简意赅。

#### 命名方式
* 类或类型：采用 `PascalCase` 
* 变量：采用 `camelCase` 。变量名应具描述性，类似`firstName`或`homeworkScore`。
* 私有成员函数/变量，前缀`_`,`_likeThis` & `_like_this`
* 包和模块：在语言中，通常为namespace, package, module等概念
    - 在静态语言中，如C++，C#的namespace，使用 `PascalCase` ;
    - 在动态语言中，如Ruby，Python，使用 `centipedecase` ，而且常使用缩写。
* 文件：用于资源表示。通常非常自由，但为了方便起见，通常采用全小写形式，并附加连词符( `.` , `_` , `-` 等)。如： `png-file-name.png` , `jpg_file_name.jpg` ， `gif.file.name.gif` 等。
    - 有些语言的文件名直接对应了语言中的 `模块` 概念，则依照 `包和模块` 的命名方式命名。
 
### 代码标记

* 使用 `TODO` 标题描述 漏掉的功能或打算加入的新特性
* 使用 `FIXME` 标题描述 需要被修复的有问题代码
* 使用 `OPTIMIZE` 标题描述 可能有性能瓶颈, 需要优化的代码.
* 使用 `HACK` 标题描述 感觉上需要重构的代码
* 使用 `REVIEW` 标题描述 关键性代码, 需要稍后不断的检查该代码是否工作正确.
* 使用 `WARN` 标题描述 需要注意的代码或说明

## 通用规则：

### 空格和缩进

* 使用 `空格` 缩进。每次缩进为4个空格符号。(tab size:4 space)
* 运算符(+, -, *, /, <<, >> , >, <, 等)前后，使用空格分隔。如<font color=green> `int x = a + b;`</font> 而非：<font color=red> `int x=a+b;` </font>

- 代码块开始标记`{`不单独放置在单行

  ```
  if (a == b) {
      foo();
  }
  ```

- 超过110字符长度单行，需要分行

  ```c
  int result = reallyLongFunctionOne() + reallyLongFunctionTwo() + 
          reallyLongFunctionThree() + reallyLongFunctionFour();
  
  int result2 = reallyLongFunction(parameterOne, parameterTwo, parameterThree,
          parameterFour, parameterFive, parameterSix);
  ```

* 函数参数之间，使用空格进行分隔。如：<font color=green> `void sum(int a, int b);`</font> ，而不是<font color=red> `void sum(int a,int b)` </font>

- 表达式操作符与操作数之间添加空格

  ```c
  int x = (a + b) * c / d + foo();
  ```


- 函数之间，添加空行

  ```c
  void foo() {
      ...
  }
                            // 空一行
  void bar() {
      ...
  }
  ```

### 命名前后缀的使用：

前后缀能快速避免命名冲突，而且常附带其他信息，因此可以善用，但不能滥用。原则仍然是简洁、清晰为上。

* 前缀：通常用来描述成员的某些限定。
    - 小写前缀： 通常用来快速区分成员（特指数据成员）限定。
        > 例如：
        >
        >  `s_` 描述`static`限定
        > 
        >  `k_` 描述`const`限定
        > 
        >  `g_` 描述`global`限定
        > 
        >  `m_` 描述`member`限定
        > 
    - 大写前缀： 通常用来描述类的类型
    - `_`下划线前缀： 通常用来描述`private`访问权限


* 后缀：通常用来描述其用途。
    - 数字后缀：简单用作资源区分
    

### 特殊数值

* 最大行宽*110*个字符。超过80个字符，要断行。
* if嵌套，不可超过3层。
* 嵌套类声明，不可超过3层。
* 单个函数，最长不可超过30行。
* 既然是缩写，则最长不可超过5个字符。

### 单词缩写使用规则：
单词所写有助于简化代码审查者的视觉疲劳，特别是非英语母语国家程序员。代码只要有简短注释，即可对缩写的单词有个清晰的认识。否则就如流传的Object-C笑话一样(老太太的裹脚布)

* 取首-中-尾3个字符：如果单词太长，取中间读音相似的3个字母，如 `manager` ， 取 `mgr` 
* 取单词前3-5个字符：如 `initialize` ，取 `init` ； `response` 取 `resp` 
* 取多个单词的首字母，组合成2-5个字符的缩写：如 `HyperText Transfer Protocol` ，取 `http` 
* 当使用缩写时，建议使用国际通用的缩写方式。如果是公开给别人使用的，如类名，公有函数名等，要么不使用缩写，要么使用国际通用缩写。对于私有函数或内部使用的变量名，依照上述3种规则，进行缩写。

### 语句与表达式

- for多用于已知循环次，while多用于未知循环次

- 在循环中，*尽可能*不使用`break`和`continue`

- 避免多余和不必要的分支判断
- 如果重复相同的代码多次，找到方法删除冗余代码，使其只有一次。例如，可放入辅助函数。如果重复的代码几乎但不完全相同，尝试让辅助函数以参数表示不同部分。

- 将公共代码移出if/else语句，以避免重复

- 如果单个函数很长（>50行），可将其分成更小的子函数。如果函数功能用`和`来描述，则表明要分解成小函数了。
- 将调用结果放在中间变量中，以减少再次调用消耗。

- 代码尽可能保持自解释，自解释不了，就要详细注释

- 尽可能使用前置声明
- 传入的参数，尽量保持其不变性。

- 使用字段存储对象的重要数据，但不存储仅在单个函数使用的临时变量。

- 把与概念不相关的功能，设为辅助函数或分拆至辅助模块。
## Unity C# 编码约定

### 命名风格

* 公开或保护变量名： `likeThis` ；非公开（`private`）变量名： `_likeThis` 
<!-- * Unity需从Inspector赋值的变量： `m_likeThis`  -->
* 常量和readonly变量： `LIKE_THIS` 
* 公开或保护函数名： `DoLikeThis` ；非公开函数： `_DoLikeThis` 
* 事件和属性: 在C#中它们都是函数集合，且往往是公开的：`LikeThis`。Event后缀 `Event` ，
* 类型统一使用： `CamelCase` 。接口类型前缀 `I` , 抽象类型前缀 `A` , 枚举类型前缀 `E` ，结构体类型前缀 `S` 
* 继承后，统一后缀：Delegate后缀 `Delegate` ，Attribute后缀 `Attribute` ，ScriptableObject后缀 `Scriptable` 
* 内部(非网络)事件处理函数，前缀`On`。网络事件回调函数`Handle`。

### 代码块

* 访问限定排序：
    - 最上部为静态、常量类型。`static, const, static readonly`
    - 其次为：公开变量和公开属性和保护变量和保护属性。`public, protected`
    - 接着为：公开函数和保护函数。` public func, protected func`
    - 再次为：受保护或私有类型。`protected,  private`
* 嵌套类，应紧随着使用的函数块部分。

### 杂项

* 代码中使用尾随大括号，即：左大括号，不换到新行
* 代码块间注释，使用： `// =========== 简短注释内容 =========== ` ， 不建议使用 `#region #endregion` 
* 继承自MonoBehaviour的脚本名，应与挂载的Unity场景中的GameObject 的名称一一对应，便于查找和出错返工。如 `Player.cs` 脚本应挂在 `Player` 对象上。

代码风格示例：
```C#

public interface IMovable {

    void Move();

}

public enum EGender : byte {

    Natural = -1,
    Female = 0,
    Male = 1

}

public class Player : MonoBehaviour, IMovable { 

    // 最开始为静态变量
    public static Player instance;

    // 常量
    public readonly INIT_GOLD = 20;
    public const MAX_HP = 100;
    
    // Unity 可检索（显示在Inspector中）部分
    public GameObject m_playerPrefab;
    public Image m_avatarIcon;
    
    // 公开变量
    public int hp;
    public int gold;
    public EGender gender;
    
    // 私有变量
    private int _id;

    private Camera _camera;
    
    // 函数部分
    public void AddGold(int n) {
        gold += n;
    }

    // =========== 通关记录 ===========

    // 嵌套类，应紧挨着使用的地方
    public class LevelRecord {
        public int level;
        public int stars;
    }    
    public void AddLevelRecord(LevelRecord lr) {
        // TODO:
    }

}
```

### 其他规则：

* public static , 配置型代码，抽出来，放到static类
* 单例类，统一使用 `Instance` 名称进行访问，如 `ModuleMgr.Instance` 
* Unity的MonoBehaviour脚本挂载，只挂第一、二级GameObject以及Prefab根GameObject上。
* 脚本只有一个功能，并能化成函数时，删除，改成函数，并合并至与之相关的脚本中。如，Player挂了另外2个脚本，PlayerMove, PlayerFire。PlayerMove和PlayerFire分别处理玩家的移动和玩家开火，那么完全可合并至Player脚本中。


## Lua编码规范：
在Lua中，只有一个table数据结构，类的实现是通过table进行模拟，因此虽然实质一样，但概念不同时，仍需不同对待。
- 类型名： `PascalCase`
- 变量名：`camelCase`
- 函数名：函数名这里不采用C#中的规定，因为在Lua脚本中，并不能直观感受函数是本地函数，还是全局函数，还是成员函数。
    - 对于C#导出到lua的函数，采用C#函数命名方式：`PascalCase`
    - 对于lua脚本中定义的函数，即原生lua函数，使用`snake_case`
    - 对于lua类私有成员函数和变量，前缀`_`的`snake_case`。（虽然lua中所有函数都是公开的，但从概念上而言，如不期望其他类调用，则将其视为内部成员函数）
- local函数，前缀`_`的`snake_case`
- 作用于本文件的local变量，为前缀`s_`的`camelCase`

- 示例代码：
```lua 
-- 模拟类的创建，创建新类UIPanel
UIPanel = UIBase.New(...)

local this = UIPanel
-- 模拟C#中的static变量
local s_player

-- 模拟C#中的公开成员函数，统一的消息响应
function UIPanel:OnInit(player) 
    self.player = player 
    s_player = player 
end 

-- 本地local函数
local function _print_player_name()
    print(s_player.name)
end

-- lua脚本原生函数，公开成员函数
function UIPanel:on_click_close()
    local time = os.time() 
    print(time)
    destroy(self.gameObject)
end 

-- lua原生函数，私有成员函数，不会在外部调用，只在此脚本内部调用
function UIPanel:_set_player_name_text()
    this.transform:Find("Player/Name").gameObject:GetComponent("Text") = s_player.name 
end 

```
