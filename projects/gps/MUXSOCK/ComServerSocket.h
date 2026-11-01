//---------------------------------------------------------------------------
#ifndef ComServerSocketH
#define ComServerSocketH

// Подключаем Windows API
#include <windows.h>
#include <vcl.h>

// Подключаем ваш класс исключений
#include "ComServerException.h"

//---------------------------------------------------------------------------

// Стандартный таймаут (можно менять в коде или INI)
extern const unsigned int TimeOutSocket;

class TSocket
{
  private:
    HANDLE hComm;  // Дескриптор порта (вместо ID библиотеки)

    // Вспомогательная функция настройки таймаутов (используется внутри Open и ReadEx)
    void __fastcall SetTimeouts(int ReadInterval, int ReadTotalMultiplier, int ReadTotalConstant);

  public:
    // Поля настроек (оставили как было, чтобы не ломать main_thread)
    unsigned short usNumCom;    // Номер порта
    unsigned long  usBaud;      // Скорость (9600 и т.д.)
    unsigned short usData;      // Бит данных (8)
    unsigned short usStop;      // Стоп бит (1 или 2)
    unsigned short bParity;     // Четность: 0-None, 1-Even(В вашей логике), 2-Odd
    
    // Остальные поля можно оставить для совместимости, но они не используются в WinAPI версии
    unsigned short usType;
    unsigned short usAddr;
    unsigned short usFlowCtrl;
    unsigned short bProtocol;
    char cTypeChanel;
    char sCallStr[64];
    char sHookStr[64];

    // Конструктор / Деструктор
    __fastcall TSocket();
    __fastcall ~TSocket();

    // Основные методы
    void __fastcall Open(void);
    void __fastcall Close(void);
    void __fastcall Clear(void);

    // Чтение и Запись
    // ReadEx возвращает кол-во реально прочитанных байт
    unsigned short __fastcall ReadEx(void* buf, unsigned short num, int t_out = TimeOutSocket);
    void __fastcall Write(void* buf, unsigned short num);
    
    // Проверка состояния (открыт ли порт)
    inline bool __fastcall Status(void) { return (hComm != INVALID_HANDLE_VALUE); }
};

#endif
