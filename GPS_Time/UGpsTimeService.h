//---------------------------------------------------------------------------
#ifndef UGpsTimeServiceH
#define UGpsTimeServiceH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <SvcMgr.hpp>
#include <vcl.h>
//---------------------------------------------------------------------------
class TCGpsTimeService : public TService
{
__published:    // IDE-managed Components
    void __fastcall ServiceStart(TService *Sender, bool &Started);
    void __fastcall ServiceStop(TService *Sender, bool &Stopped);
private:        // User declarations
public:         // User declarations
	__fastcall TCGpsTimeService(TComponent* Owner);
	TServiceController __fastcall GetServiceController(void);

	friend void __stdcall ServiceController(unsigned CtrlCode);
};
//---------------------------------------------------------------------------
extern PACKAGE TCGpsTimeService *CGpsTimeService;
//---------------------------------------------------------------------------
#endif
