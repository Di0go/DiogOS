; tty mode
mov ah, 0x0E

; print oops
mov al, "o"
int 0x10
int 0x10

mov al, "p"
int 0x10

mov al, "s"
int 0x10

; jmp to current address (hang in infinite loop)
jmp $

; fill all unused bytes with 0
times 510-($-$$) db 0

dw 0xAA55