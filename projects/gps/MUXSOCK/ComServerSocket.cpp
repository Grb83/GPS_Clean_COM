//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ComServerSocket.h"
#pragma package(smart_init)

const unsigned int TimeOutSocket = 100; 

__fastcall TSocket::TSocket()
{
    hComm = INVALID_HANDLE_VALUE;
    usNumCom = 1;
    usBaud = 9600;
    usData = 8;
    usStop = 1;
    bParity = 0; 
}

__fastcall TSocket::~TSocket()
{
    Close();
}

void __fastcall TSocket::Open(void)
{
    AnsiString PortName = "\\\\.\\COM" + IntToStr(usNumCom);

    // ОТКРЫВАЕМ ПОРТ В АСИНХРОННОМ РЕЖИМЕ (FILE_FLAG_OVERLAPPED)
    // Это спасает от любых зависаний при выдергивании USB
    hComm = CreateFile(
        PortName.c_str(),
        GENERIC_READ | GENERIC_WRITE,
        0,    
        NULL, 
        OPEN_EXISTING,
        FILE_FLAG_OVERLAPPED, // <--- Ключевое изменение!
        NULL
    );

    if (hComm == INVALID_HANDLE_VALUE)
    {
        DWORD dwError = GetLastError();
        throw ESocket("Ошибка открытия порта " + PortName + " (WinAPI Code: " + IntToStr((int)dwError) + ")", ERR_OPEN_SOCKET);
    }

    SetupComm(hComm, 4096, 4096);

    DCB dcbSerialParams = {0};
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);

    if (!GetCommState(hComm, &dcbSerialParams))
    {
        Close();
        throw ESocket("Ошибка получения настроек порта", ERR_OPEN_SOCKET);
    }

    dcbSerialParams.BaudRate = usBaud;
    dcbSerialParams.ByteSize = usData;
    
    if (usStop == 1)      dcbSerialParams.StopBits = ONESTOPBIT;
    else if (usStop == 2) dcbSerialParams.StopBits = TWOSTOPBITS;
    else                  dcbSerialParams.StopBits = ONESTOPBIT;

    switch (bParity) {
        case 0: dcbSerialParams.Parity = NOPARITY; break;
        case 1: dcbSerialParams.Parity = EVENPARITY; break;
        case 2: dcbSerialParams.Parity = ODDPARITY; break;
        default: dcbSerialParams.Parity = NOPARITY;
    }

    if (!SetCommState(hComm, &dcbSerialParams))
    {
        Close();
        throw ESocket("Ошибка установки настроек порта", ERR_OPEN_SOCKET);
    }

    Clear();
}

void __fastcall TSocket::Close(void)
{
    if (hComm != INVALID_HANDLE_VALUE)
    {
        CloseHandle(hComm);
        hComm = INVALID_HANDLE_VALUE;
    }
}

void __fastcall TSocket::Clear(void)
{
    if (hComm != INVALID_HANDLE_VALUE)
    {
        DWORD err;
        COMSTAT stat;
        // Перед очисткой проверяем, жив ли порт физически
        if (!ClearCommError(hComm, &err, &stat)) {
            throw ESocket("Связь с портом потеряна (аппаратный сбой)", ERR_OPEN_SOCKET);
        }
        PurgeComm(hComm, PURGE_RXCLEAR | PURGE_TXCLEAR); 
    }
}

unsigned short __fastcall TSocket::ReadEx(void* buf, unsigned short num, int t_out)
{
    if (hComm == INVALID_HANDLE_VALUE) return 0;

    OVERLAPPED osReader = {0};
    osReader.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
    if (osReader.hEvent == NULL) return 0;

    DWORD bytesRead = 0;
    BOOL res = ReadFile(hComm, buf, (DWORD)num, &bytesRead, &osReader);

    if (!res) 
    {
        DWORD dwErr = GetLastError();
        if (dwErr != ERROR_IO_PENDING) 
        {
            // Ошибка чтения (выдернули шнур в момент запроса)
            CloseHandle(osReader.hEvent);
            throw ESocket("Аппаратный сбой чтения (USB извлечен?)", ERR_NOT_RESPONCE);
        }
        
        // Операция "повисла", ждем ее завершения ровно t_out мс
        DWORD dwRes = WaitForSingleObject(osReader.hEvent, t_out);
        switch(dwRes)
        {
            case WAIT_OBJECT_0:
                // Успешно, байт пришел
                if (!GetOverlappedResult(hComm, &osReader, &bytesRead, FALSE)) {
                    bytesRead = 0;
                }
                break;
            case WAIT_TIMEOUT:
                // Истек таймаут (тишина в эфире), отменяем зависший запрос
                CancelIo(hComm);
                bytesRead = 0;
                break;
            default:
                // Системный сбой (шнур выдернули во время ожидания)
                CancelIo(hComm);
                CloseHandle(osReader.hEvent);
                throw ESocket("Сбой ожидания порта (USB извлечен?)", ERR_NOT_RESPONCE);
        }
    }

    CloseHandle(osReader.hEvent);
    return (unsigned short)bytesRead;
}

void __fastcall TSocket::Write(void* buf, unsigned short num)
{
    if (hComm == INVALID_HANDLE_VALUE) 
        throw ESocket("Порт закрыт, запись невозможна", ERR_NOT_RESPONCE);

    OVERLAPPED osWrite = {0};
    osWrite.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);
    if (osWrite.hEvent == NULL) 
        throw ESocket("Сбой создания события записи", ERR_NOT_RESPONCE);
    
    DWORD bytesWritten = 0;
    BOOL res = WriteFile(hComm, buf, (DWORD)num, &bytesWritten, &osWrite);

    if (!res) 
    {
        if (GetLastError() != ERROR_IO_PENDING) 
        {
            CloseHandle(osWrite.hEvent);
            throw ESocket("Аппаратная ошибка записи в порт", ERR_NOT_RESPONCE);
        }
        
        // Ждем максимум 500мс
        if (WaitForSingleObject(osWrite.hEvent, 500) == WAIT_OBJECT_0) {
            GetOverlappedResult(hComm, &osWrite, &bytesWritten, FALSE);
        } else {
            CancelIo(hComm); // Отмена при зависании
        }
    }
    
    CloseHandle(osWrite.hEvent);

    if (bytesWritten != (DWORD)num)
    {
        throw ESocket("Таймаут записи в порт", ERR_NOT_RESPONCE);
    }
}

