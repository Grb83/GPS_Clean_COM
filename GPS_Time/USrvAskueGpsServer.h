//---------------------------------------------------------------------------
#ifndef USrvAskueGpsServerH
#define USrvAskueGpsServerH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <SvcMgr.hpp>
#include <vcl.h>
//---------------------------------------------------------------------------
class TSrv_ASKUE_GPS_Server : public TService
{
__published:    // IDE-managed Components
    void __fastcall ServiceStart(TService *Sender, bool &Started);
    void __fastcall ServiceStop(TService *Sender, bool &Stopped);
private:        // User declarations
public:         // User declarations
	__fastcall TSrv_ASKUE_GPS_Server(TComponent* Owner);
	TServiceController __fastcall GetServiceController(void);

	friend void __stdcall ServiceController(unsigned CtrlCode);
};
//---------------------------------------------------------------------------
extern PACKAGE TSrv_ASKUE_GPS_Server *Srv_ASKUE_GPS_Server;
//---------------------------------------------------------------------------
#endif
