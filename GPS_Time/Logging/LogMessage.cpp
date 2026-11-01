//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "LogMessage.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)
//---------------------------------------------------------------------------

void LogMessage(int type, const char * Message)
{
	HANDLE hFile;
	char buf[2048];
	int i;
	static char *TypeMessage[3]={"Старт:  ","Стоп:   ","Ошибка: "};
	static char LogMessageFileName[256];
	static int isWriteMessage=0;
    static char IniMessageFileName[256];

	if(!*LogMessageFileName)
	{
		if(GetModuleFileName(NULL,buf,sizeof(buf))==0)
		{
			*LogMessageFileName=' ';
			return;
		}
		strncpy(strrchr(buf,'.'),".log",5);

		if(GetModuleFileName(NULL,IniMessageFileName,sizeof(IniMessageFileName))==0)
		{
			*LogMessageFileName=' ';
			return;
		}
		strncpy(strrchr(IniMessageFileName,'.'),".ini",5);

		GetPrivateProfileString(
			"LogMessage",	// points to section name
			"LogFileName",	// points to key name
			buf,// points to default string
			LogMessageFileName,// points to destination buffer
			sizeof(LogMessageFileName),	// size of destination buffer
			IniMessageFileName// points to initialization filename
			);
	}
    GetPrivateProfileString(
        "LogMessage",	// points to section name
        "WriteMessage",	// points to key name
        "NO",// points to default string
        buf,// points to destination buffer
        sizeof(buf),	// size of destination buffer
        IniMessageFileName// points to initialization filename
        );

    isWriteMessage = 0;
    if(!stricmp(buf,"YES")) isWriteMessage=true;
	if(!isWriteMessage) return;

	hFile=CreateFile(LogMessageFileName,GENERIC_WRITE,0,NULL,OPEN_ALWAYS,
		FILE_ATTRIBUTE_NORMAL,NULL);
	for(i=0; hFile==INVALID_HANDLE_VALUE && i<3 ; ++i )
	{
		Sleep(3000);
		hFile=CreateFile(LogMessageFileName,GENERIC_WRITE,0,NULL,OPEN_ALWAYS,
			FILE_ATTRIBUTE_NORMAL,NULL);
	}
	if(hFile!=INVALID_HANDLE_VALUE)
	{
		if( SetFilePointer(hFile,0l,NULL,FILE_END)==0xFFFFFFFF )
			SetEndOfFile(hFile);
		SYSTEMTIME lpSystemTime;
		GetLocalTime(&lpSystemTime);
		wsprintf(buf,"%02u.%02u.%04u   %02u:%02u:%02u   %s %s\x0d\x0a",
			lpSystemTime.wDay,lpSystemTime.wMonth,lpSystemTime.wYear,
			lpSystemTime.wHour,lpSystemTime.wMinute,lpSystemTime.wSecond,
			(type==START_MESSAGE ? TypeMessage[0]:(type==STOP_MESSAGE ? TypeMessage[1]:(type==ERROR_MESSAGE ? TypeMessage[2]:""))),
			Message);
		WriteFile(hFile,buf,strlen(buf),(LPDWORD)&i,NULL);
		CloseHandle(hFile);
	}
}

// -------------------------------------------------------------------------

HANDLE hLogMutex; // Global mutex

bool CreateLogAccess(void)
{
  hLogMutex = CreateMutex( NULL, // default security
                           FALSE, // not owned
                           NULL); // no name

  if (hLogMutex == NULL) {
    return false;
  }

  return true;
}

void CloseLogAccess(void)
{
  CloseHandle(hLogMutex);
}

bool GetLogAccess(void)
{
  DWORD dwRes;

  dwRes = WaitForSingleObject(hLogMutex, 5000);  // wait for max 5 sec
  if (dwRes != WAIT_OBJECT_0) return false;

  return true;
}

void ReleaseLogAccess(void)
{
  ReleaseMutex(hLogMutex);
}

void SharedLogMessage(int type, const char * Message)
{
  if (hLogMutex) {
    if (GetLogAccess()) LogMessage(type, Message);
    ReleaseLogAccess();
  }
}

// -------------------------------------------------------------------------


