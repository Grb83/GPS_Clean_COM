//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("ComPTermPrj.res");
USEFORM("ComPTerm.cpp", Form1);
USEUNIT("main.cpp");
USEUNIT("ComServerExcep\ComServerException.cpp");
USEUNIT("MUXSOCK\ComServerSocket.cpp");
USELIB("MUXSOCK\PCOMMB.LIB");
USEUNIT("..\lib\base_serv.cpp");
USEUNIT("..\lib\double_base_serv.cpp");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TForm1), &Form1);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
