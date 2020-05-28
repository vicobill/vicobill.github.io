# C#语言参考

## C#基础

基本数据类型：byte,sbyte,short,ushort,int,uint,long,ulong,float,double,dcimal(128位十进制),bool,char,string;IntPtr,UIntPtr,object（所有类型的基类）; delegate（匿名函数类型）；

复合数据类型：数组[], enum, struct ,class,interface

流程控制语句：if..else, switch..case;while.., do..while,for,foreach

跳转语句：break,continue,goto,throw,return,yield

## C# 高级概念

* 泛型：用于强类型的通用编程，避免类型转换（通常转换为object后操作）带来的性能损失。如ArrayList 可以添加不同类型的数据，但这些数据都是转换成object之后进行存储，这通常用于异型集合。List<T>则是同型集合，更利于编译器的类型检查。

## 特殊关键字

### delegate

delegate：用于封装命名方法或匿名方法的**引用类型**-。

```c#
delegate T MathOp<T>(T a, T b);

public static int sum(int a,int b) { return a + b;}
public static int del(int a,int b) {return a - b;}

MathOp<T> op = new MathOp<int>(sum);

MathOp<T> multiOp = new MathOp<int>();
multiOp = sum + del;
op = multiOp - del;

public delegate void EventHandler(object sender,EventArgs e);
public event EventHandler RaiseEvent;

public delegate void EventHandler<T>(object sender,T e);
public event EventHandler<MyEventArgs> RaiseEvent;

```

在以下情况下，请使用委托：

- 当使用事件设计模式时。
- 当封装静态方法可取时。
- 当调用方不需要访问实现该方法的对象中的其他属性、方法或接口时。
- 需要方便的组合。
- 当类可能需要该方法的多个实现时。

在以下情况下，请使用接口：

- 当存在一组可能被调用的相关方法时。
- 当类只需要方法的单个实现时。
- 当使用接口的类想要将该接口强制转换为其他接口或类类型时。
- 当正在实现的方法链接到类的类型或标识时：例如比较方法。

### 修饰符列表

| 修饰符   | 作用                                                         |
| -------- | ------------------------------------------------------------ |
| async    | 可修饰方法、lambada表达式等。表明为异步方法。                |
| const    | 修饰变量为不可变。                                           |
| extern   | 外部实现的方法。如其他dll等。                                |
| static   | 声明属于类型本身而不是特定对象的成员。                       |
| unsafe   | 表明涉及到指针的操作。                                       |
| virtual  | 声明方法、属性、索引器、事件等，表示它们可在派生类中被重写。 |
| volatile | 指示一个字段可由多个同时执行的线程修改。                     |
| event    | 声明事件                                                     |
| override | 扩展或修改继承的方法、属性、索引器或事件的抽象或虚拟实现需要override修饰符。 |
| readonly | 1. 声明字段只读 2. 修饰struct是不可变的 3. 修饰方法返回的值是只读的。 |
| sealed   | 修饰类是不可被继承的。                                       |

访问修饰符：

| 关键字    | 作用               |
| --------- | ------------------ |
| public    | 访问不受限         |
| protected | 限于当前类或派生类 |
| private   | 限于当前类         |



语句关键字：

| 关键字                          | 作用                                         |
| ------------------------------- | -------------------------------------------- |
| if..else,switch..case           | 分支选择                                     |
| do..while,while,for,foreach..in | 迭代                                         |
| break,continue,return           | 跳转                                         |
| try..catch..finally, throw      | 异常                                         |
| checked,unchecked               | 检测结果溢出异常或不检测                     |
| fixed                           | 用在unsafe的上下文中，也可分配固定大小缓冲区 |
| lock                            | 线程互斥                                     |

参数关键字：

| 关键字 | 作用                                        |
| ------ | ------------------------------------------- |
| params | 数目可变的参数                              |
| in,out | 引用传递参数。in不可被修改，out必须被修改。 |
| ref    | 指示按引用传递的值                          |

命名空间关键字：

| 关键字    | 作用                                          |
| --------- | --------------------------------------------- |
| namespace | 声明命名空间                                  |
| using     | 1. 创建别名或导入命名空间 2. 定义域，自动释放 |

运算符关键字：

| 关键字 | 作用                                                         |
| ------ | ------------------------------------------------------------ |
| as     | 引用类型转换                                                 |
| await  | 应用于异步方法中的任务，在方法执行中插入挂起点，直至任务完成。 |
| is     | 检测类型是否相同                                             |
| new    | 1. 创建对象和调用构造函数 2. 隐藏基类成员的继承成员 3. 限制可能用作泛型声明中类型形参的实际参数。 |
| sizeof | 获取类型（简单数据类型，枚举，指针，结构体）大小             |
| typeof | 获取运行时类型                                               |

转换关键字：

| 关键字   | 作用                                                   |
| -------- | ------------------------------------------------------ |
| explicit | 必须显式转换                                           |
| implicit | 隐式转换                                               |
| operator | 重载内置运算符，或在类或结构生命中提供用户定义的转换。 |

访问关键字：

| 关键字 | 作用               |
| ------ | ------------------ |
| base   | 访问基类成员       |
| this   | 引用类的当前实例。 |

上下文关键字：

| 关键字     | 作用                                                        |
| ---------- | ----------------------------------------------------------- |
| add,remove | 自定义事件访问器                                            |
| get,set    | 访问器方法                                                  |
| global     | 全局命名空间                                                |
| partial    | 1. 将类、接口、结构拆分至多个文件 2. 将方法的声明与定义隔开 |
| when       | 筛选条件                                                    |
| where      | 泛型类型约束                                                |
| value      | set访问器的输入参数值                                       |
| yield      | 定义迭代器。返回类型必须是IEnumerable,IEnumerator           |



## 编程指南：

* 用using子句，替代try-finally语句

  ``` c#
  Font font1 = new Font();
  try {
      byte charset = font1.charset;
  }finally{
      if (font1 != null) {
          ((IDispose)font1).Dispose();
      }
  }
  
  using(Font font1 = new Font) {
      byte charset = font1.charset;
  }
  ```

* 使用对象初始设定项简化对象创建：

  ``` c#
  var ins = new ExampleClass{Name = "Desktop",ID=3773,Age = 24};
  ```

* 如果定义稍后不删事件处理，使用lambda

  ``` c#
  public Form() {
      this.Click += (s,e) {
        MessageBox.show(
            (MouseEventArgs)e).Location.ToString()));
      }
  }
  
  // 原始：
  public Form() {
      this.Click += new EventHandler(Form1Click);
  }
  void Form1Click(object s,EventArgs e) {
        MessageBox.show(
            (MouseEventArgs)e).Location.ToString()));
  }
  
  ```
