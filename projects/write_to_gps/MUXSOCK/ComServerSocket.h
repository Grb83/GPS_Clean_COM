//---------------------------------------------------------------------------
#ifndef ComServerSocketH
#define ComServerSocketH

#define PK_LITE 1  // 1 - using MOXA PComm library functions
                   // 0 - using library Muxsock1.dll

//---------------------------------------------------------------------------
#if PK_LITE == 1
  #include "PComm.h"
  #include "Ssock.h"
#else
  #include "Ssock.h"
#endif
//chig #include "ComServerException.h"

//---------------------------------------------------------------------------

class TComServerThread;
extern const unsigned int TimeOutSocket; // Время ожидания ответа сокета

//---------------------------------------------------------------------------

class TSocket
{
  private:
  public:
    unsigned short usNumCom;    // Номер порта (1...16)
    unsigned long  usBaud;      // Скорость
    unsigned short usData,      // Количество бит
                   usStop,      // Количество стоп бит
                   bParity,	    // Контроль четности
                   usType,      // Тип сокета ASDU_SOCK или ASKUE_SOCK
                   usAddr,      // Адрес отправителя (используется для протокола), 0
                   usFlowCtrl,  // Признак контроля потока: 0 - нет контроля потока, 1 - RTS/CTS
                   bProtocol;   // Протокол: 0 - работа без протокола
    char cTypeChanel;           // Указатель на тип канала 0 - RS232; 1 - RS485; 2 - Модем Коммут.;
                                //                         3 - Модем НС; 4 - Радио;
    char sCallStr[64];          // Указатель на строку связи модема(радиомодема)
    char sHookStr[64];          // Указатель на строку разрыва соединения модема(радиомодема)
    DCB dcb;                    // Указатель на DCB порта (см.WIN32 Help)
    unsigned short Id;
    int retries,
        retries_tout;

    int read_timeout;           // Для переустановки t-out в PComm

  public:
    __fastcall TSocket();
    void __fastcall Open(void);
    void __fastcall Close(void);
    void __fastcall Read(void* buf, unsigned short num, int t_out=TimeOutSocket);
    unsigned short __fastcall ReadEx(void* buf, unsigned short num, int t_out=TimeOutSocket);
    void __fastcall Write(void* buf, unsigned short num);
    inline bool __fastcall Status(void);
    inline void __fastcall Clear(void);
#if PK_LITE == 1
    void __fastcall IoCtl(void);
#endif
};

//---------------------------------------------------------------------------
inline bool __fastcall TSocket::Status(void)
{
#if PK_LITE == 1
  return true;
#else
  return GetSSockConnectStatus(Id);
#endif
}

//---------------------------------------------------------------------------
inline void __fastcall TSocket::Clear(void)
{
#if PK_LITE == 1
  sio_flush((int)usNumCom, 2);
#else
  PurgeSSockInputQueue(Id);
#endif
}

//---------------------------------------------------------------------------
#endif
