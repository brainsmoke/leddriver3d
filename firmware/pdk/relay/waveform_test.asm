; waveform test
;

.module ledrelay

.include "pdk.asm"

.area DATA (ABS)
.org 0x00

.area CODE (ABS)
.org 0x00


set_fuse (FUSE_SET_PA5_NORMAL&FUSE_SET_LVR_3V&FUSE_SET_BOOTUP_SLOW)
;set_fuse (FUSE_SET_PA5_NORMAL&FUSE_SET_LVR_3V)

.rept (1*32)
nop
.endm

disgint
enable_ihrc
clock_1mhz
disable_ilrc
easypdk_calibrate 1000000, 5000

mov a, #0xff
mov.io pac, a
mov.io pa, a
loop:
xor.io pa, a
goto loop

