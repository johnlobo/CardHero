;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_cards
	.globl _update_selected_card
	.globl _draw_cards
	.globl _check_keyboard
	.globl _initCPC
	.globl _myInterruptHandler
	.globl _drawText
	.globl _drawTextM1
	.globl _sprintf
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_setCRTCReg
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMemoryPage
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard
	.globl _cpct_waitHalts
	.globl _cpct_setStackLocation
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _moved
	.globl _num_cards
	.globl _cards
	.globl _previous_card
	.globl _selected_card
	.globl _aux_txt
	.globl _pvmem
	.globl _i_time
	.globl _card_description
	.globl _card_sprite
	.globl _card_types
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i_time::
	.ds 4
_pvmem::
	.ds 2
_aux_txt::
	.ds 50
_selected_card::
	.ds 1
_previous_card::
	.ds 1
_cards::
	.ds 20
_num_cards::
	.ds 1
_moved::
	.ds 1
_myInterruptHandler_g_nInterrupt_1_125:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;src/main.c:61: static u8 g_nInterrupt = 0; // Manage Interrupt
	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
	ld	0 (iy), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:60: void myInterruptHandler(){
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:63: i_time++;
	ld	iy, #_i_time
	inc	0 (iy)
	jr	NZ,00130$
	inc	1 (iy)
	jr	NZ,00130$
	inc	2 (iy)
	jr	NZ,00130$
	inc	3 (iy)
00130$:
;src/main.c:64: g_nInterrupt++;
	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
	inc	0 (iy)
;src/main.c:65: switch (g_nInterrupt){
	ld	a, 0 (iy)
	dec	a
	jr	Z,00101$
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	Z,00102$
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	Z,00103$
	ld	a, 0 (iy)
	sub	a, #0x04
	jr	Z,00104$
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00105$
	jr	00106$
;src/main.c:66: case 1:
00101$:
;src/main.c:67: cpct_setBorder(HW_LIME);
	ld	hl, #0x1a10
	push	hl
	call	_cpct_setPALColour
;src/main.c:68: break;
	ret
;src/main.c:69: case 2:
00102$:
;src/main.c:74: cpct_setBorder(HW_CYAN);
	ld	hl, #0x0610
	push	hl
	call	_cpct_setPALColour
;src/main.c:75: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:76: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:77: break;
	ret
;src/main.c:78: case 3:
00103$:
;src/main.c:79: cpct_setBorder(HW_RED);
	ld	hl, #0x1c10
	push	hl
	call	_cpct_setPALColour
;src/main.c:80: break;
	ret
;src/main.c:81: case 4:
00104$:
;src/main.c:82: cpct_setBorder(HW_YELLOW);
	ld	hl, #0x1e10
	push	hl
	call	_cpct_setPALColour
;src/main.c:83: break;
	ret
;src/main.c:84: case 5:
00105$:
;src/main.c:85: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:91: cpct_setBorder(HW_MAGENTA);
	ld	hl, #0x1810
	push	hl
	call	_cpct_setPALColour
;src/main.c:92: break;
	ret
;src/main.c:93: default:
00106$:
;src/main.c:94: cpct_setBorder(HW_BRIGHT_BLUE);
	ld	hl, #0x1510
	push	hl
	call	_cpct_setPALColour
;src/main.c:95: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:96: cpct_setPalette(g_palette1, 4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_g_palette1
	push	hl
	call	_cpct_setPalette
;src/main.c:97: cpct_scanKeyboard();
	call	_cpct_scanKeyboard
;src/main.c:98: g_nInterrupt = 0;
	ld	hl,#_myInterruptHandler_g_nInterrupt_1_125 + 0
	ld	(hl), #0x00
;src/main.c:100: }
	ret
_card_types:
	.db #0x02	; 2
	.dw _s_cards_0
	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db #0x01	; 1
	.dw _s_cards_1
	.ascii "SHIELD:PROTECTS SOME DAMAGE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
_card_sprite:
	.dw _s_cards_0
	.dw _s_cards_1
_card_description:
	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "SHIELD:PROTECTS SOME DAMAGE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
;src/main.c:103: void initCPC() {
;	---------------------------------
; Function initCPC
; ---------------------------------
_initCPC::
;src/main.c:108: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:109: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:110: cpct_memset((u8*)0x8000,0,0x8000);
	ld	hl, #0x8000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	call	_cpct_memset
;src/main.c:113: cpct_setCRTCReg(6, 34);
	ld	hl, #0x2206
	push	hl
	call	_cpct_setCRTCReg
;src/main.c:114: cpct_setCRTCReg(7, 35);
	ld	hl, #0x2307
	push	hl
	call	_cpct_setCRTCReg
;src/main.c:115: cpct_setVideoMemoryPage(cpct_page80);
	ld	l, #0x20
	call	_cpct_setVideoMemoryPage
;src/main.c:118: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:119: cpct_waitHalts(2);
	ld	l, #0x02
	call	_cpct_waitHalts
;src/main.c:120: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:121: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
	ret
;src/main.c:124: void check_keyboard(){
;	---------------------------------
; Function check_keyboard
; ---------------------------------
_check_keyboard::
;src/main.c:125: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
	ld	iy, #_selected_card
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:126: previous_card = selected_card;
	ld	a, 0 (iy)
	ld	(#_previous_card + 0),a
;src/main.c:127: selected_card--;
	ld	hl, #_selected_card+0
	dec	(hl)
;src/main.c:128: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
00105$:
;src/main.c:129: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<num_cards-1)){
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
	ld	hl,#_num_cards + 0
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	a,(#_selected_card + 0)
	ld	d, #0x00
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	ret	P
;src/main.c:130: previous_card = selected_card;
	ld	a,(#_selected_card + 0)
	ld	(#_previous_card + 0),a
;src/main.c:131: selected_card++;
	ld	hl, #_selected_card+0
	inc	(hl)
;src/main.c:132: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
;src/main.c:136: void draw_cards(){
;	---------------------------------
; Function draw_cards
; ---------------------------------
_draw_cards::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/main.c:141: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:144: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W-3))-2, 160);
	ld	a,(#_previous_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	dec	b
	dec	b
	ld	a, #0xa0
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:145: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);  
	ld	hl, (_pvmem)
	ld	bc, #0x2d0c
	push	bc
	ld	bc, #0x0033
	push	bc
	push	hl
	call	_cpct_drawSolidBox
;src/main.c:148: for (i=0;i<selected_card;i++){
	ld	-3 (ix), #0x00
00104$:
	ld	hl, #_selected_card
	ld	a, -3 (ix)
	sub	a, (hl)
	jp	NC, 00101$
;src/main.c:149: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(i*(S_CARDS_0_W-3)), 164);
	ld	a, -3 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	-2 (ix), a
	ld	b, a
	inc	b
	inc	b
	ld	a, #0xa4
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:150: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	iy, (_pvmem)
	ld	l, -3 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	bc,#_cards
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_card_types
	add	hl, de
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x2908
	push	hl
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
;src/main.c:151: sprintf(aux_txt,"%1d", card_types[cards[i].type].cost);   
	ld	a, (bc)
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_card_types
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_2
	push	hl
	ld	hl, #_aux_txt
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:152: drawText(aux_txt, 3+(i*(S_CARDS_0_W-3)),165, COLORTXT_WHITE ,NORMALHEIGHT);
	ld	b, -2 (ix)
	inc	b
	inc	b
	inc	b
	ld	hl, #0x0100
	push	hl
	ld	a, #0xa5
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_aux_txt
	push	hl
	call	_drawText
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:148: for (i=0;i<selected_card;i++){
	inc	-3 (ix)
	jp	00104$
00101$:
;src/main.c:156: for (i=selected_card+1;i<num_cards;i++){
	ld	a,(#_selected_card + 0)
	inc	a
	ld	-2 (ix), a
00107$:
	ld	hl, #_num_cards
	ld	a, -2 (ix)
	sub	a, (hl)
	jp	NC, 00102$
;src/main.c:157: pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(i*(S_CARDS_0_W-3)), 164);
	ld	a, -2 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	-1 (ix), a
	ld	b, a
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a, #0xa4
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:158: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	iy, (_pvmem)
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	bc,#_cards
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_card_types
	add	hl, de
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x2908
	push	hl
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
;src/main.c:159: sprintf(aux_txt,"%1d", card_types[cards[i].type].cost);   
	ld	a, (bc)
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_card_types
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_2
	push	hl
	ld	hl, #_aux_txt
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:160: drawText(aux_txt, 5+(i*(S_CARDS_0_W-3)),165, COLORTXT_WHITE ,NORMALHEIGHT);
	ld	a, -1 (ix)
	add	a, #0x05
	ld	b, a
	ld	hl, #0x0100
	push	hl
	ld	a, #0xa5
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_aux_txt
	push	hl
	call	_drawText
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:156: for (i=selected_card+1;i<num_cards;i++){
	inc	-2 (ix)
	jp	00107$
00102$:
;src/main.c:164: pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(selected_card*(S_CARDS_0_W-3)), 160);
	ld	a,(#_selected_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	inc	b
	ld	a, #0xa0
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:165: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	bc, (_pvmem)
	ld	iy, #_selected_card
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_cards
	add	hl, de
	ld	e, (hl)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_card_types
	add	hl, de
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x2908
	push	hl
	push	bc
	push	de
	call	_cpct_drawSprite
;src/main.c:166: sprintf(aux_txt,"%1d", card_types[cards[selected_card].type].cost);   
	ld	iy, #_selected_card
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_cards
	add	hl, de
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_card_types
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_2
	push	hl
	ld	hl, #_aux_txt
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:167: drawText(aux_txt, 4+(selected_card*(S_CARDS_0_W-3)), 161, COLORTXT_WHITE ,NORMALHEIGHT);
	ld	a,(#_selected_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	inc	b
	inc	b
	ld	hl, #0x0100
	push	hl
	ld	a, #0xa1
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_aux_txt
	push	hl
	call	_drawText
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:171: pvmem = cpct_getScreenPtr((u8*) VM_START, 10, 234);
	ld	hl, #0xea0a
	push	hl
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:172: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
	ld	hl, (_pvmem)
	ld	bc, #0x0932
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
;src/main.c:174: drawTextM1(card_types[cards[selected_card].type].description,10,234,NORMALHEIGHT);
	ld	iy, #_selected_card
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_cards
	add	hl, de
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_card_types
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	hl, #0x01ea
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	push	bc
	call	_drawTextM1
	pop	af
	pop	af
	inc	sp
;src/main.c:177: sprintf(aux_txt, "PREVIOUS:%1d", previous_card);
	ld	hl,#_previous_card + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_3
	push	hl
	ld	hl, #_aux_txt
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:178: drawTextM1(aux_txt,10,244,NORMALHEIGHT);
	ld	hl, #0x01f4
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #_aux_txt
	push	hl
	call	_drawTextM1
	pop	af
	pop	af
	inc	sp
;src/main.c:179: sprintf(aux_txt, "SELECTED:%1d", selected_card);
	ld	hl,#_selected_card + 0
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #___str_4
	push	hl
	ld	hl, #_aux_txt
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/main.c:180: drawTextM1(aux_txt,10,254,NORMALHEIGHT);
	ld	hl, #0x01fe
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #_aux_txt
	push	hl
	call	_drawTextM1
	ld	sp,ix
	pop	ix
	ret
___str_2:
	.ascii "%1d"
	.db 0x00
___str_3:
	.ascii "PREVIOUS:%1d"
	.db 0x00
___str_4:
	.ascii "SELECTED:%1d"
	.db 0x00
;src/main.c:184: void update_selected_card(){
;	---------------------------------
; Function update_selected_card
; ---------------------------------
_update_selected_card::
;src/main.c:186: if (selected_card>0){
	ld	a,(#_selected_card + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:187: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W))-2, 160);
	ld	a,(#_previous_card + 0)
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	b, a
	dec	b
	dec	b
	ld	a, #0xa0
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:188: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
	ld	hl, (_pvmem)
	ld	bc, #0x0508
	push	bc
	ld	bc, #0x0033
	push	bc
	push	hl
	call	_cpct_drawSolidBox
00102$:
;src/main.c:191: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(selected_card*(S_CARDS_0_W-3)), 164);
	ld	a,(#_selected_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	ld	a, #0xa4
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:192: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	de, (_pvmem)
	ld	bc, #_cards+0
	ld	iy, #_selected_card
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_card_types
	add	hl, bc
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x2908
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	ret
;src/main.c:195: void init_cards(){
;	---------------------------------
; Function init_cards
; ---------------------------------
_init_cards::
;src/main.c:198: num_cards = (cpct_rand() % 9) + 1;
	call	_cpct_getRandom_mxor_u8
	ld	b, l
	ld	a, #0x09
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
	ld	a, l
	ld	hl, #_num_cards
	inc	a
	ld	(hl), a
;src/main.c:199: for (i=0;i<num_cards;i++){
	ld	c, #0x00
00103$:
	ld	hl, #_num_cards
	ld	a, c
	sub	a, (hl)
	jp	NC,_draw_cards
;src/main.c:200: cards[i].type = cpct_rand() % 2;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	ld	de, #_cards
	add	hl, de
	push	hl
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	a, l
	pop	bc
	pop	hl
	and	a, #0x01
	ld	(hl), a
;src/main.c:199: for (i=0;i<num_cards;i++){
	inc	c
	jr	00103$
;src/main.c:203: draw_cards();
	jp  _draw_cards
;src/main.c:206: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:207: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:208: cpct_setStackLocation((u8*) 0x7fff);
	ld	hl, #0x7fff
	call	_cpct_setStackLocation
;src/main.c:210: initCPC();
	call	_initCPC
;src/main.c:212: selected_card = 4;
	ld	hl,#_selected_card + 0
	ld	(hl), #0x04
;src/main.c:213: previous_card = 4;
	ld	hl,#_previous_card + 0
	ld	(hl), #0x04
;src/main.c:214: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
;src/main.c:216: drawTextM1("CARD HERO - DECK BUILDING GAME",10,0,NORMALHEIGHT);
	ld	hl, #0x0100
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #___str_5
	push	hl
	call	_drawTextM1
	pop	af
	pop	af
	inc	sp
;src/main.c:218: init_cards();
	call	_init_cards
;src/main.c:220: draw_cards();
	call	_draw_cards
;src/main.c:223: while (1){
00104$:
;src/main.c:224: check_keyboard();
	call	_check_keyboard
;src/main.c:225: if (moved){
	ld	a,(#_moved + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:226: draw_cards();
	call	_draw_cards
;src/main.c:227: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
	jr	00104$
___str_5:
	.ascii "CARD HERO - DECK BUILDING GAME"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
