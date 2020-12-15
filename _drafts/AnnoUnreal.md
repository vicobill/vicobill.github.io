# Unreal4源码分析    

## Prepare
###  Setup
设置环境变量，下载构建依赖工具和库，即时编译第三方库

Setup.sh/.bat：安装附加包(指定发行版)并下载第三方库预编译的二进制库。
	验证是否存在engine/binaries/dotnet/GitDependencies.exe

	将GitDependencies.sh作为 git/hooks应用到hooks/post-checkout,hooks/post-merge

	运行GitDependencies.sh
		SetupMono.sh: 设置.NET的mono实现环境，并将mono相关的环境变量
		mono GitDependencies.exe ??
		linux/setup.sh: 
			apt install -y build-essentials
			SetupToolchain.sh: 设定工具链
				从cdn下载clang放在Extras/ThirdPartyNotUE/*
			BuildThirdParty.sh: 构建第三方库(Source/ThirdParty/)
				zlib
				jemalloc
				opus
				ogg
				vorbis
				hlslcc 依赖clang
				mcpp
				freetype
				icu
				ForsythTri
				nvTriStrip
				nvTextureTools 依赖 nvcore,nvimage,nvmath,nvtt,squish
				SDL2
				coremod
				mono 会从git(https://github.com/mono/mono.git)下载指定mono版本
				GoogleTest
				strophe


GitDependencies.exe => Engine/Source/Programs/GitDependencies
	从所有目录下的Build/*.gitdeps.xml读取依赖项 (存放在Build目录下)
	从所有带有*.uplugin的目录，查询Build/*.gitdeps.xml，读取依赖项。(存放在Plugins目录下)
	将新的manifest文件写入 .ue4dependencies
	下载所有清单中列出的文件。（下载路径：baseurl/remotepath/hash   http://cdn.unrealengine.com/dependencies/)
	
当以上步骤 SUCCESS 后，可 GenerateProjectFiles.sh 会生成项目工程。



### GenerateProjectFiles
构建UnrealBuildTool工具 `xbuild UnrealBuildTool.csproj`

	xbuild: msbuild是类似make的Microsoft的构建工具。xbuild是Mono组实现的msbuild，它允许在linux以msbuild形式被构建（但只能用于构建C#和VB工程）

生成项目文件 `mono UnrealBuildTool -projectfiles`



