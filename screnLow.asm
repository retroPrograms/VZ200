;g3 start
.org 32256
	
start:
	CALL 01C9h	;clear screen
	call readkey
	CALL 01C9h	;clear screen
	ret











readkey:
scan:  ;registers af, bc, de and hl 
	call 2ef4h
	
	cp 020h 
	jr nz,scan
	CALL 01C9h	;clear screen
	ret

	jp scan
	
screenText .equ 07000h ;$71ff end
	
tile1 	.byte 255,255,255,255
	    .byte 245,95,255,255
		.byte 223,247,255,255
		.byte 119,221,255,255
		.byte 127,253,255,255
		.byte 221,119,255,255
		.byte 245,95,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		.byte 255,255,255,255
		
	
	
	.end