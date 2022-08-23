print_hex:
    push bx
    push cx
    push dx ; dx will store the value we want to print
    push si

    mov bx, dx               ; bx will be our working register
    shr bx, 12               ; shift right 12 to get the right digit
    mov bx, [bx + HEX_TABLE] ; move to bx the correspondent digit/character
    mov [HEX_OUTPUT + 2], bl ; moves whats in bl to the label to be printed

    ; index variables to be used when looping
    mov si, 3
    mov cx, 8

loop:
    cmp si, 5
    jg print_done

    mov bx, dx
    shr bx, cl
    and bx, 0x000F
    mov bx, [bx + HEX_TABLE]
    mov [HEX_OUTPUT + si], bl

    ; prepare the next loop
    add si, 1
    sub cx, 4

    jmp loop

print_done:
    mov bx, HEX_OUTPUT
    call print

    pop bx
    pop cx
    pop dx
    pop si
    ret

HEX_OUTPUT:
    db "0x0000", 0

HEX_TABLE:
    db "0123456789ABCDEF"