gdt_start:
    null_descriptor:
        ; 8 byte null descriptor for error storing
        dd 0
        dd 0

    code_descriptor:
        ;   base: 32 bits (0x0) > limit: 20 bits (0xfffff) >
        ;   1st flags: present(1) privilege(00) descriptor type(1) (1001) > 
        ;   type flags: code(1), conforming(0), readable(1), accessed(0) (1010) > 
        ;   2nd flags: granularity(1), 32-bit default(1), 64-bit segment(0), AVL(0) (1100)
        ;   the defined structure of the descriptors is super weird and painful to my brain but it is what it is... here we go

        ;   to start we define the first 16 bits of the limit
        dw 0xffff

        ;   then we define the first 24 bits of the base (total of 32)
        dw 0
        db 0

        ;   1st and type flags
        db 10011010

        ;   2nd flags + the last 4 bits of the limit
        db 11001111

        ;   last 4 bits of the base
        db 0

    data_descriptor:
        ;   same structure here but we will define it as a data segment (basicly we are only switching a 1 to a 0 in code flag)
        dw 0xffff

        dw 0
        dw 0

        db 10010010
        
        db 11001111

        db 0
    
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; size
    dd gdt_start                ; start

; consts
CODE_SEG equ code_descriptor - gdt_start
DATA_SEG equ data_descriptor - gdt_start