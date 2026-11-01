//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ComServerSocket.h"

#pragma package(smart_init)
//---------------------------------------------------------------------------

const unsigned int TimeOutSocket = 100; // Таймаут по умолчанию (мс)

//---------------------------------------------------------------------------
__fastcall TSocket::TSocket()
{
    hComm = INVALID_HANDLE_VALUE; // Инициализируем как "закрыто"

    // Значения по умолчанию
    usNumCom = 1;
    usBaud = 9600;
    usData = 8;
    usStop = 1;
    bParity = 0; // None
}

//---------------------------------------------------------------------------
__fastcall TSocket::~TSocket()
{
    Close(); // Гарантируем закрытие при удалении объекта
}

//---------------------------------------------------------------------------
void __fastcall TSocket::Open(void)
{
    // 1. Формируем имя порта
    // Для портов COM1-COM9 достаточно "COM1", но для COM10+ нужно "\\.\COM10"
    // Универсальный вариант: "\\.\COMx"
    AnsiString PortName = "\\\\.\\COM" + IntToStr(usNumCom);

    // 2. Открываем порт
    hComm = CreateFile(
        PortName.c_str(),
        GENERIC_READ | GENERIC_WRITE,
        0,    // exclusive access (порт нельзя делить с другими программами)
        NULL, // no security attributes
        OPEN_EXISTING,
        0,    // FILE_ATTRIBUTE_NORMAL (синхронный режим, без Overlapped)
        NULL
    );

    if (hComm == INVALID_HANDLE_VALUE)
    {
        // Получаем код ошибки Windows для лога
        DWORD dwError = GetLastError();
        throw ESocket("Ошибка открытия порта " + PortName + " (WinAPI Code: " + IntToStr((int)dwError) + ")", ERR_OPEN_SOCKET);
    }

    // 3. Настраиваем буферы ввода-вывода (рекомендуемые значения)
    SetupComm(hComm, 4096, 4096);

    // 4. Настраиваем параметры порта (DCB)
    DCB dcbSerialParams = {0};
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);

    if (!GetCommState(hComm, &dcbSerialParams))
    {
        Close();
        throw ESocket("Ошибка получения настроек порта", ERR_OPEN_SOCKET);
    }

    dcbSerialParams.BaudRate = usBaud;
    dcbSerialParams.ByteSize = usData;
    
    // Стоп-биты: 0,1,2 (WinAPI constants)
    if (usStop == 1)      dcbSerialParams.StopBits = ONESTOPBIT;
    else if (usStop == 2) dcbSerialParams.StopBits = TWOSTOPBITS;
    else                  dcbSerialParams.StopBits = ONESTOPBIT;

    // Четность. В вашем коде: 0=N, 1=E, 2=O.
    // WinAPI: NOPARITY=0, ODDPARITY=1, EVENPARITY=2.
    // Нужно маппировать аккуратно!
    switch (bParity) {
        case 0: dcbSerialParams.Parity = NOPARITY; break;
        case 1: dcbSerialParams.Parity = EVENPARITY; break; // ВНИМАНИЕ: Проверьте логику 'E' в main_thread
        case 2: dcbSerialParams.Parity = ODDPARITY; break;
        default: dcbSerialParams.Parity = NOPARITY;
    }

    if (!SetCommState(hComm, &dcbSerialParams))
    {
        Close();
        throw ESocket("Ошибка установки настроек порта (Baud/Parity)", ERR_OPEN_SOCKET);
    }

    // 5. Устанавливаем таймауты (по умолчанию)
    SetTimeouts(MAXDWORD, 0, TimeOutSocket);
    
    // 6. Очищаем мусор в трубах
    Clear();
}

//---------------------------------------------------------------------------
void __fastcall TSocket::Close(void)
{
    if (hComm != INVALID_HANDLE_VALUE)
    {
        CloseHandle(hComm);
        hComm = INVALID_HANDLE_VALUE;
    }
}

//---------------------------------------------------------------------------
void __fastcall TSocket::Clear(void)
{
    if (hComm != INVALID_HANDLE_VALUE)
    {
        // PURGE_RXCLEAR | PURGE_TXCLEAR - очистить буферы приема и передачи
        PurgeComm(hComm, 0x0008 | 0x0004); 
    }
}

//---------------------------------------------------------------------------
// Вспомогательная функция для SetCommTimeouts
void __fastcall TSocket::SetTimeouts(int ReadInterval, int ReadTotalMultiplier, int ReadTotalConstant)
{
    COMMTIMEOUTS timeouts = {0};
    
    // Логика WinAPI для чтения:
    // ReadInterval=MAXDWORD, остальные 0 -> вернуть то, что есть в буфере немедленно (аналог polling)
    // ReadInterval=MAXDWORD, ReadTotalConstant=X -> вернуть то что есть, но ждать байт не более X мс
    
    timeouts.ReadIntervalTimeout = ReadInterval;
    timeouts.ReadTotalTimeoutMultiplier = ReadTotalMultiplier;
    timeouts.ReadTotalTimeoutConstant = ReadTotalConstant;
    
    timeouts.WriteTotalTimeoutConstant = 500; // На запись даем полсекунды
    timeouts.WriteTotalTimeoutMultiplier = 10;

    SetCommTimeouts(hComm, &timeouts);
}

//---------------------------------------------------------------------------
unsigned short __fastcall TSocket::ReadEx(void* buf, unsigned short num, int t_out)
{
    if (hComm == INVALID_HANDLE_VALUE) return 0;

    // Если таймаут, запрошенный функцией, отличается от стандартного,
    // перенастраиваем порт "на лету"
    // Для NMEA чтения это обычно не нужно, но для совместимости с PComm логикой сделаем:
    COMMTIMEOUTS currentParams;
    GetCommTimeouts(hComm, &currentParams);

    if (currentParams.ReadTotalTimeoutConstant != (DWORD)t_out) {
        // Режим: читать сразу, но ждать не более t_out, если буфер пуст
        SetTimeouts(MAXDWORD, 0, t_out);
    }

    DWORD bytesRead = 0;
    BOOL res = ReadFile(hComm, buf, (DWORD)num, &bytesRead, NULL);

    if (!res) {
        // Если произошла системная ошибка (например, выдернули шнур)
        return 0;
    }

    return (unsigned short)bytesRead;
}
//---------------------------------------------------------------------------
void __fastcall TSocket::Write(void* buf, unsigned short num)
{
    if (hComm == INVALID_HANDLE_VALUE)
        throw ESocket("Порт закрыт, запись невозможна", ERR_NOT_RESPONCE);

    DWORD bytesWritten = 0;
    BOOL res = WriteFile(hComm, buf, (DWORD)num, &bytesWritten, NULL);

    // ИСПРАВЛЕНИЕ: Добавлено явное приведение (DWORD) перед num
    if (!res || bytesWritten != (DWORD)num)
    {
        throw ESocket("Ошибка записи в порт (WinAPI)", ERR_NOT_RESPONCE);
    }
}
//---------------------------------------------------------------------------

