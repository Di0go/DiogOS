[org 0x7C00]

mov bp, 0x9000  ; set the stack away from current memory
mov sp, bp

mov bx, welcome
call print

call switch_to_pm

jmp $

; sub-routine inclusion
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
%include "boot_sect_disk.asm"
%include "32bit_print.asm"
%include "32bit_switch.asm"
%include "gdt.asm"

[bits 32]
welcome_to_pm:
    mov ebx, msg_32bit
    call print_string_32b
    jmp $

; strings
welcome:
    db "Welcome to DiogOS!", 0
farewell:
    db "Fawewell...", 0
msg_32bit:
    db "Jumped to 32 bits...", 0

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xAA55