//---------------------------------------------------------------------------

#ifndef main_threadH
#define main_threadH
//---------------------------------------------------------------------------

#include "base_serv.h"

void __fastcall PutLogFile( AStr PPStr );
void __fastcall PutLogFileNoT( AStr PPStr );
void __fastcall UniPutLogFile( AStr PPStr, bool PPIsT );
int Server_Start(void);
void Server_Stop(void);

#endif
