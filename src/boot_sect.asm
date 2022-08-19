[org 0x7c00]

; tty mode
mov ah, 0x0E

mov al, "1"
int 0x10
mov al, the_secret
int 0x10

mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7C00
mov al, [bx]
int 0x10

mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

; jmp to current address (hang in infinite loop)
jmp $

; label
the_secret:
    db "X"

; fill all unused bytes with 0
times 510-($-$$) db 0

dw 0xAA55