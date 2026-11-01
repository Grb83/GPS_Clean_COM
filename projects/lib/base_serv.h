//---------------------------------------------------------------------------
#ifndef BASE_SERV_H
#define BASE_SERV_H

#include <system.hpp>

#include <time.h>

typedef AnsiString AStr;

const int STNDRT_GRID_BITM_LEN = 16;
const int HOUR_UN =  60 * 60;

const int NOT_FOUND = -1;

typedef char TWrkStr [ 200 ];

int booltoint( bool PPB );
bool inttobool( int PPI );

TDateTime __fastcall WinLBound( TDateTime PPBase, TDateTime PPStep );

//Валидация
void UIntInpValid( char &Key );
//e Валидация
TDateTime SecToCurrMessBegCount( TDateTime PPDT );

TDateTime UnToWinTime( time_t pFT );
struct tm *SafeLocaltime(const time_t *timer);

time_t DOSToWinTime( time_t pFT );
time_t WinToDOSTime( time_t pFT );
time_t InpTimeCorr();
AStr UnTimeToStr( time_t PPT );
void FormtUnixTime( AStr & S, tm* pTM);
double ExDTTSec( double PPExDT );
bool IsRathUnZeroTime( double PPDT );
double ExDTToDT( double dSource_AV );
bool EpsFltEqul( double x, double y, double e );
#define FlagSet(flag1, flag2) ((flag1) & (flag2))
#define FlagsSet(flag1, flag2) (((flag1) & (flag2)) == (flag2))
void FlagEstabl( byte& x, byte maska );
void FlagReset( byte& x, byte maska );

double Proporcia
  (
     double PPSource, double PPSLB, double PPSHB,  double PPDLB, double PPDHB
  );

AStr SuffNameByTimeGener();
int HandrByExtDTDT( double PPExDT, double PPDT );
int UserDoubleToInt( double PPD );
TDateTime WinCurrMessBegCount( TDateTime PPDT );
void __fastcall CreateWaitProcess( AStr PPCmd );
TDateTime StrToDateTimeFormat( AStr agStr, AStr agTFmt, AStr agDFmt );
int HSecByExDT( double dSource_AV );
AStr PacketToStr( byte* agFrame, int agSize );

//todel void FormatUnixTime(AnsiString& S, tm* pTM);

bool IsNumber( char agVal );

void __fastcall ConsCreateWaitProcess( AStr PPCmd );
void __fastcall UnivCreateWaitProcess( AStr PPCmd, DWORD dwCreationFlags, WORD wShowWindow );

extern char* BUILDER_FMT_TIME;

const int EMPTY_VAL = -1;

AnsiString FloatToStrPrec(float fVal, int iPrec);

#endif //BASE_SERV_H

