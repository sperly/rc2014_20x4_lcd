;X ms wait; B is number of ms
milli_delay:
    PUSH AF	
	PUSH BC
	CALL m_delay
	POP BC
	POP AF
    DJNZ long_wait
	RET

;Delay routine
m_delay:	
    LD BC, 27               ;10
outer:	
    LD DE, 27               ;10
inner:	
    DEC DE                  ;6
	LD A,D                  ;4/9
	OR E                    ;4/7
	JP NZ, inner            ;10
	DEC BC                  ;6
	LD A,B                  ;4/9
	OR C                    ;4/7
	JP NZ, outer            ;10
	RET                     ;10

;X µs wait; B is number of µs
micro_delay:
	NOP
    NOP
    DJNZ micro_delay
	RET