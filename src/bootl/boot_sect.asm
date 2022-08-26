[org 0x7C00]

mov bp, 0x8000  ; set the stack away from current memory
mov sp, bp



jmp $

; sub-routine inclusion
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
%include "boot_sect_disk.asm"
%include "32bit_print.asm"

; strings
welcome:
    db "Welcome to DiogOS", 0
farewell:
    db "Fawewell...", 0

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xAA55