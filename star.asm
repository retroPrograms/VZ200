;z1

.org 32256

		call 01C9h	;clear screen
		
		LD A,00h ;set screen ouput
		LD (789Ch),A 
	
		LD HL,headingMesg 
		call 2B75h ;display mesg string
		
		call keyScan
		
		
		
		ret
		
keyScan:
		LD HL,pressSpace
		call 2B75h ;display mesg string
scan:		
		call 02ef4h ;scan keyboard once
		or a		;any key pressed
		jr z,scan	;rescan if not
		cp ' '
		jr nz,scan
		ret
		
headingMesg:
		.byte "     VZ200 DIAL THE GATE"
		.byte 0dh
		.byte 0dh
		.byte 00h 	

pressSpace:
		.byte "PRESS SPACE KEY"	
		.byte 00h 	
.end