# UI创建

## 创建控件蓝图

1. 在内容浏览器的内容根文件下，右击创建UMG文件夹
2. 在UMG文件夹，点击添加新内容，在用户界面下，选择控件蓝图
3. 将控件蓝图命名为MainMenu，然后点击保存全部
4. 双击 MainMenu，在UMG编辑器中将其打开
5. 在层级窗口中，删除CanvasPanel，然后从Palette中添加VerticalBox用于垂直布局
6. 添加Text，用于主显示文字
7. 添加3个基本按钮，分别为New Game,Load Game,Quit Game
8. 点击编译，保存。





## 通用UI控件

| 控件            | 作用       |
| --------------- | ---------- |
| Button          | 按钮       |
| Check Box       | 选择框     |
| Image           | 图片       |
| Progress Bar    | 进度条     |
| Rich Text Block | 富文本框   |
| Slider          | 滑动条     |
| Text            | 文本       |
| Text Box        | 输入框     |
| Combo Box       | 下拉框     |
| Editable Text   | 可编辑文本 |
| Spin Box        | 微调框     |
|                 |            |

### 常用布局控件

| 控件            | 作用                                   |
| --------------- | -------------------------------------- |
| Canvas Panel    | 通用画布面板                           |
| Grid Panel      | 矩阵格子面板，常用于做背包等           |
| Horizontal Box  | 水平布局                               |
| Vertical Box    | 垂直布局                               |
| Scroll Box      | 滚动框                                 |
| Wrap Box        | 当子对象从左至右空间不够时，会自动换行 |
| Widget Switcher | 类似Tab控制，但一次只显示一个          |
| Overlay         | 控件可叠加在另一控件上                 |
|                 |                                        |

