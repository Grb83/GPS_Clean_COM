//---------------------------------------------------------------------------
#ifndef ShareMemH
#define ShareMemH
//---------------------------------------------------------------------------
extern HANDLE hMapObject;           // handle to file mapping
extern LPVOID lpvShareMem;          // pointer to shared memory

bool CreateSharedCommunication(DWORD dwSize);
bool OpenSharedCommunication(void);
void CloseSharedCommunication(void);
char* GetShareMemErrorMessage(void);
#endif

