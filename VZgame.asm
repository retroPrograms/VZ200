;g2 start
.org 32256
	
start:
	;CALL 01C9h	;clear screen
	call hires
	ld de, 07008h
	call drawMount
	ld de, 07125h
	call drawMount
	ld de, 07260h
	call drawMount
	
	call readkey
	CALL 01C9h	;clear screen
	ret
	
drawMount: ;07000h - 077ffh
	ld hl, mountain
	;ld de, 07000h
	ld c,8
mount_loop:
	ld a, (hl)
	ld (de), a
	
	inc hl
	inc de
	ld a, (hl)
	ld (de), a
	inc hl
	inc de
	push hl
	ld hl,30
	add hl, de
	ex de, hl
	pop hl
	dec c
	jp nz, mount_loop
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
	
mountain:
		.byte 48,0,252,192
	    .byte 3,240,15,252
		.byte 51,255,252,0
		.byte 63,12,0,63

	.end
