;g4 start
.org 32256
	
start:
	;CALL 01C9h	;clear screen
	call hires
	
	call drawScreen
	
	call readkey
	CALL 01C9h	;clear screen
	ret
	
drawScreen:
	ld b,7
	
	ld hl, screen
	ld de, 077ffh
db_loop1:
	ld c,32
db_loop:
	ld a,(hl)
	ld (de), a
	dec de
	inc hl
	dec c
	jp nz, db_loop
	dec b
	jp nz, db_loop1
	ret
	

	
hires:
		ld hl, 06800h
		ld a,8
		ld (hl), a
		ld hl,077FFh
		ld a,06fh
clearLoop:
			ld (hl), 0
			dec l
			jp nz, clearLoop
			dec h
			cp h
			jp nz, clearLoop
			ret

		
readkey:
scan:  ;registers af, bc, de and hl 
	call 2ef4h
	cp 84
	jp z, erase
	cp 020h 
	jr nz,scan
	CALL 01C9h	;clear screen
	ret
erase:
	ld hl,07250h
	
	jp scan
	

		
		
		
screen	.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
		

tileStart:
		.byte 2
		
;number .byte 1
;singlenum	.byte 1
;hexnum .byte 1

;keyboard .byte 1

	.end
