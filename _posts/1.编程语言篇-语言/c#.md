# C#

## 术语：

* 类型Type/Class：数据类型，通常由：数据、方法集组成。类似于蓝图，指定该类型可以进行哪些操作。
* 对象Instance/Object：类型的实例，可存储再命名变量、数组或集合中。
* 结构Struct：单纯进行数据布局。

* 语句Statement：单行代码，或{}包含的代码块。

* 表达式Expression：表达式是由一个或多个操作数以及零个或多个运算符组成的序列，其计算结果为一个值、对象、方法或命名空间。 表达式可以包含文本值、方法调用、运算符及其操作数，或简单名称。 简单名称可以是变量名、类型成员名、方法参数名、命名空间名或类型名。
  表达式可以使用运算符（运算符又可使用其他表达式作为参数）或方法调用（方法调用的参数又可以是其他方法调用），因此表达式可以非常简单，也可以极其复杂。
* 字段Field：成员变量。字段分静态字段和实例字段。
* 属性Property: 是访问器(get,set)的特殊方法。似字段，但是get,set方法集合。



## Delegate:委托，函数类型

delegate 修饰后面的函数签名，定义函数类型。委托可理解为特定逻辑的执行，交给了其他函数来执行。

``` c#
delegate TResult Func<in T,out TResult>(T arg);
delegate void Action<in T>(T obj);
delegate bool Predicate<in T>(T obj);

```

C#内置委托类型：

* Func<>： 通常用于将委托参数转换成其他结果时。
* Action<>：用于需要使用委托参数执行操作的情况。
* Predicate<>：用于需要确定参数是否满足委托条件的情况。

c#支持匿名委托：

``` c#
var result = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8 }
            .FindAll(delegate (int no)
                     {
                         return (no % 2 == 0);
                     });
```

匿名委托也可写成lambda表达式：

``` c#
var result = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8 }
            .FindAll(i => i % 2 == 0);
```

## Event: 事件

事件基于委托模型。委托模型遵守观察者设计模式，使订阅者能够向提供方注册并接收相关通知。 事件发送方推送事件发生的通知，事件接收器接收该通知并定义对它的响应。

## 异步

异步代码的特点：

- 等待 I/O 请求返回的同时，可通过生成处理更多请求的线程，处理更多的服务器请求。
- 等待 I/O 请求的同时生成 UI 交互线程，并通过将长时间运行的工作转换到其他 CPU 核心，让 UI 的响应速度更快。

C#中推荐使用基于任务的异步模型（还有基于事件的异步，不推荐），使用async/await关键字，以Task（任务）为基础，实现基于Promise(future,delay,deferred)的异步模型。即，承诺此操作会被执行。

每个异步操作，都会生成Task对象，Task对象可由c#内部管理的线程池分配线程进行工作。

async 声明此函数是异步操作函数；await将任务添加到线程池去工作。



## 平台调用

``` c#
[DllImport("user32.dll")]
public static extern int MessageBox(IntPtr hWnd, String text, String caption, int options);

MessageBox(IntPtr.Zero, "Command-line message box", "Attention!", 0);
```



## 常见库

### 数字：

``` c#
using System.Numerics;

Vector2,Vector3,Vector4,
Matrix3x2,Matrix4x4,
Plane,
Quaternion,
Vector<T>
```



### 日期和时间：

``` c#
DateTime.Now;
DateTime.Today;
DateTime.UtcNow;

TimeZone,TimeZoneInfo,TimeZoneOffset
```



### 集合和数据结构：

``` c#
using System.Collections;	// 非泛型集合
using System.Collections.Generic;	// 泛型集合
using System.Collections.Concurrent; // 线程安全集合

interface IEnumerable<out T>; // 可枚举集合

    
```

| 我要……                                                       | 泛型集合选项                                                 | 非泛型集合选项                                               | 线程安全或不可变集合选项                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 将项存储为键/值对以通过键进行快速查找                        | [Dictionary](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.dictionary-2) | [Hashtable](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.hashtable)  （根据键的哈希代码组织的键/值对的集合。） | [ConcurrentDictionary](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.concurrent.concurrentdictionary-2)  [ReadOnlyDictionary](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.objectmodel.readonlydictionary-2)  [ImmutableDictionary](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutabledictionary-2) |
| 按索引访问项                                                 | [List](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.list-1) | [Array](https://docs.microsoft.com/zh-cn/dotnet/api/system.array)  [ArrayList](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.arraylist) | [ImmutableList](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablelist-1)  [ImmutableArray](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablearray) |
| 使用项先进先出 (FIFO)                                        | [Queue](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.queue-1) | [Queue](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.queue) | [ConcurrentQueue](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.concurrent.concurrentqueue-1)  [ImmutableQueue](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablequeue-1) |
| 使用数据后进先出 (LIFO)                                      | [Stack](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.stack-1) | [Stack](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.stack) | [ConcurrentStack](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.concurrent.concurrentstack-1)  [ImmutableStack](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablestack-1) |
| 按顺序访问项                                                 | [LinkedList](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.linkedlist-1) | 无建议                                                       | 无建议                                                       |
| 删除集合中的项或向集合添加项时接收通知。（实现 [INotifyPropertyChanged](https://docs.microsoft.com/zh-cn/dotnet/api/system.componentmodel.inotifypropertychanged) 和 [INotifyCollectionChanged](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.specialized.inotifycollectionchanged)） | [ObservableCollection](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.objectmodel.observablecollection-1) | 无建议                                                       | 无建议                                                       |
| 已排序的集合                                                 | [SortedList](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.sortedlist-2) | [SortedList](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.sortedlist) | [ImmutableSortedDictionary](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablesorteddictionary-2)  [ImmutableSortedSet](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablesortedset-1) |
| 数学函数的一个集                                             | [HashSet](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.hashset-1)  [SortedSet](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.generic.sortedset-1) | 无建议                                                       | [ImmutableHashSet](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablehashset-1)  [ImmutableSortedSet](https://docs.microsoft.com/zh-cn/dotnet/api/system.collections.immutable.immutablesortedset-1) |

### 文件和流式IO

#### 文件和目录：

``` c#
using System.IO;

```

* [File](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.file) - 提供用于创建、复制、删除、移动和打开文件的静态方法，并可帮助创建 [FileStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.filestream) 对象。
* [FileInfo](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.fileinfo) - 提供用于创建、复制、删除、移动和打开文件的实例方法，并可帮助创建 [FileStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.filestream) 对象。
* [Directory](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.directory) - 提供用于创建、移动和枚举目录和子目录的静态方法。
* [DirectoryInfo](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.directoryinfo) - 提供用于创建、移动和枚举目录和子目录的实例方法。
* [Path](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.path) - 提供用于以跨平台的方式处理目录字符串的方法和属性。


#### 流

* [FileStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.filestream) - 用于对文件进行读取和写入操作。
* [IsolatedStorageFileStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.isolatedstorage.isolatedstoragefilestream) - 用于对独立存储中的文件进行读取或写入操作。
* [MemoryStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.memorystream) - 用于作为后备存储对内存进行读取和写入操作。
* [BufferedStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.bufferedstream) - 用于改进读取和写入操作的性能。
* [NetworkStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.net.sockets.networkstream) - 用于通过网络套接字进行读取和写入。
* [PipeStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.pipes.pipestream) - 用于通过匿名和命名管道进行读取和写入。
* [CryptoStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.security.cryptography.cryptostream) - 用于将数据流链接到加密转换。

#### 读取器和编写器

[System.IO](https://docs.microsoft.com/zh-cn/dotnet/api/system.io) 命名空间还提供用于在流中读取和写入已编码字符的类型。 通常，流用于字节输入和输出。 读取器和编写器类型处理编码字符与字节之间的来回转换，以便流可以完成操作。 每个读取器和编写器类都与流关联，可以通过类的 `BaseStream` 属性进行检索。

- [BinaryReader](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.binaryreader) 和 [BinaryWriter](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.binarywriter) - 用于将基元数据类型作为二进制值进行读取和写入。
- [StreamReader](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.streamreader) 和 [StreamWriter](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.streamwriter) - 用于通过使用编码值在字符和字节之间来回转换来读取和写入字符。
- [StringReader](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.stringreader) 和 [StringWriter](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.stringwriter) - 用于从字符串读取字符以及将字符写入字符串中。
- [TextReader](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.textreader) 和 [TextWriter](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.textwriter) - 用作其他读取器和编写器（读取和写入字符和字符串，而不是二进制数据）的抽象基类。

#### 压缩

压缩是指减小文件大小以便存储的过程。 解压缩是提取压缩文件的内容以使这些内容采用可用格式的过程。 [System.IO.Compression](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression) 命名空间包含用于对文件和流进行压缩或解压缩的类型。

- [ZipArchive](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.ziparchive) - 用于在 zip 存档中创建和检索条目。

- [ZipArchiveEntry](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.ziparchiveentry) - 用于表示压缩文件。

- [ZipFile](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.zipfile) - 用于创建、提取和打开压缩包。

- [ZipFileExtensions](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.zipfileextensions) - 用于创建和提供压缩包中的条目。

- [DeflateStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.deflatestream) - 用于使用 Deflate 算法对流进行压缩和解压缩。

- [GZipStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.compression.gzipstream) - 用于采用 gzip 数据格式对流进行压缩和解压缩。


#### 独立存储

独立存储是一种数据存储机制，它在代码与保存的数据之间定义了标准化的关联方式，从而提供隔离性和安全性。 存储提供按用户、程序集和（可选）域隔离的虚拟文件系统。 当你的应用程序无权访问用户文件时，独立存储特别有用。 你可以通过一种由计算机的安全策略控制的方式保存应用程序的设置或文件。

- [IsolatedStorage](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.isolatedstorage.isolatedstorage) - 提供用于独立存储实现的基类。
- [IsolatedStorageFile](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.isolatedstorage.isolatedstoragefile) - 提供包含文件和目录的独立存储区。
- [IsolatedStorageFileStream](https://docs.microsoft.com/zh-cn/dotnet/api/system.io.isolatedstorage.isolatedstoragefilestream) - 公开独立存储中的文件。

### 全球化

``` c#
using System.Globalization;
using System.Resources;
using System.Text;
		
```



### 批注属性(System.Attribute)

 批注描述如何将数据序列化、指定用于强制安全性的特征并限制通过实时 (JIT) 编译器进行优化，从而使代码易于调试。 批注还可记录文件的名称或代码的作者，或控制窗体开发过程中控件和成员的可见性。



## 扩展方法

``` c#
public static class StringExtension{
    public static int WordCount(this String str) // this不能省略
    {
        return str
            .Split(new char[] {' ', '.','?'}, StringSplitOptions.RemoveEmptyEntries)
            .Length;
    }
}

string s = "The quick brown fox jumped over the lazy dog.";
s.WordCount();
```

### Regex：

```c#
@"mesh_([a-z]+)_([a-z]+)(_(\S+))" 匹配 mesh_body_bazzi_arib 时
match.Groups有5个，
第一个为字符串本身
依次匹配2,3，
第四个为 _arib,
第五个为 "arib"
```