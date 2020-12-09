---
layout: post
title: 工具与技术-Language-CheckList
permalink: _posts/0.工具与技术篇/Language-CheckList.md
categories: coding
date: 2019-07-18 18:37:34 +0800
---
You appear to be advocating a new:

你乐意拥护新的：

- [ ] functional 函数式
- [ ] imperative 命令式
- [ ] object-oriented 面向对象 
- [ ]  procedural 过程式
- [ ]  stack-based 基于栈
- [ ]  "multi-paradigm" 多编程范式
- [ ]  lazy 惰性
- [ ] eager  
- [ ] statically-typed 静态类型
- [ ] dynamically-typed 动态类型
- [ ] pure 纯粹
- [ ] impure 非纯粹
- [ ] non-hygienic 非清洁
- [ ] visual 可视化
- [ ]  beginner-friendly 初学者友好
- [ ]  non-programmer-friendly 非程序员友好
- [ ]  completely incomprehensible 完全高深莫测
的编程语言。你的语言将不会工作。这是为什么。

你乐意相信:

- [    ]  语法使语言变得困难
- [ ] 垃圾回收是免费的
- [ ] 计算机拥有无限内存
- [ ] 无人需要
	- [ ] 并发
	- [ ] REPL
	- [ ] 调试器支持
	- [ ] IDE支持
	- [ ] I/O
	- [ ] 以另外语言与代码交互
- [ ] 整个世界以7位ASCII编码
- [ ] 转换成大型软件工程会很简单
- [ ] 使程序员采用新语言将会很简单
- [ ] 使程序员采用语言特定的IDE会很简单
- [ ] 程序员喜欢写公式化的东西
- [ ] undefined行为意味着程序员不会依赖它们
- [ ] "Spooky action at a distance" 让编程更有趣

不幸的是, 你的语言(有/缺乏):

- [  ] comprehensible syntax 可理解的语法  
- [  ]  semicolons 分号 
- [ ] significant whitespace 重要的空格
- [ ] macros 宏
- [ ] implicit type conversion  隐式类型转换
- [ ] explicit casting 显式分配
- [ ] type inference 类型接口
- [ ] goto 
- [ ] exceptions 异常
- [ ] closures 闭包
- [ ] tail recursion 尾递归
- [ ] coroutines 协程
- [ ] reflection 反射
- [ ] subtyping 子类型
- [ ]  multiple inheritance 多重继承
- [ ]  operator overloading 操作符重载
- [ ]   algebraic datatypes 代数数据类型
- [ ]   recursive types 递归类型
- [ ]    polymorphic types 多态类型
- [ ]     covariant array typing 协变数组类型
- [ ]     monads  
- [ ]  dependent types 类型依赖
- [ ]  infix operators 中缀操作符
- [ ]  nested comments 嵌套注释
- [ ]  multi-line strings 多行字符串
- [ ]  regexes 正则表达式
- [ ]  call-by-value 传值调用
- [ ]  call-by-name  以名调用
- [ ]  call-by-reference 以引用调用
- [ ]  call-cc

The following philosophical objections apply:
以下哲学性对象应用于：

- [ ] 程序员无需理解策略理论就可写出“Hello,World”
- [ ] 程序不会通过写“Hello,World"来开发RSI
- [ ] 以你的语言写的最重要的程序是其自身编译器
- [ ] 以你的语言写的最重要的程序不止其自身编译器
- [ ] The most significant program written in your language is its own compiler
- [ ] The most significant program written in your language isn't even its own compiler
- [ ] No language spec
- [ ] "The implementation is the spec"
-    [ ] The implementation is closed-source  [ ] covered by patents  [ ] not owned by you
- [ ] Your type system is unsound  [ ] Your language cannot be unambiguously parsed
-    [ ] a proof of same is attached
-    [ ] invoking this proof crashes the compiler
- [ ] The name of your language makes it impossible to find on Google
- [ ] Interpreted languages will never be as fast as C
- [ ] Compiled languages will never be "extensible"
- [ ] Writing a compiler that understands English is AI-complete
- [ ] Your language relies on an optimization which has never been shown possible
- [ ] There are less than 100 programmers on Earth smart enough to use your language
- [ ] ____________________________ takes exponential time
- [ ] ____________________________ is known to be undecidable

Your implementation has the following flaws:
- [ ] CPUs do not work that way
- [ ] RAM does not work that way
- [ ] VMs do not work that way
- [ ] Compilers do not work that way
- [ ] Compilers cannot work that way
- [ ] Shift-reduce conflicts in parsing seem to be resolved using rand()
- [ ] You require the compiler to be present at runtime
- [ ] You require the language runtime to be present at compile-time
- [ ] Your compiler errors are completely inscrutable
- [ ] Dangerous behavior is only a warning
- [ ] The compiler crashes if you look at it funny
- [ ] The VM crashes if you look at it funny
- [ ] You don't seem to understand basic optimization techniques
- [ ] You don't seem to understand basic systems programming
- [ ] You don't seem to understand pointers
- [ ] You don't seem to understand functions

Additionally, your marketing has the following problems:
[ ] Unsupported claims of increased productivity
[ ] Unsupported claims of greater "ease of use"
[ ] Obviously rigged benchmarks
   [ ] Graphics, simulation, or crypto benchmarks where your code just calls
       handwritten assembly through your FFI
   [ ] String-processing benchmarks where you just call PCRE
   [ ] Matrix-math benchmarks where you just call BLAS
[ ] Noone really believes that your language is faster than:
    [ ] assembly  [ ] C  [ ] FORTRAN  [ ] Java  [ ] Ruby  [ ] Prolog
[ ] Rejection of orthodox programming-language theory without justification
[ ] Rejection of orthodox systems programming without justification
[ ] Rejection of orthodox algorithmic theory without justification
[ ] Rejection of basic computer science without justification

Taking the wider ecosystem into account, I would like to note that:
- [ ] Your complex sample code would be one line in: _______________________
- [ ] We already have an unsafe imperative language
- [ ] We already have a safe imperative OO language
- [ ] We already have a safe statically-typed eager functional language
- [ ] You have reinvented Lisp but worse
- [ ] You have reinvented Javascript but worse
- [ ] You have reinvented Java but worse
- [ ] You have reinvented C++ but worse
- [ ] You have reinvented PHP but worse
- [ ] You have reinvented PHP better, but that's still no justification
- [ ] You have reinvented Brainfuck but non-ironically

In conclusion, this is what I think of you:
[ ] You have some interesting ideas, but this won't fly.
[ ] This is a bad language, and you should feel bad for inventing it.
[ ] Programming in this language is an adequate punishment for inventing it.