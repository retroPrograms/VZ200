;z1

.org 32256

		call 01C9h	;clear screen
		
		LD A,00h ;set screen ouput
		LD (789Ch),A 
	
		LD HL,headingMesg 
		call 2B75h ;display mesg string
		
		
		
		ret
		
headingMesg:
		.byte "     VZ200 DIAL THE GATE"
		.byte 0dh
		.byte 0dh
		.byte 00h 	
		
		
.end