# Unity开发常用方法

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
