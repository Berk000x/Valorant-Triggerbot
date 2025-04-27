get_cfg PROTO
get_screenshot PROTO :DWORD, :DWORD, :DWORD 
find_color PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
left_click PROTO
PrintConsole PROTO :DWORD
is_key_pressed PROTO :DWORD

CONFIG STRUCT
    hold_key   dd ?
    tap_time   dd ? 
    scan_area  dd ?
    color_sens dd ?
    red        dd ?
    green      dd ?
    blue       dd ?
CONFIG ENDS