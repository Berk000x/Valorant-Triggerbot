MessageBoxA PROTO :DWORD,:DWORD,:DWORD,:DWORD
ExitProcess PROTO :DWORD
lstrcpyA PROTO :DWORD,:DWORD
GetDC PROTO :DWORD
AllocConsole PROTO 
GetStdHandle PROTO :DWORD
WriteConsoleA PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
GetDeviceCaps PROTO :DWORD,:DWORD
CreateCompatibleDC PROTO :DWORD
CreateCompatibleBitmap PROTO :DWORD,:DWORD,:DWORD
SelectObject PROTO :DWORD,:DWORD
BitBlt PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
GetObjectA PROTO :DWORD,:DWORD,:DWORD
RtlFillMemory PROTO :DWORD,:DWORD,:DWORD
GetDIBits PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
GlobalAlloc PROTO :DWORD,:DWORD
CreateFileA PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
WriteFile PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ReleaseDC PROTO :DWORD,:DWORD
DeleteDC PROTO :DWORD
DeleteObject PROTO :DWORD
CloseHandle PROTO :DWORD
GlobalFree PROTO :DWORD
Sleep PROTO :DWORD
mouse_event PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
GetFullPathNameA PROTO :DWORD,:DWORD,:DWORD,:DWORD
StrToIntA PROTO :DWORD
PathFileExistsA PROTO :DWORD
GetPrivateProfileStringA PROTO :DWORD,:DWORD,:DWORD,:DWORD,:DWORD,:DWORD
GetPrivateProfileIntA PROTO :DWORD,:DWORD,:DWORD,:DWORD
lstrlenA PROTO :DWORD
GetAsyncKeyState PROTO :DWORD

DESKTOPHORZRES EQU 118
DESKTOPVERTRES EQU 117
SRCCOPY EQU 00CC0020h
DIB_RGB_COLORS EQU 0
GENERIC_WRITE EQU 40000000h
FILE_ATTRIBUTE_NORMAL EQU 80h
CREATE_ALWAYS EQU 2
STD_OUTPUT_HANDLE EQU -11
MOUSEEVENTF_LEFTDOWN EQU 0002h
MOUSEEVENTF_LEFTUP EQU 0004h
MAX_PATH EQU 260
BI_RGB EQU 0

BITMAP STRUCT
    bmType         DWORD ?    
    bmWidth        DWORD ?   
    bmHeight       DWORD ?    
    bmWidthBytes   DWORD ?    
    bmPlanes       WORD  ?   
    bmBitsPixel    WORD  ?    
    bmBits         DWORD ?  
BITMAP ENDS

BITMAPFILEHEADER STRUCT
    bfType       WORD      ?
    bfSize       DWORD     ?
    bfReserved1  WORD      ?
    bfReserved2  WORD      ?
    bfOffBits    DWORD     ?
BITMAPFILEHEADER ENDS

BITMAPINFOHEADER STRUCT
    biSize            DWORD     ?
    biWidth           SDWORD    ?  
    biHeight          SDWORD    ?
    biPlanes          WORD      ?
    biBitCount        WORD      ?
    biCompression     DWORD     ?
    biSizeImage       DWORD     ?
    biXPelsPerMeter   SDWORD    ?
    biYPelsPerMeter   SDWORD    ?
    biClrUsed         DWORD     ?
    biClrImportant    DWORD     ?
BITMAPINFOHEADER ENDS
