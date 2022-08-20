[org 0x7C00]

call new_line

mov bx, welcome
call print

call new_line

mov bx, farewell
call print

call new_line

jmp $

; sub-routine inclusion
%include "boot_sect_print.asm"

; strings
welcome:
    db "Welcome to DiogOS", 0
farewell:
    db "Fawewell...", 0

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xAA55