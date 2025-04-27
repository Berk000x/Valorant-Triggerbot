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
    msg1             db "The triggerbot is running successfully. Go into a game and enjoy!", 0AH, 0  
    error_msg1       db "Error: get_cfg failed. Make sure config.ini is in the same directory as main.exe and includes the correct values", 0AH, 0
    error_msg2       db "Error: get_screenshot failed.", 0AH, 0 

.code
main: 
    invoke get_cfg
    cmp eax, 0
    je CFG_FAILED 

    ; scan_area * scan_area * 4
    mov eax, cfg.scan_area
    mov ebx, cfg.scan_area
    mul ebx
    mov edi, eax
    mov eax, 4
    mov ebx, edi 
    mul ebx
    mov pixel_count, eax

    invoke PrintConsole, offset msg1

MAIN_LOOP:
    invoke is_key_pressed, cfg.hold_key
    cmp eax, 0
    je MAIN_LOOP
    
    invoke get_screenshot, cfg.scan_area, cfg.scan_area, 0
    cmp eax, 0
    je SS_FAILED
    mov screen_data, eax

    invoke find_color, screen_data, pixel_count, cfg.color_sens, cfg.red, cfg.green, cfg.blue
    cmp eax, 1
    je COLOR_FOUND

    invoke GlobalFree, screen_data 
    jmp MAIN_LOOP 

COLOR_FOUND:
    invoke left_click
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

end main