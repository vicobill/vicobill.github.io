
struct SMail {
    int             id;
    int             flag;
    UserId          from;
    UserId          to;
    FTime           send_time;
    int             contentLength;
    const char*     contents;
    int             state;
    void*           enclusures;
};

SMail*      New();
int         SendMail(SMail* mail,int timeout,int attempts);
int         PostMail(SMail* mail);
int         PullMails(SMail** mails);
int         DestroyMail(SMail* mail);
int         GetPrivilege(UserId  userid,SMail* mail);
int         GetMailEnclosures(UserId userid,SMail* mail);

