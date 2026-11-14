DEVICE = PFC161

papl  = 0x13
misc  = 0x08

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

