
TARGETS=relay_oldpcb-pms150c.ihx \
        relay_oldpcb-pfs154.ihx \
        relay_newpcb-pms150c.ihx \
        relay_newpcb-pfs154.ihx \
        relay5-pms150c.ihx \
        relay5-pfs154.ihx

CLEAN=$(TARGETS)
DEPS=pdk.asm device/pms150c/part.asm device/pfs154/part.asm

AS13=sdaspdk13
AS14=sdaspdk14

INC_PMS150C=-Idevice/pms150c
INC_PFS154=-Idevice/pfs154

all: $(TARGETS)

clean:
	-rm $(CLEAN)
	-rm *.ihx *.cdb *.lst *.map *.rel *.rst *.sym

%-pms150c.rel: %.asm $(DEPS)
	$(AS13) $(INC_PMS150C) -s -o -l $@ $<

%-pfs154.rel: %.asm $(DEPS)
	$(AS14) $(INC_PFS154) -s -o -l $@ $<

%.ihx: %.rel
	sdldpdk -muwx -i $@ -Y $< -e
	-rm $(@:.ihx=.cdb) $(@:.ihx=.lst) $(@:.ihx=.map) $(@:.ihx=.rel) $(@:.ihx=.rst) $(@:.ihx=.sym)
