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
	
	
	.end