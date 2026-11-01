//---------------------------------------------------------------------------
#ifndef ComServerExceptionH
#define ComServerExceptionH
//---------------------------------------------------------------------------
class EDataBase : public Sysutils::Exception
{
public:
	/* Exception.Create */
	__fastcall EDataBase(const System::AnsiString Msg)
		: Sysutils::Exception(Msg)
	{ }
	/* Exception.CreateFmt */
	__fastcall EDataBase(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size)
		: Sysutils::Exception(Msg, Args, Args_Size)
	{ }
	/* Exception.CreateRes */
	__fastcall EDataBase(int Ident) : Sysutils::Exception(Ident)
	{ }
	/* Exception.CreateResFmt */
	__fastcall EDataBase(int Ident, const System::TVarRec * Args,
		const int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size)
	{ }
	/* Exception.CreateHelp */
	__fastcall EDataBase(const System::AnsiString Msg, int AHelpContext)
		:Sysutils::Exception(Msg, AHelpContext)
	{ }
	/* Exception.CreateFmtHelp */
	__fastcall EDataBase(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size, int AHelpContext)
		: Sysutils::Exception(Msg, Args, Args_Size, AHelpContext)
	{ }
	/* Exception.CreateResHelp */
	__fastcall EDataBase(int Ident, int AHelpContext)
		: Sysutils::Exception(Ident, AHelpContext)
	{ }
	/* Exception.CreateResFmtHelp */
	__fastcall EDataBase(int Ident, const System::TVarRec * Args,
		const	int Args_Size, int AHelpContext)
		: Sysutils::Exception(Ident, Args, Args_Size, AHelpContext)
	{ }
public:
	/* TObject.Destroy */
	__fastcall virtual ~EDataBase(void)
	{ }
};
//---------------------------------------------------------------------------
class ESocket : public Sysutils::Exception
{
public:
	/* Exception.Create */
	__fastcall ESocket(const System::AnsiString Msg,long cod=100l)
		: Sysutils::Exception(Msg),Cod(cod)
	{ }
	/* Exception.CreateFmt */
	__fastcall ESocket(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size)
		: Sysutils::Exception(Msg, Args, Args_Size)
	{ }
	/* Exception.CreateRes */
	__fastcall ESocket(int Ident) : Sysutils::Exception(Ident)
	{ }
	/* Exception.CreateResFmt */
	__fastcall ESocket(int Ident, const System::TVarRec * Args,
		const int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size)
	{ }
	/* Exception.CreateHelp */
	__fastcall ESocket(const System::AnsiString Msg, int AHelpContext)
		:Sysutils::Exception(Msg, AHelpContext)
	{ }
	/* Exception.CreateFmtHelp */
	__fastcall ESocket(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size, int AHelpContext)
		: Sysutils::Exception(Msg, Args, Args_Size, AHelpContext)
	{ }
	/* Exception.CreateResHelp */
	__fastcall ESocket(int Ident, int AHelpContext)
		: Sysutils::Exception(Ident, AHelpContext)
	{ }
	/* Exception.CreateResFmtHelp */
	__fastcall ESocket(int Ident, const System::TVarRec * Args,
		const	int Args_Size, int AHelpContext)
		: Sysutils::Exception(Ident, Args, Args_Size, AHelpContext)
	{ }
public:
	long Cod;
	/* TObject.Destroy */
	__fastcall virtual ~ESocket(void)
	{ }
};
//---------------------------------------------------------------------------
class EComServerThread : public Sysutils::Exception
{
public:
	/* Exception.Create */
	__fastcall EComServerThread(const System::AnsiString Msg,long cod=100l)
		: Sysutils::Exception(Msg),Cod(cod)
	{ }
	/* Exception.CreateFmt */
	__fastcall EComServerThread(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size)
		: Sysutils::Exception(Msg, Args, Args_Size)
	{ }
	/* Exception.CreateRes */
	__fastcall EComServerThread(int Ident) : Sysutils::Exception(Ident)
	{ }
	/* Exception.CreateResFmt */
	__fastcall EComServerThread(int Ident, const System::TVarRec * Args,
		const int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size)
	{ }
	/* Exception.CreateHelp */
	__fastcall EComServerThread(const System::AnsiString Msg, int AHelpContext)
		:Sysutils::Exception(Msg, AHelpContext)
	{ }
	/* Exception.CreateFmtHelp */
	__fastcall EComServerThread(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size, int AHelpContext)
		: Sysutils::Exception(Msg, Args, Args_Size, AHelpContext)
	{ }
	/* Exception.CreateResHelp */
	__fastcall EComServerThread(int Ident, int AHelpContext)
		: Sysutils::Exception(Ident, AHelpContext)
	{ }
	/* Exception.CreateResFmtHelp */
	__fastcall EComServerThread(int Ident, const System::TVarRec * Args,
		const	int Args_Size, int AHelpContext)
		: Sysutils::Exception(Ident, Args, Args_Size, AHelpContext)
	{ }
public:
	long Cod;
	/* TObject.Destroy */
	__fastcall virtual ~EComServerThread(void)
	{ }
};
//---------------------------------------------------------------------------
class ETerminateThread : public Sysutils::Exception
{
public:
	/* Exception.Create */
	__fastcall ETerminateThread(const System::AnsiString Msg)
		: Sysutils::Exception(Msg)
	{ }
	/* Exception.CreateFmt */
	__fastcall ETerminateThread(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size)
		: Sysutils::Exception(Msg, Args, Args_Size)
	{ }
	/* Exception.CreateRes */
	__fastcall ETerminateThread(int Ident) : Sysutils::Exception(Ident)
	{ }
	/* Exception.CreateResFmt */
	__fastcall ETerminateThread(int Ident, const System::TVarRec * Args,
		const int Args_Size) : Sysutils::Exception(Ident, Args, Args_Size)
	{ }
	/* Exception.CreateHelp */
	__fastcall ETerminateThread(const System::AnsiString Msg, int AHelpContext)
		:Sysutils::Exception(Msg, AHelpContext)
	{ }
	/* Exception.CreateFmtHelp */
	__fastcall ETerminateThread(const System::AnsiString Msg,
		const System::TVarRec * Args, const int Args_Size, int AHelpContext)
		: Sysutils::Exception(Msg, Args, Args_Size, AHelpContext)
	{ }
	/* Exception.CreateResHelp */
	__fastcall ETerminateThread(int Ident, int AHelpContext)
		: Sysutils::Exception(Ident, AHelpContext)
	{ }
	/* Exception.CreateResFmtHelp */
	__fastcall ETerminateThread(int Ident, const System::TVarRec * Args,
		const	int Args_Size, int AHelpContext)
		: Sysutils::Exception(Ident, Args, Args_Size, AHelpContext)
	{ }
public:
	/* TObject.Destroy */
	__fastcall virtual ~ETerminateThread(void)
	{ }
};
//---------------------------------------------------------------------------
class EHalfHour : public Sysutils::Exception
{
public:
	/* Exception.Create */
	__fastcall EHalfHour(const System::AnsiString Msg)
		: Sysutils::Exception(Msg)
	{ }
public:
	/* TObject.Destroy */
	__fastcall virtual ~EHalfHour(void)
	{ }
};

//---------------------------------------------------------------------------

#define ERR_OPEN_SOCKET (long)1l
#define ERR_NOT_RESPONCE (long)2l
#define ERR_CONTROL_SUMM (long)3l
#define ERR_QUERY_SOCKET (long)4l
#define ERR_TIME_DIFF (long)5l
#define OK_STATE (long)0l
#define OK_MODIFY_TIME (long)-1l
#define OK_MODIFY_ZONE (long)-2l
#define OK_READ_DAY (long)-100l
#define OK_READ_MONTH (long)-101l

#endif
