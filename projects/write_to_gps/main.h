//---------------------------------------------------------------------------

#ifndef mainH
#define mainH
//---------------------------------------------------------------------------

#include "base_serv.h"
#include "ComServerSocket.h"

const int ByteArrSize = 512;
typedef byte ByteArray[ ByteArrSize ];

void __fastcall PutLogFile( AStr PPStr );
void __fastcall PutLogFileNoT( AStr PPStr );
void __fastcall UniPutLogFile( AStr PPStr, bool PPIsT );
int Server_Start(void);
void Server_Stop(void);
int ReadPacket();

extern TSocket* Socket;
extern bool ExtReadStop;

#endif
