
all:
	@arm-none-eabi-as main.s -o main.o
	@arm-none-eabi-ld --print-memory-usage --script stm32f030.ld main.o -o main.elf
	@arm-none-eabi-objcopy --output-target ihex main.elf main.hex
	@arm-none-eabi-objcopy --output-target binary main.elf main.bin
	@arm-none-eabi-objdump -d main.o > disasm.s

	
clean:
	rm *.o
