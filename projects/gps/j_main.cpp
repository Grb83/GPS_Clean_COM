//---------------------------------------------------------------------------
#include <vcl.h>
#include <conio.h>
#pragma hdrstop

#include "j_main.h"
#include "main_thread.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
//	17.02.01
//	vpr                           -- 19.02.01  -- изменено by AVN
//	Проект:	Шаблон Сервиса WinNT  --              для сервиса ComServer'a
//	------
//	Состав:
//	-------
//	SrvTmpl.cpp - программный модуль проекта сервиса
//	SrvTmpl.bat - командный файл установки сервиса
//	sc.exe		- утилита управления диспетчером сервисов WinNT Win32 SDC
//	Параметры командной строки:
//	---------------------------
//		/c - запуск сервиса в режиме консольного приложения

//	Описание:
//	---------
//	При компиляции SrvTmpl.cpp как консольного Win32 приложения получается
//	вполне "рабочий" сервис SrvTmpl.exe, который можно зарегистрировать, как описано в
//	SrvTmpl.bat, и запустить/остановить при помощи апплета управления сервисами
//	WinNT. Никакой полезной работы сервис не выполняет.
//	Дополнительно на уровне ф-ции main() в шаблоне реализована возможность
//	запуска сервиса в режиме обычного консольного приложения Win32 (для отладки).

//	Использование:
//	--------------
//	Для реализации по шаблону своего сервиса необходимо:
//	1. Сохранить проект шаблона под новым именем
//	2. Скопировать SrvTmpl.bat под новым именем (при желании)
//	3. Заменить строку имени сервиса lpServiceName в глобальных данных SrvTmpl.cpp своим именем
//	4. Заменить строку имени сервиса в SrvTmpl.bat
//	5. Заменить 2 строки имени исполняемого файла сервиса в SrvTmpl.bat
//	6. Реализовать ф-ции int StartSrv(int argc, char **argv); и void StopSrv();

//	Ограничения:
//	------------
//	1. 	Шаблон реализует сервис типа SERVICE_WIN32_OWN_PROCESS (1 сервис в исп.модуле)
//	2. 	Поддерживаются только ф-ции запуска-останова со стороны диспетчера сервисов WinNT
//      Для введения поддержки ф-ций управления паузой-восстановлением требуется
//		модифицировать ф-ю Handler().
//	3. 	Предполагается, что инициализация-останов сервиса выполняется не более 5с.
//		Если это не так, требуется модифицировать поле dwWaitHint структуры SERVICE_STATUS,
//		либо вводить в StartSrv() промежуточные вызовы SetServiceStatus(),
//		инкрементирующие поле dwCheckPoint структуры SERVICE_STATUS, либо и то
//		и другое вместе.

//	Краткая справка по логике реализации сервиса WinNT:
//	-----------------------------------------------
//  1. 	в ф-ции main() консольного приложения сервиса требуется вызвать
//      	StartServiceCtrlDispatcher(ServiceStartTable), которая инициализирует
//		диспетчер сервисов на запуск указанного в ServiceStartTable сервиса.
//	2.	Если указанный сервис найден в реестре,диспетчер сервисов запускает
//		указанную в ServiceStartTable ф-ю ServiceMain(), которая должна:
//		- 	зарегистрировать ф-ю обработчик запросов к сервису со стороны диспетчера-
//			Handler(DWORD fdwControl), регистрация выполняется вызовом
//			RegisterServiceCtrlHandler(lpServiceName,Handler).
//		- 	выполнить инициализацию прикладной логики сервиса, вызывая через
//			интервалы времени не более dwWaitHint структуры SERVICE_STATUS мс
//			функцию SetServiceStatus(ssh,&ss), модифицируя при каждом вызове
//			либо поле dwCheckPoint структуры SERVICE_STATUS, либо поле
//			dwCurrentState той же структуры, чтобы диспетчер понимал - идет
//			инициализация,"зависаний" нет.При ошибках инициализации требуется
//			устанавливать поля dwWin32ExitCode и dwServiceSpecificExitCode.
//	3.	После запуска сервиса из ServiceMain() диспетчер будет управлять
//		сервисом через вызовы ф-ции Handler() для останова,паузы,восстановления
//		логики сервиса.

//	Дополнительная информация:
//	--------------------------
//	Из файла помощи Win32 SDC Win32SDC.hlp
//---------------------------------------------------------------------------
//	Прототипы функций модуля:
//
//---------------------------------------------------------------------------

VOID WINAPI ServiceMain(DWORD dwArgc,LPTSTR *lpszArgv); //Ф-я инициализации сервиса,не модифицировать
VOID WINAPI Handler(DWORD fdwControl);	//Ф-я управления сервисом,не модифицировать
int StartSrv(int argc, char **argv);	//Ф-я инициализации,вызывается из ServiceMain(),здесь разместить код инициализации
void StopSrv();							//Ф-я деинициализации,вызывается из Handler(),здесь разместить код деинициализации
int main(int argc, char **argv);		//main() консольного приложения,не модифицировать

//---------------------------------------------------------------------------
//	Глобальные данные модуля:
//
//---------------------------------------------------------------------------

char* lpServiceName = "Srv_ASKUE_GPS_Server";	// Имя сервиса
bool bConMode = false;			                        // Флаг запуска сервиса
                                       //в режиме консоли  --  пока true всегда для отладки

// Таблица структур запуска сервиса (используется StartServiceCtrlDispatcher())

SERVICE_TABLE_ENTRY ServiceStartTable[] = {{lpServiceName, ServiceMain},
                                           {NULL, NULL}};

SERVICE_STATUS_HANDLE ssh;		// handle ф-ции управления сервисом
SERVICE_STATUS ss =				// Структура статуса сервиса,не модифицировать
{
  SERVICE_WIN32_OWN_PROCESS,	                    //В модуле реализован 1 сервис
  SERVICE_STOPPED,			                        //текущее состояние сервиса
  SERVICE_CONTROL_INTERROGATE|SERVICE_ACCEPT_STOP,	//Флаги разрешения внешнего управления
  NO_ERROR/*или ERROR_SERVICE_SPECIFIC_ERROR*/,		//Признак ошибки операции сервиса
  0,							                    //код ошибки операции сервиса
  0,							//счетчик интервалов длительности операций сервиса
  15000						    //min. интервал длительности операции сервиса в мс
};

//---------------------------------------------------------------------------
//	StartSrv() - service start function
//	Return: (Код возврата должен соответствовать приведенным ниже требованиям,
//			он интерпретируется в ServiceMain(),как признак успешного.неуспешного
//			запуска сервиса.Отрицательный код возврата инвертируется ServiceMain(),
//			и возвращается диспетчеру сервисов WinNT как "Service specific error code"
// 	retcode	 > 0 - OK!
//			<= 0 - Error
//---------------------------------------------------------------------------

int StartSrv(int argc, char **argv)
{
// Здесь разместить код инициализации - запуск нитей основной логики приложения

  return Server_Start();
}

//---------------------------------------------------------------------------
//	StopSrv() - service stop function
//---------------------------------------------------------------------------

void StopSrv()
{
// Здесь разместить код деинициализации - останов нитей основной логики приложения

  Server_Stop();
}

//---------------------------------------------------------------------------
//	Service Handler function
//---------------------------------------------------------------------------

VOID WINAPI Handler(DWORD fdwControl)
{
  switch (fdwControl) {
	case SERVICE_CONTROL_STOP:
         ss.dwCurrentState = SERVICE_STOP_PENDING;
         SetServiceStatus(ssh, &ss);
         StopSrv();
         ss.dwCurrentState = SERVICE_STOPPED;
         SetServiceStatus(ssh, &ss);
         break;
	case SERVICE_CONTROL_PAUSE:
         break;
	case SERVICE_CONTROL_CONTINUE:
         break;
	case SERVICE_CONTROL_INTERROGATE:
         SetServiceStatus(ssh, &ss);
         break;
	case SERVICE_CONTROL_SHUTDOWN:
         ss.dwCurrentState = SERVICE_STOP_PENDING;
         SetServiceStatus(ssh, &ss);
         StopSrv();
         ss.dwCurrentState = SERVICE_STOPPED;
         SetServiceStatus(ssh, &ss);
         break;
  }
}

//---------------------------------------------------------------------------
//	Service main function
//---------------------------------------------------------------------------

VOID WINAPI ServiceMain(DWORD dwArgc, LPTSTR* lpszArgv)
{
  int i;

  ssh = RegisterServiceCtrlHandler(lpServiceName, Handler);

  if (ssh) {
    ss.dwCurrentState = SERVICE_START_PENDING;
    SetServiceStatus(ssh, &ss);
    i = StartSrv(dwArgc, lpszArgv);
    if (i > 0) ss.dwCurrentState = SERVICE_RUNNING;
    else {
      ss.dwCurrentState = SERVICE_STOPPED;
      ss.dwWin32ExitCode = ERROR_SERVICE_SPECIFIC_ERROR;
      ss.dwServiceSpecificExitCode = i*(-1);
    }
    SetServiceStatus(ssh, &ss);
  }
}
//---------------------------------------------------------------------------
//	Main function
//---------------------------------------------------------------------------

#pragma argsused

int JustMain(int argc, char **argv)
{
  int i;

  for (i=0; i<argc; i++) if (strstr(strupr(argv[i]), "/C") != NULL) {
    bConMode = true;
    break;
  }

  if (bConMode) {                    //---------------------  Console mode
    if (StartSrv(argc,argv) > 0) {
      cprintf("GPSServer is started in console mode. Press any key to shut down...");
      getch();
      cprintf("\r\nAttempting to stop GPSServer. Please wait...");
      StopSrv();
      cprintf("\r\nGPSServer stopped OK!   Press any key...");
      getch();
    }
    else {
      cprintf("\r\nError starting GPSServer.  Press any key...");
      getch();
    }
  }
  else {                             //---------------------  Service mode
    i = StartServiceCtrlDispatcher(ServiceStartTable);
    return i;
  }

  return 0;
}

int main(int argc, char* argv[])
{
  return JustMain(argc, argv);
}



