#include <SysUtils.hpp>
#include <SvcMgr.hpp>
#pragma hdrstop
#define Application Svcmgr::Application
USERES("CSrvGps.res");
USEFORM("USrvAskueGpsServer.cpp", Srv_ASKUE_GPS_Server); /* TService: File Type */
USEUNIT("GpsPollThread.cpp");
USEUNIT("TimeControlThread.cpp");
USEUNIT("Logging\LogMessage.cpp");
USELIB("PCOMMB.LIB");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
		Application->Initialize();
		Application->CreateForm(__classid(TSrv_ASKUE_GPS_Server), &Srv_ASKUE_GPS_Server);
         Application->Run();
	}
	catch (Exception &exception)
	{
		Sysutils::ShowException(&exception, Sysutils::ExceptAddr());
	}
	return 0;
}
