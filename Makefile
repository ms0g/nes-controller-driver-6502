CA65=ca65
SRC=nes-cnt-drv-6502.asm
OBJS=nes-cnt-drv-6502.o

$(OBJS) : $(SRC)
	$(CA65) $(SRC)

.PHONY: clean
clean:
	rm -f $(OBJS)