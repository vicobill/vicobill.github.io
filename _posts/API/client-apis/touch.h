
// 客户端与服务器连接
int fr_client_new();
int fr_client_destroy();
int fr_client_touch(const char* adr);   // 与服务器连接
int fr_client_untouch();        // 与服务器断开连接
int fr_client_pulse_async();    // 与服务器保持连接
int fr_client_is_oblivion();       // 客户端被断开

// 客户端与服务器连接后，通过pipe通信
int fr_pipe_pull_async();   // 从服务器获得消息
int fr_pipe_fetch();    // 查看是否有数据
int fr_pipe_push_async(const void* data); // 给服务器发消息
int fr_pipe_close();    // 主动关闭
bool fr_pipe_is_close();
bool fr_pipe_is_authorized();   // 是否有权访问


/* Session 授权之后，与服务器的会话 */

int fr_session_new(const char* sid);
int fr_session_close(const char* sid);

int fr_session_authorize(const char* sid,const char* token);
int fr_session_is_active(const char* sid);

int fr_session_freeze_async();
int fr_session_unfreeze_async();

int fr_session_read_async();
int fr_session_write_async();

int fr_session_assoc_pipe(const void* pipe); // 与网路关联



