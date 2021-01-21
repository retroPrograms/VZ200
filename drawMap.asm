
drawMap:
	ld iy,screenMap
	ld b,16
	ld c,128    ;128
	ld d,070h
	ld ix,tileMap
drawMapLoop:
	ld e,(ix)
	ld a,(iy)
	call tileSelect
	push bc
	push de
	push ix
	call drawForest
	pop ix
	pop de
	pop bc
	inc ix
	inc iy
	dec b
	jp z,nextLineD
draw_ret:
	dec c
	jp nz, drawMapLoop
	ret
	
tileSelect:
	cp 1
	jp nz, ts_next1
	ld hl, mountain
	ret
ts_next1:
	cp 2
	jp nz, ts_next2
	ld hl, forest1
	ret
ts_next2:
	cp 3
	jp nz, ts_next3
	ld hl, forest2
	ret
ts_next3:
	cp 4
	jp nz, ts_next4
	ld hl, house
	ret
ts_next4:
	cp 5
	jp nz, ts_next5
	ld hl,mainMountain
	ret
ts_next5:
	cp 6
	jp nz, ts_next6
	ld hl,river
	ret
ts_next6:
	cp 7
	jp nz, ts_next7
	ld hl,gate
	ret
ts_next7:
	cp 8
	jp nz, ts_next8
	ld hl,wall
	ret
ts_next8:
	ld hl,green
	ret
	
	
nextLineD:
	ld b,16
	ld ix,tileMap
	inc d
	jp draw_ret
	
	

	
drawForest: ;07000h - 077ffh  ;temp for tile testing
	;ld hl,hero
	;ld de, 07000h
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
	
drawHero:
	ld hl, hero
	ld de, 07000h
	call drawForest
	ret
	
clearGraphs:	
	ld hl, 077ffh
cg_loop:
	ld (hl),0
	dec hl
	ld a,06fh ;06ffh 
	cp h
	jp nz, cg_loop
	ld a, 0ffh
	cp l
	jp nz, cg_loop
	ret