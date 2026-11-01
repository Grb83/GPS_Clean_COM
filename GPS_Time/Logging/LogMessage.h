//---------------------------------------------------------------------------
#ifndef LogMessageH
#define LogMessageH
//---------------------------------------------------------------------------

#define START_MESSAGE	0
#define STOP_MESSAGE 	1
#define ERROR_MESSAGE	-1
#define NORMAL_MESSAGE	2

extern void LogMessage(int type, const char * Message);
/*---------------------------------------------------------------------------
	Для того , чтобы сообщения об ошибках выводились в файл, в каталоге, из
которого будет запущено приложение, должен находиться  INI-файл. Имя файла должно
совпадать с именем EXE-модуля и содержать следующую секцию, например:

[LogMessage]
;По умолчанию WriteMessage=No
WriteMessage=Yes
;По умолчанию LogFileName=[name_exe_module].log
LogFileName=MyLogFileName.log
---------------------------------------------------------------------------*/

extern HANDLE hLogMutex; // Global mutex

bool CreateLogAccess(void);
void CloseLogAccess(void);
bool GetLogAccess(void);
void ReleaseLogAccess(void);
void SharedLogMessage(int type, const char * Message);

#endif
