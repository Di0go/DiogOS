disk_load:
    push ax
    push bx
    push cx
    push dx

    mov ah, 0x02    ; 0x02 is read in int 0x13 function
    mov al, dh      ; number of sectors to read (0x01 - 0x80)
    mov cl, 0x02    ; sector to read (sectors start from 0x01)
    mov ch, 0x00    ; cylinder
    mov dh, 0x00    ; head number

    ; dl stores the drive number, handled by BIOS
    ; [es:bx] is the default location for int 0x13
    int 0x13
    jc disk_err     ; controlled by carry bit

    pop dx          ; get the number of the sectors passed as input back
    cmp al, dh      ; after 0x13 al stores the number of sectors read
    jne sectors_err ; if wanted sectors and read sectors are different = error

    pop ax
    pop bx
    pop cx
    ret

disk_err:
    mov bx, DISK_ERR
    call print
    mov dh, ah      ; ah contains the error code
    call print_hex
    jmp $

sectors_err:
    mov bx, SECTORS_ERR
    call print
    jmp $

DISK_ERR:
    db "Disk read error.", 0xA, 0xD, 0

SECTORS_ERR:
    db "Number of sectors read is incorrect.", 0xA, 0xD, 0