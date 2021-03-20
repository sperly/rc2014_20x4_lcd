
init_lcd:
    LD   B, 030h                 ;write command 030h
    CALL write_command
    LD B, 4                      ;wait 4.1 ms
    CALL milli_delay
    
    LD   B, 030h                 ;write command 030h
    call write_command
    LD B, 100                    ;wait 100µs
    CALL micro_delay
    
    LD   B, 030h                 ;write command 030h
    call write_command
    LD B, 100                    ;wait 100µs
    CALL micro_delay

    LD   B, 038h                 ;write command 038h
    call write_command
    LD B, 39                     ;wait 39 µs
    CALL micro_delay

    call clear_display           ;Display Clear
    
    LD   B, 004h                 ;write command 004h ;Entry mode set
    call write_command


read_busy:
    ;set R/W high
    ;set E high
    ;get PIO_A_D in to A
    ;set E low
    ;set R/W low
    ;and A with 080h
    ;if A > 0 -> busy is high
    ret

;write command from B register
write_command:
    LD   A, 04h                 ;set E high
    OUT  (PIO_B_D), A
    LD   A, B                   ;set command
    OUT  (PIO_A_D), A
    LD   A, 00h                 ;set E low
    OUT  (PIO_B_D), A
    RET

write_data:
    LD   A, 01h                 ;set RS high
    OUT  (PIO_B_D), A
    LD   A, 05h                 ;set E high
    OUT  (PIO_B_D), A
    LD   A, B                   ;set data
    OUT  (PIO_A_D), A
    LD   A, 01h                 ;set E low
    OUT  (PIO_B_D), A
    LD   A, 01h                 ;set RS low
    OUT  (PIO_B_D), A
    RET

clear_display:
    LD   B, 01h                 ;write command 01h ;Display Clear
    CALL write_command
    LD B, 2                      ;wait 2 ms
    CALL milli_delay
    RET

display_off:
    LD   B, 08h                 ;write command 0Fh ;Display Off
    CALL write_command
    LD B, 39                     ;wait 39 µs
    CALL micro_delay
    RET

display_on:
    LD   B, 0Ch                 ;write command 0Fh ;Display On
    CALL write_command
    LD B, 39                     ;wait 39 µs
    CALL micro_delay
    RET

goto_home:
    LD   B, 02h                 ;write command 02h ;Return Home
    CALL write_command
    LD B, 2                      ;wait 2 ms
    CALL milli_delay
    RET

;set position on display, A is lines and B is column
goto_pos:
    RET
