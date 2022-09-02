kernel.bin: kernel_entry.o kernel.o
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary 

kernel_entry.o: bootl/kernel_entry.asm
	nasm -f elf $< -o $@ 

kernel.o: kernel/kernel.c
	gcc -m32 -ffreestanding -fno-PIC -c $< -o $@ 

boot_sect.bin: bootl/boot_sect.asm
	nasm $< -f bin -o $@

os-image.bin: boot_sect.bin kernel.bin
	cat $^ > $@

run: os-image.bin
	qemu-system-i386 os-image.bin

clean:
	rm *.bin *.o