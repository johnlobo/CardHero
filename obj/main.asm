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
	.globl _drawTextM1
	.globl _sprintf
	.globl _cpct_getRandom_mxor_u8
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
	.globl _num_cards
	.globl _cards
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
_cards::
	.ds 10
_num_cards::
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
;src/main.c:53: static u8 g_nInterrupt = 0; // Manage Interrupt
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
;src/main.c:52: void myInterruptHandler(){
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:55: i_time++;
	ld	iy, #_i_time
	inc	0 (iy)
	jr	NZ,00144$
	inc	1 (iy)
	jr	NZ,00144$
	inc	2 (iy)
	jr	NZ,00144$
	inc	3 (iy)
00144$:
;src/main.c:56: g_nInterrupt++;
	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
	inc	0 (iy)
;src/main.c:57: if (g_nInterrupt == 1){
	ld	a, 0 (iy)
;src/main.c:58: cpct_setVideoMode(0);
	dec	a
	jr	NZ,00116$
	ld	l,a
	call	_cpct_setVideoMode
;src/main.c:59: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:60: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
	ret
00116$:
;src/main.c:62: if (g_nInterrupt == 2){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x02
	jr	NZ,00113$
;src/main.c:63: cpct_setBorder(HW_BLUE);
	ld	hl, #0x0410
	push	hl
	call	_cpct_setPALColour
	ret
00113$:
;src/main.c:65: if (g_nInterrupt == 3){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x03
	jr	NZ,00110$
;src/main.c:66: cpct_setBorder(HW_RED);
	ld	hl, #0x1c10
	push	hl
	call	_cpct_setPALColour
	ret
00110$:
;src/main.c:68: if (g_nInterrupt == 4){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x04
	jr	NZ,00107$
;src/main.c:69: cpct_setBorder(HW_YELLOW);
	ld	hl, #0x1e10
	push	hl
	call	_cpct_setPALColour
	ret
00107$:
;src/main.c:71: if (g_nInterrupt == 5){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x05
	jr	NZ,00104$
;src/main.c:72: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:73: cpct_setPalette(g_palette1, 4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_g_palette1
	push	hl
	call	_cpct_setPalette
;src/main.c:74: cpct_setBorder(HW_MAGENTA);
	ld	hl, #0x1810
	push	hl
	call	_cpct_setPALColour
	ret
00104$:
;src/main.c:75: }else if (g_nInterrupt == 6){
	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
	sub	a, #0x06
	ret	NZ
;src/main.c:76: cpct_scanKeyboard();
	call	_cpct_scanKeyboard
;src/main.c:77: g_nInterrupt = 0;
	ld	hl,#_myInterruptHandler_g_nInterrupt_1_124 + 0
	ld	(hl), #0x00
;src/main.c:78: cpct_setBorder(HW_BRIGHT_BLUE);
	ld	hl, #0x1510
	push	hl
	call	_cpct_setPALColour
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
;src/main.c:82: void initCPC() {
;	---------------------------------
; Function initCPC
; ---------------------------------
_initCPC::
;src/main.c:83: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:84: cpct_clearScreen_f64(0x0000);      // with black.
	ld	hl, #0x4000
	push	hl
	ld	h, #0x00
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_memset_f64
;src/main.c:85: cpct_setPalette(g_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:86: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:87: cpct_setBorder(HW_WHITE);
	ld	hl, #0x0010
	push	hl
	call	_cpct_setPALColour
;src/main.c:90: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:91: cpct_waitHalts(2);
	ld	l, #0x02
	call	_cpct_waitHalts
;src/main.c:92: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:93: cpct_setInterruptHandler(myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
	ret
;src/main.c:97: void check_keyboard(){
;	---------------------------------
; Function check_keyboard
; ---------------------------------
_check_keyboard::
;src/main.c:98: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
	ld	iy, #_selected_card
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00105$
;src/main.c:99: previous_card = selected_card;
	ld	a, 0 (iy)
	ld	(#_previous_card + 0),a
;src/main.c:100: selected_card--;
	ld	hl, #_selected_card+0
	dec	(hl)
;src/main.c:101: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
00105$:
;src/main.c:102: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<9)){
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
	ld	iy, #_selected_card
	ld	a, 0 (iy)
	sub	a, #0x09
	ret	NC
;src/main.c:103: previous_card = selected_card;
	ld	a, 0 (iy)
	ld	(#_previous_card + 0),a
;src/main.c:104: selected_card++;
	ld	hl, #_selected_card+0
	inc	(hl)
;src/main.c:105: moved = YES;
	ld	hl,#_moved + 0
	ld	(hl), #0x01
	ret
;src/main.c:109: void draw_cards(){
;	---------------------------------
; Function draw_cards
; ---------------------------------
_draw_cards::
;src/main.c:114: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:117: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W-3))-2, 95);
	ld	a,(#_previous_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	dec	b
	dec	b
	ld	a, #0x5f
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:118: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);
	ld	hl, (_pvmem)
	ld	bc, #0x2d0c
	push	bc
	ld	bc, #0x0033
	push	bc
	push	hl
	call	_cpct_drawSolidBox
;src/main.c:120: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:122: pvmem = cpct_getScreenPtr((u8*) 0xC000, 10, 150);
	ld	hl, #0x960a
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:123: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
	ld	hl, (_pvmem)
	ld	bc, #0x0932
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
;src/main.c:125: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:127: for (i=0;i<selected_card;i++){
	ld	c, #0x00
00104$:
	ld	hl, #_selected_card
	ld	a, c
	sub	a, (hl)
	jr	NC,00101$
;src/main.c:128: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	b, l
	inc	b
	inc	b
	push	bc
	ld	a, #0x63
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:129: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	de, (_pvmem)
	ld	hl, #_cards
	ld	b, #0x00
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
;src/main.c:127: for (i=0;i<selected_card;i++){
	inc	c
	jr	00104$
00101$:
;src/main.c:132: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:134: for (i=selected_card+1;i<10;i++){
	ld	hl,#_selected_card + 0
	ld	c, (hl)
	inc	c
00107$:
;src/main.c:135: pvmem = cpct_getScreenPtr((u8*) 0xC000, 4+(i*(S_CARDS_0_W-3)), 99);
	ld	a,c
	cp	a,#0x0a
	jr	NC,00102$
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	inc	b
	inc	b
	push	bc
	ld	a, #0x63
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	(_pvmem), hl
;src/main.c:136: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	iy, (_pvmem)
	ld	hl, #_cards
	ld	b, #0x00
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
;src/main.c:134: for (i=selected_card+1;i<10;i++){
	inc	c
	jr	00107$
00102$:
;src/main.c:139: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:141: pvmem = cpct_getScreenPtr((u8*) 0xC000, 3+(selected_card*(S_CARDS_0_W-3)), 95);
	ld	a,(#_selected_card + 0)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	inc	b
	ld	a, #0x5f
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:142: cpct_drawSprite(card_sprite[cards[selected_card]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	bc, (_pvmem)
	ld	iy, #_cards
	ld	de, (_selected_card)
	ld	d, #0x00
	add	iy, de
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_card_sprite
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x2908
	push	hl
	push	bc
	push	de
	call	_cpct_drawSprite
;src/main.c:144: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:145: drawTextM1(card_description[cards[selected_card]],10,150,NORMALHEIGHT);
	ld	a, #<(_cards)
	ld	hl, #_selected_card
	add	a, (hl)
	ld	c, a
	ld	a, #>(_cards)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	c,a
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
;src/main.c:147: cpct_waitHalts(20);
	ld	l, #0x14
	call	_cpct_waitHalts
;src/main.c:148: sprintf(aux_txt, "SELECTED:%1d", selected_card);
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
;src/main.c:149: drawTextM1(aux_txt,10,160,NORMALHEIGHT);
	ld	hl, #0x01a0
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
	ret
___str_2:
	.ascii "SELECTED:%1d"
	.db 0x00
;src/main.c:153: void update_selected_card(){
;	---------------------------------
; Function update_selected_card
; ---------------------------------
_update_selected_card::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:156: if (selected_card>0){
	ld	a,(#_selected_card + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:157: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W))-2, 95);
	ld	a,(#_previous_card + 0)
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	b, a
	dec	b
	dec	b
	ld	a, #0x5f
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:158: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
	ld	hl, (_pvmem)
	ld	bc, #0x0508
	push	bc
	ld	bc, #0x0033
	push	bc
	push	hl
	call	_cpct_drawSolidBox
00102$:
;src/main.c:161: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
	ld	a, -1 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	b, a
	inc	b
	inc	b
	ld	a, #0x63
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvmem), hl
;src/main.c:162: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
	ld	de, (_pvmem)
	ld	a, -1 (ix)
	add	a, #<(_cards)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_cards)
	ld	h, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	bc, #_card_sprite
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x2908
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	inc	sp
	pop	ix
	ret
;src/main.c:165: void init_cards(){
;	---------------------------------
; Function init_cards
; ---------------------------------
_init_cards::
;src/main.c:168: num_cards = (cpct_rand() % 9) + 1;
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
;src/main.c:169: for (i=0;i<num_cards;i++){
	ld	c, #0x00
00103$:
	ld	hl, #_num_cards
	ld	a, c
	sub	a, (hl)
	jp	NC,_draw_cards
;src/main.c:170: cards[i] = cpct_rand() % 2;
	ld	hl, #_cards
	ld	b, #0x00
	add	hl, bc
	push	hl
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	a, l
	pop	bc
	pop	hl
	and	a, #0x01
	ld	(hl), a
;src/main.c:169: for (i=0;i<num_cards;i++){
	inc	c
	jr	00103$
;src/main.c:173: draw_cards();
	jp  _draw_cards
;src/main.c:176: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:178: initCPC();
	call	_initCPC
;src/main.c:180: selected_card = 4;
	ld	hl,#_selected_card + 0
	ld	(hl), #0x04
;src/main.c:181: previous_card = 4;
	ld	hl,#_previous_card + 0
	ld	(hl), #0x04
;src/main.c:182: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
;src/main.c:184: draw_cards();
	call	_draw_cards
;src/main.c:186: drawTextM1("!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",10,190,NORMALHEIGHT);
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
;src/main.c:189: while (1){
00104$:
;src/main.c:190: check_keyboard();
	call	_check_keyboard
;src/main.c:191: if (moved){
	ld	a,(#_moved + 0)
	or	a, a
	jr	Z,00104$
;src/main.c:192: draw_cards();
	call	_draw_cards
;src/main.c:193: moved = NO;
	ld	hl,#_moved + 0
	ld	(hl), #0x00
	jr	00104$
___str_3:
	.ascii "!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
