                .section .text
                .org 0

_stack:         .long   ram + 0x1000
_reset:         .long   start+1
_NMI:           .long   stub+1
_HardFault:     .long   stub+1
                .long   0,0,0,0,0,0,0           // Reserved 4-10
_SVCall:        .long   stub+1
                .long   0,0                     // Reserved 12-13
_PendSV:        .long   stub+1
_SysTick:       .long   ISR_SysTick+1
_WWDG:          .long   stub+1                  // IRQ0
                .long   stub+1
_RTC:           .long   stub+1                  // EXTI17,19,20
_FLASH:         .long   stub+1                  // IRQ3
_RCC:           .long   stub+1                  // IRQ4
_EXTI0_1:       .long   stub+1                  // IRQ5
_EXTI2_3:       .long   stub+1                  // IRQ6
_EXTI4_15:      .long   stub+1                  // IRQ7
                .long   stub+1                  // Reserved
_DMA_CH1:       .long   stub+1                  // IRQ9
_DMA_CH2_3:     .long   stub+1                  // IRQ10
_DMA_CH4_5:     .long   stub+1                  // IRQ11
_ADC:           .long   stub+1                  // IRQ12
_TIM1_BRK_UP:   .long   stub+1                  // TRG_COM
_TIM1_CC:       .long   stub+1                  // IRQ14
                .long   stub+1                  // Reserved
_TIM3:          .long   stub+1                  // IRQ16
_TIM6:          .long   stub+1                  // IRQ17
                .long   stub+1                  // Reserved
                .long   stub+1                  // Reserved
_TIM14:         .long   stub+1                  // IRQ19
_TIM15:         .long   stub+1                  // IRQ20
_TIM16:         .long   stub+1                  // IRQ21
_TIM17:         .long   stub+1                  // IRQ22
_I2C1:          .long   stub+1                  // IRQ23
_I2C2:          .long   stub+1                  // IRQ24
_SPI1:          .long   stub+1                  // IRQ25
_SPI2:          .long   stub+1                  // IRQ26
_USART1:        .long   stub+1                  // IRQ27
_USART2:        .long   stub+1                  // IRQ28
_USART3_4_5_6:  .long   stub+1                  // IRQ29
                .long   stub+1                  // Reserved
_USB:           .long   stub+1                  // IRQ31


                //Заглушка для всех неиспользуемых прерываний

                .balign 4
stub:
                bx      LR
