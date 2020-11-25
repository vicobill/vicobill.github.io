# Unity开发常用代码

* 场景加载：

  SceneManager.LoadScene

* 鼠标点选映射

* 范围选取：

  Physics.OverlapSphere

* 动作播放：动作是状态机控制。通过Animator.SetXXX

* 文件与目录操作：System.IO.Directory

* 可通过Application.CaptureScreenshop截屏

* 创建于销毁GameObject：Instantiate，Destroy

``` c#

var v = target.pos - player.pos;
var distance = v.magnitude
var direction = v / distance;	// 得到归一化的方向

```

* Unity 日志文件目录：

  | 平台    | 日志目录                                                     |
  | ------- | ------------------------------------------------------------ |
  | macos   | ~/Library/Logs/Unity/                                        |
  | windows | `C:\Users\username\AppData\Local\Unity\Editor\Editor.log`;C:\Users\username\AppData\LocalLow\CompanyName\ProductName\output_log.txt |

* 定义自定消息：

  ``` c#
  public interface ICustomMessageTarget : IEventSystemHandler{
      void message1();
  }
  public class CustomMessageTarget:MonoBehaviour ,ICustomMessageTarget {
      void message1(){}
  }
  ExecuteEvents.Execute<ICustomMessageTarget>(target,null,(x,y)=>x.message1());
  ```



* 坐标转换：

  Transform.TransformPoint将坐标点从局部坐标系转换成世界坐标系。Transform.InverseTransformPoint将坐标点从世界坐标系转换成局部坐标系。

  Transform.TransformDirection和InverseTransformDirection将矢量在局部坐标系和世界坐标系中互换。

* 常用矢量操作：

  * 加法： 计算合力，计算合力的分力等
  * 减法：计算距离
  * 数乘：缩放
  * 点乘：计算夹角
  * 叉乘：计算增维空间与原矢量垂直的矢量
  * 投影（Project）：计算a矢量到b矢量上的投影
  * 归一化（Normalize）：将矢量变换成大小为1个单位，方向不变的矢量。常用作法线。
  * 取大小（magnitude）：取矢量的长度
  * 差值运算（Lerp）：可用作缓动效果，如同刹车后车慢慢停下。