MEMORY {
    RAM (RWX) : ORIGIN = 0x20000000, LENGTH = 4k
    FLASH (RX) : ORIGIN = 0x08000000, LENGTH = 16k
}

SECTIONS {
    ENTRY(start)
    .code : ALIGN(4) { * (.text) } >FLASH
    .data : ALIGN(4) { * (.data) } >FLASH
    .bss  : ALIGN(4) { * (.ramd) } >RAM
}
