;   Disk Address Packet Structure
DAPS:
                    db 0x10     ;   size of the packet (16 bytes)
                    db 0
    seccount:       dw 16       ;   number of sectors to transfer, int13 resets to number of sectors actually read for error checking
    buffer:         dw 0x1000   ;   memory buffer destination
                    dw 0        ;   in memory page 0
    lba_store       dd 1        ;   lba to read here
                    dd 0        ;   more bytes for big lba's ( > 4 bytes)

disk_load:
    push ax
    push bx

    mov si, DAPS
    mov ah, 0x42
    int 0x13
    jc short disk_err

    pop ax
    pop bx
    ret

disk_err:
    mov bx, DISK_ERR
    call print
    jmp end

sectors_err:
    mov bx, SECTORS_ERR
    call print
    jmp end

end: 
    hlt
    jmp end

DISK_ERR:
    db "Disk read error.", 0xA, 0xD, 0

SECTORS_ERR:
    db "Number of sectors read is incorrect.", 0xA, 0xD, 0