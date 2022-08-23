# DiogOS

This is my first attempt at writting an OS

To compile the main .asm file use:

```
nasm -f bin asm_name.asm -o desired_name.bin  
```

To run the OS itself I would recommend QEMU, quickest and easiest way.

```
qemu-system-x86_64 desired_name.bin
```
