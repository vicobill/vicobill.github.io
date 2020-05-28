
struct SRankRec {
    int     id;
    int     type;
    int     rows;
    Uid*    players;
};

int     GetRankList(int type, SRankRec*,int maxnum);
int     Sort(SRancRec*,const SRankRec* ,cmp_t );
int     GetRange(int type,int start,int length,SRankRec* );
