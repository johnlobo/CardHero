;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _draw_cards
	.globl _check_keyboard
	.globl _initCPC
	.globl _myInterruptHandler
	.globl _drawTextM1
	.globl _sprintf
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard
	.globl _cpct_waitHalts
	.globl _cpct_memset_f64
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _moved
	.globl _previous_card
	.globl _selected_card
	.globl _aux_txt
	.globl _pvmem
	.globl _i_time
	.globl _card_description
	.globl _card_sprite
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
_moved::
	.ds 1
_myInterruptHandler_g_nInterrupt_1_124:
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
;src/main.c:51: static u8 g_nInterrupt = 0; // Manage Interrupt
	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
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
;src/main.c:50: void myInterruptHandler(){
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:53: i_time++;
	ld	iy, #_i_time
	inc	0 (iy)
	jr	NZ,00121$
	inc	1 (iy)
	jr	NZ,00121$
	inc	2 (iy)
	jr	NZ,00121$
	inc	3 (iy)
00121$:
;src/main.c:54: g_nInterrupt++;
	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
	inc	0 (iy)
;src/main.c:55: if (g_nInterrupt == 1){
	ld	a, 0 (iy)
;src/main.c:56: cpct_setVideoMode(0);
	dec	a
	jr	NZ,00102$
	ld	l,a
	call	_cpct_setVideoMode
;src/main.c:57: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
00102$:
;src/main.c:59: if (g_nInterrupt == 5){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x05
	jr	NZ,00104$
;src/main.c:60: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:61: cpct_setPalette(g_palette1, 4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_g_palette1
	push	hl
	call	_cpct_setPalette
00104$:
;src/main.c:63: if (g_nInterrupt == 6)
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:65: cpct_scanKeyboard();
	call	_cpct_scanKeyboard
;src/main.c:66: g_nInterrupt = 0;
	ld	hl,#_myInterruptHandler_g_nInterrupt_1_124 + 0
	ld	(hl), #0x00
	ret
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
;src/main.c:70: void initCPC() {
;	---------------------------------
; Function initCPC
; ---------------------------------
_initCPC::
;src/main.c:71: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:72: cpct_clearScreen_f64(0x0000);      // with black.
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_memset_f64
;src/main.c:73: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:74: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:75: cpct_setBorder(HW_WHITE);
	ld	hl, #0x0010
	push	hl
	call	_cpct_setPALColour
;src/main.c:78: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:79: cpct_waitHalts(2);
	ld	l, #0x02
	call	_cpct_waitHalts
;src/main.c:80: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:81: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
	ret
;src/main.c:85: void check_keyboard(){
;	---------------------------------
; Function check_keyboard
; ---------------------------------
_check_keyboard::
;src/main.c:86: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
	ld	iy, #_selected_card
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:87: previous_card = selected_card;
	ld	a, 0 (iy)
	ld	(#_previous_card + 0),a
;src/main.c:88: selected_card--;
	ld	hl, #_selected_card+0
	dec	(hl)
;src/main.c:89: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
00105$:
;src/main.c:90: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<9)){
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
	ld	iy, #_selected_card
	ld	a, 0 (iy)
	sub	a, #0x09
	ret	NC
;src/main.c:91: previous_card = selected_card;
	ld	a, 0 (iy)
	ld	(#_previous_card + 0),a
;src/main.c:92: selected_card++;
	ld	hl, #_selected_card+0
	inc	(hl)
;src/main.c:93: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
;src/main.c:97: void draw_cards(){
;	---------------------------------
; Function draw_cards
; ---------------------------------
_draw_cards::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
;src/main.c:99: u8 cards[10] = {1,0,1,1,0,1,0,1,0,1};
	ld	hl, #0x0000
	add	hl, sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x01
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x01
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x01
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x01
;src/main.c:102: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/main.c:106: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W-3))-2, 95);
	ld	a,(#_previous_card + 0)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	d, a
	dec	d
	dec	d
	push	bc
	ld	a, #0x5f
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:107: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);
	ld	hl, (_pvmem)
	push	bc
	ld	de, #0x2d0c
	push	de
	ld	de, #0x0033
	push	de
	push	hl
	call	_cpct_drawSolidBox
	ld	l, #0x14
	call	_cpct_waitHalts
	ld	hl, #0x960a
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:112: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
	ld	hl, (_pvmem)
	push	bc
	ld	de, #0x0932
	push	de
	ld	de, #0x0000
	push	de
	push	hl
	call	_cpct_drawSolidBox
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/main.c:116: for (i=0;i<selected_card;i++){
	ld	-4 (ix), #0x00
00104$:
	ld	hl, #_selected_card
	ld	a, -4 (ix)
	sub	a, (hl)
	jr	NC,00101$
;src/main.c:117: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
	ld	l, -4 (ix)
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	d, l
	inc	d
	inc	d
	push	bc
	ld	a, #0x63
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:118: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	de, (_pvmem)
	ld	l,-4 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	a, #<(_card_sprite)
	add	a, l
	ld	l, a
	ld	a, #>(_card_sprite)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	pop	iy
	push	bc
	ld	hl, #0x2908
	push	hl
	push	de
	push	iy
	call	_cpct_drawSprite
	pop	bc
;src/main.c:116: for (i=0;i<selected_card;i++){
	inc	-4 (ix)
	jr	00104$
00101$:
;src/main.c:121: cpct_waitHalts(20);
	push	bc
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/main.c:123: for (i=selected_card+1;i<10;i++){
	ld	a,(#_selected_card + 0)
	inc	a
	ld	-1 (ix), a
00107$:
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NC,00102$
;src/main.c:124: pvmem = cpct_getScreenPtr((u8*) 0xC000, 4+(i*(S_CARDS_0_W-3)), 99);
	ld	a, -1 (ix)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	d, a
	inc	d
	inc	d
	inc	d
	inc	d
	push	bc
	ld	a, #0x63
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:125: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	iy, (_pvmem)
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_card_sprite
	add	hl, de
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
;src/main.c:123: for (i=selected_card+1;i<10;i++){
	inc	-1 (ix)
	jr	00107$
00102$:
;src/main.c:128: cpct_waitHalts(20);
	push	bc
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/main.c:130: pvmem = cpct_getScreenPtr((u8*) 0xC000, 3+(selected_card*(S_CARDS_0_W-3)), 95);
	ld	a,(#_selected_card + 0)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	ld	d, a
	inc	d
	inc	d
	inc	d
	push	bc
	ld	a, #0x5f
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:131: cpct_drawSprite(card_sprite[cards[selected_card]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	hl, (_pvmem)
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	hl, (_selected_card)
	ld	h, #0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_card_sprite
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x2908
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	call	_cpct_drawSprite
	ld	l, #0x14
	call	_cpct_waitHalts
	pop	bc
;src/main.c:134: drawTextM1(card_description[cards[selected_card]],10,150,NORMALHEIGHT);
	ld	hl, (_selected_card)
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_card_description
	add	hl, de
	ld	bc, #0x0196
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	push	hl
	call	_drawTextM1
	pop	af
	pop	af
	inc	sp
;src/main.c:136: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:137: sprintf(aux_txt, "SELECTED:%1d", selected_card);
	ld	hl,#_selected_card + 0
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
;src/main.c:138: drawTextM1(aux_txt,10,160,NORMALHEIGHT);
	ld	hl, #0x01a0
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
	.ascii "SELECTED:%1d"
	.db 0x00
;src/main.c:142: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:144: initCPC();
	call	_initCPC
;src/main.c:146: selected_card = 4;
	ld	hl,#_selected_card + 0
	ld	(hl), #0x04
;src/main.c:147: previous_card = 4;
	ld	hl,#_previous_card + 0
	ld	(hl), #0x04
;src/main.c:148: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
;src/main.c:150: draw_cards();
	call	_draw_cards
;src/main.c:152: drawTextM1("!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",10,190,NORMALHEIGHT);
	ld	hl, #0x01be
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #___str_3
	push	hl
	call	_drawTextM1
	pop	af
	pop	af
	inc	sp
;src/main.c:155: while (1){
00104$:
;src/main.c:156: check_keyboard();
	call	_check_keyboard
;src/main.c:157: if (moved){
	ld	a,(#_moved + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:158: draw_cards();
	call	_draw_cards
;src/main.c:159: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
	jr	00104$
___str_3:
	.ascii "!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
