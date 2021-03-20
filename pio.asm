PIO_BASE  equ	068h
PIO_A_C   equ	PIO_BASE+2
PIO_A_D   equ	PIO_BASE
PIO_B_C   equ	PIO_BASE+3
PIO_B_D   equ	PIO_BASE+1

init_pio:
	LD   A, 0Fh
	OUT  (PIO_A_C), A
	LD   A, 03h
	OUT  (PIO_A_C), A
	LD   A, 00h
	OUT  (PIO_A_D), A 

    LD   A, 0Fh
	OUT  (PIO_Bb_C), A
	LD   A, 03h
	OUT  (PIO_B_C), A
	LD   A, 00h
	OUT  (PIO_B_D), A 

    RET