//---------------------------------------------------------------------------

#include <vcl.h>

#include "ComServerException.h"
#include "main.h"

#pragma hdrstop

#include "ComPTerm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

ByteArray SendBuffer;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Server_Start();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormDestroy(TObject *Sender)
{
  Server_Stop();
}

//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  try
  {
    memset( SendBuffer, 0x0 , sizeof( SendBuffer ) );
    int prInt = Edit1->Text.Length();
    memmove( SendBuffer, Edit1->Text.c_str(), prInt );
    SendBuffer[ prInt ] = 0x0D;
    SendBuffer[ prInt + 1 ] = 0x0A;
    Socket->Clear();
    Socket->Write( SendBuffer, prInt + 2 );
    //08.10.03 ReadPacket();
  }
  catch (ESocket& e)
  {
    AStr prStr = "Ошибка сокета при записи/чтении: " + e.Message;
    PutLogFile( prStr );
  }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
  ExtReadStop = TRUE;
}
//---------------------------------------------------------------------------

