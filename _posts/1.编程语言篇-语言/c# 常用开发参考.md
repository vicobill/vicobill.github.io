c#程序：
    程序：定义类型，包含成员，可以组织在命名空间中。
    类型：类和接口是示例类型。
    成员：属性，函数，字段以及事件是示例成员。
    汇编：当c#程序被编译，它们汇编在一起exe或dll。

类型和变量：值类型和引用类型：
    值类型：
        sbyte,short,int,long,
        byte,ushort,uint,ulong,
        char,
        float,double,
        decimal,
        bool
        enum E{...}
        struct S{...}
        null
    引用类型：
        object,string,
        class C{...}
        interface I{...}
        <T>[],<T>[,]
        delegate <T> D(...)
自定数据类型：
    class,enum,interface,struct,delegate

    class 支持单继承与多态，派生类可以扩展和特例化基类。
    struct包括数据和函数成员，但不需要堆分配，不支持继承。
    interface定义契约，包含一系列公共函数成员。可被多重继承或实现。
    delegate代表方法的引用，可被当做参数传递和分配给变量。类似函数指针。
    以上4种都支持泛型。

表达式：
    由运算符和操作对象构成。
    操作符：
        .       成员访问
        x(),x[],x++,x--,new T(),
        new T(){}    创建并初始化
        new {}  匿名初始化
        typeof(T)  获取类型
        checked(x),unchecked(x) 在检测或非检测环境下求值
        default(T)  获取类型的初始值
        delegate{} 匿名函数（匿名方法）
        (T)x    类型转换
        await x     异步等待x结束
        x is T      判断x是否是T类型
        x as T      以T形式返回x，否则为null
        (T x) => y      匿名函数（Lambda表达式）


语句：
    块： {}
    声明语句：声明局部变量和常量
    表达式语句：用于表达式求值。函数调用，new，赋值=，++，--等操作以及await
    选择语句：if，switch
    迭代语句：while,do,for,foreach
    跳转语句： break,continue,goto,throw,return,yield
    try..catch..finally：异常捕获
    checked,unchecked:用于检测整数计算溢出气你概况
    lock: 获取互斥锁，执行语句，然后释放锁。
    using：获取资源，执行语句，然后销毁资源。

类和对象：
    类结合了状态和行为而成一个单元。

    成员：
        常量    类关联的常量
        字段    类的变量
        方法    类能执行的计算和行为
        属性    类的行为相关可读写的属性
                int Count { get { return _count;}set {_count = value;}}
        索引    可索引类实例的相关行为
                T this[int index] {
                    get { return items[index];}
                    set {items[index] = value;}
                }
        事件    类能生成的通知
                event EventHandler Changed;
        运算    类支持的运算
        构造    实例或类初始化行为
        析构    实例销毁之前的行为
        类型    嵌套类型

    访问：
        public      不限定
        protected   此类或子类
        internal    此程序
        protected internal 此程序或子类
        private     此类

    继承意味着隐式包含基类所有成员，除了实例和静态构造器，以及基类的析构器。
    子类型可隐式转换成基类型，也即：基类型变量可引用此类或子类的实例。

    字段：
        static字段，它只有存储位置，无论有多少个实例，也只有一份static字段
        实例字段，则会在每个实例都有一份独立副本。
    方法：
        static方法通过类访问，实例方法通过实例访问。
        
        方法签名必须是唯一的。方法签名包括：函数名，类型参数数量，以及参数数量、修饰、类型。方法签名不包含返回值类型。

        参数用于传递值或变量引用。有4种参数：
            值参数，引用参数(ref)，输出参数(out)，以及参数数组/不定参数(params [])。
    
        虚方法：当调用虚方法时，会确定实例的运行时类型并调用确定的实现。
        非虚函数：当调用时，实例的编译时类型是决定性因素。
        虚方法可被派生类override（签名相同）。虚方法声明引入新的方法，override方法声明特例化已存在的继承的virtual方法以提供新的实现。
        abstract方法是虚方法，但没有实现。只能在abstract类中存在。

属性System.Attribute：
    类型，成员以及其他实体支持修饰。

unsafe：用于操作指针
