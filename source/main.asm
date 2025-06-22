.386                  ; Use 32-bit instructions
.model flat, stdcall  ; Use flat memory and stdcall calling convention (used for Windows API calling)
.stack 4096           ; Set up a stack with a size of 4096 bytes (4 KB)

include win.inc
include helper.inc

includelib user32.lib
includelib kernel32.lib
includelib gdi32.lib
includelib shlwapi.lib

.data
    EXTERN cfg : CONFIG
    screen_data      dd 0
    pixel_count      dd 0
    h_window         dd 0
    msg_buffer       db 64 dup(0)
    msg1             db "The triggerbot is running successfully. Go into a game and enjoy!", 0AH, 0AH, 0  
    msg2             db 13, "Reaction time: %lu ms  ", 0
    error_msg1       db "ERROR: Failed reading Config. Ensure config.txt is in the same folder as main.exe with correct values", 0AH, 0
    error_msg2       db "ERROR: GetScreenshot failed.", 0AH, 0 
    error_msg3       db "ERROR: FindWindow failed. Make sure that Valorant is running.", 0AH, 0 
    error_msg4       db "ERROR: LeftClick (PostMessage) failed", 0AH, 0 
    window_name      db "VALORANT  ", 0

.code
main: 
    invoke GetConfig
    cmp eax, 0
    je CFG_FAILED 

    ; Calculate the total pixel count (scan_area * scan_area)
    mov eax, cfg.scan_area
    mov ebx, cfg.scan_area
    mul ebx
    mov pixel_count, eax

    ; Get Valorants window handle for PostMessage(), used in LeftClick()
    invoke FindWindowA, 0, offset window_name
    cmp eax, 0
    je FIND_WINNM_FAILED
    mov h_window, eax

    invoke PrintConsole, offset msg1

    invoke InitPerformanceCounters

MAIN_LOOP:
    invoke IsKeyPressed, cfg.hold_key
    cmp eax, 0
    je MAIN_LOOP
    
    invoke StartCounter

    invoke GetScreenshot, cfg.scan_area, cfg.scan_area, 0
    cmp eax, 0
    je SS_FAILED
    mov screen_data, eax

    invoke FindColor, screen_data, pixel_count, cfg.color_sens, cfg.red, cfg.green, cfg.blue
    cmp eax, 1
    je COLOR_FOUND

    invoke GlobalFree, screen_data 
    jmp MAIN_LOOP 

COLOR_FOUND:
    invoke LeftClick, h_window
    cmp eax, 0
    je LEFT_CLICK_FAILED

    invoke StopCounter

    invoke wsprintfA, offset msg_buffer, offset msg2, eax
    invoke PrintConsole, offset msg_buffer

    invoke Sleep, cfg.tap_time
    invoke GlobalFree, screen_data 
    jmp MAIN_LOOP 


CFG_FAILED:
    invoke PrintConsole, offset error_msg1
    invoke Sleep, 3000
    invoke ExitProcess, 0    

SS_FAILED:
    invoke PrintConsole, offset error_msg2
    invoke Sleep, 3000
    invoke ExitProcess, 0    

FIND_WINNM_FAILED:
    invoke PrintConsole, offset error_msg3
    invoke Sleep, 3000
    invoke ExitProcess, 0  

LEFT_CLICK_FAILED:
    invoke PrintConsole, offset error_msg4
    invoke Sleep, 3000
    invoke ExitProcess, 0  
    
end main