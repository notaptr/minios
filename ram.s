                .section .ramd
                .balign 4

                .org 0x800

                //Переменные ядра

syscounter:     .long 0                     //Текущее значение счётчика

                //Переменные процессов
