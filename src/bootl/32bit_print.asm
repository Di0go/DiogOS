[bits 32]

; consts
VIDEO_MEMORY equ 0xb8000
BLACK_BG_WHITE_FG equ 0x0f

; edx serves as a pointer to the string to be printed
print_string_32b:
    push ax
    push ebx
    push edx

    mov edx, VIDEO_MEMORY

print_string_32b_loop:
    mov al, [ebx]
    mov ah, BLACK_BG_WHITE_FG

    cmp al, 0       ; checks if string is finished (null terminated string)
    je print_string32b_done

    mov [edx], ax   ; stores char and string components in video memory
    add ebx, 1      ; next char
    add edx, 2      ; next video memory position

print_string32b_done:
    pop ax
    pop ebx
    pop edx
    ret