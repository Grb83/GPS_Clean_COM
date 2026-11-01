//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#pragma inline

#include "AvcTime.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

extern "C" time_t __stdcall vc_time(void);
extern "C" tm*    __stdcall vc_localtime(const time_t*);
extern "C" time_t __stdcall vc_mktime(tm* t);

time_t avc_time(void)
{
  return vc_time();
}

tm* avc_localtime(const time_t* t)
{
  tm* TM;

  TM = vc_localtime(t);
  asm {
    add esp,4
  }
  return TM;
}

time_t avc_mktime(tm* TM)
{
  time_t t;

  t = vc_mktime(TM);
  asm {
    add esp,4
  }
  return t;
}
