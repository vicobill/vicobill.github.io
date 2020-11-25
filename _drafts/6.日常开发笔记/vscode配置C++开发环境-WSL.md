1. 前提条件：
- 安装VSCODE
- 安装C++ Extension for VSCODE
- 安装WSL

2. 设置WSL Linux环境
- 在~/下，创建projects/helloworld
- 更新WSL：`sudo apt update && sudo apt dist-upgrade`
- 安装必要编译环境：`sudo apt install build-essential gdb`

3. 创建Workspace
- 在Windows下任意目录，使用cmd 创建与WSL结构类似的目录：projects/helloworld
- 使用vscode打开helloworld目录：`cd projects/helloworld && code .`

4. 配置编译器路径(c_cpp_properties.json)
- ctrl+shift+p > C/C++:Edit Configurations(UI)
- 选中compiler path 为`/usr/bin/g++`
- Intellisense mode 为 `${default}`

5. 创建构建任务：(tasks.json)
- ctrl+shift+p > Tasks:Configure Default Build Task
- 编辑tasks.json为：
```json
{
  "version": "2.0.0",
  "windows": {
    "options": {
      "shell": {
        "executable": "bash.exe",
        "args": ["-c"]
      }
    }
  },
  "tasks": [
    {
      "label": "build hello world on WSL",
      "type": "shell",
      "command": "g++",
      "args": [
        "-g",
        "-o",
        "/home/<your linux user name>/projects/helloworld/helloworld.out",
        "helloworld.cpp"
      ],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

6. 配置调试设置：(launch.json)
- 菜单Debug > Add Configuration 选择 C++(GDB/LLDB)
- 编辑launch.json为：
``` json 
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "(gdb) Launch",
      "type": "cppdbg",
      "request": "launch",
      "program": "/home/<your Linux user name>/projects/helloworld/helloworld.out", // 这里是WSL中的目录
      "args": [""],
      "stopAtEntry": true, // 在入口处自动停止
      "cwd": "/home/<your Linux user name>/projects/helloworld/", // 这里是WSL中的目录
      "environment": [],
      "externalConsole": true,
      "windows": {
        "MIMode": "gdb",
        "miDebuggerPath": "/usr/bin/gdb",
        "setupCommands": [
          {
            "description": "Enable pretty-printing for gdb",
            "text": "-enable-pretty-printing",
            "ignoreFailures": true
          }
        ]
      },
      "pipeTransport": {
        "pipeCwd": "",
        "pipeProgram": "c:\\windows\\sysnative\\bash.exe",
        "pipeArgs": ["-c"],
        "debuggerPath": "/usr/bin/gdb"
      },
      "sourceFileMap": {
        "/mnt/c": "${env:systemdrive}/",
        "/usr": "C:\\Users\\<path to WSL directory which you will place here later>" // 这里的实际目录，会在接下来的步骤再设置
      }
    }
  ]
}

```

7. 添加helloworld.cpp
- 在VSCode中，新建文件helloworld.cpp
- 添加测试代码并保存：
``` cpp
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
   vector<string> msg {"Hello", "C++", "World", "from", "VS Code!", "and the C++ extension!"};

   for (const string& word : msg)
   {
      cout << word << " ";
   }
   cout << endl;
}
```
- 移到string上，按下F12，可打开其定义头文件
- 在VSCODE选项卡上，右键，Copy Path，即可得到包含的头文件真实路径。

8. 设置系统头文件目录：
- 将上一步复制的路径，填入launch.json的sourceFileMap：
``` json 
    "sourceFileMap": {
        "/mnt/c": "${env:systemdrive}/",
        "/usr": "C:\\Users\\Administrator\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\usr\\"
    }
```

9. 配置完成
- 可按ctrl+shift+b构建，按F5即可调试。