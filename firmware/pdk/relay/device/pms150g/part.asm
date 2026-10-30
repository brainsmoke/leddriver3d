
DEVICE = PMS150G

FUSE_ADDRESS = 0x3ff
FUSE_BITS = 0xffd

FUSE_SET_SECURITY_ON = (FUSE_BITS)
FUSE_SET_SECURITY    = (FUSE_BITS & ~1)
/*
FUSE_SET_LVR_4V      = (FUSE_BITS & ~(7 << 2))
FUSE_SET_LVR_3V5     = (FUSE_SET_LVR_4V | (1 << 2))
FUSE_SET_LVR_3V      = (FUSE_SET_LVR_4V | (2 << 2))
FUSE_SET_LVR_2V75    = (FUSE_SET_LVR_4V | (3 << 2))
FUSE_SET_LVR_2V5     = (FUSE_SET_LVR_4V | (4 << 2))
FUSE_SET_LVR_2V2     = (FUSE_SET_LVR_4V | (5 << 2))
FUSE_SET_LVR_2V      = (FUSE_SET_LVR_4V | (6 << 2))
FUSE_SET_LVR_1V8     = (FUSE_SET_LVR_4V | (7 << 2))

...
*/

FUSE_SET_PA5_OPEN_DRAIN = (FUSE_BITS)
FUSE_SET_PA5_NORMAL  = (FUSE_BITS & ~(1<<9))

papl  = 0x13
misc  = 0x1b

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

