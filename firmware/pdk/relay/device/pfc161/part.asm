DEVICE = PFC161

FUSE_ADDRESS=0x7ff

papl  = 0x13
misc  = 0x08
rop   = 0x3a
misclvr = 0x1b

MISCLVR_3V5 = 0xc0

.macro set_lvr val
	mov a, #val
	mov.io misclvr, a
.endm

.macro disable_touch_sense
	mov a, #3
	mov.io rop, a
.endm

; see PMS150 datasheet 5.10.3
.macro brownout_erratum_workaround_init
	nop
	nop
	nop
.endm

.macro brownout_erratum_workaround_2cycles
	nop
	nop
.endm

