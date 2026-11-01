//---------------------------------------------------------------------------

#ifndef TimeControlThreadH
#define TimeControlThreadH
//---------------------------------------------------------------------------
#include <Classes.hpp>

enum enMessageType {msgLocked, msgUnlocked, msgTout, msgSynchro, msgCorrected};

//---------------------------------------------------------------------------
class TTimeControlThrd : public TThread
{
  private:
    int OldTimeGap;
    bool OldValid;
    bool OldEnable;
    TDateTime t_23_59_30;
    TDateTime t_00_00_30;

    int __fastcall Update_Gap(int iVal, int iMax);
    void __fastcall ShowMessage(enMessageType MessageType);
    void __fastcall DoSynchronize(void);

    void __fastcall Do_enable_bat(void);
    void __fastcall Do_disable_bat(void);

  protected:
    void __fastcall Execute();

  public:
    __fastcall TTimeControlThrd(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
