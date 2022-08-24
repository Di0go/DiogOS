[org 0x7C00]

mov bp, 0x8000  ; set the stack away from current memory
mov sp, bp

mov bx, 0x9000  ; [es:bx] 0x0000:0x9000 = 0x09000
mov dh, 2       ; number of sectors to read
call disk_load

mov dx, [0x9000]
call print_hex

call new_line

mov dx, [0x9000 + 512]
call print_hex

jmp $

; sub-routine inclusion
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"
%include "boot_sect_disk.asm"

; strings
welcome:
    db "Welcome to DiogOS", 0
farewell:
    db "Fawewell...", 0

; Padding and magic number.
times 510 -( $ - $$ ) db 0
dw 0xAA55

; after 512 we start sector 2

times 256 dw 0xDEFF ; sector 2
times 256 dw 0xF3C1 ; sector 3