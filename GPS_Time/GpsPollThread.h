//---------------------------------------------------------------------------

#ifndef GpsPollThreadH
#define GpsPollThreadH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------

#define BUFF_SIZE 1024

class TGpsPollThrd : public TThread
{
  private:
    int port;
    int baud;
    int stop;
    int dataFmt;
    int parity;
    int t_out;
    bool DGPS_fix;
    bool bEstimated;
    bool RMC_date;
    int min_SatInUse;
    bool bPacketLog;

    BYTE bRecv[BUFF_SIZE];

    void __fastcall GetConfig(void);
    void __fastcall OpenComPort(void);
    void __fastcall CloseComPort(void);
    void __fastcall Poll_GSM(void);
    int __fastcall Process_GGA(void);
    int __fastcall Process_RMC(void);

    void __fastcall Do_start_bat(void);
    void __fastcall Do_stop_bat(void);

  protected:
    void __fastcall Execute();

  public:
    __fastcall TGpsPollThrd(bool CreateSuspended);
};

struct stGPS_Data {
  int max_TimeGaps;
  int GGA_state;
  int RMC_state;
  bool bDataValid;
  int iQuality;
  int SatInUse;
  char cTime[8];
  char cDate[8];
  TDateTime gpsTime;
  TDateTime gpsDate;
  TDateTime min_Mistiming;
  int iTimeGap;
  int iDateGap;
};

struct stExternCmd {
  int max_ToutGaps;
  bool Enable;
  int iToutGap;
};

extern stGPS_Data GPS_Data;
extern stExternCmd ExternCmd;

//---------------------------------------------------------------------------
#endif
