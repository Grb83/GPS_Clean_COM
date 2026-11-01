#include <SysUtils.hpp>
#include <SvcMgr.hpp>
#pragma hdrstop
#define Application Svcmgr::Application
USERES("GpsTimeSrv.res");
USEFORM("UGpsTimeService.cpp", CGpsTimeService); /* TService: File Type */
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
		Application->CreateForm(__classid(TCGpsTimeService), &CGpsTimeService);
         Application->Run();
	}
	catch (Exception &exception)
	{
		Sysutils::ShowException(&exception, Sysutils::ExceptAddr());
	}
	return 0;
}
