UObject是UE4中所有对象的基类。

# 类型

| 类型名      | 描述       |
| ----------- | ---------- |
| Super       | 基类访问   |
| ThisClass   | 当前类访问 |
| WithinClass | 包类访问   |



## 变量：

| 变量名        | 描述                               |
| ------------- | ---------------------------------- |
| ObjectFlags   | 用以跟踪和报告对象状态             |
| InternalIndex | 在GObjectArray中的索引，唯一标识符 |
| ClassPrivate  | 对象所属的类                       |
| NamePrivate   | 对象名称                           |
| OuterPrivate  | 对象驻扎的对象（包）               |
| StatID        | 统计ID                             |
|               |                                    |

# 函数：

| 功能描述         | 函数名                                                       | 描述                                                         |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 构造             | UObject                                                      | (Flags)<br />(Class,Flags,InternalFlags,Outer,Name)<br />(ObjectInitializer) |
| 自省             | StaticClass<br />StaticPackage<br />StaticClassCastFlags     | 运行时类型<br />运行时所在的包<br />类型转换标识             |
|                  |                                                              |                                                              |
| 注册             | Register,<br />RegisterDependencies,<br />DefferredRegister  |                                                              |
| 对象的自身信息   | GetUniqueID,<br />GetClass,<br />GetOuter,<br />GetFName<br />GetFullName<br />GetPathName<br />GetFullGroupName<br />GetName<br />AppendName<br />IsA<br />FindNearestCommonBaseClass<br />GetInterfaceAddress<br />GetNativeInterfaceAddress<br />IsDefaultSubobject |                                                              |
| 标识             | SetFlags,<br />GetFlags,<br />ClearFlags<br />HasAnyFlags,<br />HasAllFlags,<br />GetMaskedFlags |                                                              |
| 标记             | Mark<br />Unmark<br />HasAnyMarks<br />HasAllMarks<br />GetAllMarks |                                                              |
| 垃圾回收处理标识 | IsPendingKill<br />MarkPendingKill<br />ClearPendingKill<br />AddToRoot<br />RemoveFromRoot<br />IsRooted<br />AddToCluster<br />ClearCluster |                                                              |
| 包管理           | GetOutermost<br />MarkPackageDirty<br />IsTemplate<br />GetTypedOuter<br />IsIn<br />IsInA<br />RootPackagehasAnyFlags |                                                              |
| 链接的注释       | GetLinker<br />GetLinkerIndex<br />GetLinkerUE4Version<br />GetLinkerLicenseeUE4Version<br />GetLinkerCustomVersion |                                                              |
| 子类对象管理     | CreateDefaulgSubobject<br />CreateOptionalDefaultSubobject<br />CreateAbstractDefaultSubobject<br />GetDefaultSubobjects<br />GetDefaultSubobjectByName<br />TagSubobjects<br />BuildSubobjectMapping<br />CollectDefaultSubobjects<br />CheckDefaultSubobjects |                                                              |
| 消息回调         | PostInitProperties<br />PostCDOConstruct<br />PreSaveRoot<br />PostSaveRoot<br />PreSave<br />PostLoad<br />PostLoadSubobjects<br />Serialize<br />PostInterpChange<br />ShutdownAfterError<br />PreEditChange<br />CanEditChange<br />PostEditChangeProperty<br />PostEditChangeChainProperty<br />PreEditUndo<br />PostEditUndo<br />PostTransacted<br />PostDuplicate<br />NeedsLoadForClient<br />NeedsLoadForServer<br />NeedsLoadForTargetPlatform<br />NeedsLoadForEditorGame<br />GetPreloadDependencies<br />GetPrestreamPackages<br />ExportCustomProperties<br />ImportCustomProperties<br />PostEditImport<br /><br />GetDesc<br />GetWorld<br />GetNativePropertyValues<br /> |                                                              |
| 资源大小         | GetResourceSizeEx<br />GetResourceSizeBytes                  |                                                              |
| 重命名           | Rename<br />PostRename                                       |                                                              |
| 配置文件         | PostReloadConfig<br />SaveConfig<br />UpdateDefaultConfigFile<br />UpdateGlobalUserConfigFile<br />UpdateSinglePropertyInConfigFile<br />GetDefaultConfigFilename<br />GetGlobalUserConfigFilename<br />GetConfigOverridePlatform<br />LoadConfig<br />ReloadConfig<br />ParseParms |                                                              |
| 生命周期         | BeginDestroy<br />IsReadyForFinishDestroy<br />FinishDestroy |                                                              |
| 网络属性         | IsNameStableForNetworking<br />IsFullNameStableForNetworking<br />IsSupportedForNetworking<br />GetSubobjectsWithStableNamesForNetworking<br />PreNetReceive<br />PostNetReceive<br />PostRepNotifies<br />PreDestroyFromReplication |                                                              |
|                  | IsSelected，<br />Implements                                 | 是否被选中<br />是否实现某接口                               |
| 脚本管理         | FindFunction<br />ProcessEvent<br />GetFunctionCallspace<br />CallRemoteFunction<br />CallFunction<br />ProcessConsoleExec<br />SkipFunction<br />RegenerateClass<br />IsInBlueprint<br />AbortInsideMemberFunction |                                                              |



