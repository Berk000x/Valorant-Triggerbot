GetScreenshot PROTO :DWORD, :DWORD, :DWORD 
FindColor PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
LeftClick PROTO h_window:DWORD
GetConfig PROTO
PrintConsole PROTO :DWORD
IsKeyPressed PROTO :DWORD
InitPerformanceCounters PROTO
StartCounter PROTO
StopCounter PROTO

CONFIG STRUCT
    hold_key   dd ?
    tap_time   dd ? 
    scan_area  dd ?
    color_sens dd ?
    red        dd ?
    green      dd ?
    blue       dd ?
CONFIG ENDS