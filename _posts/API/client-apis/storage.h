/// 存储
int fr_storage_write(const char* key, const char* val);
int fr_storage_read(const char* key,char* val);
void fr_storage_dir(char* dir);
void fr_storage_clear(); // 清除所有数据


int fr_storage_write_async(const char* key,const char* val);
int fr_storage_read_async(const char* key);
int fr_storage_size_async(); // 获取云存储大小
int fr_storage_clear_async();