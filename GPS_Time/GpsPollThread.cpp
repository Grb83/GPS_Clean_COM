//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "GpsPollThread.h"
#include "PComm.h"
#include "LogMessage.h"
#pragma package(smart_init)


#define MAX_COM_PORTS 64
#define MAX_NMEA_SENTENCE 300

stGPS_Data GPS_Data;
stExternCmd ExternCmd;

//---------------------------------------------------------------------------

//   Important: Methods and properties of objects in VCL can only be
//   used in a method called using Synchronize, for example:
//
//      Synchronize(UpdateCaption);
//
//   where UpdateCaption could look like:
//
//      void __fastcall Unit1::UpdateCaption()
//      {
//        Form1->Caption = "Updated in a thread";
//      }
//---------------------------------------------------------------------------

__fastcall TGpsPollThrd::TGpsPollThrd(bool CreateSuspended)
    : TThread(CreateSuspended)
{
}
//---------------------------------------------------------------------------

void __fastcall TGpsPollThrd::GetConfig(void)
{
  char IniMeterFileName[256]="";
  char buf[256];
  DWORD dwRes;
  int iRes;

  memset(&GPS_Data, 0, sizeof(GPS_Data));
  GPS_Data.iTimeGap = -1;
  GPS_Data.iDateGap = -1;
  GPS_Data.max_TimeGaps = 10;

  memset(&ExternCmd, 0, sizeof(ExternCmd));
  ExternCmd.iToutGap = -1;
  ExternCmd.max_ToutGaps = 300;

  port = 1;     // com1
  baud = 9600;  // 9600
  stop = 1;
  dataFmt = 8;  // 8N1
  parity = 0;
  t_out = 1000; // ms
  DGPS_fix = false;
  bEstimated = false;
  RMC_date = true;
  min_SatInUse = 3;
//  min_Mistiming = 5;
  GPS_Data.min_Mistiming = TDateTime(0, 0, 5, 0);
  bPacketLog = false;

  if (GetModuleFileName(NULL, IniMeterFileName, sizeof(IniMeterFileName)) > 0) {
    strncpy(strrchr(IniMeterFileName,'.'), ".ini", 5);

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "port",                  // points to key name
      "1",                     // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (iRes > 0 && iRes <= MAX_COM_PORTS) port = iRes;
    }

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "baud",                  // points to key name
      "9600",                  // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (iRes >= 300 && iRes <= 115200) baud = iRes;
    }

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "stop",                  // points to key name
      "1",                     // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (0 < iRes && iRes < 3) stop = iRes;
    }

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "data",                  // points to key name
      "8",                     // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (6 < iRes && iRes < 9) dataFmt = iRes;
    }

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "parity",                // points to key name
      "0",                     // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (0 <= iRes && iRes < 3) parity = iRes;
    }

    dwRes = GetPrivateProfileString(
      "PortDefs",              // points to section name
      "t_out",                 // points to key name
      "1000",                  // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (300 <= iRes && iRes < 60000) t_out = iRes;
    }

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "DGPS_fix",              // points to key name
      "NO",                    // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) if (strcmpi(buf, "YES") == 0) DGPS_fix = true;

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "Estimated",             // points to key name
      "NO",                    // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) if (strcmpi(buf, "YES") == 0) bEstimated = true;

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "RMC_date",              // points to key name
      "YES",                   // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) if (strcmpi(buf, "NO") == 0) RMC_date = false;

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "min_SatInUse",          // points to key name
      "3",                     // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (0 < iRes && iRes < 13) min_SatInUse = iRes;
    }

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "max_TimeGaps",          // points to key name
      "10",                    // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (0 < iRes && iRes < 300) GPS_Data.max_TimeGaps = iRes;
    }

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "max_ToutGaps",          // points to key name
      "300",                   // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (10 <= iRes && iRes <= 10000) ExternCmd.max_ToutGaps = iRes;
    }

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "min_Mistiming",         // points to key name
      "5",                    // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) {
      iRes = atoi(buf);
      if (2 < iRes && iRes < 65535) GPS_Data.min_Mistiming = TDateTime(0, 0, (WORD)iRes, 0);
    }

    dwRes = GetPrivateProfileString(
      "GPS",                   // points to section name
      "packetLog",             // points to key name
      "NO",                    // points to default string
      buf,                     // points to destination buffer
      sizeof(buf),             // size of destination buffer
      IniMeterFileName);       // points to initialization filename
    if (dwRes > 0) if (strcmpi(buf, "YES") == 0) bPacketLog = true;

  }
}
//---------------------------------------------------------------------------

void __fastcall TGpsPollThrd::OpenComPort(void)
{
  int iErr, ibaud;
  int mode = 0;
  char cDF[4];
  AnsiString S;
  char fClass[256];

  switch (baud) {
    case    300: ibaud =    B300; break;
    case    600: ibaud =    B600; break;
    case   1200: ibaud =   B1200; break;
    case   2400: ibaud =   B2400; break;
    case   4800: ibaud =   B4800; break;
    case   9600: ibaud =   B9600; break;
    case  19200: ibaud =  B19200; break;
    case  38400: ibaud =  B38400; break;
    case  57600: ibaud =  B57600; break;
    case 115200: ibaud = B115200; break;
    default: ibaud = B9600; baud = 9600;
  }

  switch (parity) {
    case 0: mode = P_NONE; cDF[1] = 'N'; break;
    case 1: mode = P_ODD; cDF[1] = 'O'; break;
    case 2: mode = P_EVEN; cDF[1] = 'E'; break;
    default: mode = P_NONE; cDF[1] = 'N';
  }

  switch (dataFmt) {
    case 7: mode |= BIT_7; cDF[0] = '7'; break;
    case 8: mode |= BIT_8; cDF[0] = '8'; break;
    default: mode |= BIT_8; cDF[0] = '8';
  }

  switch (stop) {
    case 1: mode |= STOP_1; cDF[2] = '1'; break;
    case 2: mode |= STOP_2; cDF[2] = '2'; break;
    default: mode |= STOP_1; cDF[2] = '1';
  }

  cDF[3] = 0;

  iErr = sio_open(port);                                   if (iErr) goto L_Error;
  iErr = sio_ioctl(port, ibaud, mode);                     if (iErr) goto L_Error;
//  iErr = sio_RTS(port, 1);                               if (iErr) goto L_Error;
  iErr = sio_SetReadTimeouts(port, (DWORD)t_out, 0);       if (iErr) goto L_Error;
  iErr = sio_flush(port, 2);                               if (iErr) goto L_Error;

  sprintf(fClass, "Com%d  opened at baud %d   flow %s", port, baud, cDF);
  LogMessage(NORMAL_MESSAGE, fClass);
  return;

L_Error:
  S = "Error opening port Com" + IntToStr(port) + ": " + IntToStr(iErr);
  throw Exception(S);
}
//---------------------------------------------------------------------------

void __fastcall TGpsPollThrd::CloseComPort(void)
{
  char fClass[256];

  sio_close(port);

  sprintf(fClass, "Com%d  closed", port);
  LogMessage(NORMAL_MESSAGE, fClass);
}
//---------------------------------------------------------------------------

void __fastcall TGpsPollThrd::Poll_GSM(void)
{
  int iErr, i;
  char C;
  AnsiString S;
  bool bPackStarted, bPackReceived;

  while (true) {                    // LOOP through NMEA packets:

    i = 0;                                              // packet start count
    bPackStarted = false;                               // no packet started
//    bPackReceived = false;                              // no packet received
    memset(bRecv, 0, BUFF_SIZE);                        // buffer clear

    while (true) {                            // LOOP receiving one NMEA packet:
      if (Terminated) break;

      iErr = sio_read(port, &C, 1);                     // read byte from GPS
      if (iErr < 0) {
        GPS_Data.bDataValid = false;
        GPS_Data.iTimeGap = -1;
        CloseComPort();                                 // if hdwr error -- fly away
        S = "Error reading port: " + IntToStr(iErr);
        throw Exception(S);
      }
      if (iErr > 0) {                                   // if byte was read
        if (bPackStarted) {                             //   if inside packet
          bRecv[i] = C;                                 //     store byte in buffer
          i++;
          if (C == '\r') {                              //     check if it's a last byte in packet
            break;                                      //             and exit LOOP if so
          }
        }
        else {                                          // if outside packet
          if (C == '$') {                               //   if start of packet found
            bRecv[i] = C;                               //     store byte in buffer
            i++;
            bPackStarted = true;                        //     enable switch
          }
        }
        if (i > MAX_NMEA_SENTENCE) {                    // if exceeded NMEA sentence -- mark invalid -- goto next packet
          i = 0;
          break;
        }
      }
      else {                                            // if timeout -- mark invalid -- goto next packet
        i = 0;
        break;
      }
    }
                                              // here we received one NMEA packet
    if (Terminated) break;
    if (i < 8) {                                        // if short message -- mark invalid -- goto next packet
      GPS_Data.bDataValid = false;
      GPS_Data.iTimeGap = -1;
      continue;
    }

    if (bPacketLog) {
      bRecv[i-1] = 0;
      LogMessage(NORMAL_MESSAGE, bRecv);
    }

    if (strncmp(bRecv, "$GPGGA", 6) == 0) GPS_Data.GGA_state = Process_GGA();
    if (strncmp(bRecv, "$GPRMC", 6) == 0) GPS_Data.RMC_state = Process_RMC();

    Sleep(10);
  }
}
//---------------------------------------------------------------------------

int __fastcall TGpsPollThrd::Process_GGA(void)
{
  int i;
  char* pC;
  char* pTime;
  char* pQuality;
  char* pSatsInUse;
  unsigned short hour, min, sec, msec;
  char cBuf[8];
  TDateTime T;

  pC = strtok(bRecv, ",");              // header
  if (pC == NULL) return 1;
  pC = strtok(NULL, ",");               // UTC time of position fix, hhmmss format
  if (pC == NULL) return 2;
  pTime = pC;
  if (strlen(pTime) < 6) return 3;      // too short time string

  for (i=0; i<5; i++) {
    pC = strtok(NULL, ",");
    if (pC == NULL) return 4;
  }
  pQuality = pC;                        // GPS quality indication
  if (strlen(pQuality) < 1) return 5;   // too short quality string

  pC = strtok(NULL, ",");               // Number of satellites in use, 00 to 12
  if (pC == NULL) return 6;
  pSatsInUse = pC;
  if (strlen(pSatsInUse) < 2) return 7; // too short "in use" string

  memset(cBuf, 0, sizeof(cBuf));
  strncpy(GPS_Data.cTime, pTime, 6);
  strncpy(cBuf, pTime, 2);              // hh
  hour = atoi(cBuf);
  if (hour > 23) return 8;

  strncpy(cBuf, pTime+2, 2);            // mm
  min = atoi(cBuf);
  if (min > 59) return 9;

  strncpy(cBuf, pTime+4, 2);            // ss
  sec = atoi(cBuf);
  if (sec > 59) return 10;

  try {
    T = TDateTime(hour, min, sec, 0);
    i = 0;
  }
  catch (Exception& ) {
    i = 11;
  }
  if (i > 0) return i;

  GPS_Data.gpsTime = T;
  
  memset(cBuf, 0, sizeof(cBuf));
  strncpy(cBuf, pQuality, 1);
  GPS_Data.iQuality = atoi(cBuf);

  strncpy(cBuf, pSatsInUse, 2);
  GPS_Data.SatInUse = atoi(cBuf);

  GPS_Data.bDataValid = ((GPS_Data.iQuality == 1) || (DGPS_fix && (GPS_Data.iQuality == 2)) ||
                                                     (bEstimated && (GPS_Data.iQuality == 6))) &&
                                                             (GPS_Data.SatInUse >= min_SatInUse);
  if (GPS_Data.bDataValid) ExternCmd.Enable = true;

  GPS_Data.iTimeGap = 0;              // received Ok, started t-out countup
  ExternCmd.iToutGap = 0;
  return 0;
}
//---------------------------------------------------------------------------

int __fastcall TGpsPollThrd::Process_RMC(void)
{
  int i;
  char* pC;
  char* pTime;
  unsigned short year, month, day;
  char cBuf[8];
  TDateTime T;

  pC = strtok(bRecv, ",");            // header
  if (pC == NULL) return 1;

  for (i=0; i<9; i++) {
    pC = strtok(NULL, ",");
    if (pC == NULL) return 2;
  }
  pTime = pC;                         // UTC date of position fix, ddmmyy format
  if (strlen(pTime) < 6) return 3;    // too short time string

  memset(cBuf, 0, sizeof(cBuf));
  strncpy(GPS_Data.cDate, pTime, 6);
  strncpy(cBuf, pTime, 2);            // dd
  day = atoi(cBuf);
  if (day < 1 || day > 31) return 4;

  strncpy(cBuf, pTime+2, 2);          // mm
  month = atoi(cBuf);
  if (month < 1 || month > 12) return 5;

  strncpy(cBuf, pTime+4, 2);          // yy
  year = atoi(cBuf);
  if (year > 99) return 6;
  year += 2000;

  try {
    T = TDateTime(year, month, day);
    i = 0;
  }
  catch (Exception& ) {
    i = 7;
  }
  if (i > 0) return i;

  GPS_Data.gpsDate = T;
  GPS_Data.iDateGap = 0;              // received Ok, started t-out countup
  return 0;
}
//---------------------------------------------------------------------------

void __fastcall TGpsPollThrd::Execute()
{
  char fClass[256];

  Do_start_bat();

  while (true) {
    try {
      GetConfig();
      OpenComPort();

      Poll_GSM();

      CloseComPort();
    }
    catch (Exception& e) {
      sprintf(fClass, "***  ERROR:  %s", e.Message.c_str());
      LogMessage(NORMAL_MESSAGE, fClass);
    }

    if (Terminated) break;
    Sleep(3000);
  }

  Do_stop_bat();
}

//---------------------------------------------------------------------------
//                    Выполняем команду
//---------------------------------------------------------------------------
void __fastcall TGpsPollThrd::Do_start_bat(void)
{
//  HINSTANCE hRes;
  char cCmd[] = "g_cmd\\g_strt.bat";
  char cOper[] = "open";
  char cParam[] = ">>g_cmd\\g_res.log";

  ShellExecute(NULL, cOper, cCmd, cParam, NULL, SW_SHOWNORMAL);
}

//---------------------------------------------------------------------------
void __fastcall TGpsPollThrd::Do_stop_bat(void)
{
//  HINSTANCE hRes;
  char cCmd[] = "g_cmd\\g_stop.bat";
  char cOper[] = "open";
  char cParam[] = ">>g_cmd\\g_res.log";

  ShellExecute(NULL, cOper, cCmd, cParam, NULL, SW_SHOWNORMAL);
}

