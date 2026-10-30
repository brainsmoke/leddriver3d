
TARGET13=leddriver16bit-pms150c.ihx
TARGET14=leddriver16bit-pfs154.ihx

TESTS=lowbits16_test-pdk14.ihx

TARGETS=$(TARGET13) $(TARGET14)

CLEAN=$(TARGETS)
DEPS=pdk.asm uart2.asm delay.asm softpwm16.asm settings.asm device/pms150c/part.asm device/pms150g/part.asm device/pfs154/part.asm

AS13=sdaspdk13
AS14=sdaspdk14

INC_PMS150C=-Idevice/pms150c
INC_PFS154=-Idevice/pfs154

ADDRESS=0

all: $(TARGETS)

clean:
	-rm $(CLEAN)
	-rm *.ihx *.cdb *.lst *.map *.rel *.rst *.sym

%-pms150c.rel: %.asm $(DEPS)
	$(AS13) $(INC_PMS150C) -s -o -l $@ $<

%-pfs154.rel: %.asm $(DEPS)
	$(AS14) $(INC_PFS154) -s -o -l $@ $<

%.ihx: %.rel
	sdldpdk -muwx -g INDEX=$$(($(ADDRESS)*3)) -i $@ -Y $< -e
	-rm $(@:.ihx=.cdb) $(@:.ihx=.lst) $(@:.ihx=.map) $(@:.ihx=.rel) $(@:.ihx=.rst) $(@:.ihx=.sym)

