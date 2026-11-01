//---------------------------------------------------------------------------
//       КЛАСС ПРЕДОСТАВЛЯЕТ МЕТОДЫ ДЛЯ ОПРОСА СОКЕТА
//  Интерфейсный класс для библиотеки Muxsock1.dll
//  Связан с дочерним окном главной формы для отображения состаяния сокета
//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ComServerSocket.h"
#include "ComServerException.h"
//chig #include "ComServerThread.h"
#pragma package(smart_init)
//---------------------------------------------------------------------------

const unsigned int TimeOutSocket=100;

//---------------------------------------------------------------------------

__fastcall TSocket::TSocket()
{
                      //        Начальные установки

#if 0                  // без КМ
  usNumCom = 1;
  usBaud = 300;
  usData = 7;
  usStop = 1;
  bParity = 1;
  read_timeout = 0;

#if PK_LITE == 0
  usType = ASKUE_SOCK;
  usAddr = 101;
  usFlowCtrl = FLCTRL_RS485;
//	usFlowCtrl = FLCTRL_NON;
  bProtocol = SOCK_PROT_NON;
  cTypeChanel = CH_RS232;
  sHookStr[0] = sCallStr[0] = 0;
  memset(&dcb, 0, sizeof(dcb));
  Id = 0xFFFF;
#endif

#else
                        // KM ----------------
  usNumCom = 2;
  usBaud = 9600;
  usData = 8;
  usStop = 1;
  bParity = 0;
  read_timeout = 0;

#if PK_LITE == 0
  usType = ASKUE_SOCK;
  usAddr = 41;
  usFlowCtrl = FLCTRL_RS485;
//	usFlowCtrl = FLCTRL_NON;
  bProtocol = SOCK_PROT_OCT;
  cTypeChanel = CH_RS232;
  sHookStr[0] = sCallStr[0] = 0;
  memset(&dcb, 0, sizeof(dcb));
  Id = 0xFFFF;
#endif
#endif
}
//---------------------------------------------------------------------------
void __fastcall TSocket::Open(void)
{
//chig  ComServerThread->socketWait();

#if PK_LITE == 1

  int iErr, port;

  port = (int)usNumCom;
  iErr = sio_open(port);
  if (iErr != 0) throw ESocket("Ошибка открытия порта: " + IntToStr(iErr), ERR_OPEN_SOCKET);

  IoCtl();

#else

  char ModeString[64];
  char chParity;
  unsigned int uiResult;
  int count;

  switch (bParity) {
      case 0:
          chParity='N';
          break;
      case 1:
          chParity='E';
          break;
      case 2:
          chParity='O';
          break;
  }
  sprintf(ModeString, "baud=%lu parity=%c data=%hu stop=%hu", usBaud, chParity, usData, usStop);

#if 0
  if (usNumCom > 2) {
    usFlowCtrl=FLCTRL_RS485;  // 15.06.01 -- by AVN для отладки dll
  }
  if (usNumCom == 2) {
    usFlowCtrl=FLCTRL_RTSCTS;  // 03.07.01 -- by AVN для отладки модемов
  }
#endif

  uiResult=OpenSSock( usNumCom,ModeString,bProtocol,usType,usAddr,usFlowCtrl,
  &cTypeChanel,sCallStr,sHookStr,&dcb);
  //Если произошла ошибка открытия сокета
  Id=(unsigned short)(uiResult & 0x0000FFFF);
  if (uiResult & 0xFFFF0000) {
//chig      ComServerThread->socketBad();
      switch (uiResult >> 16) {
          case SOCK_PORT_OPEN_ERROR: Id = 0xFFFF;
                                     throw ESocket("Ошибка открытия порта.", ERR_OPEN_SOCKET);
          case SOCK_PORT_DCB_NOTMATCH: throw ESocket("Не совпадают настройки режима порта.", ERR_OPEN_SOCKET);
          case SOCK_DEV_NOTMATCH: Id = 0xFFFF;
                                  throw ESocket("Не совпадает строка связи или тип канала.", ERR_OPEN_SOCKET);
          case SOCK_OPEN_ERROR: Id = 0xFFFF;
                                throw ESocket("Слишком много открытых сокетов.", ERR_OPEN_SOCKET);
          case SOCK_BAD_TYPE:
          case SOCK_LIMIT_EXC:
          case SOCK_READ_TOUT:
          default:             Id = 0xFFFF;
                               throw ESocket("Невозможно открыть сокет.", ERR_OPEN_SOCKET);
      }
  }
  if (Id == 0xFFFF) {
//chig      ComServerThread->socketBad();
      throw ESocket("Сокет не открыт.", ERR_OPEN_SOCKET);
  }
  ReadSSock( Id, (unsigned char*)ModeString, 1, 10 );
  if (!GetSSockConnectStatus(Id)) {
      Sleep(retries_tout*1000);
      count=0;
      while (!GetSSockConnectStatus(Id) && ++count<=retries) Sleep(retries_tout*1000);
      if (count > retries) {
          Close();
//chig          ComServerThread->socketBad();
          throw ESocket("Соединение не установлено.", ERR_OPEN_SOCKET);
      }
  }
#endif

//chig  ComServerThread->socketOk();
}

//---------------------------------------------------------------------------

#if PK_LITE == 1
void __fastcall TSocket::IoCtl(void)
{
  int iErr, port, baud, bit_cnt, stop_bit, parity;

  port = (int)usNumCom;

  switch (usBaud) {
    case 50L: baud = B50; break;
    case 75L: baud = B75; break;
    case 110L: baud = B110; break;
    case 134L: baud = B134; break;
    case 150L: baud = B150; break;
    case 300L: baud = B300; break;
    case 600L: baud = B600; break;
    case 1200L: baud = B1200; break;
    case 1800L: baud = B1800; break;
    case 2400L: baud = B2400; break;
    case 4800L: baud = B4800; break;
    case 7200L: baud = B7200; break;
    case 9600L: baud = B9600; break;
    case 19200L: baud = B19200; break;
    case 38400L: baud = B38400; break;
    case 57600L: baud = B57600; break;
    case 115200L: baud = B115200; break;
    case 230400L: baud = B230400; break;
    case 460800L: baud = B460800; break;
    case 921600L: baud = B921600; break;
    default: baud = B9600;
  }

  switch (usData) {
    case 5: bit_cnt = BIT_5; break;
    case 6: bit_cnt = BIT_6; break;
    case 7: bit_cnt = BIT_7; break;
    case 8: bit_cnt = BIT_8; break;
    default: bit_cnt = BIT_8;
  }

  switch (usStop) {
    case 1: stop_bit = STOP_1; break;
    case 2: stop_bit = STOP_2; break;
    default: stop_bit = STOP_1;
  }

  switch (bParity) {
    case 0: parity = P_NONE; break;
    case 1: parity = P_EVEN; break;
    case 2: parity = P_ODD; break;
    default: parity = P_NONE;
  }

  iErr = sio_ioctl(port, baud, parity | bit_cnt | stop_bit);
  if (iErr != 0) {
//chig    ComServerThread->socketBad();
    throw ESocket("Ошибка настройки порта: " + IntToStr(iErr), ERR_OPEN_SOCKET);
  }
}
#endif

//---------------------------------------------------------------------------

void __fastcall TSocket::Close(void)
{
#if PK_LITE == 1

  int iErr, port;

//chig  ComServerThread->socketWait();
  port = (int)usNumCom;
  iErr = sio_close(port);
  if (iErr != 0) {
//chig    ComServerThread->socketBad();
    throw ESocket("Ошибка закрытия порта: " + IntToStr(iErr));
  }
//chig  ComServerThread->socketOk();

#else

	if( Id==0xFFFF )
		return;
//chig	ComServerThread->socketWait();
	if( CloseSSockEx(Id, 1) )        // 02.03.01  --  by AVN -- closing SSock & Com port !!!
	{
//chig		ComServerThread->socketOk();
		Id=0xFFFF;
	}
	else
	{
//chig		ComServerThread->socketBad();
		throw(ESocket("Сокет не закрыт."));
	}
#endif
}
//---------------------------------------------------------------------------
unsigned short __fastcall TSocket::ReadEx( void* buf, unsigned short num, int t_out )
{
	unsigned short read;

//chig	ComServerThread->socketWait();

#if PK_LITE == 1

  int iErr, port;

  port = (int)usNumCom;
  if (t_out != read_timeout) {
    read_timeout = t_out;
    iErr = sio_SetReadTimeouts(port, read_timeout, 0);
    if (iErr != 0) {
//chig      ComServerThread->socketBad();
      throw ESocket("Ошибка установки таймаута чтения порта: " + IntToStr(iErr));
    }
  }
  iErr = sio_read(port, (char*)buf, (int)num);
  if (iErr < 0) {
//chig    ComServerThread->socketBad();
    throw ESocket("Ошибка чтения порта: " + IntToStr(iErr));
  }
  read = (unsigned short)iErr;

#else

	read = ReadSSock( Id, (unsigned char*)buf, num, t_out );

#endif

//chig    ComServerThread->socketOk();

    return read;
}
//---------------------------------------------------------------------------

void __fastcall TSocket::Read( void* buf, unsigned short num, int t_out )
{
	register unsigned short read;
//chig	ComServerThread->socketWait();

#if PK_LITE == 1

  int iErr, port;

  port = (int)usNumCom;
  if (t_out != read_timeout) {
    read_timeout = t_out;
    iErr = sio_SetReadTimeouts(port, read_timeout, 0);
    if (iErr != 0) {
//chig      ComServerThread->socketBad();
      throw ESocket("Ошибка установки таймаута чтения порта: " + IntToStr(iErr));
    }
  }
  iErr = sio_read(port, (char*)buf, (int)num);
  if (iErr < 0) {
//chig    ComServerThread->socketBad();
    throw ESocket("Ошибка чтения порта: " + IntToStr(iErr));
  }
  read = (unsigned short)iErr;

  if (read == num)
  {
//chig    ComServerThread->socketOk();
  }
  else {
//chig    ComServerThread->socketBad();
    throw ESocket("Не поступают данные из порта.", ERR_NOT_RESPONCE);
  }

#else

	read=ReadSSock( Id, (unsigned char*)buf, num, t_out );

	if (( read==num && bProtocol==SOCK_PROT_NON) ||
		( read>0 && bProtocol==SOCK_PROT_OCT ) )
  {
//chig      ComServerThread->socketOk();
  }
	else {
//chig      ComServerThread->socketBad();
      throw ESocket("Не поступают данные из сокета.", ERR_NOT_RESPONCE);
	}

#endif
}
//---------------------------------------------------------------------------

void __fastcall TSocket::Write( void* buf, unsigned short num )
{
#if PK_LITE == 1

  int iErr, port;

  port = (int)usNumCom;
  iErr = sio_write(port, (char*)buf, (int)num);
  if (iErr < 0) {
//chig    ComServerThread->socketBad();
    throw ESocket("Ошибка записи порта: " + IntToStr(iErr));
  }
  if ((unsigned short)iErr >= num)
  {
//chig    ComServerThread->socketOk();
  }
  else {
//chig    ComServerThread->socketBad();
    throw ESocket("Данные в порт не поступают.", ERR_NOT_RESPONCE);
  }

#else

  int i;

  if (usBaud < 110) {                  // for low speed communications
//chig    ComServerThread->socketWait();
    for (i=0; i<num; i++) {
      if (WriteSSock(Id, (unsigned char*)buf + i, 1, (unsigned char)usAddr) == 0)
      {
//chig        ComServerThread->socketBad();
        throw ESocket("Данные в сокет не поступают.", ERR_NOT_RESPONCE);
      }
      Sleep(100);
    }
//chig    ComServerThread->socketOk();
  }
  else {                               // for normal speed communications
//chig    ComServerThread->socketWait();
    if (WriteSSock(Id, (unsigned char*)buf, num, (unsigned char)usAddr ) >= num)
    {
//chig      ComServerThread->socketOk();
    }
    else {
//chig      ComServerThread->socketBad();
      throw ESocket("Данные в сокет не поступают.", ERR_NOT_RESPONCE);
    }
  }
#endif
}
//---------------------------------------------------------------------------


