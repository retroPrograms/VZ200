;g2 start  http://www.cpcalive.com/docs/TASMMAN.HTM assembler help
.org 32256

;#include "drawMap.asm"	
start:
	
	call hires
	
	
	call drawMap
	call drawHero
	
	call readkey
	CALL 01C9h	;clear screen
	ret

#include "drawMap.asm"	
#include "tiles.asm"	

moveCave:
	;ld hl, wall  ;test
	;ld de, 07000h
	call clearGraphs
	ld hl, cavern1 ;test
	ld de, 07000h
	call drawForest
	
	ret
	
moveHeroS:
	ld hl,green  ;test
	ld de, 07000h
	call drawForest 
	ret
	
moveHeroE:
	ld hl, wall  ;test
	ld de, 07000h
	call drawForest
	ret
	
moveHeroN:
	ld hl, gate  ;test
	ld de, 07000h
	call drawForest
	ret
	
moveHeroW:
	ld hl,mountain ;test
	ld de, 07000h
	call drawForest
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
	cp 65
	call z, moveHeroW  ;A key
	cp 87
	call z, moveHeroN  ;W key
	cp 90
	call z, moveHeroS  ;Z key
	cp 83
	call z, moveHeroE  ;S key
	cp 67
	call z, moveCave   ;C key
	cp 020h 
	jr nz,scan
	CALL 01C9h	;clear screen
	ret
erase:
	ld hl,07250h
	
	jp scan

	.end
