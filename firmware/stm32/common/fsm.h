#ifndef FSM_H
#define FSM_H

#define GOOD          (0*8)
#define GOOD_00       (1*8)
#define GOOD_01_FE    (2*8)
#define GOOD_FF       (3*8)
#define GOOD_FFFF     (4*8)
#define GOOD_FFFFFF   (5*8)
#define BAD           (6*8)
#define BAD_FF        (7*8)
#define BAD_FFFF      (8*8)
#define BAD_FFFFFF    (9*8)

#define STATE_COUNT   (10*8)

#define FSM_END(s) (s>=STATE_COUNT)

#define GOOD_RETURN  0xf0
#define RESERVED     0xf1
#define TIMING       0xf2
#define ROUTE        0xf3

#define BAD_RETURN   0xff

#define IN_00     0
#define IN_01_EF  1
#define IN_F0     2
#define IN_F1     3
#define IN_F2     4
#define IN_F3     5
#define IN_F4_FE  6
#define IN_FF     7

#ifndef __ASSEMBLER__

#include <stdint.h>

extern const uint8_t fsm[STATE_COUNT];
extern const uint8_t fsm_map[256];

#endif

#endif //FSM_H
