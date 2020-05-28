
struct SChatMsg {
	int 	id;
	int 	flag;
	FTime 	time;
	Uid 	from;
	Uid 	to;
	int 	channel;
	int 	state;
	int 	length;
	const char* contents;
};

int 	TryChat(Uid a,Uid b);
int 	Chat(SChatMsg* msg);

struct SChatGroup{
	int 	id;
	FTime	mktime;
	Uid 	owner;
	int 	memberNum;
	Uid* 	members;
};

int 	NewChatGroup(Uid owner);
int 	Mute(Uid a,int grp,int time, int reason);
int 	Unmute(Uid a,int grp);
int 	Ban(Uid a,int grp,int time,int reason);
int 	Unban(Uid a,int grp);
int 	Kick(Uid a,Uid b,int grp,int reason);

struct SLiveShow{
	int 	id;
	int 	gameid;
	FTime 	starttime;
	FTime 	stoptime;
	Uid 	owner;
};
int 	StartLive(Uid);
int 	StopLive(Uid);
int 	Gift(Uid,SLiveShow*,int gift);
int 	Unlike(Uid,SLiveShow*);
int 	Like(Uid,SLiveShow* );
