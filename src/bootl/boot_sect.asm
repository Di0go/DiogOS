[org 0x7C00]

KERNEL_OFFSET equ 0x1000    ; memory offset to laod the kernel to

mov bp, 0x9000  ; set the stack away from current memory
mov sp, bp

mov bx, welcome
call print

call load_kernel

call switch_to_pm

jmp halt

; sub-routine inclusion
%include "bootl/boot_sect_print.asm"
%include "bootl/boot_sect_print_hex.asm"
%include "bootl/boot_sect_disk.asm"
%include "bootl/32bit_print.asm"
%include "bootl/32bit_switch.asm"
%include "bootl/gdt.asm"

halt:
    hlt
    jmp halt

load_kernel:
    mov bx, msg_kernel_load
    call print

    call disk_load

    ret

[bits 32]
welcome_to_pm:
    mov ebx, msg_32bit
    call print_string_32b

    call KERNEL_OFFSET

    jmp halt

; strings
welcome:
    db "Welcome to DiogOS!", 0xA, 0xD, 0
farewell:
    db "Fawewell...", 0xA, 0xD, 0
msg_32bit:
    db "Jumped to 32 bits...", 0xA, 0xD, 0
msg_kernel_load:
    db "Loading Kernel to memory...", 0xA, 0xD, 0

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xAA55