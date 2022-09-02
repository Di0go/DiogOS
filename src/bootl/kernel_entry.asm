[bits 16]
[EXTERN main]

[GLOBAL _start]
_start:
    call main     

jhalt:
    hlt
    jmp jhalt