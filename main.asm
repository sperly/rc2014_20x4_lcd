            org                 8000h ; 8000h can be also used here if Rom size is 16kB or less

            call start

#INCLUDE    pio.asm
#INCLUDE    delay.asm
#INCLUDE    lcd_driver.asm

start:
            call init_pio
            call init_lcd
            

