;g2 start  http://www.cpcalive.com/docs/TASMMAN.HTM assembler help
.org 32256
	
start:
	;CALL 01C9h	;clear screen
	call hires
	
	;call drawMap
	call drawForest
	call drawForest2
	call readkey
	CALL 01C9h	;clear screen
	ret
	
drawMap:

	ld b, 8	; 8 lines
	ld d, 070h
mapLine:
	ld c, 16 ; 16 tiles
	ld ix, tileMap
mapLoop:
	ld e, (ix)
	;ld d, 070h
	push bc
	push de
	call drawMount
	pop de
	pop bc
	inc ix
	dec c
	jp nz, mapLoop
	inc d
	dec b
	jp nz,mapLine
	ret
	
drawMount: ;07000h - 077ffh
	ld hl, forest2
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
	
drawForest: ;07000h - 077ffh  ;temp for tile testing
	ld hl, forest1
	ld de, 07000h
	ld c,8
mount_loop1:
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
	jp nz, mount_loop1
	ret
	
drawForest2: ;07000h - 077ffh ;temp for tile testing
	ld hl, forest2
	ld de, 07002h
	ld c,8
mount_loop2:
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
	jp nz, mount_loop2
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
		
forest1:
		.byte 85,21,85,4
	    .byte 20,21,0,85
		.byte 21,84,85,69
		.byte 21,64,65,81
		
forest2:
		.byte 5,5,20,21
	    .byte 21,84,1,85
		.byte 16,84,84,80
		.byte 81,21,20,84
		
tileMap:
		.byte 000h, 002h, 004h, 006h, 008h, 00ah, 00ch, 00eh, 010h
		.byte 012h, 014h, 016h, 018h, 01ah, 01ch, 01eh
		
tileNums:
		.FILL 128 ,0
		
screenMap:
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		
		.byte 0,0,0,0 ,0,1,2,3, 0,0,0,0, 0,0,0,0
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		.byte 0,0,0,0 ,0,0,0,0, 0,0,0,0, 0,0,0,0
		
		

	.end
