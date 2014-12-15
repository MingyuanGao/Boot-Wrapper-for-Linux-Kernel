# Build an ELF Linux Image
KERNEL      = zImage
OUT_IMAGE   = linux.elf

BOOTLOADER	= boot.S
LD_SCRIPT	= model.lds
AS		= $(CROSS_COMPILE)as -g
LD		= $(CROSS_COMPILE)ld -g

# ===================================================
default: $(OUT_IMAGE)
	echo "ELF Linux Created"

$(OUT_IMAGE): boot.o $(LD_SCRIPT) $(KERNEL)
	$(LD) -o $@ --script=$(LD_SCRIPT)

boot.o: $(BOOTLOADER)
	$(AS) -o $@ $<

clean:
	rm -f $(OUT_IMAGE) boot.o

