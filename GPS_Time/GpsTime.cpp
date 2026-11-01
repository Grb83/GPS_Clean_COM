//---------------------------------------------------------------------------

#include <vcl.h>
#include <conio.h>
#pragma hdrstop

#include "GpsPollThread.h"
#include "TimeControlThread.h"
//---------------------------------------------------------------------------

#pragma argsused
int main(int argc, char* argv[])
{
  int iRes;

  TGpsPollThrd* PollThread;
  TTimeControlThrd* TimeControlThread;

  TimeControlThread = new TTimeControlThrd(true);
  TimeControlThread->Resume();

  PollThread = new TGpsPollThrd(true);
//  PollThread->FreeOnTerminate = true;
  PollThread->Resume();

  cprintf("\r\n   Press any key to stop...");

  while (true) {
    if (kbhit()) {
      PollThread->Terminate();
      TimeControlThread->Terminate();
      break;
    }
    Sleep(1000);
  }

  getch();

  WaitForSingleObject((HANDLE)TimeControlThread->Handle, 10000);
  WaitForSingleObject((HANDLE)PollThread->Handle, 10000);
  delete PollThread;
  delete TimeControlThread;

//  getch();
  return 0;
}
//---------------------------------------------------------------------------
