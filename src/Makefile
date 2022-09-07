C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

OBJ = ${C_SOURCES:.c=.o}

kernel.bin: bootl/kernel_entry.o ${OBJ}
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary 

%.o: %.c ${HEADERS}
	gcc -m32 -g -ffreestanding -fno-PIC -c $< -o $@ 

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

os-image.bin: bootl/boot_sect.bin kernel.bin
	cat $^ > $@

run: os-image.bin
	qemu-system-i386 os-image.bin

clean:
	rm *.bin *.o *.dis *.elf &
	rm kernel/*.o bootl/*.bin bootl/*.o drivers/*.o

#DEBUG SECTION 

#disassemble
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

kernel.elf: bootl/kernel_entry.o ${OBJ}
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^

debug: os-image.bin kernel.elf
	qemu-system-i386 -s os-image.bin &
	gdb -ex "target remote localhost:1234" -ex "symbol-file kernel.elf"