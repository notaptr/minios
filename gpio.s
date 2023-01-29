                .section    .text
                .balign 4


/*
 * Работаем с каналом PA4, 10 ножка, 5-й бит порта А
 * 00 - input; 01 - output; 10 - alterate; 11 - analog
 *
 */

GPIO_init:
                push {r0,r1,r2}

                //Программируем режим работы порта на вывод

                ldr r0, GPIOA_MODER             //Адрес регистра режима
                ldr r2, [r0]                    //Текущее состояние

                movs r1, MODE_OUT               //режим "вывод"
                lsls r1, 8                      //это 5-й бит
                orrs r2, r1                     //Модифицируем
                str r2, [r0]                    //Сохраняем

                //Программируем режим вывода - OD/PP

                pop {r0,r1,r2}
                bx  LR

GPIO_set:
                push {r0,r1,r2}

                ldr r0, GPIOA_ODR
                ldr r1, [r0]

                //Устанавливаем 5-й бит
                movs r2, 16
                orrs r1, r2
                str r1,[r0]

                pop {r0,r1,r2}
                bx  LR

GPIO_reset:
                push {r0,r1,r2}

                ldr r0, GPIOA_ODR
                ldr r1, [r0]

                //Сбрасываем 5-й бит
                movs r2, 16
                bics r1, r2
                str r1,[r0]

                pop {r0,r1,r2}
                bx  LR

                .balign 4

                .equ    GPIOA_BASE,  0x48000000
                .equ    MODE_IN,     0x0
                .equ    MODE_OUT,    0x1
                .equ    MODE_ALT,    0x2
                .equ    MODE_ANALOG, 0x3

GPIOA_MODER:    .long   GPIOA_BASE
GPIOA_ODR:      .long   GPIOA_BASE+0x14
