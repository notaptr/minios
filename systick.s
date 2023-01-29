                .section    .text
                .balign 4

/*
 * Процедура обработки прерывания таймера
 * Читаем переменную STK_COUTNER
 * Если ноль, ничего не делаем
 * Если не ноль, уменьшаем на единицу
 * Сохранены r0,r1,r2,r3,r12,lr,pc,xPCR
 */

ISR_SysTick:
                ldr r1, STK_COUTNER
                ldr r0, [r1]
                orrs r0, r0
                beq 0f
                subs r0, 1
                str r0, [r1]
0:
                bx  LR


/*
 * Процедура ожидания данного количества миллисекунд
 * r0 - время ожидания
 *
 */

SysTick_wait:
                push {r1}
                ldr r1, STK_COUTNER
                str r0, [r1]
0:
                ldr r0, [r1]
                orrs r0, r0
                bne 0b
                pop {r1}
                bx LR

//                .balign 4

/*
 * Процедура инициализации системного таймера.
 * База таймера - 1 мс
 * Частота HSI  - 8 МГц, Частота таймера 1/8
 * База счётчика - 1 мкс, 24 бита
 * Значение счётчика - 1000
 */

SysTick_init:
                push {r0,r1,r2}

                ldr r0, STK_RVR

                //Новое значение перезагрузки
                ldr r1, STK_TIME
                str r1, [r0]

                //Новый текущий счётчик
                ldr r0, STK_CVR
                str r1, [r0]

                ldr r0, STK_CSR
                ldr r1, [r0]
                movs r2, CSR_EN | CSR_INT
                orrs r1, r2
                str r1, [r0]

                pop {r0,r1,r2}
                bx  LR

                .balign 4

                .equ    CSR_EN,    1
                .equ    CSR_INT,   2
                .equ    STK_BASE,  0xE000E010
/*
                .equ    STK_CSR,   0
                .equ    STK_RVR,   4
                .equ    STK_CVR,   8
                .equ    STK_CALIB, 12
*/

STK_CSR:        .long   STK_BASE                //0-EN, 1-INT
STK_RVR:        .long   STK_BASE+4              //0-23
STK_CVR:        .long   STK_BASE+8
STK_CALIB:      .long   STK_BASE+12             //10 мс
STK_TIME:       .long   1000                    //1 мс при 8МГц
STK_24bit:      .long   0x00FFFFFF
STK_COUTNER:    .long   syscounter
