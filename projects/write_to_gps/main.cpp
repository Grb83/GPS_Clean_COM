//---------------------------------------------------------------------------

#include <vcl.h>
#include <fcntl.h>
#include<sys\stat.h>

#include<io.h>
#include <IniFiles.hpp>

#include "ComServerSocket.h"
#include "ComServerException.h"

#pragma hdrstop

#include "main.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)

bool ExtReadStop;

const int OK_READ = 1;
const int NOT_READ = 3;
/*
const int BAD_KS_READ = 2;
const int UNKNOWN_READ = 4;
*/

void Init();

static char InitStr[ 256 ];

static int CURRENT_PORT;
static AStr BaudRate;
static AStr lParity;
static AStr StopBit;
static AStr MData;
static int TimeOut;
char CallStr[ 256 ];
char HookStr[ 256 ];
int InpCnt;
int OutCnt;
int BadCnt;
int BadOutCnt;

HANDLE hMainThread = NULL;       // Handle to thread implementing MainForm cycle

ByteArray CmdBuffer;

TSocket* Socket;

int Server_Start(void)
{
  hMainThread = NULL;

  AStr prStr = "";
  PutLogFileNoT( prStr );

  prStr = "Начало работы.";
  PutLogFile( prStr );

  DWORD dwThreadId;

  Init();

  return 1;
}

void Server_Stop(void)
{
  //Деиниц
  try
  {
    Socket->Close();
    AStr prStr = "Закрыт порт № " + IntToStr( CURRENT_PORT );
    PutLogFile( prStr );
  }
  catch (ESocket &eSoc)
  {
    AStr prStr = "Ошибка сокета: " + eSoc.Message;
    PutLogFile( prStr );
  };
  delete Socket;
  //е Деиниц

  AStr prStr = "Конец работы.";
  PutLogFile( prStr );
}

void __fastcall PutLogFileNoT( AStr PPStr )
{
  UniPutLogFile( PPStr, FALSE );
}
void __fastcall PutLogFile( AStr PPStr )
{
  UniPutLogFile( PPStr, TRUE );
}

void __fastcall UniPutLogFile( AStr PPStr, bool PPIsT )
{
  int prLogFileH;
  //Проток
  TWrkStr fullName;
  AStr prStr = ExtractFilePath(Application->ExeName) + "ComPTermPrj.log";
  strcpy( fullName, prStr.c_str() );
  if
  (
    (
      prLogFileH
      =
      open
      (
        fullName
        ,
        O_RDWR
        |
        O_CREAT
        |
        O_TEXT
        |
        O_APPEND
        ,
        S_IREAD|S_IWRITE
      )
    )
    ==
    -1
  )
  {
    perror("Error:");
    int prI = errno;
    throw;
  }
  //e Проток

  AStr prMStr;
  if ( PPIsT )
    prMStr = DateTimeToStr( Now() ) + " - " + PPStr + "\n";
  else
    prMStr = PPStr;
//     + "\n";

  write( prLogFileH, prMStr.c_str(), strlen( prMStr.c_str() ) );
  close( prLogFileH );
};

void Init()
{
  //Чтение ini-файла
  if ( FileExists( ExtractFilePath(Application->ExeName) + "ComPTermPrj.INI") )
  {
    // Чтение параметров COM порта
    TIniFile* IniFle = new TIniFile( ExtractFilePath(Application->ExeName) + "ComPTermPrj.INI" );

    CURRENT_PORT = IniFle->ReadInteger("CONFIG", "LISTEN PORT", 4);
    BaudRate = IniFle->ReadString("CONFIG", "BAUD RATE", "1200");
    lParity = IniFle->ReadString("CONFIG", "PARITY", "N");
    StopBit = IniFle->ReadString("CONFIG", "STOP BIT", "1");
    MData = IniFle->ReadString("CONFIG", "DATA", "8");
    TimeOut = 1000 * ( IniFle->ReadInteger("CONFIG", "TIMEOUT", 2) );

    delete IniFle;
    //e
  };
  //e Чтение ini-файла

	Socket = new TSocket();

  DCB lDCB;

  AStr InitAStr;
  InitAStr = "baud=" + BaudRate + " parity=" + lParity + " data=" +
    MData + " stop=" + StopBit;

  strcpy( InitStr, InitAStr.c_str() );

  BuildCommDCB( InitStr, &lDCB );

  Socket->usNumCom =(unsigned short)CURRENT_PORT;
  Socket->usBaud	  =(unsigned short)( StrToInt( BaudRate ) );
  char prChar = ( lParity.c_str() )[ 0 ];
  if ( 'N' == prChar )
    Socket->bParity = 0;
  else if ( 'E' == prChar )
    Socket->bParity = 1;
  else if ( 'O' == prChar )
    Socket->bParity = 2;
  Socket->usData	  =(unsigned short)( StrToInt( MData ) );
  Socket->usStop	  =(unsigned short)( StrToInt( StopBit ) );
  Socket->bProtocol = SOCK_PROT_NON;
  Socket->usType = ASDU_SOCK;
  Socket->usAddr = 0;
  Socket->usFlowCtrl = FLCTRL_NON;
  Socket->cTypeChanel = CH_RS232;//Указатель на тип канала 0 - RS232;1 -	RS485;2 - Модем Коммут.;
  strcpy( Socket->sCallStr, CallStr );
  strcpy( Socket->sHookStr, HookStr );
  memcpy( &(Socket->dcb), &lDCB, sizeof(Socket->dcb) );

  try
  {
    Socket->Open();
    AStr prStr = "Открыт порт № " + IntToStr( CURRENT_PORT );
    PutLogFile( prStr );
  }
  catch (ESocket &eSoc)
  {
    AStr prStr = "Ошибка сокета: " + eSoc.Message;
    PutLogFile( prStr );
  }
}

int ReadPacket()
{
  Word CountByte;
  ExtReadStop = FALSE;
  memset( CmdBuffer, 0x0 , sizeof( CmdBuffer ) );
//  while( !ExtReadStop )
  for ( int i = 0; i < 300; i++ )
  {
    CountByte= Socket->ReadEx(  CmdBuffer, 1, TimeOut );
    if( 1 == CountByte )
    {
      if( 0x02 == CmdBuffer[0] )
      {
      }//Первый синхроимп
      byte prB = CmdBuffer[0];
//      AStr prStr = IntToStr( prB );
      char prChar[ 30 ];
      prChar[ 0 ] = prB;
      prChar[ 1 ] = '\0';
//      AStr prStr = IntToStr( prB );
      AStr prStr = prChar;
      PutLogFileNoT( prStr );
    }//Проч-ли 1 симв
  }//while
  return 1;
}

