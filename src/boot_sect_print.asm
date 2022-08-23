print:
    push ax
    push bx

start:
    mov al, [bx]    ; move whats in bx to al
    cmp al, 0       ; compare the content to 0 to see if the string has ended (null terminated string)
    je stop         ; if string is fully printed then return

    mov ah, 0x0E ; tty mode

    int 0x10    ; actually print
    add bx, 1   ; increment the pointer

    jmp start   ; loop again 

stop:
    pop ax
    pop bx
    ret

new_line:
    push ax
    mov ah, 0x0E ; tty mode

    mov al, 0x0A ; new line 
    int 0x10
    mov al, 0X0D ; carriage return
    int 0x10

    pop ax
    ret