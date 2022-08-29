[bits 16]
switch_to_pm:
    cli                     ;   disable interrupts
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 0x1             ;   set first bit of register to 1 in order to switch
    mov cr0, eax            ;   move the changed bit back to cr0
    jmp CODE_SEG:start_pm   ;   far jump

[bits 32]
start_pm:
    ;   update segmemt registers
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ;   update the stack
    mov ebp, 0x90000
    mov esp, ebp

    call welcome_to_pm