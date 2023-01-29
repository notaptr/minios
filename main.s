                .thumb
                .syntax unified
                .cpu cortex-m0
                .arch armv6-m

                .equ    ram,    0x20000000

                .global start

                .include "isr.s"
                .include "systick.s"
                .include "gpio.s"
                .include "clock.s"
                .include "ram.s"

                .section .text

                .balign 4
start:
                //Инициализируем системный таймер

                cpsid i
                bl      RCC_gpioa               //Тактирование AHB
                bl      GPIO_init               //Пин 5 на вывод
                bl      SysTick_init            //Таймер 1 мс
                cpsie i

                //Ожидаем секунду в цикле

0:
                bl      GPIO_set

                ldr r0, wait_ms
                bl      SysTick_wait

                bl      GPIO_reset

                ldr r0, wait_ms
                bl      SysTick_wait

                b 0b

                .balign 4

wait_ms:        .long   1000     //В миллисекундах

                .end
