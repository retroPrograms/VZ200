;g2 start
.org 32256
	
start:
	;CALL 01C9h	;clear screen
	call hires
	ld hl,07000h
	;call drawTile
	ld hl,07004h
	;call drawTile
	ld hl,07008h
	call drawTile1
	;ld hl,07250h
	;call undrawTile
	ld hl,07000h
	call undrawTile
	call drawBottom
	call readkey
	CALL 01C9h	;clear screen
	ret
	
drawBottom:
	ld b,7
	
	ld hl, bottom
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
	
	
undrawTile:
	ld c,4
	ld b,12
	;ld de, tile1
	;ld hl, tileStart ;07000h
tileLoop_1:
	ld a,0
	ld (hl),a
	inc hl
	;inc de
	dec c
	jp nz, tileLoop_1
	;push de
	ld de, 28
	add hl, de
	;pop de
	ld c,4
	dec b
	jp nz, tileLoop_1
	ret


drawTile1:
	ld c,4
	ld b,16
	ld de, tile3
	;ld hl, tileStart ;07000h
tileLoop1:
	ld a,(de)
	ld (hl),a
	inc hl
	inc de
	dec c
	jp nz, tileLoop1
	push de
	ld de, 28
	add hl, de
	pop de
	ld c,4
	dec b
	jp nz, tileLoop1
	ret	
	
drawTile:
	ld c,4
	ld b,12
	ld de, tile1
	;ld hl, tileStart ;07000h
tileLoop:
	ld a,(de)
	ld (hl),a
	inc hl
	inc de
	dec c
	jp nz, tileLoop
	push de
	ld de, 28
	add hl, de
	pop de
	ld c,4
	dec b
	jp nz, tileLoop
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
	call undrawTile
	jp scan
	
tile1 	.byte 0,0,0,0
	    .byte 20,0,0,84
		.byte 1,64,20,0
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
	
tile2 	.byte 0,0,0,0
	    .byte 60,0,0,252
		.byte 3,192,60,0
		.byte 0,48,192,0
		.byte 0,15,0,0
		.byte 3,255,255,192
		.byte 15,240,192,240
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		
tile3 	.byte 0,0,0,0
	    .byte 0,15,192,0
		.byte 0,253,112,0
		.byte 3,171,92,0  
		.byte 14,170,255,0 
		.byte 14,170,214,192  
		.byte 50,170,190,192 
		.byte 50,0,40,192 
		.byte 50,3,204,192 
		.byte 14,3,204,192 
		.byte 14,0,0,192  
		.byte 14,15,243,192 
		.byte 3,0,12,0
		.byte 0,255,240,0
		.byte 0,0,0,0
		.byte 0,0,0,0
		
		
bottom	.byte 255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255
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
