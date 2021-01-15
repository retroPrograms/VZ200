;g4 start
.org 32256
	
start:
	;CALL 01C9h	;clear screen
	call hires
	
	call drawScreen
	
	call readkey
	CALL 01C9h	;clear screen
	ret
	
drawScreen: ;07000h - 077ffh
	ld hl, pic1
	ld de, 07000h
ds_loop:
	ld a,(hl)
	ld (de),a
	inc hl
	inc de
	ld a, 078h
	cp d
	jp nz, ds_loop
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
	

		
		
		
pic .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,5,80,85,85,4,21,85
	 .byte 80,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,1,84,84,0
	 .byte 0,0,0,0,0,5,21,64,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 1,85,0,0,0,0,0,0,0
	 .byte 0,0,0,21,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,69,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 5,64,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,20,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,80,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,1,64,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 1,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,16,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,16,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,4,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 5,64,0,0,0,0,0,0,0
	 .byte 0,0,0,0,21,85,80,0,1
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,20,0,0,17
	 .byte 85,85,84,0,0,0,0,0,85
	 .byte 64,0,21,64,0,16,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,80,0,5,80,0,0,1,0
	 .byte 0,0,0,84,64,0,0,0,20
	 .byte 0,4,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,1,0,0,84
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,5,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,4,0,1,64,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,80,0,84,0,0,0,0,0
	 .byte 0,0,0,0,0,0,16,0,5
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,84,0,0,20,0,5
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,16,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,21,1
	 .byte 84,0,0,0,5,64,0,0,0
	 .byte 0,0,0,0,0,0,0,80,0
	 .byte 0,0,21,85,64,0,0,0,4
	 .byte 0,0,0,16,0,5,0,0,0
	 .byte 0,16,1,84,0,0,0,0,0
	 .byte 0,0,0,64,0,0,0,16,0
	 .byte 64,0,0,0,4,0,0,0,16
	 .byte 0,1,0,0,0,0,20,20,5
	 .byte 64,0,0,0,0,0,85,84,64
	 .byte 0,0,0,80,0,64,0,0,0
	 .byte 4,0,0,0,16,0,0,64,0
	 .byte 0,0,5,64,0,64,0,0,0
	 .byte 0,1,64,5,64,0,0,0,64
	 .byte 1,64,0,0,0,4,0,0,0
	 .byte 20,0,85,64,0,0,0,1,0
	 .byte 0,80,0,0,0,0,5,0,1
	 .byte 64,0,0,0,80,21,0,0,0
	 .byte 0,16,0,0,0,5,85,4,0
	 .byte 0,0,0,1,0,0,16,0,0
	 .byte 0,0,20,0,0,64,0,0,0
	 .byte 5,80,0,0,0,0,80,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 64,0,16,0,0,0,0,16,0
	 .byte 0,64,0,0,0,0,0,0,0
	 .byte 0,0,64,0,0,0,0,0,0
	 .byte 0,0,0,0,0,64,0,4,0
	 .byte 0,0,0,16,0,0,64,0,0
	 .byte 0,0,0,0,0,0,1,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,64,0,4,0,0,0,0,16
	 .byte 0,0,64,0,0,0,0,0,0
	 .byte 0,0,4,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,16,0,4
	 .byte 0,0,0,0,16,0,0,64,0
	 .byte 0,0,0,0,0,0,0,20,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,16,0,4,0,0,0,0
	 .byte 16,0,0,64,0,0,0,0,0
	 .byte 0,0,0,64,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,16,0
	 .byte 4,0,0,0,0,16,0,0,64
	 .byte 0,0,0,0,0,0,0,1,64
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,4,0,0,0
	 .byte 0,16,0,0,64,0,0,0,0
	 .byte 0,0,0,20,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,4
	 .byte 0,4,0,0,0,0,16,0,0
	 .byte 64,0,0,0,0,0,0,0,80
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,4,0,20,0,0
	 .byte 0,0,20,0,0,0,0,0,0
	 .byte 0,0,0,1,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 5,0,80,0,0,0,0,4,0
	 .byte 0,4,0,0,0,0,0,0,5
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,5,65,64,0
	 .byte 0,0,0,1,0,0,4,0,0
	 .byte 0,0,0,0,4,0,0,0,0
	 .byte 0,0,0,0,0,0,64,0,0
	 .byte 0,4,85,0,0,0,0,0,0
	 .byte 80,0,85,0,0,0,0,0,0
	 .byte 4,0,0,0,5,0,0,0,0
	 .byte 0,1,64,0,0,0,4,0,0
	 .byte 0,0,0,0,0,21,65,65,64
	 .byte 0,0,0,0,0,5,0,0,1
	 .byte 84,0,0,0,0,0,20,64,0
	 .byte 0,0,4,0,0,0,0,0,0
	 .byte 0,0,85,0,64,0,0,0,0
	 .byte 0,1,85,85,84,0,0,0,0
	 .byte 0,1,65,0,0,0,0,4,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 16,0,1,84,64,0,0,0,0
	 .byte 0,0,0,0,0,0,4,1,0
	 .byte 0,0,0,4,0,0,0,0,0
	 .byte 0,0,0,0,0,16,0,0,80
	 .byte 20,84,0,0,0,0,0,0,0
	 .byte 0,0,80,1,0,0,0,0,4
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,4,0,0,21,64,1,21,64
	 .byte 0,0,0,0,0,0,69,0,4
	 .byte 0,0,0,0,4,0,0,0,0
	 .byte 0,0,0,0,0,0,1,0,0
	 .byte 0,84,0,0,21,85,69,20,0
	 .byte 0,21,64,0,80,0,0,0,0
	 .byte 4,0,0,0,0,0,0,0,0
	 .byte 0,0,0,64,0,0,5,64,0
	 .byte 0,0,0,5,84,84,64,0,5
	 .byte 0,0,0,0,0,16,0,0,0
	 .byte 0,0,0,0,0,0,0,0,80
	 .byte 0,0,0,21,0,0,0,0,0
	 .byte 0,0,0,1,80,0,0,0,0
	 .byte 0,16,0,0,0,0,0,0,0
	 .byte 0,0,0,0,4,0,0,0,1
	 .byte 84,0,0,0,0,0,0,0,85
	 .byte 0,0,0,0,0,0,64,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 4,0,0,0,0,5,80,0,0
	 .byte 0,0,0,21,0,0,0,0,0
	 .byte 0,0,64,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,16,0,0
	 .byte 0,0,21,80,0,0,0,85,64
	 .byte 0,0,0,0,0,0,4,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,1,64,0,0,0,0,5
	 .byte 85,81,84,0,0,0,0,0,0
	 .byte 0,0,16,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,21
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,1,64,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,20,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,4,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,1,16,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,64,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,1,64
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,21,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,20,80,0,0,0
	 .byte 0,0,0,0,0,0,5,64,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,4,64,0,0,0,0,0,0
	 .byte 0,1,80,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,64,64
	 .byte 0,0,0,0,0,0,21,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,1,84,81,4,81
	 .byte 84,80,64,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,
	 
pic1 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 21,85,85,80,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,21,85,69,85,5
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,1
	 .byte 84,0,0,0,85,84,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,84,0,0,0,0
	 .byte 0,85,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,21
	 .byte 64,0,0,0,0,0,0,64,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,1,80,0,0,0,0
	 .byte 0,0,0,85,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,21
	 .byte 0,0,0,0,0,0,0,0,5
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,5,64,0,0,0,0
	 .byte 0,0,0,0,5,80,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,21
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,80,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,80,0,0,0,0
	 .byte 0,0,0,0,0,0,68,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,85
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,5,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,84,0,0,0,0
	 .byte 0,0,0,0,0,0,0,1,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 80,3,255,192,0,0,0,0,0
	 .byte 15,192,0,1,64,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,16,15,0,240
	 .byte 0,0,0,0,0,252,255,0,0
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,64,12,0,60,0,0,0,0
	 .byte 0,192,3,0,0,80,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,64,48,0
	 .byte 3,0,0,0,0,0,192,0,192
	 .byte 0,80,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,64,240,0,3,0,0,0
	 .byte 0,3,0,0,192,0,16,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,1,64,192
	 .byte 0,3,0,0,0,0,3,0,0
	 .byte 240,0,16,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,1,0,48,0,12,0,0
	 .byte 0,0,3,0,0,12,0,16,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,5,0
	 .byte 60,0,240,0,0,0,0,3,192
	 .byte 0,252,0,20,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,4,0,15,255,192,0
	 .byte 0,0,0,0,60,0,192,0,4
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,4
	 .byte 0,0,12,0,0,0,0,0,0
	 .byte 15,255,192,0,4,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,4,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 4,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 4,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,4,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,4,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,4,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,4,0,0,0,0,0,160,0
	 .byte 8,0,0,0,0,0,4,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,4,0,0
	 .byte 0,0,10,42,0,42,160,0,0
	 .byte 0,0,4,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,4,0,0,0,0,8,2
	 .byte 0,32,32,0,0,42,0,4,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,4,0
	 .byte 0,0,0,10,168,0,40,160,0
	 .byte 2,162,128,4,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,4,0,2,168,0,0
	 .byte 0,0,10,128,0,10,0,128,4
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,4
	 .byte 0,10,2,128,0,0,0,0,0
	 .byte 0,40,0,128,4,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,5,0,10,0,160
	 .byte 0,0,0,0,0,0,160,2,128
	 .byte 4,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 1,0,2,0,42,0,0,0,0
	 .byte 0,2,128,2,128,4,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,1,0,2,128
	 .byte 2,160,0,0,0,0,40,0,2
	 .byte 0,4,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,1,64,0,128,0,40,0,0
	 .byte 0,0,160,0,10,0,20,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,64,0
	 .byte 160,0,10,128,0,0,10,128,0
	 .byte 40,0,16,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,64,0,40,0,0,170
	 .byte 170,170,168,0,0,160,0,20,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,80
	 .byte 0,10,0,0,0,0,0,0,0
	 .byte 0,128,0,80,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,16,0,2,128,0
	 .byte 0,0,0,0,0,10,0,0,80
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 4,0,0,168,0,0,0,0,0
	 .byte 0,40,0,0,80,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,1,0,0,10
	 .byte 0,0,0,0,0,0,160,0,1
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,80,0,0,168,0,0,0
	 .byte 0,10,0,0,5,64,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,20,0
	 .byte 0,2,170,128,0,0,168,0,0
	 .byte 20,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,1,64,0,0,2,42
	 .byte 170,170,128,0,0,80,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 85,0,0,0,0,0,0,0,0
	 .byte 1,64,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,5,84,0,0
	 .byte 0,0,0,0,0,84,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,21,81,64,0,0,0,0
	 .byte 85,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,1,84
	 .byte 5,68,65,4,85,64,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,1,85,69,85,85
	 .byte 64,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,0,0,0,0
	 .byte 0,0,0,0,0,

tileStart:
		.byte 2
		
;number .byte 1
;singlenum	.byte 1
;hexnum .byte 1

;keyboard .byte 1

	.end
