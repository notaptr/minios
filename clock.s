                .section    .text
                .balign 4

RCC_gpioa:
                push {r0,r1,r2}
                ldr r0, RCC_AHBENR
                ldr r1, [r0]
                movs r2, 1
                lsls r2, AHBEN_BIT
                orrs r1, r2
                str r1, [r0]
                pop {r0,r1,r2}
                bx      LR

                .balign 4

                .equ    RCC_BASE, 0x40021000
                .equ    AHBEN_BIT, 17

RCC_AHBENR:     .long   RCC_BASE+0x14
