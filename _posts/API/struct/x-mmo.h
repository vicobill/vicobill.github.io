#pragma once 

namespace role {

typedef u32     AEntityId;  /** 场景实体ID */

struct SRole {
    AUserId     userId;         /*< 角色所属用户ID */
    AUniqId     uid;            /*< 在数据库中的ID */
    AEntityId   entId;          /*< 角色在场景中的ID */
    FName       name;           /*< 角色名称 */
    
    struct SRoleRawAttr*        rawAttr;    /* 原始属性 */
    struct SRoleBaseAttr*       baseAttr;   /*< 基本属性 */
    struct SRoleExtAttr*        extAttr;    // extend attributes

    struct SRoleInventory*      inventory;

    struct SRoleSkillRec*       skills;     // skills learned
    struct SRoleBuffRec*        buffs;      // buffs in the scene
    struct SRoleVehicleRec*     vehicles;   // vehicles 
    struct SRoleWeaponRec*      weapons;    
    struct SRoleArmorRec*       armors;
    struct SRoleQuestRec*       quests;     
    struct SRoleHomeRec*        homes;       
    struct SRoleTravelRec*      travels;    // fast travel points
    struct SRoleMailRec*        mails;      // mails 
    struct SRoleFriendRec*      friends;    
    struct SRoleShopRec*        shops;
    struct SRoleAllyRec*        allys;
    struct SRoleArmyRec*        armys;
    struct SRoleTroopRec*       troops;
    struct SRoleCityCapRec*     cityCaps;
    struct SRoleTitleRec*       titles;
    struct SRoleAreaRepRec*     areaReps;   // area reputations

    struct SRoleFamily*         family;
};
//----------------------------------------------------------
struct SRoleRawAttr {
    i32         str;            /*< 力量 */
    i32         dex;            /*< 敏捷 */
    i32         intl;           /*< 智力 */
    i32         pers;           /*< 洞察 */
    i32         con;            /*< 体质 */
    i32         luck;           /*< 幸运 */
    i32         endu;           /*< 耐力 */
    i32         charm;          /*< 魅力 */
};
/** 
 * 基本属性
 **/
struct SRoleBaseAttr{
    i32         hp;             // health
    i32         mp;             // magic
    i32         ep;             // energe 
    i32         xp;             // experience
    i32         level;          // level

    i32         gold;           /*< 金币 */
    i32         silver;         /*< 银币 */
    i32         cooper;         /*< 铜币 */
};

struct SRoleExtAttr{
    u32         bornTime;       /*< 在游戏世界中的出生时间 */
    i32         age;            /*< 年龄 */
    u8          camp;           /*< 阵营 */
    u8          carrer;         /*< 职业 */
    i32         credit;         /*< 声誉 */
    
    u8          scene;          /*< 所在场景 */
    Vec3        pos;            /*< 在场景的位置 */

    FStr        tagSt;          /*< 个性签名 */
    
    struct SRoleResAttr* resAttr;
};

struct SRoleResAttr{
    i32         iron;           /*< 铁矿 */
    i32         stone;          /*< 石矿 */
    i32         wood;           /*< 木头 */
    i32         food;           /*< 粮食 */
    i32         horse;          /*< 马匹 */
    i32         cannon;         /*< 炮 */
    i32         thrower;        /*< 投石器 */
    i32         ladder;         /*< 云梯 */
    i32         bumpTimber;     /*< 撞木 */
    i32         ship;           /*< 船只 */
    i32         airCraft;       /*< 飞机 */
};
/** 
 * 角色邮件项
 **/
struct SRoleMailRec {
    AUniqId     fromUid;        /*< 寄信人 */
    FStr        fromName;       
    u32         flag;       // such as AWARD,QUEST,PK...
    FStr         title;
    FStr        detail;
    

    struct SRoleMailRec* next;
};

struct SRoleBuffRec {
    u32         id;
    u32         rtMsec;
    u32         flag;

    FName       name;
    FStr        desc;
    
    struct SRoleBuffRec* next;
};

struct SRoleInventory {
    i32         capcity;
    i32         used;

    struct SPropItemRec* propItems; 
};
struct SRoleSkillRec {
    u32         id;
    u32         castMsec;       // cast time: msecs
    u32         flag;           // flag,such as MANUAL,AUTO,DEBUFF,BUFF...
    f32         range;          // cast range
    f32         damRange;       // damage range
    i32         numTargets;     // max num targets
    i32         cost;           // cost how many
    i32         costFlag;       // cost what
    i32         cdMsec;         // cool down time:msecs


    FName       name;
    FStr        desc;

    struct SRoleSkillRec* next;
};

struct SPropItem {
    u32         id;
    u32         flag;       // such as: QUEST,FOOD,WEAPON...
    u32         useFlag;    // such as: ALL,MAN,NPC...
    i32         hp;
    i32         cnt;
    u32         price;
    

    FName       name;
    FStr        desc;
};

struct SPropItemRec {
    struct SPropItem item;
    struct SPropItemRec* next;
};

struct SRoleVehicleRec {
    SPropItem   item;
    u32         launchSec;
    f32         speed;
    f32         turnSpeed;
    f32         accSpdPerSec;
    u8          capcity;

    struct SRoleVehicleRec* next;
};

struct SRoleWeaponRec {
    struct SPropItem item;
    u32         launchSec;
    u32         reloadSec;  
    i32         attack;
    i32         speed;      // attack count per second
    f32         range;
    f32         damRange;
    u32         clipCap;    // clip capcity,num of ammo
    
    struct SRoleWeaponRec* next;
};

struct SRoleArmorRec {
    struct SPropItem item;
    u32         launchSec;
    i32         partFlag;
    i32         val;


    struct SRoleArmorRec* next;
};


}