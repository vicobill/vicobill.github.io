1. 怎么加载地图？切换地图？

   > 通过UEngine::LoadMap 、GameStatics::OpenLevel,GetWorld()->ServerTravel(URL)

2. 在切换关卡后，如何仍然保持游戏数据？

   使用GameInstance。

3. 如何实例化对象？

   NewObject<> ,GetWorld()->SpawnActor<>

4. Component的操作：

   CreateDeaultSubobject<>: 实时创建组件

   GetOwner() ：获取组件所附着的Actor

   FindComponentByClass\<T\>()：查找Actor中的指定类型的Component

   

5. 怎么指定游戏模式？

   > 通过DefaultGame.ini设置默认GameMode，或者通过UEngine::LoadMap的url设置中的?game=xxx设置游戏模式。

6. 游戏模式包含哪些内容？

   > 游戏模式包含GameFramework中大多数类的设置：GameSession，DefaultPawn，PlayerController，GameState，PlayerState，HUD，

7. 开火时，怎么指定开火动画？

8. 人物动作动画如何切换？

9. 如何切换武器？

10. 配置文件能配置什么？
   - 默认的地图：
     - 编辑器默认的地图
     - 游戏默认地图：通常为Entry
     - 服务器默认地图

11. 如何指定输入？

    在InputComponent中绑定事件，在ini中配置输入动作对应的按键或轴。

12. 如何打印日志：

    GEngine->AddOnScreenDebugMessage;UE_LOG; FError::Throwf; FMessageDialog::Open

    ``` c++
    DECLARE_LOG_CATEGORY_EXTERN(MyCat,DefaultVerbosity,CompileTimeVerbosity)
    DEFINE_LOG_CATEGORY(MyCat)
    ```

    

    

13. 如何查找Component？

    




# 教程

1. 实现GameMode

2. 新建Character类，然后创建此类的蓝图类，用于设置基本的Mesh。然后将Maps&Modes的BP_MyCharacter设为默认的Pawn

   1. 在Engine-Input中添加Axis Mapping，实现角色移动

   2. 添加角色移动函数：UFUNCTION MoveForward,MoveRight

      ``` c++
      void MyCharacter::SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) {
          Super::SetupPlayerInputComponent(PlayerInputComponent);
          PlayerInputComponent->BindAxis("MoveForward",this,&MyCharacter::MoveForward);
          
      }
      
      void MyCharacter::MoveForward(float Value) {
          FVector Direction = FRotationMatrix(Controller->GetControlRotatioin()).GetScaledAxis(EAxis::X);
          AddMovementInput(Direction,Value);
      }
      ```

   3. 添加相机跟随控制：

      ``` c++
      PlayerInputComponent->BindAxis("Turn",this, &MyCharacter::AddControllerYawInput);
      PlayerInputComponent->BindAxis("LookUp",this,&MyCharacter::AddControllerPitchInput);
      ```

   4. 添加角色跳跃：在Engine Input中添加Action Mappings：Jump，在代码中：

      ``` c++
      void MyCharacter::StartJump() {
          bPressedJump = true;
      }
      void MyCharacter::StopJump() {
          bPressedJump = false;
      }
      ```

   5.  为角色添加模型：导入FBX模型，将导入的模型置给MyCharacter的Mesh属性。

   6.   相机跟随：添加CameraComponent

      ``` c++
      CameraComponent = CreateDefaultSubobject<UCameraComponent>(TEXT("FPSCam"));
      CameraComponent->SetupAttachment(GetCapsuleComponent());
      CameraComponent->SetRelativeLocation(FVector(0,0,50.f + BaseEyeHeight));
      CameraComponent->bUsePawnControlRotation = true;
      ```

      

   7.  为角色添加第一人称模型：USkeletalMeshComponent

      ``` c++
      FPSMesh = CreateDefaultSubobject<USkeletalMeshComponent>(TEXT("FPSMesh"));
      FPSMesh->SetOnlyOwnerSee(true); // 该模型仅对宿主玩家可见
      FPSMesh->SetupAttachment(CameraComponent);
      FPSMesh->bCastDynamicShadow = false; // 此模型不产生阴影
      FPSMesh->CastShadow = false;
      
      GetMesh()->SetOwnerNoSee(true); // 设置宿主玩家无法看到第三人称身体模型。
      ```

3. 实现子弹：FPSProjectTile

   1. 添加UProjectileMovementComponent和USphereComponent。球体用于碰撞。

      ``` c++
      CollisionSphereComponent = CreateDefaultSubobject<USphereComponent>(TEXT("SphereComponent"));
      CollisionSphereComponent->InitSphereRadius(15.f);
      RootComponent = CollisionSphereComponent;
      
      ProjectileMovementComponent= CreateDefaultSubobject<UProjectileMovementComponent>(TEXT("ProjectileMovementComponent"));
      ProjectileMovementComponent->SetUpdatedComponent(CollisionSphereComponent);
      ProjectileMovementComponent->InitialSpeed = 3000;
      ProjectileMovementComponent->MaxSpeed = 3000;
      ProjectileMovementComponent->bRotationFollowsVelocity = true;
      ProjectileMovementComponent->bShouldBounce = true;
      ProjectileMovementComponent->Bouciness = 0.3f;
      
      ```

      

   2. 设置初始速度：

      ``` c++
      void MyProjectile::FireInDirection(const FVector& Direction) {
          ProjectileMovementComponent->Velocity = Direction * ProjectileMovementComponent->InitialSpeed;
      }
      ```

      

   3. 绑定开火操作：UFUNCTION Fire

      ``` c++
      PlayerInputComponent->BindAction("Fire", IE_Pressed,this,&MyCharacter::Fire);
      ```

      

   4. 给角色添加枪口位置，以便于生成子弹：FVector MuzzleOffset; TSubclassOf\<class MyProjectile\> ProjectileClass;

      ``` c++
      void MyCharacter::Fire() {
          if (!ProjectClass) return;
          if(!World) return;
          FVector CamLocation;
          FRotator CamRotation;
          
          GetActorEyesViewPoint(CamLocation,CamRotation);
          
          FVector MuzzleLocation = CamLocation + FTransforom(CamRotation).TransformVector(MuzzleOffset);
          FRotator MuzzleRotation = CamRoation;
          MuzzleRoation.Pitch += 10.0f; // 往上抬高准星
          
          FActorSpawnParameters SpawnParams;
          SpawnParams.Owner = this;
          SpawnParams.Instigator = Instigator;
          MyProjectile* Projectile = World->SpawnActor<MyProjectile>(ProjectileClass,MuzzleLocation,MuzzleRotation,SpawnParams);
          if (Projectile) {
              FVector LaunchDir =MuzzleRotation.Vector();
              Projectile->FireInDirection(LaunchDir);
          }
      }
      ```

      




# 动画：

动画分为：动画序列、混合空间、动画蓝图。动画序列是美术提供的动画资源；混合空间是根据现有动画序列，在不同参数值情况下，自然过渡到对应动画序列；动画蓝图用于控制动画的播放。