//---------------------------------------------------------------------------
#ifndef AvcTimeH
#define AvcTimeH
//---------------------------------------------------------------------------
#include <time.h>

time_t avc_time(void);
tm*    avc_localtime(const time_t*);
time_t avc_mktime(tm*);

#endif
