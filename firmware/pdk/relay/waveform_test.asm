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

disgint
enable_ihrc
clock_2mhz
disable_ilrc
easypdk_calibrate 2000000, 5000

mov a, #0x78
mov.io pac, a
loop:
xor.io pa, a
goto loop

