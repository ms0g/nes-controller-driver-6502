CA65=ca65
OBJS=nes-cnt-drv.o

nes-cnt-drv.o : nes-cnt-drv.S
	$(CA65) nes-cnt-drv.S

.PHONY: clean
clean:
	rm -f $(OBJS)