#include <dir.h>
//---------------------------------------------------------------------------
#include "USrvAskueGpsServer.h"
#include "GpsPollThread.h"
#include "TimeControlThread.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TSrv_ASKUE_GPS_Server *Srv_ASKUE_GPS_Server;
TGpsPollThrd* PollThread;
TTimeControlThrd* TimeControlThread;

//---------------------------------------------------------------------------
__fastcall TSrv_ASKUE_GPS_Server::TSrv_ASKUE_GPS_Server(TComponent* Owner)
	: TService(Owner)
{
}

TServiceController __fastcall TSrv_ASKUE_GPS_Server::GetServiceController(void)
{
	return (TServiceController) ServiceController;
}

void __stdcall ServiceController(unsigned CtrlCode)
{
	Srv_ASKUE_GPS_Server->Controller(CtrlCode);
}
//---------------------------------------------------------------------------
void __fastcall TSrv_ASKUE_GPS_Server::ServiceStart(TService *Sender, bool &Started)
{
  char IniMeterFileName[256]="";
  char* pC;

  ErrCode = 0;
  if (GetModuleFileName(NULL, IniMeterFileName, sizeof(IniMeterFileName)) > 0) {
    pC = strrchr(IniMeterFileName,'\\');
    if (pC) *pC = 0;
    if (chdir(IniMeterFileName)) ErrCode = 1;
  }
  else ErrCode = 1;
  Started = ErrCode == 0;

  if (Started) try {
    TimeControlThread = new TTimeControlThrd(true);
    TimeControlThread->FreeOnTerminate = false;
    TimeControlThread->Resume();
    PollThread = new TGpsPollThrd(true);
    PollThread->FreeOnTerminate = false;
    PollThread->Resume();
  }
  catch (...) {
    ErrCode = 2;
  }

  Started = ErrCode == 0;
}
//---------------------------------------------------------------------------
void __fastcall TSrv_ASKUE_GPS_Server::ServiceStop(TService *Sender, bool &Stopped)
{
  PollThread->Terminate();
  TimeControlThread->Terminate();
  WaitForSingleObject((HANDLE)TimeControlThread->Handle, 10000);
  WaitForSingleObject((HANDLE)PollThread->Handle, 10000);
  delete PollThread;
  delete TimeControlThread;

  Stopped = true;
}
//---------------------------------------------------------------------------
