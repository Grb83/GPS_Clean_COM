//---------------------------------------------------------------------------
#include <CONIO.H>
#include <STDIO.H>
#include <sysutils.hpp>
#include "base_serv.h"

#pragma hdrstop

#include <math.h>

#include "double_base_serv.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

char BUILDER_FMT_TIME_BODY[40]="hh':'nn':'ss";
char* BUILDER_FMT_TIME = BUILDER_FMT_TIME_BODY;


void FormtUnixTime( AStr & S, tm* pTM)
{
  S = "";
  S.sprintf("%02d.%02d.%04d  %02d:%02d:%02d", pTM->tm_mday,
            pTM->tm_mon+1, pTM->tm_year+1900, pTM->tm_hour, pTM->tm_min, pTM->tm_sec);
}

int booltoint( bool PPB )
{
  return PPB ? 1 : 0;
}

bool inttobool( int PPI )
{
  return ( PPI > 0 ) ? TRUE : FALSE;
}

TDateTime __fastcall WinLBound( TDateTime PPBase, TDateTime PPStep )
{
  //Количество интервалов
  int prInt = floor( double( PPBase ) / double( PPStep ) );
  //e Количество интервалов
        return prInt * PPStep;
}

void UIntInpValid( char &Key )
{
  AnsiString S=(AnsiString)Key;
  AnsiString S1="0123456789\b\r";
  if(!S1.Pos(S)){
    Key=NULL;
    Beep();
    return;
  }
  if(S=="\r")
    Key=NULL;
}


bool IsNumber( char agVal )
{
  bool lcRes = TRUE;

  char lcStr[ 2 ] = "1";
  lcStr[ 0 ] = agVal;

  AnsiString S = AnsiString( lcStr );

  AnsiString S1="0123456789";

  if( !S1.Pos(S) )
    lcRes = FALSE;

  return lcRes;
}

//Нахождение нач текущ месяца
TDateTime SecToCurrMessBegCount( TDateTime PPDT )
{
  unsigned short prY, prMonth, prD, prH, prMin, prS, prMS;
  PPDT.DecodeDate( &prY, &prMonth, &prD);
  PPDT.DecodeTime( &prH, &prMin, &prS, &prMS );
        return
                PPDT
                -
                //Хвост от начала месяца
                (
                        prMS * M_SEC_DT
                        +
      prS * SEC_DT
                        +
      prMin * MIN_DT
                        +
      prH * HOUR_DT
                        +
      ( prD - 1 ) * DAY_DT
                )
                //e Хвост от начала месяца
    +
    //Поскольку исходное - секунды
    10 * M_SEC_DT
    //e Поскольку исходное - секунды
    ;
}

TDateTime UnToWinTime( time_t pFT )
{
        tm* Destin;
        TDateTime prDT;
        Destin = SafeLocaltime(&pFT);
        prDT
                =
                TDateTime
                (
                        (unsigned short)(1900 + Destin->tm_year),
                        (unsigned short)(Destin->tm_mon + 1),
                        (unsigned short)Destin->tm_mday
                )
                +
                TDateTime
                (
                        (unsigned short)Destin->tm_hour,
                        (unsigned short)Destin->tm_min,
                        (unsigned short)Destin->tm_sec,
                        0
                );
        return prDT;
};

struct tm *SafeLocaltime(const time_t *timer)
{
  time_t prT = 0;
  if ( *timer >= 0 )
    return localtime( timer );
  else
    return localtime( &prT );
}

time_t DOSToWinTime( time_t pFT )
{
  time_t prT;
  if ( pFT < 100000 )
    prT = pFT;
  else
    prT = pFT + InpTimeCorr();
  return prT;
}

time_t WinToDOSTime( time_t pFT )
{
  time_t prT;
  if ( pFT < 100000 )
    prT = pFT;
  else
    prT = pFT - InpTimeCorr();
  return prT;
}

time_t InpTimeCorr()
{
  return _timezone;
}


AStr UnTimeToStr( time_t PPT )
{
        AnsiString s;
  if ( 0 == PPT )
    s = "00.00.00 00:00:00";
  else
  {
    tm* pTM;
    pTM = SafeLocaltime(&PPT);
    FormtUnixTime(s, pTM);
  }
  return s;
}

double ExDTTSec( double PPExDT )
{
  double prPart = ( PPExDT - floor( PPExDT ) );
  prPart = floor( prPart / SEC_DT ) * SEC_DT;
  return prPart + floor( PPExDT );
}

bool IsRathUnZeroTime( double PPDT )
{
  double prDT = UnToWinTime( 1 );
  bool prRes = PPDT > prDT;
  return prRes;
}

bool EpsFltEqul( double x, double y, double e )
{
  double PrFl;
  PrFl = x - y;
  return ( fabs( PrFl ) < e );
};

void FlagEstabl( byte& x, byte maska )
{
  x
    =
    x
    |
    maska;
};

void FlagReset( byte& x, byte maska )
{
  x
    =
    x
    &
    ~maska;
};

/*Валидаторы от СС

file://---------------------------------------------------------------------------
void __fastcall TFormAddRecalc::longKeyPress(TObject *Sender, char &Key)
{
#define Sender ((TEdit*)Sender)
  AnsiString S=(AnsiString)Key;
  AnsiString S1="0123456789\b\r";
  if(Sender->SelStart==0&&S=="-")
    return;
  if(!S1.Pos(S)){
    Key=NULL;
    Beep();
    return;
  }
  if(S=="\r")
    Key=NULL;
#undef Sender
}
file://---------------------------------------------------------------------------
void __fastcall TFormAddRecalc::edNULLKeyPress(TObject *Sender,
      char &Key)
{
#define Sender ((TEdit*)Sender)
  AnsiString S=(AnsiString)Key;
  AnsiString S1;
  if(qwMainPERCENT->AsFloat){
    S1="0123456789\b\r";
    if(Sender->SelStart==0&&S=="-")
      return;
  }else
    S1="0\b\r";//I?e ionoonoaee euaiou cai?ao ia aaia euaioiuo eAo*?

  if(!S1.Pos(S)){
    Key=NULL;
    Beep();
    return;
  }
  if(S=="\r")
    Key=NULL;
#undef Sender
}
file://---------------------------------------------------------------------------
void __fastcall TFormAddRecalc::currencyKeyPress(TObject *Sender, char &Key)
{
#define Sender ((TEdit*)Sender)
  AnsiString S=(AnsiString)Key;
  AnsiString S1="0123456789";
  AnsiString Sd=AnsiString(DecimalSeparator);
  if((Sender->SelStart==0&&S=="-")||S=="\r"||S=="\b"){
    if(S=="\r")
      Key=NULL;
    return;
  }
  AnsiString tmpStr=Sender->Text.Delete(Sender->SelStart+1,Sender->SelLength).Insert(S,Sender->SelStart+1);
  int PosSd=tmpStr.Pos(Sd);
  if((Sender->Text.Pos(Sd)&&!S1.Pos(S))||
     (!Sender->Text.Pos(Sd)&&!AnsiString(S1+Sd).Pos(S))||
     (PosSd&&tmpStr.SubString(PosSd,tmpStr.Length()+1-PosSd).Length()>3)){
    Key=NULL;
    Beep();
    return;
  }
#undef Sender
}
file://---------------------------------------------------------------------------

Валидаторы от СС*/

double Proporcia
  (
     double PPSource, double PPSLB, double PPSHB,  double PPDLB, double PPDHB
  )
{
  double prRes;
  double prDltS = PPSHB - PPSLB;
  double prDltD = PPDHB - PPDLB;
  double prOffsS = PPSource - PPSLB;
  double prOffsD = prDltD * prOffsS / prDltS;
  prRes = PPDLB + prOffsD;
  return prRes;
}

AStr SuffNameByTimeGener()
{
  AStr prRes = FormatDateTime( "yymmdd'_'hhmmss", Now() );
  return prRes;
}

int HandrByExtDTDT( double PPExDT, double PPDT )
{
  return floor( (double)( PPExDT - PPDT ) / H_SEC_DT  + 0.1 );
}

int UserDoubleToInt( double PPD )
{
  int prInt;
  prInt = floor( PPD + 0.1 );
  return prInt;
}

TDateTime WinCurrMessBegCount( TDateTime PPDT )
{
        unsigned short cur_year, cur_month, cur_day,
                   cur_hour, cur_minute, cur_sec, cur_milsec;
        PPDT.DecodeTime(&cur_hour, &cur_minute, &cur_sec, &cur_milsec);
        PPDT.DecodeDate(&cur_year, &cur_month, &cur_day);

        return
                PPDT
                -
                //Хвост от начала месяца
                (
      cur_milsec * M_SEC_DT
      +
                        cur_sec * SEC_DT
                        +
      cur_minute * MIN_DT
                        +
                        cur_hour * HOUR_DT
                        +
                        cur_day - 1
                );
                //e Хвост от начала месяца
}

void __fastcall CreateWaitProcess( AStr PPCmd )
{
  AStr prCmd
    =
    PPCmd;

  STARTUPINFO si;
  PROCESS_INFORMATION pi;

  ZeroMemory( &si, sizeof(si) );
  si.cb = sizeof(si);

  // Start the child process.
  CreateProcess( NULL, // No module name (use command line).
      prCmd.c_str(), // Command line.
      NULL,             // Process handle not inheritable.
      NULL,             // Thread handle not inheritable.
      FALSE,            // Set handle inheritance to FALSE.
      DETACHED_PROCESS,                // No creation flags.
      NULL,             // Use parent's environment block.
      NULL,             // Use parent's starting directory.
      &si,              // Pointer to STARTUPINFO structure.
      &pi );             // Pointer to PROCESS_INFORMATION structure.

  // Wait until child process exits.
  WaitForSingleObject( pi.hProcess, INFINITE );

  // Close process and thread handles.
  CloseHandle( pi.hProcess );

  CloseHandle( pi.hThread );

}

TDateTime StrToDateTimeFormat( AStr agStr, AStr agTFmt, AStr agDFmt )
{

  AStr lcMemShortTimeFormat = ShortTimeFormat;
  AStr lcMemShortDateFormat = ShortDateFormat;

  ShortTimeFormat = agTFmt;
  ShortDateFormat = agDFmt;

  TDateTime lcRes = StrToDateTime( agStr );

  ShortTimeFormat = lcMemShortTimeFormat;
  ShortDateFormat = lcMemShortDateFormat;
  return lcRes;

}

AStr PacketToStr( byte* agFrame, int agSize )
{
  AStr lcStr;
  lcStr = "";
  for ( int i = 0; i < agSize; i++ )
  {
    byte lcInt = agFrame[ i ];
    char lcChs[ 30 ];
    sprintf( lcChs, "0x%02X ", lcInt );
    lcStr = lcStr + lcChs;
  }
  return lcStr;
}

void __fastcall ConsCreateWaitProcess( AStr PPCmd )
{
  UnivCreateWaitProcess( PPCmd, CREATE_NEW_CONSOLE, SW_MINIMIZE	 /*SW_HIDE*/ );
}

void __fastcall UnivCreateWaitProcess( AStr PPCmd, DWORD dwCreationFlags, WORD wShowWindow )
{
  AStr prCmd
    =
    PPCmd;

  STARTUPINFO si;

  //Что-то не работает
  si.wShowWindow = wShowWindow;
  si.dwFlags = STARTF_USESHOWWINDOW;
  //e

  PROCESS_INFORMATION pi;

  ZeroMemory( &si, sizeof(si) );
  si.cb = sizeof(si);

  // Start the child process.
  CreateProcess( NULL, // No module name (use command line).
      prCmd.c_str(), // Command line.
      NULL,             // Process handle not inheritable.
      NULL,             // Thread handle not inheritable.
      FALSE,            // Set handle inheritance to FALSE.
      dwCreationFlags,                // No creation flags.
      NULL,             // Use parent's environment block.
      NULL,             // Use parent's starting directory.
      &si,              // Pointer to STARTUPINFO structure.
      &pi );             // Pointer to PROCESS_INFORMATION structure.

  // Wait until child process exits.
  WaitForSingleObject( pi.hProcess, INFINITE );

  // Close process and thread handles.
  CloseHandle( pi.hProcess );

  CloseHandle( pi.hThread );

}

//Обрезание времени до секунд
//e
//Только для отображения
//e
//Это - нов
double ExDTToDT( double dSource_AV )
{
  double dPartCalc_LV = dSource_AV - floor( dSource_AV );
  //Нашли количество секунд в доле суток
  int iSecCalc_LV = floor( (double)( dPartCalc_LV ) / SEC_DT  );
  //e
  //Нашли вр в сек
  return floor( dSource_AV ) + iSecCalc_LV * SEC_DT + H_SEC_DT;
  //e Нашли вр в сек
}
//old
/*
double ExDTToDT( double PPDT )
{
  double prPart = PPDT - floor( PPDT );
  int prSec = floor( prPart / SEC_DT );
  return floor( PPDT ) + prSec * SEC_DT;
}
*/
//e

//Количество сотых в части секунды
//e
//new vart
//e
int HSecByExDT( double dSource_AV )
{
  double dPartCalc_LV = dSource_AV - floor( dSource_AV );
  //Количество сотых в части суток
  int iPartSecRes =
    floor
    (
      (double)( dPartCalc_LV ) / H_SEC_DT
    );
  //e
  iPartSecRes = iPartSecRes % 100;
  return iPartSecRes;
}
//old vart
/*
int HSecByExDT( double agExDT )
{
  double lcDT = ExDTToDT( agExDT );
  int lcHS = floor( (double)( agExDT - lcDT ) / H_SEC_DT  + 0.1 );
  return lcHS;
}
*/
//e

//Перевод fVal в строку (iPrec - число знаков после запятой)
AnsiString FloatToStrPrec(float fVal, int iPrec)
{
   AnsiString sResult = "";

   if (iPrec < 0) iPrec = 0;
   sResult.printf("%.*f", iPrec, fVal);
   return sResult;
}

