//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ShareMem.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

HANDLE hMapObject;           // handle to file mapping
LPVOID lpvShareMem;          // pointer to shared memory
char ShareMemErrorMessage[128];
SECURITY_DESCRIPTOR SecDesc;
SECURITY_ATTRIBUTES SecAttr;

bool CreateSharedCommunication(DWORD dwSize)
{
//--------------»нициализаци€ DAKL,позвол€ющего доступ к объекту любого процесса
  InitializeSecurityDescriptor(&SecDesc,SECURITY_DESCRIPTOR_REVISION );
  SetSecurityDescriptorDacl(&SecDesc,TRUE,(PACL)NULL,FALSE );
  SecAttr.nLength = sizeof(SECURITY_ATTRIBUTES);
  SecAttr.lpSecurityDescriptor = &SecDesc;
  SecAttr.bInheritHandle = FALSE;

  hMapObject = CreateFileMapping(
                (HANDLE) 0xFFFFFFFF, // use paging file
                &SecAttr,            // security attributes
                PAGE_READWRITE,      // read/write access
                0,                   // size: high 32-bits
                dwSize,              // size: low 32-bits
                "c_gpstimesrv_memfilemap");    // name of map object

  if (hMapObject == NULL) {
    strcpy(ShareMemErrorMessage, "Can't create file mapping.");
    return false;
  }
  if (GetLastError() == ERROR_ALREADY_EXISTS) {
    strcpy(ShareMemErrorMessage, "File mapping already exists.");
    return false;
  }

  lpvShareMem = MapViewOfFile(
                hMapObject,     // object to map view of
                FILE_MAP_WRITE, // read/write access
                0,              // high offset:  map from
                0,              // low offset:   beginning
                0);             // default: map entire file

  if (lpvShareMem == NULL){
    strcpy(ShareMemErrorMessage, "Can't create shared memory.");
    return false;
  }

  memset(lpvShareMem, '\0', dwSize);
  return true;
}

bool OpenSharedCommunication(void)
{
  hMapObject = OpenFileMapping(
                FILE_MAP_ALL_ACCESS,      // read/write access
                FALSE,                    // inheritance
                "c_server_memfilemap");    // name of map object

  if (hMapObject == NULL) {
    strcpy(ShareMemErrorMessage, "Can't open file mapping.");
    return false;
  }

  lpvShareMem = MapViewOfFile(
                hMapObject,     // object to map view of
                FILE_MAP_WRITE, // read/write access
                0,              // high offset:  map from
                0,              // low offset:   beginning
                0);             // default: map entire file

  if (lpvShareMem == NULL){
    strcpy(ShareMemErrorMessage, "Can't open shared memory.");
    return false;
  }

  return true;
}

void CloseSharedCommunication(void)
{
  if (lpvShareMem != NULL) UnmapViewOfFile(lpvShareMem);
  if (hMapObject != NULL) CloseHandle(hMapObject);
}

char* GetShareMemErrorMessage(void)
{
  return (char*)ShareMemErrorMessage;
}

