---
layout: post
title: {ISSUE}unity
categories: 
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


# .Net Core C#

.NetCore是开放源代码的通用开发平台，由Microsoft和.NET社区共同维护，跨平台。.Net Core是整个平台，而不仅仅只对应C#。如同JVM一样，其上不仅仅只有Java。.Net Core也可视为是虚拟机。C#也是编译为中间字节码，供.Net运行，其运行原理与JVM如出一辙。

C#是.Net平台首推语言，其重要程度与Java之于JVM一样。C#是一门精心设计过的语言，精巧（但不简洁）。

C#内置标准库以System开始，是组建整个C#生态圈的核心。Unity底层采用C++编写，其脚本语言环境集成了.Net平台，在其上构筑了Boo,Javascript等语言环境，当然，还可以构建更多的语言环境，但要考虑中间层.Net带来的解析或编译消耗。

整个.Net在底层，以.Net Standard Library为基础，其上构建了Framework、Core和Xamarin三种生态。Framework主要针对ASP、WPF等Windows应用程序，构建本机APP；Core是跨平台框架；Xamarin移动端APP框架。

所以，Unity，CryEngine等的C#脚本语言部分，基本上以Core为主，即使不是Core也是开源的Mono方案。但归根结底来说，.Net Framework和.Net Core只是上层生态库不同而已。

无论是Framework还是Core以及其他衍生产品，其支持部分仍然是.Net Standard Library。如果是学习C#，则从.Net Core开始。

C#语言经过演变，如今已发展到7.0。对于Unity使用的C#版本而言，主要有两个主要区别：Framework 2.x/3.5/4.x,对应的C#版本主要有5.0和7.0。现在普遍以7.0为主。7.0是兼容5.0的。就如同C++98,11,17等，C++17兼容C++11、C++11等。


## C#特性简短回顾：

- 内置垃圾回收。
- 静态语言，纯粹面向对象，一切皆继承自Object。语法如同C++
- 具有模板特性，写法如同C++，但更简洁
- 偏重接口继承，避免多重继承
- 以Namespace作为包管理单元。VS Studio可使用Nuget包管理器管理包。
- 命名空间命名比较自由
- 不允许全局变量、全局函数，都需要用class包裹。
- 包含预处理指令
- 默认成员是private
- 概念上，成员变量分为两种：字段和属性。
- 在访问限定上，有：public,private,protected,internal,protected internal。 定义类型时，也要附加访问限定符。
- 在面向对象类型修饰上，有：interface,abstract, partial，static，sealed
- 在函数传参上，有：ref,out，传值
- 值分为引用类型、值类型两种。
- 有?后缀，?表示可空，??类似于ruby中的 or :` num ?? 3.14`
- 内置delegate和event，用于实现消息机制
- 内置lock，async，await关键字，可方便实现异步
- 支持extensions，扩展原有类的功能。

C#是精心设计的面向对象语言，其语法井井有条，但对于自由型代码编写者而言，语法过于有板有眼，吾不爱之。

## C#标准库：
语言用于制定语义、语法，而标准库则是用于快速产品制作不可缺少的部分。.Net标准库是庞大的，基本上涉及了常用的代码库，但整体相较C++ Boost，更顺眼一点。

C#以namespace管理功能包，以下列出最常用的功能包

|包|说明| 附加|
|---|---|---|
| System | 命名空间包含用于定义常用值和引用数据类型、事件和事件处理程序、接口、特性以及处理异常的基础类和基类。| |
| System.Buffers | 包含用于创建和管理内存缓冲区等的类型命名空间包含用于创建和管理内存缓冲区的类型 |Buffers.Text,Buffers.Binary |
| System.Collections| 命名空间包含接口和类，这些接口和类定义各种对象（如列表、队列、位数组、哈希表和字典）的集合。 | Collections.Generic,Collections.Concurrency,Collections.Specialized|
| System.CodeDom | 命名空间包含可以用于表示源代码文档的元素和结构的类。 此命名空间中的类可用来建立源代码文档结构的模型，使用 命名空间提供的功能可以将源代码文档输出为所支持语言的源代码。| CodeDom.Compiler|
| System.ComponentModel| 命名空间提供用于实现组件和控件的运行时和设计时行为的类。 此命名空间包括用于特性和类型转换器的实现、数据源绑定和组件授权的基类和接口。|
| System.Configuration | 命名空间包含提供用于处理配置数据的编程模型的类型。| Configuration.Assemblies, Configuration.Internal, Configuration.Provider |
| System.Data| 命名空间提供对表示 ADO.NET 结构的类的访问。 通过 ADO.NET，可以生成可有效管理多个数据源的数据的组件 | Data.Odbcc,Data.OleDb,Data.Sql,Data.SqlClient,Data.SqlTypes|
| System.Diagnostics | 提供与系统进程、事件日志和性能计数器的交互的类| Diagnostics.CodeAnalysis,Diagnostics.Contracts,Diagnostics.SymbolStore,Diagnostics.Tracing|
| System.Drawing | 提供方位GDI+基础图形函数的类。| Drawing.Configuration,Drawing.Design,Drawing.Drawing2D,Drawing.Imaging,Drawing.Priting,Drawing.Text |
| System.Dynamic | 提供类和接口，支持动态语言运行时(Dynamic Language Runtime) | |
| System.Globalization | 提供类，定义文化相关信息，包括语言，国家，日历，日期格式，货币，数字，字符串排序规则。这些都是用于国际化相关的。提供国际化函数，包括文本元素处理和代理支持| |
| System.IO | 提供读、写文件和数据流的类型，也提供基础函数、目录支持类型| IO.Compression, IO.Enumeration,IO.IsolatedStorage,IO.MemoryMappedFiles,IO.Packaging,IO.Pipes,IO.Ports|
| System.Linq | 提供使用Language-Intergrated Query查询的支持的类和接口|
| System.Net | 提供用于网络协议的简单程序接口。提供插件式协议、实现网络服务。| Net.Cache,Net.Http,Net.Mail,Net.Mime,Net.NetworkInformation,Net.PeerToPeer,Net.Security,Net.Sockets,Net.WebSockets|
| System.Numberics | 提供数字类型 | |
| System.Reflection | 包含遍历assemblies,modules,members,parameters,和其他托管代码的实体的信息的类。这些类型也可用于处理加载类型的实例，例如钩子事件或调用方法。可动态创建类型| Reflection.Emit,Reflection.Metadata,Reflection.PortableExcutable|
| System.Runtime | 包含高级类型，以支持多样的命名空间，如System,Runtime,Security命名空间 | Runtime.CompilerServices,ConstrainedExcution,Runtime.ExceptionServices,RunTime.InteropServices,Runtime.Loader,Runtime.Serialization,Runtime.Versioning|
| System.Security | 提供基本语言运行时安全系统，包括权限基类 | Security.AccessControl,Security.Authentication,Security.Claims,Security.Cryptography,Security.Permissions,Security.Policy,Security.Principal |
| System.ServiceProcess | 允许实现、安装、控制Windows服务应用。| |
| System.Text | 命名空间包含表示 ASCII 和 Unicode 字符编码的类；用于让字符块和字节块相互转换的抽象基类；以及无需创建 的中间实例即可操作并格式化 对象的帮助器类。| Text.RegularExpressions |
| System.Threading | 提供多线程编程的类和接口 | Threading.Tasks |
| System.Timers| 以指定间隔时间触发事件 | |
| System.Transactions | 事务处理| |
| System.Web | 浏览器和服务器通信的类和接口 | |
| System.Xml | XML标准处理 | Xml.Linq,Xml.Resolvers,Xml.Schema,Xml.Serialization,Xml.XPath,Xml.Xsl |

针对许多常见的Unity Framework，很多只是重新实现了C#标准库中实现的功能，多此一举。当选择一个语言时，是选择的其生态环境，当选择了Unity，那么即选择了C#及其标准库。这和许多语言相同，如学习Scala，也得熟悉Java标准库；学习Elixir, 也得熟悉Erlang标准库；学习C++，也得熟悉stl、Boost一样。齐全的标准库，可让开发事半功倍。

### 附录，常见的标准库中的类：
参阅:[.NetCore2.2](https://docs.microsoft.com/zh-cn/dotnet/api/?view=netcore-2.2)

- System

|类|作用|
|---|---|
| AppContext |	提供用于设置和检索应用程序上下文相关数据的成员。 |
| AppDomain | 表示应用程序域，它是一个应用程序在其中执行的独立环境。 此类不能被继承。 |
| ApplicationId,ApplicationIdentity | 唯一标识。不可被继承 |
| Array| 提供一些方法，用于创建、处理、搜索数组并对数组进行排序，从而充当公共语言运行时中所有数组的基类。|
| Attribute | 	表示自定义特性的基类。|
| BitConverter | 基数据类型转换为一个字节数组以及将一个字节数组转换为基数据类型。|
| Buffer | 操作基元类型的数组 |
| CharEnumerator | 循环访问字符串|
| Console | 控制台|
| Convert | 基本类型之间转换|
| Delegate | 表示委托，委托是一种数据结构，它引用静态方法或引用类实例及该类的实例方法。|
| Enum | 枚举|
| Environment | 环境平台信息|
| EventArgs | 事件数据基类|
| Exception | 异常|
| UriParser| 基于文件方案的可自定义分析器|
| FlagsAttribute | 位域 |
| GC | 垃圾回收|
| Lazy<T> | 延迟初始化 |
| Math,MathF | 数学方法|
| MemoryExtensions| 内存相关的扩展方法|
| MulticastDelegate | 多播委托，即调用列表中可有多个元素的委托 |
| Nullable| |
| Object | 支持 .NET 类层次结构中的所有类，并为派生类提供低级别服务。 这是所有 .NET 类的最终基类；它是类型层次结构的根。|
| OperatingSystem | 	表示有关操作系统的信息，如版本和平台标识符。 此类不能被继承|
| Progress<T> | 进度回调|
| Random | 伪随机数生成器 |
| String | UTF-16字符串 |
| StringComparer | 字符串比较 |
| StringNormalizationExtensions| 字符串标准化|
| TimeZone，TimeZoneInfo | 时区|
| Tuple | 提供用于创建元组对象的静态方法。|
| TupleExtensions| 扩展|
| Type | 	表示类型声明：类类型、接口类型、数组类型、值类型、枚举类型、类型参数、泛型类型定义，以及开放或封闭构造的泛型类型 |
| Uri,UriBuilder | 提供统一资源标识符 (URI) 的对象表示形式和对 URI 各部分的轻松访问。|
| Version | 	表示程序集、操作系统或公共语言运行时的版本号。 此类不能被继承。|
| WeakReference| 表示类型化弱引用，即在引用对象的同时仍然允许垃圾回收来回收该对象。|
|**值类型**||
| Boolean,Byte,SByte,Char,Single,Double,Decimal| |
| Int16,Int32,Int64,IntPtr,UInt16,UInt32,UInt64,UIntPtr |  |
| DateTime,DateTimeOffset,TimeSpan | |
| Guid |  |
| Memory<T> | 表示连续内存 |
| ModuleHandle | 模块的运行时句柄 |
| Void | 无返回值|
|**接口** | |
| IAsyncResult| 异步操作的结果 |
| ICloneable | 依据现有实例创建类的新实例|
| IComparable | 可比较|
| IDisposable | 释放非托管资源 |
| IEquatable<T> | 相等 |
| IFormatProvider | 控制格式化对象机制|
| IFormattable | 值格式化为字符串 |
| IObservable<T> | 可被观察对象 |
| IObserver<T> | 观察者 |
| IProgress<T> | 进度更新 |
| IServiceProvider | 服务提供者|
|**委托** | |
| Action<T...> | 无返回值的方法 |
| AsyncCallback | 异步完成时调用|
| EventHandler<TEvenetArgs> | 处理事件的方法|
| Func<T...,TResult> | 自定方法|
| Predicate<T> | 返回bool类型的方法|
| Converter<TIn,TOut> | 类型转换的方法 |

- System.Buffers/ Buffers.Text
|类|作用|
|---|---|
| ArrayPool<T> | 资源池 |
| BuffersExtensions||
|MemoryPool<T> | 内存池 |
| Base64 |在二进制数据和以 base 64 表示的 UTF-8 编码的文本之间转换。|
| 

- System.Collections/ System.Collections.Generic
|类|作用|
|---|---|
| ArrayList| 动态数组 |
| BitArray | 位值压缩数据 |
| Hashtable | |
| Dictionary<TKey,TValue> |
| HashSet<T> ||
| LinkedList<T> |  双向链表 |
| List<T> | |
| Queue, Queue<T> | |
| SortedList | 键值对集合，按键排序|
| SortedSet<T> ||
| Stack,Stack<T> | 栈 |
| **接口** | |
| ICollection ||
| IComparer||
| IDictionary ||
| IEnumerable |可迭代对象|
| IEnumerator | 迭代器|
| IList ||

- System.IO

|类| 作用 |
|---|---|
| BinaryReader,BinaryWriter | 二进制读写|
| BufferedStream | 缓冲式流 |
| Directory | 目录处理的静态方法 |
| DriverInfo | 驱动器信息的访问 |
| File | 文件处理的静态方法|
| FileStream | 文件流式读写 |
| FileSystemWatcher | 侦听文件系统更改通知 |
| MemoryStream | 可存储区为内存的流式读写 |
| Path | 对文件或目录信息的String实例的操作 |
| Stream，StreamReader，StreamWriter | 字节序列流式读写 |
| StringReader，StringWriter | 字符串式读写 |
| TextReader,TextWriter | 连续字符序列读写器 |
| UnmanagedMemoryAccessor,UnmanagedMemoryStream | 提供从托管代码随机访问非托管内存块的能力 |
| **压缩** | |
| BrotliStream | Brotli数据规范压缩|
| DeflateStream |  |
| GZipStream | |
| ZipArchive|  压缩文件包 |
| ZipArchiveEntry | 压缩文档中的压缩文件 |
| ZipFile | 静态方法， 处理压缩文档|
|ZipFileExtensions | 扩展方法|
| **Packagin** ||
| Package | 可存储多个数据对象的容器 |
| PackagePart |包的部分，抽象类|
| ZipPackage | ZIP文档包|
| ZipPackagePart | 存储在ZipPackage中的部分 |
| **管道**| 用于进程间通信 |
| AnonymousPipeClientStream | 匿名管道流的客户端|
| AnonymousPipeServerStream | 匿名管道流的服务端|
| NamedPipeClientStream | 命名管道流客户端|
| NamedPipeServerStream | 命名管道流服务端 |
| **串口**||
| SerialPort | 串行端口资源 |

- System.Net

| 类 | 作用 |
|----|-----|
|AuthenticationManager | 管理客户端身份验证过程中调用的身份验证模块|
| Authorization | 包含Internet服务器的身份验证消息|
| Cookie | 管理Cookie |
| CredentialCache | 为多个凭据提供存储空间 |
| Dns | 域名解析 |
| DnsEndPoint,DnsPermission| |
| EndPoint | 标识网络地址 |
| EndPointPermission | |
| FileWebRequest | WebRequest类的文件系统实现 |
| FileWebResponse| WebResponse类的文件系统实现 |
| FtpWebRequest,FtpWebResponse | |
| GlobalProxySelection | Http请求的全局代理实例 |
| HttpListener,<br />HttpListenerBasicIdentity,<br />HttpListenerContext,<br />HttpListenerPrefixCollection | |
| HttpListenerRequest,HttpListenerResponse | |
| HttpLstenerTimeoutManager | 超时管理器 |
| HttpVersion | |
| HttpWebRequest,HttpWebResponse| Http网络请求 |
| IPAddress ，IPEndPoint | 网际协议地址 |
| IPHostEntry | 主机信息 |
| NetworkCredential | 基于密码身份验证方案提供凭据 |
| ServicePoint，ServicePointManager | Http连接管理 |
| SocketAddress | |
|SocketPermission | 控制在传输地址上建立或接受连接的权利 |
| TransportContext | 基础传输层的上下文|
| WebClient | 提供用于将数据发送到由 URI 标识的资源及从这样的资源接收数据的常用方法。|
| WebHeaderCollection | 包含与请求或响应关联的协议标头。 |
| WebPermission | 控制访问 HTTP Internet 资源的权限 |
| WebProxy | WebRequest 的 http代理设置|
| WebRequest 对URI发出请求 ||
| WebResponse | 来自URI的响应 |
| WebUtility | 提供编解码URL的方法 |
|**缓存**||
|HttpRequestCachePolicy | 缓存策略|
| RequestCachePolicy | |
|**Http**||
|HttpClient | Http响应的客户端 |
| HttpContent | http正文和内容标头 |
| HttpMethod | 检索和创建新的Http方法|
| HttpRequestMessage,HttpResponseMessage | |
| MultipartContent | HttpContent对象集合 |
| StreamContent | 流提供Http内容|
| StringContent | 基于字符串提供http内容|
| ByteArrayContent | 基于基于字节数组的Http内容|
| **邮件** | |
| SmtpPermission |控制电子邮件权限 |
| MailMessage | 电子邮件信息 |
| AlternativeView ,AlternativeViewCollection | 电子邮件查看格式 |
| Attachment，AttachmentBase,AttachmentCollecion | 附件|
| LinkedResource,LinkedResourceCollection | 电子邮件中嵌入的外部资源 ，如HTML图像|
| MailAddress,MailAddressCollection| 电子邮件地址|
|**网络信息** | |
| GatewayIPAddressInformation+Collection | 网关IP地址 |
| IcmpV4/6Statistics| 本地计算机控制消息协议的统计数据 |
| IPAddressCollection | |
| IPAddressInformation+Collection | 网络接口地址的信息|
| IPGlobalProperties/Statistics | 本机网络连接的信息和统计 |
| IPInterfaceProperties/Statistics| 网络接口信息和统计|
| IPv4InterfaceProperties/Statistics| |
| IPv6InterfaceProperties| |
| MulticastIPAddressInfomation+Collection| 网络连接的多播地址信息 |
| NetworkChange | IP地址更改时通知|
| NetworkInformationPermission+Attribute| |
| NetworkInterface | 网络接口配置和统计信息 |
| PhysicalAddress | 提供网络适配器MAC地址 |
| Ping | 允许应用程序确定是否可通过网络访问远程计算机|
| PingOptions,PingReply| |
| Tcp/UdpStatics | Tcp或Udp统计信息|
| TcpConnectionInformation| Tcp连接的信息 |
|UnicastIPAddressInformation+Collection | 单播地址信息 |
| **Sockets**||
| Socket | 伯克利套接字 |
| TcpClient | TCP客户端连接|
|TcpListener | 侦听来自TCP网络客户端的连接 |
| IPv6MulticastOption | 加入IPV6多播的选项|
|LingerOption | 	指定在调用 Socket 或 Close() 方法之后，如果仍有数据要发送，Close() 是否保持连接以及保持多长时间。|
| MulticastOption | |
| NetworkStream | 网络数据流|
| SocketTaskExtensions | Socket类的扩展方法 |
| UdpClient | UDP网络服务客户端|
| UnixDomainSocketEndPoint | Unix域套接字终端 |
| **WebSockets** | |
| ClientWebSocket | WebSocket 客户端 |
| ClientWebSocketOptions  | |
| WebSocket | 允许发送、接受数据 |
| WebSocketContext | WebSocket环境信息 |
| WebSocketRceiveResult | 接收到数据的结果|
| HttpListenerWebSocketContext | Http类接收信息的信息 |
| **MIME** | |
| ContentDisposition| Disposition标头 |
| ContentType | Content-Type标头|
| DispositionTypeNames | 电子邮件附件的处置类型的字符串 |
| MediaTypeNames | 电子邮件附件的媒体类型信息 |
| **安全通信** ||
| AuthenticatedStream | 提供通过流传递凭据的方法，以及为客户端/服务器应用程序请求或执行身份验证的方法 |
| NegotiateStream | 	提供一个使用协商安全协议的流，以便对客户端-服务器通信中的客户端及服务器（可选）进行身份验证。|
| SslClient/ServerAuthenticationOptions | |
|SslStream | 提供一个用于客户端-服务器通信的流，该流使用安全套接字层 (SSL) 安全协议对服务器和（可选）客户端进行身份验证。|

- System.Numberics

|类|说明|
|---|---|
| BigInteger | 任意大带符号整数|
| Complex | 复数|
| Matrix3x2， Matrix4x4 | 矩阵|
| Plane | 三维空间平面|
| Quaternion | 三维物理旋转的向量|
| Vector<T>，<br />Vector2,<br />Vector3,<br />Vector4 | 矢量 |

- System.Reflection
|类|说明|
|---|---|
| Assembly | 表示一个程序集，它是一个可重用、无版本冲突并且可自我描述的公共语言运行时应用程序构建基块。|
| AssemblyAlgorithmId<br />/Company<br />/Configuration<br />/Copyright<br />/Culture<br />/DefaultAlias<br />/DelaySign<br />/Description<br />/FileVersions<br />/Flags<br />/InformationalVersion<br />/KeyFile/KeyName<br />/Metadata<br />/Product<br />/SignatureKey<br />/Title<br />/Trademark<br />/VersionAttribute ||
| AssemblyExtensions | 扩展|
| Binder | 	从候选者列表中选择一个成员，并执行实参类型到形参类型的类型转换。|
| ConstructorInfo | 	发现类构造函数的属性并提供对构造函数元数据的访问权。|
| DispatchProxy | 	提供实例化代理对象和处理其方法调度的机制。 |
| EventInfo | 发现事件的属性并提供对事件元数据的访问权|
| EventInfoExtensions | |
| FieldInfo | 发现字段的属性并提供对字段元数据的访问权限|
| LocalVariableInfo | |
| ManifestResourceInfo | |
| MemberInfo ||
| MemberInfoExtensions | |
| MethodInfo,MethodBody,MethodBase | |
| MethodInfExtensions | |
| Missing | |
| Module | 	在模块上执行反射。|
| ModuleExtensions | |
| ParameterInfo | |
| Pointer | 指针 |
| PropertyInfo | 属性元数据 |
| PropertyInfoExtensions | |
| ReflectionContext | 	表示可提供反射对象的上下文。 |
| RuntimeReflectionExtentions| 提供检索有关运行时类型的信息的方法 |
| StrongNameKeyPair | 封装对公钥或私钥对的访问，该公钥或私钥对用于为强名称程序集创建签名 |
| TypeDelegator | 包装 Type 对象并将所有方法委托给该 Type。|
| TypeExtensions| |
|TypeInfo | 表示类类型、接口类型、数组类型、值类型、枚举类型、类型参数、泛型类型定义，以及开放或封闭构造的泛型类型的类型声明。|

- System.Resources
|类|说明|
|---|---|
| ResourceManager| 资源管理器，其可在运行时提供对于特定文化资源的便利访问|
| ResourceReader/Writer | 资源读写|
| ResourceSet| 资源集合|

- System.Runtime
|类|说明|
|---|---|
| GCSettings | 垃圾回收设置 |
| MemoryFailPoint | 执行一个操作之前检查是否有足够的内存资源。 此类不能被继承。|

- System.Text

|类|说明|
|---|---|
| Decoder，Encoder | 编码与解码 字符串与字节数组间转换|
| Encoding | 字符编码|
| StringBuilder | 表示可变字符字符串。 此类不能被继承。|
|**正则表达式**||
| Capture+Collection| 子表达式成功捕获 |
| Group+Collection | 单个捕获组|
| Match+Collection | 匹配结果 |
| Regex | 正则表达式 |
| RegexRunner |编译正则表达式的基类|
| RegexCopilationInfo | 将正则表达式编译为独立程序集的信息 |
| RegexRunnerFactory | 为编译过的正则表达式创建RegexRunner类 |

- System.Threading
|类 | 说明 |
|---|-----|
| AsyncLocal<T> | 表示对于给定异步控制流（如异步方法）是本地数据的环境数据|
| AutoResetEvent| 表示线程同步事件在一个等待线程释放后收到信号时自动重置。 此类不能被继承。|
| Barrier | 	使多个任务能够采用并行方式依据某种算法在多个阶段中协同工作。 |
|CompressedStack | 提供方法用于设置和捕获当前线程上的压缩堆栈。 此类不能被继承。|
| Interlocked | 为多个线程共享的变量提供原子操作。 |
| LazyInitializer | 提供延迟初始化例程。|
| CountdownEvent | 表示在计数变为零时处于有信号状态的同步基元|
| EventWaitHandle | 表示一个线程同步事件。|
| ExecutionContext | 	管理当前线程的执行上下文。 此类不能被继承。|
| HostExecutionContext| 在线程之间封装并传播宿主执行上下文|
| HostExecutionContextManager | 提供使公共语言运行时宿主可以参与执行上下文的流动（或移植）的功能。|
| ManualResetEvent+Slim |  表示线程同步事件，收到信号时，必须手动重置该事件。 |
| Monitor | 提供同步访问对象的机制 |
| Mutex | 一个同步基元，也可用于进程间同步|
| Overlapped | 提供 Win32 OVERLAPPED 结构的托管表现形式，包括从 Overlapped 实例向 NativeOverlapped 结构传输信息的方法|
| PreAllocatedOverlapped | 表示本机重叠 I/O 操作的预分配状态 |
| ReaderWriterLock+Slim | 	定义支持单个写线程和多个读线程的锁 |
| RegisterWaitHandle| |
| Semaphore+Slim | 限制可同时访问某一资源或资源池的线程数|
| SynchronizationContext| 提供在各种同步模型中传播同步上下文的基本功能|
| Thread | 创建和控制线程，设置其优先级并获取其状态 |
| ThreadLocal<T> | 提供数据的线程本地存储。|
| ThreadPool | 提供一个线程池，该线程池可用于执行任务、发送工作项、处理异步 I/O、代表其他线程等待以及处理计时器|
| Timeout | 包含指定无限期超时间隔的常数。 此类不能被继承|
| Timer | 提供以指定的时间间隔对线程池线程执行方法的机制。 此类不能被继承|
| Volatile | 包含用于执行可变内存操作的方法|
| WaitHandle+Extensions| 封装等待对共享资源进行独占访问的操作系统特定的对象|
| **Tasks**||
| ConcurrentExclusiveSchedulerPair | 提供任务计划程序，其用于执行任务，同时确保并发任务可同时运行，而独占任务从不运行。|
| Parallel | 	提供对并行循环和区域的支持 |
| ParallelOptions/LoopState| |
| Task<TResult> | 表示一个异步操作|
| TaskCompletionSource<TResult> | 表示未绑定到委托的 Task<TResult> 的制造者方，并通过 Task 属性提供对使用者方的访问。|
| TaskExtensions| 扩展|
| TaskFactory<TResult> | 提供对创建和计划 Task 对象的支持|
| TaskScheduler | 表示一个处理将任务排队到线程中的低级工作的对象。|
| **Tasks.DataFlow**|提供基于Actor的编程模型|
| ActionBlock<TInput> | 提供数据流块，其调用为每个接收的数据提供的 Action<T> 委托|
| BatchBlock<T> | 提供将输入批处理到数组中的数据流 |
| BroadcastBlock<T> | 提供缓冲区，用于一次存储最多一个元素，在每个消息抵达时覆盖每个消息 |
| BufferBlock<T> | 为数据流提供用于存储数据的缓冲区|
| DataflowBlock |提供一组用于处理数据流块的静态方法|
| JoinBlock<T1,T2> |提供一个数据流块，该块联接多个数据流源，这些数据流源并不一定属于相同类型，会等待每个类型的一个项目到达，然后才作为包含每个类型的项目的元组完全释放。|
|TransformBlock<TInput,TOutput>|提供数据流块，其调用为每个接收的数据提供的 Func<T,TResult> 委托|
|TransformManyBlock<TInput,TOutput>|提供数据流块，其调用为每个接收的数据提供的 Func<T,TResult> 委托|
|WriteOnceBlock<T>|在数据流块网络中为接受和存储最多一个元素提供缓冲区|

- System.Timer
|类|说明|
|---|---|
|ElapsedEventArgs | 时间事件 |
| Timer | 在设定的间隔之后生成事件，带有生成重复事件的选项 |
| TimerDescriptionAttribute| |


# Unity库
Unity库包含这样几部分：UnityEngine和UnityEditor和Unity。

UnityEngine内部以模块对功能进行划分，模块列表如下：
|模块|说明|
|---|---|
|AIModule| 实现寻路特性|
| AndroidJNI | 允许调用Java代码|
| Animation| 实现动画系统|
| AssetBundle | 实现AssetBundle类以及关联API以从AssetBundle中加载数据|
| Audio | 实现音频系统|
| Cloth | 通过Cloth组件实现布料物理模拟 |
| Core | 实现Unty功能必须的基本类，此模块必需存在|
| Director| 实现PlayableDirector类|
| FileSystemHttp| HTTP虚拟文件系统，允许文件从Http读写|
| GameCenter | 提供使用Apple GameCenter服务的API |
|ImageConversion | 实现ImageConversion类以提供辅助函数将图片转换至或从PNG,JPEG,EXR格式转换 |
| IMGUI | 提供立即模式的GUI方案，以创建游戏内置和编辑器用户界面|
| InputLegacy | 实现Input类，用于读取玩家输入|
| JSONSerialize| 提供JsonUtility类，可用于序列化Unity对象至JSON格式|
| ParticleSystem| 实现Unity粒子系统|
| Physic2D | 实现Unity 2D物理|
| Physics | 实现3D物理|
| ScreenCapture| 使用ScreenCapture类提供函数以截屏|
| SharedInternals | 用于内部，提供其他模块需要的底层功能。此模块没有公共API，而且不可禁用|
| Terrain| 提供Terrain组件，实现地形渲染引擎 |
| TerrainPhysics | 通过实现TerrainCollider组件，连接Terrain和物理模块|
| TextRendering| 提供访问Unity文本渲染系统|
| Tilemap | 实现Tilemap类|
| UIElements | 实现UI框架中UIElements保持模式 |
| UI | 实现UI系统必需的基本组件|
| Umbra | 实现遮挡剔除系统。此模块没有任何公共API |
| UnityAnalytics | 实现Unity Analytics必需的API |
|UnityWebRequestAssetBundle | 提供DownloadHandlerAssetBundle类以用于下载AssetBundle |
| UnityWebRequestAudio |  提供DownloadHandlerAudioClip类以用于下载AudioClips |
| UnityWebRequest | 允许通过Http服务进行通信 |
| UnityWebReqeustTexture | 提供DownloadHandlerTexture类以用于下载Textures|
| UnityWebRequestWWW | 提供传统WWW以使用http服务通信 |
| Vehicles | 通过WheelCollider组件实现载具物理模拟 |
| Video | 允许回放视频文件|
| VR | 实现虚拟现实设备的支持 |
| WebGL | 提供WebGL特定的API |
| Wind | 实现WindZone组件，可影响地形渲染和粒子模拟 |
| XR | 包含VR和AR相关平台支持功能|



## 附录，Unity库
-  UnityEngine.AI
|类|说明|
|---|---|
|NavMesh | 单例类，访问已烘焙的NavMesh |
| NavMeshAgent | 导航网格代理 |
| NavMeshBuilder | 导航网格构建接口|
| NavMeshData | 包含和表示NavMesh 数据 |
| NavMeshObstacle | NavMeshAgent避开的障碍物 |
| NavMeshPath | 导航系统计算的路径|
| OffMeshLink | Link允许移动跳出平面化导航网格|

- UnityEngine.AndroidJNI
|类| 说明 |
|---|----|
|AndroidJavaClass | 表示java.lang.Class的实例|
|AndroidJavaObject | 表示java.lang.Object的通用实例|
| AndroidJavaProxy | 可用于实现任意Java接口。任何Java虚拟机方法调用匹配至proxy对象将会自动传给C#实现|
| AndroidJNI | 原始JNI接口|
| AndroidJNIHelper | 辅助接口，签名创建和方法查询|

- UnityEngine.Animation 
|类|说明|
|---|---|
|AnimConstraint | 约束对象相对于一个或多个源对象的位置的方向，使得对象面向源的平均位置。|
|Animation | 用于播放动画的组件|
| AnimationClip | 存储基于关键帧的动画|
| AnimationEvent | 允许在播放动画时调用类似于SendMessage的脚本函数|
| AnimationPlayableBinding| 包含表示AnimationPlayableOutput的信息|
| AnimationPlayableOutputExtensions| 扩展|
| AnimationPlayableUtilities | 实现高级实用功能方法，以简化PlayableAPI和动画的使用|
| AnimationState | 给予动画混合的完全控制 |
| AnimationStreamHandleUtility | 静态类，提供动画流处理的实用方法|
| Animator | 控制Mecanim动画系统的接口|
| AnimatorControllerParameter| 用于脚本和控制器沟通。一些参数可在脚本中设置，一些可用控制器设置；其他参数在Animation Clip中基于Custom Curves，可使用脚本API采样|
| AnimatorJobExtensions| 静态类，提供Animator和动画C#任务的扩展方法 |
| AnimatorOverrideController | 控制Animator Override Controller的接口|
| AnimatorUtility | 操作Animator的实用方法|
| Avatar | Avatar定义|
| AvatarBuilder | 从脚本构建Avatar |
| AvatarMask | 用于遮盖人形体部分和transform|
| HumanPoseHandler | 从人形化身骨骼层级读取HumanPose，或写入HumanPose至其中|
| HumanTrait | 所有人形骨骼和肌肉类型的详细信息 |
| LookAtConstraint | 对象朝向约束。是简化的AimConstraint,典型的与Camera结合使用|
| Motion | AnimationCclip和BlendTree的基类|
| NotKeyableAttribute | 用于标记属性非动画型|
| ParentConstraint | 约束对象的朝向和位置关联至多个源。约束对象行为如其在源层级中 |
| PositionConstraint | 约束对象位置，关联于一个或多个源对象|
| RotationConstraint | 约束对象的旋转，关联于一个或多个源对象|
| RuntimeAnimatorController | AnimatorController的运行时表示。可在运行时改变Animator Controller|
| ScaleConstraint | 约束对象的缩放至一个或多个源对象|
| SharedBetweenAnimatorsAttribute | 表明此StateMachineBehaviour应该只实例化一次并且共享至所有Animator实例。此可为每个控制器实例降低内存占用|
| StateMachineBehaviour | 可加至状态机状态的组件。|

- UnityEngine.AssetBundle
| 类 | 说明 |
|----|-----|
| AssetBundle |在运行时，可通过UnityWebRequest流式附加资源，并且实例化它们。AssetBundle通过BuildPipeline.BuildAssetBundle创建|
| AssetBundleCreateRequest | AssetBundle的异步创建请求|
| AssetBundleManifest | 构建的所有AssetBundle的清单|
| AssetBundleRecompressOperation |对AssetBundle异步再压缩|
| AssetBundleRequest | AssetBundle的异步加载请求|

- UnityEngine.Audio
|类|说明|
|---|---|
| AudioClip | 音频数据容器|
| AudioListener | 在3D空间中表示听众|
| AudioMixer | 混响器|
| AudioMixerGroup| 表示混音器的一组对象|
| AudioMixerSnashot | 混音器中快照|
| Audio | 音频资源 |
| AudioChorusFilter | 采用音频剪辑并处理它创建合唱效果|
| AudioDistortionFilter| 音频失真滤波器会扭曲来自AudioSource的声音或到达AudioListener的声音|
| AudioEchoFilter|音频回声滤波器，在给定延迟后重复声音，根据衰减比率衰减回声|
|AudioHighPassFilter | 音频高通滤波器，让AudioSource的高频通过，并截断频率低于截止频率的信号|
| AudioLowPassFilter| 音频低通滤波器，会截断高于指定频率的信号|
| AudioReverbFilter | 音频混响滤波器，采用音频剪辑并对其进行扭曲以创建自定义混响效果|
| AudioReverbZone | 如果要在场景中创建基于位置的环境效果，则使用混响区域|
| AudioPlayableBinding| 一个PlayableBinding，包含AudioPlayableOutput的信息|
| AudioSampleProvider | 提供访问由Unity对象如VideoPlayer生成的音频采样 |
| AudioSettings | 从脚本控制全局音频设置 |
| AudioSource | 3D空间内的音频源 |
| Microphone | 使用此类用连接的麦克风记录一段AudioClip|
| WebCamTexture | 直播视频输入渲染的纹理 |

- UnityEngine.Cloth
|类|作用|
|---|---|
|Cloth | 提供布料物理模拟的接口|

- UnityEngine.Core
|类|作用|
|---|---|
|AddComponentMenu | 添加组件菜单项属性|
| AlwaysLinkAssemblyAttribute| 确保程序集始在托管代码剥离时始终得到处理 |
| AndroidDevice | Android特定函数接口|
| AnimationCurve | 关键帧集合，可依时间评估|
| Application | 访问应用运行时数据 |
| AssemblyIsEditorAssembly | 汇集等级，任何以此属性标记的类都视为Editor类|
| Assert | 包括断言方法 |
| AsyncGPUReadback | 允许异步回读GPU资源|
| AsyncOperation | 异步操作协程 |
| AsyncReadManager | 可通过Unity虚拟文件系统运行异步IO操作，可在任何线程或任务上执行这些操作|
| BatchRendererGroup | 批次渲染组|
| BeforeRenderOrderAttribute | 指定Application.onBeforeRender自定回调顺序 |
| Behaviour | 可禁用或启用的组件|
| BillboardAsset | 描述如何绘制Billboard|
| BillboardRenderer | 渲染Billboard |
| BurstDiscardAttribute | 从由Burst编译器编译成本机代码中移除方法或属性 |
| Caching | 允许管理缓存的AssetBundle，以及通过UnityWebRequestAssetBundle.GetAssetBundle()下载 |
| Camera | 玩家通过相机设备观察世界|
| ColorUsageAttribute | 用于配置ColorField和ColorPicker的使用|
| ColorUtility | 颜色相关的实用方法|
| CommandBuffer | 执行的图形命令列表|
| Component | 附加至GameObject的一切组件的基类|
| ComputeBuffer | GPU数据缓冲区，多用于compute shader |
| ComputeShader | ComputerShader资源|
| ContextMenu | 此属性允许添加命令到上下文菜单 |
| ContextMenuItemAttribute | 此属性添加上下文菜单项|
| Coroutine | MonoBehaviour.StartCoroutine返回一个Coroutine。此类的实例只用于引用这些协程，不保存任何属性和函数|
| CrashReport | 保存单个应用崩溃事件和提供访问所有搜集的崩溃报告数据|
| CreateAssetMenuAttribute | 标记ScriptableObject派生类型可自动列于Assets/Create子菜单，所以此类型的实例可便捷创建并存为项目".assets"文件。|
| Crypto | 加密算法类 |
| Cubemap | 处理Cube map，使用此类创建或修改已存在的cube map 资源|
| CubemapArray | Cubemap 数组|
| CullingGroup | 描述包围球集合，应有其可视性和距离|
| Cursor | 光标处理|
| CustomeRenderTexture | 自定渲染纹理，是渲染纹理的扩展，启用它可使用Shader直接渲染至Texture|
| CustomSampler | 自定CPU剖析label，用于剖析任意代码块|
| CustomYieldInstruction | 自定yield指令以挂起协程的基类|
| DataUtility | 访问Sprite数据的实用方法|
| DeallcateOnJobCompletionAttribute| |
| Debug | 包含开发时调试用方法|
| DelayedAttribute | 延迟创建变量|
| Device | 设备接口|
| DictationRecognizer | 侦听语音输入并尝试确定其使用的短语|
| Directory | 目录操作|
| DisallowMultipleComponent | 阻止多个相同的组件加到对象上 |
| Display | 提供访问显示/显示屏的渲染操作|
| DisposeSentinel | 用于自动侦测内存泄漏|
| DyamicGI | 允许控制动态Global Illumination |
| ExcludeFromCoverageAttribute | 允许不进行覆盖|
| ExcludeFromObjectFactoryAttribute | 可阻止通过ObjectFactory方法生成|
| ExcludeFromPresetAttribute | 阻止从类的实例创建Preset |
| ExcuteAlways | 使脚本实例始终执行，编辑或播放模式都执行|
| File | 提供文件操作|
| Flare | flare资源。|
| FlareLayer | |
| FloatComparer | 近似相等|
| FormerlySerializedAsAttribute | 重命名字段，不丢弃其序列化值|
| FrameTimingManager | 允许用户捕获并访问多针的FrameTiming数据 |
| GameObject | 所有Unity 场景中实体的基类|
| GarbageCollector | 控制垃圾回收器 |
| GeometryUtility | 基本几何体实用方法|
| Gizmos | 用于给予可视化调试或设置场景视图辅助|
| GL | 底层图形库|
| Gradient | 用于颜色动画|
| Graphics | Unity绘制函数原始接口|
| GraphicsBuffer | GPU图形数据缓冲区，工作于数据如顶点和索引缓冲|
| GraphicsSettings | 图形设置的脚本接口|
| GUIElement | GUI中显示的图片和文本的基类|
| Handheld | 手持式设备接口|
| HashUnsafeUtilities | 计算哈希|
| HashUtilties | 计算哈希的实用函数 |
| HeaderAttribute | 添加属性头于Inspector中|
| HelpURLAttribute | 自定帮助文档URL |
| HideInInspector | 属性不在Inspector中显示|
| IJobExtensions | 使用IJob接口的Job扩展方法 |
| IJobParallelForExtensions | 使用IJobParallelFor的Job的扩展方法 |
| IJobParallelForTramsformExtensions | 扩展IJobParallelForTransform的方法|
| ImageEffectAfterScale | 此属性标记任何图形特效将会在动态分辨率阶段渲染|
| ImageEffectAllowedInSceneView | 可渲染至Scene视图相机|
| ImageEffectOpaque | 可在opaque几何体后渲染，但在透明几何体前|
| ImageEffectTransformsToLDR| 当使用HDR渲染它可在图形特效渲染时切换至LDR|
| ImageEffectUsesCommandBuffer | 图形特效都使用CommandBuffer |
| InspectorNameAttribute | 枚举值描述改变在Inspector中的名称 |
| JobHandleUnsafeUtility | |
| JobProducerTypeAttribute | 所有job接口类型必需使用JobProducerType。用于Burst ASM编译执行方法 |
| JobsUtility | 创建、运行和调试job的方法|
| Launcher | 启动器 |
| LensFlare | 镜头眩光组件的脚本接口|
| LicenseInformation | 许可证信息，也初始化应用支付|
| Light | 光的组件的脚本接口|
| LightmapData | lightmap的数据|
| LightmapperUtils | 通过烘焙后端转换光源类型|
| Lightmapping | 光烘焙后端的接口 |
| LightmapSettings | 保存场景的光照贴图|
| LightProbeGroup | 光照探针组|
| LightProbeProxyVolume | 光照探针代理体组件，提供用于大型非静态对象的高分辨率光照|
| LightProbes | 保存场景的光照探针|
| LineRenderer | 用于在3D空间绘制自由线渲染器|
| LineUtility | 线函数集合|
| LocalNotification | iOS.LocalNotification封装UILocalNotification类 |
| LODGroup | 用于组织多个渲染器至LOD等级|
| Logger | 初始化Logger新实例|
| Material | 材质|
| MaterialPropertyBlock | 应用材质值块|
| MemoryProfiler | 内存剖析API容器类|
| Mesh | 可从脚本创建或修改网格 |
| MeshFilter | 访问Mesh的网格过滤器 |
| MeshRenderer | 渲染由MeshFilter或TextMesh的网格 |
| MessageEventArgs | 传给注册至PlayerConnection的Action回调的参数 |
| MetaData | 内存快照元数据|
| MinAttribute | 指定最小值 |
| MonoBehaviour | 是每个Unity脚本派生于的基类|
| MultilineAttribute | 多行文本编辑|
| NativeArrayUnsafeUtility | |
| NativeContainerAttribute | 允许创建自定义本机容器 |
| NativeContainerIsAtomicWriteOnlyAttribute <br/>NativeContainerIsReadOnlyAttribute<br/>NativeContainerSupportsDeallocateOnJobCompletionAttribute<br/>NativeContainerSupportsDeferredConvertListToArray <br/>NativeContainerSuppoertsMinMaxWriteRestrictionAttribute<br/>NativeDisableContainerSafetyRestrictionAttribute<br/>NativeDisableParallelForRestrictionAttribute<br/>NativeDisableUnsafePtrRestrictionAttribute<br/>NativeFixedLengthAttribute<br/>NativeSetClassTypeToNullOnScheduleAttribute<br/>NativeSetThreadIndexAttribute|本机代码相关属性 |
|NativeLeadDetection | native泄漏侦测|
| NativeSliceUnsafeUtility | |
| Notification | 默认Playable通知实现 |
| NotificationServices | 只在ios启用|
| Object | 所有能引用的对象的基类|
| OcclusionArea | 遮挡剔除执行的区域|
| OcclusionPortal | 运行时动态改变遮挡的portal |
| OnDemandResources | |
| OnDemandResourcesRequest | 表示OnDemandResources请求，它是异步操作，可在协程中yield |
| PhotoCapture | 从web 相机截图并保存到内存或磁盘|
| PhotoCaptureFrame | 从web相机截图的信息 |
| PhraseRecognitionSystem | 短语重新组织|
| PhraseRecognizer | 关键字和语义组织|
| Ping | Ping任意给定IP地址|
| PixelPerfectRendering | 促进基于sprite渲染的pixel perfect渲染的API集 |
| PlayableAsset | 可在运行时实例化的Playable资源基类|
| PlayableBehaviour | 自定义可播放脚本基类|
| PlayableExtensions | 实现IPlayable的所有类型的扩展|
| PlayableOutputExtensions | 实现了IPlayableOutput的所有类型的扩展|
| PlayerConnection | 用于Player到Editor的网络连接处理|
| PlayerLoop | 表示player loop |
| PlayerPrefs | 在游戏Sessions间存储和访问玩家首选项 |
| PreferBinarySerialization | ScriptableObject派生类型使用二进制序列化|
| PreserveAttribute | 阻止字节代码strip |
| Profiler | 从脚本控制Profiler |
| Projector | projector组件脚本接口 |
| PropertyAttribute | |
| QualitySettings | |
| Random | 随机数生成|
| RangeAttribute | |
| ReadOnlyAttribute | 用于job的成员结构只读|
| RectOffset | 矩形偏移 |
| RectTransform | 矩形的位置、大小、锚点、枢轴点信息|
| ReflectionProbe | 用于捕获周围环境到纹理，可传递给shader用于反射|
| Remote | AppleTV远程输入配置|
| RemoteNotification | iOS远程通知|
| Renderer | 所有渲染器的通用方法|
| RendererExtensions | 扩展Renderer方法，只用于UpdateGIMaterial方法|
| RenderPipeline | 定义一系列命令和设置，描述如何渲染一帧|
| RenderPipelineAsset | |
| RenderPipelineManager | |
| RenderSettings | 渲染设置|
| RenderTexture | 可渲染至的渲染纹理 |
| ReplayKit | 仅用于ios |
| RequireComponent | 标记依赖组件|
| ResourceRequest | 从Resource bundle中异步加载请求|
| Resources | 允许查找和访问资源中的对象|
| RuntimeIntializeOnLoadMethodAttribute| 允许运行时类方法在游戏加载时初始化 |
| Sampler | 提供CPU Profiler控制|
| ScalableBufferManager | 缩放渲染纹理以支持动态分辨率，如果目标平台/图形API支持|
| SceneManager | 运行时场景管理|
| SceneUtility | 场景和构建设置相关的实用函数|
| Screen | 访问显示信息|
| ScriptableObject | 如希望创建无需挂载在gameobject对象的类时，可派生自此类|
| ScriptableRuntimeReflectionSystem | |
|ScriptableRuntimeReflectionSystemSettings | 脚本化实时反射系统的全局设置|
| ScriptPlayableBinding | 包含表示ScriptingPlayableOutput的信息的PlayableBinding |
| Security | Webplayer安全相关类 |
| SelectionBaseAttribute | 标记对象可被选择|
| SerializeField | 强制Unity序列化私有字段|
| Shader | 用于所有渲染的Shader脚本|
| ShaderKeyword | Shader内指定代码路径的标识 |
| ShaderVariantCollection | 记录在每个shader中实际用到的variants|
| SkinnedMeshRenderer | |
| SkyBox | 天空盒脚本接口|
| SleepTimeout | 包含Screen.sleepTimeout的特定值 |
| SortingGroup | 添加SortingGroup至GameObject将确保其内所有渲染器将会排序并一起渲染|
| SpaceAttribute | Inspector中的空隙|
| SparseTexture | 处理SparseTexture |
| SplashScreen | Splash Screen 接口|
| Sprite | 2D游戏中的Sprite对象|
| SpriteAtlas | Unity内创建的资源，是内置sprite packing方案的一部分|
| SpriteAtlasManager | 运行时管理SpriteAtlas |
| SpriteDataAccessExtensions | 设计为读写Sprite内部数据|
| SpriteRenderer | 渲染Sprite |
| SpriteRendererDataAccessExtensions | 允许调用者覆盖SpriteRenderer渲染 |
| StaticBatchingUtility | 有利的静态批次处理|
| SupportedRenderingFeatures | 描述给定渲染管线支持的渲染特性|
| SystemInfo | 访问系统和硬件信息|
| TextAreaAttribute | 高度灵活和可滚动的文本域 |
| TextAsset | 文本文件资源|
| Texture | 纹理处理基类。包含Texture2D和RenderTexture类通用的函数|
| Texture2D,Texture2DArray | 2D纹理|
| Texture3D | 处理3D纹理，用此创建3D纹理资源|
| TexturePlayableBinding | |
| Tile | 表示Windows开始屏幕中的Tile |
| Time | 从Unity获取时间信息的接口|
| Toast | 表示Windows Store App的toast通知 |
| TooltipAttribute | 在Inspector中指定提示文本|
| TouchScreenKeyboard | 屏幕键盘接口。只在Native iphone,android,windows store app中支持|
| TrialRenderer | 用于创建移动对象后的Trails |
| Transform | 对象的位置、旋转和缩放 |
| UnityAPICompatibilityVersionAttribute | 兼容的API版本|
| UnityEvent<T...> | 无参回调，可通过Scene保存|
| UnityEventBase | UnityEvent抽象类|
| UnsafeUtility | |
| UsesLuminPlatformLevelAttribute | |
| UsesLuminPrivilegeAttribute ||
| Utils | |
| VideoCapture | 从web相机记录video到磁盘|
| WaitForEndOfFrame | 等待直到Unity已渲染每个相机和GUI，在帧显示在屏幕上之前|
| WaitForFixedUpdate | 等待直到下一个fixed帧率|
| WaitForSeconds | 挂起协程的执行指定秒数，使用有缩放的时间|
| WaitForSecondsRealtime | 挂起协程的执行指定秒数，使用无缩放的时间|
| WaitUntil | 挂起协程的执行直到指定delegate求值为真|
| WaitWhile | 挂起协程的执行，直到指定delegate求值为false |
| WebCam | 当前Web相机状态的通用信息|
| WriteAccessRequiredAttribute | |
| WriteOnlyAttribute | |
|YieldInstruction | 所有yield指令的基类|

- Unity.Director
|类|说明|
|---|---|
|PlayableDirector | 实例化PlayableAsset并控制Playable对象的播放|

- Unity.GameCenter 
|类|说明|
|---|---|
| GameCenterPlatform | ios GameCenter 网络服务实现|
| Social | 通用访问Social API |

- Unity.ImageConversion
|类|说明|
|---|---|
| ImageConversion | 图片数据转换|

- Unity.IMGUI
|类|说明|
|---|---|
| Event | UnityGUI事件|
| GUI | 手动放置的GUI类|
| GUIContent | GUI元素的内容|
| GUILayout | 自动布局的GUI接口|
| GUILayoutOption | 内部用，指定布局方式|
| GUILayoutUtility | 实用函数|
| GUISettings | GUI行为的通用设置|
| GUISkin | GUI外观和行为|
| GUIStyle | GUI元素的风格信息|
| GUIStyleState | GUI风格对象的当前状态|
| GUITargetAttribute | 也允许OnGUI调用时显示控制|
| GUIUtility | 创建新GUI控件的实用类|

- UnityEngine.InputLegacy 
|类|说明|
|---|---|
|AndroidInput | 离屏触摸输入|
| Compass | 指南针接口|
| Gyroscope | |
| Input | 输入系统接口|
| LocationService | 定位接口|

- UnityEngine.JSONSerivialize
|类|说明|
|---|---|
|JsonUtility | JSON数据处理|

- UnityEngine.ParticleSystem
|类|说明|
|---|---|
| ParticlePhysicsExtensions | 粒子系统的物理扩展 |
| ParticleSystem | 粒子系统的脚本接口|
| ParticleSystemForceField | 粒子系统力域脚本接口|
| ParticleSystemRenderer | 渲染粒子到屏幕|

- UnityEngine.Physics2D
|类|说明|
|---|---|
| AnchoredJoint2D | 有锚点的Joint基类 |
| AreaEffector2D | 区域内施加力|
| BoxCollider2D | 矩形碰撞体|
| BuoyancyEffector2D | 施加力，模拟buoyancy，fluid-flow和fluid drag |
| CapsuleCollider2D | 胶囊形状碰撞体|
| CircleCollider2D | 圆形碰撞体|
| Collider2D | 2d游戏中碰撞类型的基类|
| Collision2D | 2D物理回调函数返回的碰撞详细信息|
| CompositeCollider2D| 合并其他碰撞体一起，组成的碰撞体|
| ConstantForce2D | 每个物理更新时持续应用线性和力矩力到刚体 |
| DistanceJoint2D | 保持两刚体固定的距离的Joint|
| EdgeCollider2D | 由顶点定义的连接线的2D物理碰撞体|
| Effctor2D | 所有2D影响器的基类|
| FixedJoint2D | 连接两个刚体锚点，用于可配置的spring |
| FrictionJoint2D | 应用力和力矩以减少线性和角性速度到0|
| HingeJoint2D | 允许刚体绕点或其他对象点旋转的Joint |
| Joint2D | 所有连接到刚体对象的Joint的基类|
| Physics2D | 2D物理的全局设置和辅助函数|
| PhysicsMaterial2D| 定义Collider2D的表面属性的资源|
| PhysicsSceneExtentions2D | 访问底下物理场景的场景扩展|
| PhysicsUpdateBehaviour2D | FixedUpdate中2D物理组件必需的回调函数的基类|
| PlatformEffector2D | 应用 platform 行为如一边碰撞等 |
| PointEffector2D | 对一点施加 吸引/击退的力 |
| PolygonCollider2D | 任意多边形碰撞器 |
| RelativeJoint2D| 保持两个刚体其相对朝向 |
| Rigidbody2D | 2Dsprite的刚体物理组件|
| SliderJoint2D | 限制刚体在单线上的行为的Joint|
| SpringJoint2D | 视图保持两刚体对象集合距离的Joint，施加力于二者|
| SurfaceEffector2D | 应用正切力到collider表面|
| TargetJoint2D | 尝试移动刚体到指定目标点的Joint|
| WheelJoint2D | 允许模拟轮子，通过提供约束悬架行为以及可选的motor|

- UnityEngine.Physics
|类|说明|
|---|---|
| BoxCollider,CapsuleCollider,SphereCollider | 不同形状的碰撞器 |
| Collider | 所有碰撞器的基类|
| CharacterController | 允许以碰撞约束而非刚体移动对象|
| Collision | 碰撞信息|
| CharacterJoint | 多用于Ragdoll效果|
| ConfigurableJoint | 特别灵活的joint，可完全控制旋转和线性运动|
| ConstantForce | 固定施加力|
| ControllerColliderHit | 用于CharacterController.OnControllerColliderHit，给出碰撞的详细信息以及如何处理它|
| FixedJoint | 组织2个刚体，让它们粘在一起 |
| HingeJoint | 组织2个刚体，约束它们的移动，让它们看起来像用铰链连起来一样|
| Joint | 所有Joint基类|
| MeshCollider | 允许在网格和图元间侦测碰撞|
| PhysicMaterial | 用于描述如何处理碰撞对象（摩擦力、弹力）|
| Physics | 全局物理属性和辅助方法|
| PhysicsSceneExtensions | 访问底部物理场景的场景扩展|
| Rigidbody | 通过物理模拟控制物体的位置|
| SpringJoint | 连接2刚体，弹簧力将自动应用以保持它们处于给定的距离|

- UnityEngine.ScreenCapture
|类|说明|
|---|---|
|ScreenCapture | 截屏方法|

- UnityEngine.Terrain

  | 类                  | 说明                                                         |
  | ------------------- | ------------------------------------------------------------ |
  | DetailPrototype     | Terrain GameObject使用的细节原型                             |
  | PaintContext        | 涂绘操作上下文，可跨多个连接的Terrain                        |
  | SplatPrototype      | 用于TerrainData的Splat（斑点）原型                           |
  | Terrain             | 渲染地形的Terrain组件                                        |
  | TerrainCallbacks    | 为触发Terrain数据改变时提供事件                              |
  | TerrainData         | 存储高度图、细节mesh位置、树实例、地形纹理alpha图等          |
  | TerrainExtensions   | 只在UpdateGIMaterials方法调用的扩展方法                      |
  | TerrainLayer        | 描述地形的层                                                 |
  | TerrainPaintUtility | 自定地形涂绘工具的实用方法                                   |
  | TerrainUtility      | 提供用于地形工具的一系列实用方法                             |
  | Tree                | 树创建器的Tree组件                                           |
  | TreePrototype       | 简单的类，指向树原型                                         |
  | *结构体*            |                                                              |
  | BrushTransform      | 表示线性2D变换量，位于画刷UV空间和目标XY空间之间（典型的这是Terrain-local对象空间） |
  | PatchExtents        | 最小和最大地形补丁高度值                                     |
  | TreeInstance        | 包含关于放在Terrain GameObject中的树的信息                   |

- UnityEngine.TerrainPhysics

  | 类              | 说明               |
  | --------------- | ------------------ |
  | TerrainCollider | 基于高度图的碰撞器 |

* UnityEngine.TextRendering
|类|说明|
|---|---|
| Font | 字体资源的脚本接口|
| TextGenerator | 用于生成文本以渲染的类|
| TextMesh | 文本网格组件的脚本接口|
| *结构体* | |
| CharacterInfo | 指定如何从字体纹理渲染字符 |
| TextGenerationSettings| |
| UICharInfo | 指定关于可渲染字符的相关信息 |
| UILineInfo | 生成的一行文本的信息|
| UIVertex  | 由Canvas使用管理顶点的类|

- UnityEngine.Tilemap
|类 | 说明|
|----|----|
|CustomGridBrushAttribute | 启用Grid画刷窗口|
| GridBrushBase | 可在grid创作数据的基类，如涂绘、擦除、挑拣、选择和填充等|
| ITilemap | 从Tile查询所需的信息类|
| Tile | Tilemap中默认的tile |
| TileBase | Tilemap中tile的基类|
| Tilemap | 保存由Grid组件标记的sprite布局的信息|
| TilemapCollider2D | 2D物理表示形状 |
| TilemapRenderer | 用于渲染Tilemap，由Tilemap组件和Grid组件标记出 |
|*struct*||
| TIleData | 渲染一个Tile所必需的数据|
| TileAnimationData | 使Tile动起来的必需的数据|

- UnityEngine.UI
|类|说明|
|----|----|
|Canvas| 可用于屏幕渲染的元素|
| CanvasGroup | 可用于修改子元素Alpha、Raycasting、Enabled状态的放置元素|
| CanvasRenderer | 渲染到屏幕的组件，在所有渲染信息完成后，当附加到Canvas时。设计用于GUI应用|
| RectTransformUtility | 包含辅助方法以与RectTransform工作的实用类|
|*UIELements*| |
|AttachToPanelEvent | 当元素添加到panel时发送的事件|
| BaseField<T> | 控件基类|
| BaseFieldTraits<T1,T2> | BaseField特性|
| BaseSlider<T> | Slider区域基类|
| BindableElement | 可绑定到属性的元素|
| BlurEvent | 元素丢失焦点时立即发送此事件。此事件会慢慢发生，不会泡汤，也不会取消|
| Box | 风格化可视元素，匹配IMGUI Box Style |
| Button | 可点击按钮|
| CallbackEventHandler | 回调接口|
| ChangeEvent<T> | 域内数据改变时发送事件|
| Clickable | 跟踪处理鼠标事件，当元素被点击时回调|
| CommandEventBase<T> | 命令事件基类|
| ContextClickEvent | 右击事件|
| ContextualMenuManager | 显示上下文菜单|
| ContextualMenuManipulator | 当右击或按下键盘menu按键时，显示上下文菜单 |
| ContextualMenuPopulateEvent| 当上下文菜单必需menu item时发送此事件|
| CustomStyleResolvedEvent | 在自定风格属性被解决之后发送|
| DetachFromPanelEvent | 从其父元素剥离前发送此事件|
| DragAndDropEventBase<T> | 拖拽事件基类|
| DragEnterEvent | 拖事件发生于元素之内时发生，不可取消，不是慢慢发生，不会泡汤|
| DragExitedEvent | 拖拽事件结束时发生|
| DragLeveEvent | 当拖离开某元素时发生|
| DragPerformEvent | 拖放到某元素时发生|
| DragUpdatedEvent | 元素被拖进可能的放置目标上时发生|
| DropdownMenu | |
| DropdownMenuAction | |
| DropdownMenuEventInfo | 触发下拉框显示所需信息 |
| DropdownMenuItem | |
| DropdownMenuSeparator | 分隔|
| EventBase<T?> | 事件基类，实现时间轮训和自动注册到事件类型系统|
| EventDispatcher | 递送事件到IPanel |
| ExecuteCommandEvent | 执行命令时触发|
| Focusable | 可获取焦点对象基类|
| FocusChangeDirection | 在焦点ring中焦点移动方向 |
| FocusController | 管理Panel内焦点 |
| FocusEvent | 元素获取焦点时立即发生|
| FocusEventBase<T> | 焦点相关事件基类|
| FocusInEvent,FocusOutEvent| 焦点获取和丢失时立即发生|
| FoldOut | 折叠选中的UI|
| GeometryChangedEvent | 布局计算，位置或维度发生变化时发送|
| IBindingExtensions | 提供添加IBindable函数的扩展类|
| Image | 表示源纹理的可视元素|
| IMGUIContainer | 绘制IMGUI内容的元素|
| IMGUIEvent | 当无对等UIElements事件时，发送IMGUI事件 |
| ImmediateModeElement | 可实现自定立即模式渲染的可视元素 |
| INotifyValueChangeExtensions | 用于实现了INotifyValueChanged的元素的扩展类|
| InputEvent | 从TextField改变时发送事件|
| KeyboardEventBase<T> | 键盘事件|
| KeyDownEvent,KeyUpEvent | 键盘事件|
| Label | 文本元素|
| ListView | 垂直可滚动区域，只能创建可视元素，允许绑定多个项。当用户滚动时，可视元素是循环并绑定到新数据项|
| Manipulator | 所有Manipulator实现的基类 |
| MinMaxSlider | 最小最大范围的Slider |
| MouseCaptureController | 管理捕获鼠标事件 |
| MousseCaptureEvent| 开始捕获鼠标后发送的事件|
| MouseCaptureEventBase<T> | 开始捕获鼠标时发送的事件 |
| MouseCaptureOutEvent | 在开始捕获鼠标前发送的事件|
| MouseDownEvent<br/>,MouseEnterEvent<br/>,MouseEnterWindowEvent<br/>,MouseLeaveEvent<br/>MouseLeaveWindowEvent<br/>,MouseMoveEvent<br/>MouseOutEvent<br/>MouseOverEvent<br/>MouseUpEvent<br/> | 鼠标的不同事件|
| MouseManipulator | 激活过滤器的列表|
| PanelChangedEventBase<T> | Panel改变时的事件基类|
| PopupWindow | 弹出式IMGUI元素|
| RepeatButton | 当按下时循环执行某行为的按钮|
| Scroller | 垂直或水平滚动器|
| ScrollView | 在可滚动框之内显示其内容|
| Slider,SliderInt | 包含浮动点值的滑条|
| StyleSheet | 应用于可视元素以控制布局并显示到用户界面的风格集 |
| TemplateContainer | 模板容器 |
| TextElement | 包含文本的可视元素的抽象基类 |
| TextField | 可编辑字符串的矩形区域 |
| TextInputBaseField<T> | 用于所有基于文本域的抽象基类 | 
| Toggle | Toggle 域 |
| TooltipEvent | 找到第一个元素显示提示时发送的事件|
| TypedUxmlAttributeDescription<T> | 所有uxml指定属性的基类 |
| UQuery，UQueryExtensions | UQuery时扩展方法集，以允许选择分离或汇集的可视元素于复杂层级内|
| UxmlAttributeDescription | 描述XML属性的基类 |
| UxmlChildElementDescription | 描述元组的允许的子元素 |
| UxmlBool/Color/Double/Float/Int/Long/String/AttributeDescription| 不同XML值类型属性 | 
| UxmlEnumAttributeDescription<T> | 以字符串表示enum的属性 |
| UxmlEnumeration | 从一列值中选取属性 | 
| UxmlFactory<T1,T2?> | 使用从UXML文件读取的数据实例化可视元素 |
| UxmlRootElementFactory | 根UXML元素的工厂 |
| UxmlRootElementTriats | 根UNXML元素的UxmlTraits | 
| UxmlTraits | 解析UXML文件派生可视元素，并生成UMXL schema定义 |
| UxmlTypeRestriction | 限制属性值的基类 |
| UxmlValueBounds | 限制属性的值在指定包围之内 |
| UxmlValueMatches | 限制属性的值匹配正则表达式 |
| ValidateCommandEvent | 发送给接收命令的探针 |
| VisualElement | UIElement可视树结构的部分对象的基类|
| VisualElementExtensions | VisualElement扩展 |
| VisualElementFocusChangeDirection | 为VisualElementFocusRing定义焦点改变方向 |
| VisualElementFocusRing | 实现线性焦点环。元素通过焦点index存储|
| VisualTreeAsset | 保持VisualElementAsset树形结构的实例。从UXML文件创建，每个VisualElementAsset表示一个UXML节点。VisualTreeAsset可克隆到yield VisualElement树|
| WheelEvent | 鼠标滚轮事件|

- UnityEngine.Analytics
| 类 | 说明 |
|----|----|
|Analytics | Unity用户分析服务 |
| AnalyticsSessionInfo | 为当前游戏实例提供访问分析会话信息 |
| RemoteSettings | 提供访问远程设置 |

- UnityEngine.UnityWebRequest
|类| 说明|
|---|---|
| CertificateHandler | 响应拒绝或接受从http请求的证书 |
| DownloadHandler | 管理和处理从远程服务接收的HTTP响应body数据 |
| DownloadHandlerBuffer | 通用DownloadHandler实现，用于存储数据到native字节缓冲 |
| DownloadHandlerFile | 下载处理器，用以存储下载的数据到文件 |
| DownloadHandlerScript | 抽象类用于用户创建脚本驱动的DownloadHandler实现 |
| MultipartFormDataSection | 辅助对象，用于包含通用、非文件数据的结构块 |
| MultipartFormFileSection | 辅助对象，添加文件到多部份结构通过MultipartFormSectionAPI |
| DownloadHandleTexture/AudioClip/AssetBundle | 下载AssetBundle的DownloadHandler子类|
| UnityWebRequestTexture/AudioClip/AssetBundle | 使用UnityWebRequest下载asset bundle的辅助类 |
| UnityWebRequest | 用于和Web服务器通信 |
| UnityWebRequestAsyncOperation | 从UnityWebRequest.SendWebRequest()返回的异部操作对象，你可yield直到它继续，通过AsyncOperation.completed注册事件处理或手动检测是否结束（AsyncOperation.isDown)或进度(AsyncOperation.progress) |
| UploadHandler | 辅助对象，在Http请求中管理缓冲和传输body数据 |
| UploadHandleFile | 特里化UploadHandler，从给定文件读取数据，并以请求body发送原始字节到服务器 |
| UploadHandleRaw | 通用UploadHandler子类，用于本机代码内存缓冲|
| WWWForm | 辅助类，生成form数据并通过UnityWebRequest或WWW类，post给web 服务器|

- UnityEngine.Vehicle
  |类|说明|
  |---|---|
  |WheelCollider | 载具轮子的特殊碰撞器 |
  | WheelHit | 由WheelCollider反馈的轮子的联系信息 |

- UnityEngine.Video
  |类|说明|
  |---|---|
  | VideoClip | 视频数据的容器 |
  | VideoPlayer | 播放视频内容到目标 |
  | VideoPlayerExtensions | 视频播放器扩展 | 

-UnityEngine.VR/XR
 | 类 | 说明 | 
 |---|------|
 | GestureRecognizer | 识别用户手势的API |
 | HolographicRemoting | 允许应用连接至远程全息设备，以及应用与设备间的流式数据 |
 | HolographicSettings | 影响全息平台的性能和表现 |
 | InteractionManager | 可访问从手、控制器和系统语言命令的输入 |
 | SurfaceObserver | 空间映射API |
 | WorldAnchor | 允许Gameobject的位置锁定于物理空间 |
 | WorldAnchorStore | 固有WorldAnchor的存储对象 |
 | WorldAnchorTransferBatch | 可在app间导入、导出的WorldAnchor批次 |
 | WorldManager | 真实世界跟踪系统的状态 |
 | XRDevice | 包含所有相关于XR设备的信息 |
 | XRSettings | 全局XR相关设置|
 | XRStats | 从XR子系统时间和其他统计|
 | CommonUsage | 用于从XR.InputDevice.TryGetFeatureValue检索输入特性 |
 | InputDevice | 在XR输入子系统访问设备的接口 |
 | InputTracking | 与XR跟踪系统交互 |
 | IntegratedSubsystem | 集成式子系统 |
 | IntegratedSubsystemDescriptor | |
 | Subsystem | 从SubsystemDescriptor为给定的子系统初始化子系统，并提供与该给定子系统交互的接口，直到它被销毁。创建仔细通过后，可以启动或停止以打开和关闭功能。 |
 | SubsystemDescriptor | 在创建子系统实例之前可以查询的子系统信息 |
 | SubsystemManager | 允许访问通过插件提供附加功能的子系统 |
 | XRCameraSubsystem+Descriptor | 摄像头访问 |
 | XRDepthSubsystem+Descriptor | 物理环境的深度数据的访问，如点云 |
 | XRDisplaySubsystem+Descriptor| 控制渲染到头部跟踪显示 |
 | XRExperientceSubsystem+Descriptor | 允许查询特定于平台体验的信息的方法和属性 |
 | XRGestureSubsystem+Descriptor | 对给定平台的手势提供支持 |
 | XRInputSubsystem+Descriptor | 启用和禁用来自特定插件的输入 |
 | XRMeshSubsystem +Descriptor | 允许外部系统为Unity提供动态网格 |
 | XRPlaneSubsystem+Descriptor | 提供有关在环境中检测到的平面的信息 |
 | XRRaycastSubsystem+Descriptor| 允许查询提供的指定光线附近的物理环境部分。这些可跟踪包括平面和深度数据。 |
 | XRReferencePointSubsystem+Descriptor| 参考点，指示环境中感兴趣的区域，有助于确保对这些点的跟踪保持准确 |
 | XRSessionSubsystem+Descriptor |  用于与XR绘画交互并配置XR绘画的方法和属性的集合 |


- UnityEngine.WebGL
  | 类 | 说明 |
  |----| ---- |
  | WebGLInput | 提供支持WebGL特定的功能 | 

- UnityEngine.Wind
  | 类 | 说明 |
  | --- | --- |
  | WindZone | 添加区域给船舰的树，使其树枝和树叶波动，如被风吹|
