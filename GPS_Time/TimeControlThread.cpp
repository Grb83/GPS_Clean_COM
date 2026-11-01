//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <math.h>
#pragma hdrstop

#include "TimeControlThread.h"
#include "GpsPollThread.h"
#include "LogMessage.h"
#pragma package(smart_init)

#define GAP_SLICE 200        // count every 200 ms

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

__fastcall TTimeControlThrd::TTimeControlThrd(bool CreateSuspended)
    : TThread(CreateSuspended)
{
  OldTimeGap = -1;
  OldValid = false;
  OldEnable = false;
  t_23_59_30 = TDateTime(23, 59, 30, 0);
  t_00_00_30 = TDateTime( 0,  0, 30, 0);
}
//---------------------------------------------------------------------------

int __fastcall TTimeControlThrd::Update_Gap(int iVal, int iMax)
{
  if (iVal < 0) return -1;

  iVal++;
  if (iVal > iMax) return -1;

  return iVal;
}
//---------------------------------------------------------------------------

void __fastcall TTimeControlThrd::ShowMessage(enMessageType MessageType)
{
  char fClass[256];

  switch (MessageType) {
    case msgLocked: sprintf(fClass, "GPS time locked:  %s  (quality=%d,  sat_in_use=%d)", GPS_Data.cTime,
                                                                              GPS_Data.iQuality, GPS_Data.SatInUse);
                    break;

    case msgUnlocked: sprintf(fClass, "*** GPS time unlocked:  quality=%d,  sat_in_use=%d", GPS_Data.iQuality, GPS_Data.SatInUse);
                      break;

    case msgTout: sprintf(fClass, "*** GPS time unlocked:  timeout");
                  break;

    case msgSynchro: sprintf(fClass, ">>> correct to GPS time  %s  and date  %s", GPS_Data.cTime, GPS_Data.cDate);
                     break;

    case msgCorrected: sprintf(fClass, ">>> corrected OK");
                       break;

    default: return;
  }

  LogMessage(NORMAL_MESSAGE, fClass);
}
//---------------------------------------------------------------------------

void __fastcall TTimeControlThrd::DoSynchronize(void)
{
  SYSTEMTIME SystemTime, GPS_Time;
  TDateTime tdSystemTime, td_GPS_Time;
  LPVOID lpMsgBuf;

  if (GPS_Data.bDataValid && (GPS_Data.iDateGap >= 0)) {
    if (GPS_Data.gpsTime > t_23_59_30 || GPS_Data.gpsTime < t_00_00_30) return;
    GetSystemTime(&SystemTime);
    tdSystemTime = SystemTimeToDateTime(SystemTime);
    td_GPS_Time = GPS_Data.gpsTime + GPS_Data.gpsDate;
    if (fabs(double(tdSystemTime) - double(td_GPS_Time)) > double(GPS_Data.min_Mistiming)) {
      ShowMessage(msgSynchro);
      DateTimeToSystemTime(td_GPS_Time, GPS_Time);
      if (SetSystemTime(&GPS_Time)) ShowMessage(msgCorrected);
      else {
        FormatMessage(
            FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
            NULL,
            GetLastError(),
            MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
            (LPTSTR) &lpMsgBuf,
            0,
            NULL
        );
               // Display the string.
        LogMessage(NORMAL_MESSAGE, (char*)lpMsgBuf);
              // Free the buffer.
        LocalFree( lpMsgBuf );
      }
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TTimeControlThrd::Execute()
{
  bool bLocked, bUnlocked;

  while (true) {
    GPS_Data.iTimeGap = Update_Gap(GPS_Data.iTimeGap, GPS_Data.max_TimeGaps);
    GPS_Data.iDateGap = Update_Gap(GPS_Data.iDateGap, GPS_Data.max_TimeGaps);
    ExternCmd.iToutGap = Update_Gap(ExternCmd.iToutGap, ExternCmd.max_ToutGaps);

    if (Terminated) break;
    Sleep(GAP_SLICE);

    bLocked = bUnlocked = false;
    if (GPS_Data.bDataValid) {
      if (OldTimeGap < 0 && GPS_Data.iTimeGap >= 0) { ShowMessage(msgLocked); bLocked = true; }
      if (OldTimeGap >= 0 && GPS_Data.iTimeGap < 0) ShowMessage(msgTout);
    }
    else {
      if (OldTimeGap < 0 && GPS_Data.iTimeGap >= 0) { ShowMessage(msgUnlocked); bUnlocked = true; }
      if (OldTimeGap >= 0 && GPS_Data.iTimeGap < 0) ShowMessage(msgTout);
    }

    OldTimeGap = GPS_Data.iTimeGap;

    if (GPS_Data.iTimeGap >= 0) {
      if (GPS_Data.bDataValid && !OldValid) if (!bLocked) ShowMessage(msgLocked);
      if (!GPS_Data.bDataValid && OldValid) if (!bUnlocked) ShowMessage(msgUnlocked);
    }

    OldValid = GPS_Data.bDataValid;
    DoSynchronize();

    if (!OldEnable && ExternCmd.Enable) Do_enable_bat();
    if (ExternCmd.Enable) if (ExternCmd.iToutGap == -1) ExternCmd.Enable = false;
    if (OldEnable && !ExternCmd.Enable) Do_disable_bat();
    OldEnable = ExternCmd.Enable;
  }
}

//---------------------------------------------------------------------------
//                    Выполняем команду
//---------------------------------------------------------------------------
void __fastcall TTimeControlThrd::Do_enable_bat(void)
{
//  HINSTANCE hRes;
  char cCmd[] = "g_cmd\\g_enbl.bat";
  char cOper[] = "open";
  char cParam[] = ">>g_cmd\\g_res.log";

  ShellExecute(NULL, cOper, cCmd, cParam, NULL, SW_SHOWNORMAL);
}

//---------------------------------------------------------------------------
void __fastcall TTimeControlThrd::Do_disable_bat(void)
{
//  HINSTANCE hRes;
  char cCmd[] = "g_cmd\\g_disb.bat";
  char cOper[] = "open";
  char cParam[] = ">>g_cmd\\g_res.log";

  ShellExecute(NULL, cOper, cCmd, cParam, NULL, SW_SHOWNORMAL);
}

