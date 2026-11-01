//---------------------------------------------------------------------------
#ifndef ComServerSocketH
#define ComServerSocketH

#include <windows.h>
#include <vcl.h>
#include "ComServerException.h"

extern const unsigned int TimeOutSocket;

class TSocket
{
  private:
    HANDLE hComm;

  public:
    unsigned short usNumCom;
    unsigned long  usBaud;
    unsigned short usData;
    unsigned short usStop;
    unsigned short bParity;
    
    unsigned short usType;
    unsigned short usAddr;
    unsigned short usFlowCtrl;
    unsigned short bProtocol;
    char cTypeChanel;
    char sCallStr[64];
    char sHookStr[64];

    __fastcall TSocket();
    __fastcall ~TSocket();

    void __fastcall Open(void);
    void __fastcall Close(void);
    void __fastcall Clear(void);

    unsigned short __fastcall ReadEx(void* buf, unsigned short num, int t_out = TimeOutSocket);
    void __fastcall Write(void* buf, unsigned short num);
    
    inline bool __fastcall Status(void) { 
        if (hComm == INVALID_HANDLE_VALUE) return false;
        DWORD err;
        COMSTAT stat;
        // ???? ?????????? ?????????, ClearCommError ????? ?????? false
        return ClearCommError(hComm, &err, &stat) != 0;
    }
};

#endif
