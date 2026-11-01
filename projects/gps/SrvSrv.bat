@rem --------------------------------------------------------------------
@rem vpr 17.02.01  --  20.02.01 - modified by AVN for Communication Server Service
@rem
@rem Командный файл установки сервиса CSrvGSM.EXE
@rem Создает ключ реестра для CSrvGSM.
@rem Копирует файл сервиса (CSrvGSM.exe) в системную
@rem директорию Winnt.
@rem
@rem ВНИМАНИЕ!
@rem   Параметры запуска CSrvGSM.exe:
@rem   При запуске в режиме консоли: CSrvGSM.exe /c
@rem   При запуске в режиме сервиса: CSrvGSM.exe
@rem ВНИМАНИЕ!
@rem   Для работы командного файла необходима утилита sc.exe из Win32 SDK
@rem --------------------------------------------------------------------

rem sc.exe create Srv_ASKUE_GSM_Server BinPath= "%SystemRoot%\System32\CSrvGSM.exe" type= own start= demand
rem copy CSrvGSM.exe %SystemRoot%\System32\
rem copy MuxSock1.dll %SystemRoot%\System32\
rem copy Ociw32.dll %SystemRoot%\System32\
sc.exe create Srv_ASKUE_GPS_Server BinPath= "d:\igor9\work575\CSrvGPS.exe" type= own start= demand
rem sc.exe delete Srv_ASKUE_GPS_Server
