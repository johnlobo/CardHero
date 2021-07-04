                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _draw_cards
                             13 	.globl _check_keyboard
                             14 	.globl _initCPC
                             15 	.globl _myInterruptHandler
                             16 	.globl _drawTextM1
                             17 	.globl _sprintf
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_setPALColour
                             20 	.globl _cpct_setPalette
                             21 	.globl _cpct_waitVSYNC
                             22 	.globl _cpct_setVideoMode
                             23 	.globl _cpct_drawSprite
                             24 	.globl _cpct_drawSolidBox
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard
                             27 	.globl _cpct_waitHalts
                             28 	.globl _cpct_memset_f64
                             29 	.globl _cpct_setInterruptHandler
                             30 	.globl _cpct_disableFirmware
                             31 	.globl _moved
                             32 	.globl _previous_card
                             33 	.globl _selected_card
                             34 	.globl _aux_txt
                             35 	.globl _pvmem
                             36 	.globl _i_time
                             37 	.globl _card_description
                             38 	.globl _card_sprite
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
   5FA0                      46 _i_time::
   5FA0                      47 	.ds 4
   5FA4                      48 _pvmem::
   5FA4                      49 	.ds 2
   5FA6                      50 _aux_txt::
   5FA6                      51 	.ds 50
   5FD8                      52 _selected_card::
   5FD8                      53 	.ds 1
   5FD9                      54 _previous_card::
   5FD9                      55 	.ds 1
   5FDA                      56 _moved::
   5FDA                      57 	.ds 1
   5FDB                      58 _myInterruptHandler_g_nInterrupt_1_124:
   5FDB                      59 	.ds 1
                             60 ;--------------------------------------------------------
                             61 ; ram data
                             62 ;--------------------------------------------------------
                             63 	.area _INITIALIZED
                             64 ;--------------------------------------------------------
                             65 ; absolute external ram data
                             66 ;--------------------------------------------------------
                             67 	.area _DABS (ABS)
                             68 ;--------------------------------------------------------
                             69 ; global & static initialisations
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _GSINIT
                             73 	.area _GSFINAL
                             74 	.area _GSINIT
                             75 ;src/main.c:51: static u8 g_nInterrupt = 0; // Manage Interrupt
   5FDC FD 21 DB 5F   [14]   76 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
   5FE0 FD 36 00 00   [19]   77 	ld	0 (iy), #0x00
                             78 ;--------------------------------------------------------
                             79 ; Home
                             80 ;--------------------------------------------------------
                             81 	.area _HOME
                             82 	.area _HOME
                             83 ;--------------------------------------------------------
                             84 ; code
                             85 ;--------------------------------------------------------
                             86 	.area _CODE
                             87 ;src/main.c:50: void myInterruptHandler(){
                             88 ;	---------------------------------
                             89 ; Function myInterruptHandler
                             90 ; ---------------------------------
   471B                      91 _myInterruptHandler::
                             92 ;src/main.c:53: i_time++;
   471B FD 21 A0 5F   [14]   93 	ld	iy, #_i_time
   471F FD 34 00      [23]   94 	inc	0 (iy)
   4722 20 0D         [12]   95 	jr	NZ,00121$
   4724 FD 34 01      [23]   96 	inc	1 (iy)
   4727 20 08         [12]   97 	jr	NZ,00121$
   4729 FD 34 02      [23]   98 	inc	2 (iy)
   472C 20 03         [12]   99 	jr	NZ,00121$
   472E FD 34 03      [23]  100 	inc	3 (iy)
   4731                     101 00121$:
                            102 ;src/main.c:54: g_nInterrupt++;
   4731 FD 21 DB 5F   [14]  103 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
   4735 FD 34 00      [23]  104 	inc	0 (iy)
                            105 ;src/main.c:55: if (g_nInterrupt == 1){
   4738 FD 7E 00      [19]  106 	ld	a, 0 (iy)
                            107 ;src/main.c:56: cpct_setVideoMode(0);
   473B 3D            [ 4]  108 	dec	a
   473C 20 0F         [12]  109 	jr	NZ,00102$
   473E 6F            [ 4]  110 	ld	l,a
   473F CD 0D 53      [17]  111 	call	_cpct_setVideoMode
                            112 ;src/main.c:57: cpct_setPalette(g_palette0, 16);
   4742 21 10 00      [10]  113 	ld	hl, #0x0010
   4745 E5            [11]  114 	push	hl
   4746 21 0B 47      [10]  115 	ld	hl, #_g_palette0
   4749 E5            [11]  116 	push	hl
   474A CD 4D 51      [17]  117 	call	_cpct_setPalette
   474D                     118 00102$:
                            119 ;src/main.c:59: if (g_nInterrupt == 5){
   474D 3A DB 5F      [13]  120 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   4750 D6 05         [ 7]  121 	sub	a, #0x05
   4752 20 10         [12]  122 	jr	NZ,00104$
                            123 ;src/main.c:60: cpct_setVideoMode(1);
   4754 2E 01         [ 7]  124 	ld	l, #0x01
   4756 CD 0D 53      [17]  125 	call	_cpct_setVideoMode
                            126 ;src/main.c:61: cpct_setPalette(g_palette1, 4);
   4759 21 04 00      [10]  127 	ld	hl, #0x0004
   475C E5            [11]  128 	push	hl
   475D 21 83 41      [10]  129 	ld	hl, #_g_palette1
   4760 E5            [11]  130 	push	hl
   4761 CD 4D 51      [17]  131 	call	_cpct_setPalette
   4764                     132 00104$:
                            133 ;src/main.c:63: if (g_nInterrupt == 6)
   4764 3A DB 5F      [13]  134 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   4767 D6 06         [ 7]  135 	sub	a, #0x06
   4769 C0            [11]  136 	ret	NZ
                            137 ;src/main.c:65: cpct_scanKeyboard();
   476A CD F6 53      [17]  138 	call	_cpct_scanKeyboard
                            139 ;src/main.c:66: g_nInterrupt = 0;
   476D 21 DB 5F      [10]  140 	ld	hl,#_myInterruptHandler_g_nInterrupt_1_124 + 0
   4770 36 00         [10]  141 	ld	(hl), #0x00
   4772 C9            [10]  142 	ret
   4773                     143 _card_sprite:
   4773 7B 44               144 	.dw _s_cards_0
   4775 C3 45               145 	.dw _s_cards_1
   4777                     146 _card_description:
   4777 53 57 4F 52 44 3A   147 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   47A0 00                  148 	.db 0x00
   47A1 00                  149 	.db 0x00
   47A2 00                  150 	.db 0x00
   47A3 00                  151 	.db 0x00
   47A4 00                  152 	.db 0x00
   47A5 00                  153 	.db 0x00
   47A6 00                  154 	.db 0x00
   47A7 00                  155 	.db 0x00
   47A8 00                  156 	.db 0x00
   47A9 53 48 49 45 4C 44   157 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   47C4 00                  158 	.db 0x00
   47C5 00                  159 	.db 0x00
   47C6 00                  160 	.db 0x00
   47C7 00                  161 	.db 0x00
   47C8 00                  162 	.db 0x00
   47C9 00                  163 	.db 0x00
   47CA 00                  164 	.db 0x00
   47CB 00                  165 	.db 0x00
   47CC 00                  166 	.db 0x00
   47CD 00                  167 	.db 0x00
   47CE 00                  168 	.db 0x00
   47CF 00                  169 	.db 0x00
   47D0 00                  170 	.db 0x00
   47D1 00                  171 	.db 0x00
   47D2 00                  172 	.db 0x00
   47D3 00                  173 	.db 0x00
   47D4 00                  174 	.db 0x00
   47D5 00                  175 	.db 0x00
   47D6 00                  176 	.db 0x00
   47D7 00                  177 	.db 0x00
   47D8 00                  178 	.db 0x00
   47D9 00                  179 	.db 0x00
   47DA 00                  180 	.db 0x00
                            181 ;src/main.c:70: void initCPC() {
                            182 ;	---------------------------------
                            183 ; Function initCPC
                            184 ; ---------------------------------
   47DB                     185 _initCPC::
                            186 ;src/main.c:71: cpct_disableFirmware();
   47DB CD 1B 53      [17]  187 	call	_cpct_disableFirmware
                            188 ;src/main.c:72: cpct_clearScreen_f64(0x0000);      // with black.
   47DE 21 00 40      [10]  189 	ld	hl, #0x4000
   47E1 E5            [11]  190 	push	hl
   47E2 26 00         [ 7]  191 	ld	h, #0x00
   47E4 E5            [11]  192 	push	hl
   47E5 26 C0         [ 7]  193 	ld	h, #0xc0
   47E7 E5            [11]  194 	push	hl
   47E8 CD 30 52      [17]  195 	call	_cpct_memset_f64
                            196 ;src/main.c:73: cpct_setPalette(g_palette0, 16);
   47EB 21 10 00      [10]  197 	ld	hl, #0x0010
   47EE E5            [11]  198 	push	hl
   47EF 21 0B 47      [10]  199 	ld	hl, #_g_palette0
   47F2 E5            [11]  200 	push	hl
   47F3 CD 4D 51      [17]  201 	call	_cpct_setPalette
                            202 ;src/main.c:74: cpct_setVideoMode(0);
   47F6 2E 00         [ 7]  203 	ld	l, #0x00
   47F8 CD 0D 53      [17]  204 	call	_cpct_setVideoMode
                            205 ;src/main.c:75: cpct_setBorder(HW_WHITE);
   47FB 21 10 00      [10]  206 	ld	hl, #0x0010
   47FE E5            [11]  207 	push	hl
   47FF CD 70 51      [17]  208 	call	_cpct_setPALColour
                            209 ;src/main.c:78: cpct_waitVSYNC();
   4802 CD 05 53      [17]  210 	call	_cpct_waitVSYNC
                            211 ;src/main.c:79: cpct_waitHalts(2);
   4805 2E 02         [ 7]  212 	ld	l, #0x02
   4807 CD 2B 52      [17]  213 	call	_cpct_waitHalts
                            214 ;src/main.c:80: cpct_waitVSYNC();
   480A CD 05 53      [17]  215 	call	_cpct_waitVSYNC
                            216 ;src/main.c:81: cpct_setInterruptHandler(myInterruptHandler);
   480D 21 1B 47      [10]  217 	ld	hl, #_myInterruptHandler
   4810 CD 27 54      [17]  218 	call	_cpct_setInterruptHandler
   4813 C9            [10]  219 	ret
                            220 ;src/main.c:85: void check_keyboard(){
                            221 ;	---------------------------------
                            222 ; Function check_keyboard
                            223 ; ---------------------------------
   4814                     224 _check_keyboard::
                            225 ;src/main.c:86: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
   4814 21 01 01      [10]  226 	ld	hl, #0x0101
   4817 CD 64 51      [17]  227 	call	_cpct_isKeyPressed
   481A 7D            [ 4]  228 	ld	a, l
   481B B7            [ 4]  229 	or	a, a
   481C 28 1A         [12]  230 	jr	Z,00105$
   481E FD 21 D8 5F   [14]  231 	ld	iy, #_selected_card
   4822 FD 7E 00      [19]  232 	ld	a, 0 (iy)
   4825 B7            [ 4]  233 	or	a, a
   4826 28 10         [12]  234 	jr	Z,00105$
                            235 ;src/main.c:87: previous_card = selected_card;
   4828 FD 7E 00      [19]  236 	ld	a, 0 (iy)
   482B 32 D9 5F      [13]  237 	ld	(#_previous_card + 0),a
                            238 ;src/main.c:88: selected_card--;
   482E 21 D8 5F      [10]  239 	ld	hl, #_selected_card+0
   4831 35            [11]  240 	dec	(hl)
                            241 ;src/main.c:89: moved = YES;
   4832 21 DA 5F      [10]  242 	ld	hl,#_moved + 0
   4835 36 01         [10]  243 	ld	(hl), #0x01
   4837 C9            [10]  244 	ret
   4838                     245 00105$:
                            246 ;src/main.c:90: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<9)){
   4838 21 00 02      [10]  247 	ld	hl, #0x0200
   483B CD 64 51      [17]  248 	call	_cpct_isKeyPressed
   483E 7D            [ 4]  249 	ld	a, l
   483F B7            [ 4]  250 	or	a, a
   4840 C8            [11]  251 	ret	Z
   4841 FD 21 D8 5F   [14]  252 	ld	iy, #_selected_card
   4845 FD 7E 00      [19]  253 	ld	a, 0 (iy)
   4848 D6 09         [ 7]  254 	sub	a, #0x09
   484A D0            [11]  255 	ret	NC
                            256 ;src/main.c:91: previous_card = selected_card;
   484B FD 7E 00      [19]  257 	ld	a, 0 (iy)
   484E 32 D9 5F      [13]  258 	ld	(#_previous_card + 0),a
                            259 ;src/main.c:92: selected_card++;
   4851 21 D8 5F      [10]  260 	ld	hl, #_selected_card+0
   4854 34            [11]  261 	inc	(hl)
                            262 ;src/main.c:93: moved = YES;
   4855 21 DA 5F      [10]  263 	ld	hl,#_moved + 0
   4858 36 01         [10]  264 	ld	(hl), #0x01
   485A C9            [10]  265 	ret
                            266 ;src/main.c:97: void draw_cards(){
                            267 ;	---------------------------------
                            268 ; Function draw_cards
                            269 ; ---------------------------------
   485B                     270 _draw_cards::
   485B DD E5         [15]  271 	push	ix
   485D DD 21 00 00   [14]  272 	ld	ix,#0
   4861 DD 39         [15]  273 	add	ix,sp
   4863 21 F2 FF      [10]  274 	ld	hl, #-14
   4866 39            [11]  275 	add	hl, sp
   4867 F9            [ 6]  276 	ld	sp, hl
                            277 ;src/main.c:99: u8 cards[10] = {1,0,1,1,0,1,0,1,0,1};
   4868 21 00 00      [10]  278 	ld	hl, #0x0000
   486B 39            [11]  279 	add	hl, sp
   486C 4D            [ 4]  280 	ld	c,l
   486D 44            [ 4]  281 	ld	b,h
   486E 36 01         [10]  282 	ld	(hl),#0x01
   4870 59            [ 4]  283 	ld	e, c
   4871 50            [ 4]  284 	ld	d, b
   4872 13            [ 6]  285 	inc	de
   4873 AF            [ 4]  286 	xor	a, a
   4874 12            [ 7]  287 	ld	(de), a
   4875 69            [ 4]  288 	ld	l, c
   4876 60            [ 4]  289 	ld	h, b
   4877 23            [ 6]  290 	inc	hl
   4878 23            [ 6]  291 	inc	hl
   4879 36 01         [10]  292 	ld	(hl), #0x01
   487B 69            [ 4]  293 	ld	l, c
   487C 60            [ 4]  294 	ld	h, b
   487D 23            [ 6]  295 	inc	hl
   487E 23            [ 6]  296 	inc	hl
   487F 23            [ 6]  297 	inc	hl
   4880 36 01         [10]  298 	ld	(hl), #0x01
   4882 21 04 00      [10]  299 	ld	hl, #0x0004
   4885 09            [11]  300 	add	hl, bc
   4886 36 00         [10]  301 	ld	(hl), #0x00
   4888 21 05 00      [10]  302 	ld	hl, #0x0005
   488B 09            [11]  303 	add	hl, bc
   488C 36 01         [10]  304 	ld	(hl), #0x01
   488E 21 06 00      [10]  305 	ld	hl, #0x0006
   4891 09            [11]  306 	add	hl, bc
   4892 36 00         [10]  307 	ld	(hl), #0x00
   4894 21 07 00      [10]  308 	ld	hl, #0x0007
   4897 09            [11]  309 	add	hl, bc
   4898 36 01         [10]  310 	ld	(hl), #0x01
   489A 21 08 00      [10]  311 	ld	hl, #0x0008
   489D 09            [11]  312 	add	hl, bc
   489E 36 00         [10]  313 	ld	(hl), #0x00
   48A0 21 09 00      [10]  314 	ld	hl, #0x0009
   48A3 09            [11]  315 	add	hl, bc
   48A4 36 01         [10]  316 	ld	(hl), #0x01
                            317 ;src/main.c:102: cpct_waitVSYNC();
   48A6 C5            [11]  318 	push	bc
   48A7 CD 05 53      [17]  319 	call	_cpct_waitVSYNC
   48AA 2E 14         [ 7]  320 	ld	l, #0x14
   48AC CD 2B 52      [17]  321 	call	_cpct_waitHalts
   48AF C1            [10]  322 	pop	bc
                            323 ;src/main.c:106: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W-3))-2, 95);
   48B0 3A D9 5F      [13]  324 	ld	a,(#_previous_card + 0)
   48B3 5F            [ 4]  325 	ld	e, a
   48B4 87            [ 4]  326 	add	a, a
   48B5 87            [ 4]  327 	add	a, a
   48B6 83            [ 4]  328 	add	a, e
   48B7 57            [ 4]  329 	ld	d, a
   48B8 15            [ 4]  330 	dec	d
   48B9 15            [ 4]  331 	dec	d
   48BA C5            [11]  332 	push	bc
   48BB 3E 5F         [ 7]  333 	ld	a, #0x5f
   48BD F5            [11]  334 	push	af
   48BE 33            [ 6]  335 	inc	sp
   48BF D5            [11]  336 	push	de
   48C0 33            [ 6]  337 	inc	sp
   48C1 21 00 C0      [10]  338 	ld	hl, #0xc000
   48C4 E5            [11]  339 	push	hl
   48C5 CD D6 53      [17]  340 	call	_cpct_getScreenPtr
   48C8 C1            [10]  341 	pop	bc
   48C9 22 A4 5F      [16]  342 	ld	(_pvmem), hl
                            343 ;src/main.c:107: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);
   48CC 2A A4 5F      [16]  344 	ld	hl, (_pvmem)
   48CF C5            [11]  345 	push	bc
   48D0 11 0C 2D      [10]  346 	ld	de, #0x2d0c
   48D3 D5            [11]  347 	push	de
   48D4 11 33 00      [10]  348 	ld	de, #0x0033
   48D7 D5            [11]  349 	push	de
   48D8 E5            [11]  350 	push	hl
   48D9 CD 2B 53      [17]  351 	call	_cpct_drawSolidBox
   48DC 2E 14         [ 7]  352 	ld	l, #0x14
   48DE CD 2B 52      [17]  353 	call	_cpct_waitHalts
   48E1 21 0A 96      [10]  354 	ld	hl, #0x960a
   48E4 E5            [11]  355 	push	hl
   48E5 21 00 C0      [10]  356 	ld	hl, #0xc000
   48E8 E5            [11]  357 	push	hl
   48E9 CD D6 53      [17]  358 	call	_cpct_getScreenPtr
   48EC C1            [10]  359 	pop	bc
   48ED 22 A4 5F      [16]  360 	ld	(_pvmem), hl
                            361 ;src/main.c:112: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
   48F0 2A A4 5F      [16]  362 	ld	hl, (_pvmem)
   48F3 C5            [11]  363 	push	bc
   48F4 11 32 09      [10]  364 	ld	de, #0x0932
   48F7 D5            [11]  365 	push	de
   48F8 11 00 00      [10]  366 	ld	de, #0x0000
   48FB D5            [11]  367 	push	de
   48FC E5            [11]  368 	push	hl
   48FD CD 2B 53      [17]  369 	call	_cpct_drawSolidBox
   4900 2E 14         [ 7]  370 	ld	l, #0x14
   4902 CD 2B 52      [17]  371 	call	_cpct_waitHalts
   4905 C1            [10]  372 	pop	bc
                            373 ;src/main.c:116: for (i=0;i<selected_card;i++){
   4906 DD 36 FC 00   [19]  374 	ld	-4 (ix), #0x00
   490A                     375 00104$:
   490A 21 D8 5F      [10]  376 	ld	hl, #_selected_card
   490D DD 7E FC      [19]  377 	ld	a, -4 (ix)
   4910 96            [ 7]  378 	sub	a, (hl)
   4911 30 4A         [12]  379 	jr	NC,00101$
                            380 ;src/main.c:117: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
   4913 DD 6E FC      [19]  381 	ld	l, -4 (ix)
   4916 5D            [ 4]  382 	ld	e, l
   4917 29            [11]  383 	add	hl, hl
   4918 29            [11]  384 	add	hl, hl
   4919 19            [11]  385 	add	hl, de
   491A 55            [ 4]  386 	ld	d, l
   491B 14            [ 4]  387 	inc	d
   491C 14            [ 4]  388 	inc	d
   491D C5            [11]  389 	push	bc
   491E 3E 63         [ 7]  390 	ld	a, #0x63
   4920 F5            [11]  391 	push	af
   4921 33            [ 6]  392 	inc	sp
   4922 D5            [11]  393 	push	de
   4923 33            [ 6]  394 	inc	sp
   4924 21 00 C0      [10]  395 	ld	hl, #0xc000
   4927 E5            [11]  396 	push	hl
   4928 CD D6 53      [17]  397 	call	_cpct_getScreenPtr
   492B C1            [10]  398 	pop	bc
   492C 22 A4 5F      [16]  399 	ld	(_pvmem), hl
                            400 ;src/main.c:118: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   492F ED 5B A4 5F   [20]  401 	ld	de, (_pvmem)
   4933 DD 6E FC      [19]  402 	ld	l,-4 (ix)
   4936 26 00         [ 7]  403 	ld	h,#0x00
   4938 09            [11]  404 	add	hl, bc
   4939 6E            [ 7]  405 	ld	l, (hl)
   493A 26 00         [ 7]  406 	ld	h, #0x00
   493C 29            [11]  407 	add	hl, hl
   493D 3E 73         [ 7]  408 	ld	a, #<(_card_sprite)
   493F 85            [ 4]  409 	add	a, l
   4940 6F            [ 4]  410 	ld	l, a
   4941 3E 47         [ 7]  411 	ld	a, #>(_card_sprite)
   4943 8C            [ 4]  412 	adc	a, h
   4944 67            [ 4]  413 	ld	h, a
   4945 7E            [ 7]  414 	ld	a, (hl)
   4946 23            [ 6]  415 	inc	hl
   4947 66            [ 7]  416 	ld	h, (hl)
   4948 6F            [ 4]  417 	ld	l, a
   4949 E5            [11]  418 	push	hl
   494A FD E1         [14]  419 	pop	iy
   494C C5            [11]  420 	push	bc
   494D 21 08 29      [10]  421 	ld	hl, #0x2908
   4950 E5            [11]  422 	push	hl
   4951 D5            [11]  423 	push	de
   4952 FD E5         [15]  424 	push	iy
   4954 CD 7C 51      [17]  425 	call	_cpct_drawSprite
   4957 C1            [10]  426 	pop	bc
                            427 ;src/main.c:116: for (i=0;i<selected_card;i++){
   4958 DD 34 FC      [23]  428 	inc	-4 (ix)
   495B 18 AD         [12]  429 	jr	00104$
   495D                     430 00101$:
                            431 ;src/main.c:121: cpct_waitHalts(20);
   495D C5            [11]  432 	push	bc
   495E 2E 14         [ 7]  433 	ld	l, #0x14
   4960 CD 2B 52      [17]  434 	call	_cpct_waitHalts
   4963 C1            [10]  435 	pop	bc
                            436 ;src/main.c:123: for (i=selected_card+1;i<10;i++){
   4964 3A D8 5F      [13]  437 	ld	a,(#_selected_card + 0)
   4967 3C            [ 4]  438 	inc	a
   4968 DD 77 FF      [19]  439 	ld	-1 (ix), a
   496B                     440 00107$:
   496B DD 7E FF      [19]  441 	ld	a, -1 (ix)
   496E D6 0A         [ 7]  442 	sub	a, #0x0a
   4970 30 44         [12]  443 	jr	NC,00102$
                            444 ;src/main.c:124: pvmem = cpct_getScreenPtr((u8*) 0xC000, 4+(i*(S_CARDS_0_W-3)), 99);
   4972 DD 7E FF      [19]  445 	ld	a, -1 (ix)
   4975 5F            [ 4]  446 	ld	e, a
   4976 87            [ 4]  447 	add	a, a
   4977 87            [ 4]  448 	add	a, a
   4978 83            [ 4]  449 	add	a, e
   4979 57            [ 4]  450 	ld	d, a
   497A 14            [ 4]  451 	inc	d
   497B 14            [ 4]  452 	inc	d
   497C 14            [ 4]  453 	inc	d
   497D 14            [ 4]  454 	inc	d
   497E C5            [11]  455 	push	bc
   497F 3E 63         [ 7]  456 	ld	a, #0x63
   4981 F5            [11]  457 	push	af
   4982 33            [ 6]  458 	inc	sp
   4983 D5            [11]  459 	push	de
   4984 33            [ 6]  460 	inc	sp
   4985 21 00 C0      [10]  461 	ld	hl, #0xc000
   4988 E5            [11]  462 	push	hl
   4989 CD D6 53      [17]  463 	call	_cpct_getScreenPtr
   498C C1            [10]  464 	pop	bc
   498D 22 A4 5F      [16]  465 	ld	(_pvmem), hl
                            466 ;src/main.c:125: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   4990 FD 2A A4 5F   [20]  467 	ld	iy, (_pvmem)
   4994 DD 6E FF      [19]  468 	ld	l,-1 (ix)
   4997 26 00         [ 7]  469 	ld	h,#0x00
   4999 09            [11]  470 	add	hl, bc
   499A 6E            [ 7]  471 	ld	l, (hl)
   499B 26 00         [ 7]  472 	ld	h, #0x00
   499D 29            [11]  473 	add	hl, hl
   499E 11 73 47      [10]  474 	ld	de, #_card_sprite
   49A1 19            [11]  475 	add	hl, de
   49A2 5E            [ 7]  476 	ld	e, (hl)
   49A3 23            [ 6]  477 	inc	hl
   49A4 56            [ 7]  478 	ld	d, (hl)
   49A5 C5            [11]  479 	push	bc
   49A6 21 08 29      [10]  480 	ld	hl, #0x2908
   49A9 E5            [11]  481 	push	hl
   49AA FD E5         [15]  482 	push	iy
   49AC D5            [11]  483 	push	de
   49AD CD 7C 51      [17]  484 	call	_cpct_drawSprite
   49B0 C1            [10]  485 	pop	bc
                            486 ;src/main.c:123: for (i=selected_card+1;i<10;i++){
   49B1 DD 34 FF      [23]  487 	inc	-1 (ix)
   49B4 18 B5         [12]  488 	jr	00107$
   49B6                     489 00102$:
                            490 ;src/main.c:128: cpct_waitHalts(20);
   49B6 C5            [11]  491 	push	bc
   49B7 2E 14         [ 7]  492 	ld	l, #0x14
   49B9 CD 2B 52      [17]  493 	call	_cpct_waitHalts
   49BC C1            [10]  494 	pop	bc
                            495 ;src/main.c:130: pvmem = cpct_getScreenPtr((u8*) 0xC000, 3+(selected_card*(S_CARDS_0_W-3)), 95);
   49BD 3A D8 5F      [13]  496 	ld	a,(#_selected_card + 0)
   49C0 5F            [ 4]  497 	ld	e, a
   49C1 87            [ 4]  498 	add	a, a
   49C2 87            [ 4]  499 	add	a, a
   49C3 83            [ 4]  500 	add	a, e
   49C4 57            [ 4]  501 	ld	d, a
   49C5 14            [ 4]  502 	inc	d
   49C6 14            [ 4]  503 	inc	d
   49C7 14            [ 4]  504 	inc	d
   49C8 C5            [11]  505 	push	bc
   49C9 3E 5F         [ 7]  506 	ld	a, #0x5f
   49CB F5            [11]  507 	push	af
   49CC 33            [ 6]  508 	inc	sp
   49CD D5            [11]  509 	push	de
   49CE 33            [ 6]  510 	inc	sp
   49CF 21 00 C0      [10]  511 	ld	hl, #0xc000
   49D2 E5            [11]  512 	push	hl
   49D3 CD D6 53      [17]  513 	call	_cpct_getScreenPtr
   49D6 C1            [10]  514 	pop	bc
   49D7 22 A4 5F      [16]  515 	ld	(_pvmem), hl
                            516 ;src/main.c:131: cpct_drawSprite(card_sprite[cards[selected_card]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   49DA 2A A4 5F      [16]  517 	ld	hl, (_pvmem)
   49DD DD 75 FD      [19]  518 	ld	-3 (ix), l
   49E0 DD 74 FE      [19]  519 	ld	-2 (ix), h
   49E3 2A D8 5F      [16]  520 	ld	hl, (_selected_card)
   49E6 26 00         [ 7]  521 	ld	h, #0x00
   49E8 09            [11]  522 	add	hl, bc
   49E9 6E            [ 7]  523 	ld	l, (hl)
   49EA 26 00         [ 7]  524 	ld	h, #0x00
   49EC 29            [11]  525 	add	hl, hl
   49ED 11 73 47      [10]  526 	ld	de, #_card_sprite
   49F0 19            [11]  527 	add	hl, de
   49F1 5E            [ 7]  528 	ld	e, (hl)
   49F2 23            [ 6]  529 	inc	hl
   49F3 56            [ 7]  530 	ld	d, (hl)
   49F4 C5            [11]  531 	push	bc
   49F5 21 08 29      [10]  532 	ld	hl, #0x2908
   49F8 E5            [11]  533 	push	hl
   49F9 DD 6E FD      [19]  534 	ld	l,-3 (ix)
   49FC DD 66 FE      [19]  535 	ld	h,-2 (ix)
   49FF E5            [11]  536 	push	hl
   4A00 D5            [11]  537 	push	de
   4A01 CD 7C 51      [17]  538 	call	_cpct_drawSprite
   4A04 2E 14         [ 7]  539 	ld	l, #0x14
   4A06 CD 2B 52      [17]  540 	call	_cpct_waitHalts
   4A09 C1            [10]  541 	pop	bc
                            542 ;src/main.c:134: drawTextM1(card_description[cards[selected_card]],10,150,NORMALHEIGHT);
   4A0A 2A D8 5F      [16]  543 	ld	hl, (_selected_card)
   4A0D 26 00         [ 7]  544 	ld	h, #0x00
   4A0F 09            [11]  545 	add	hl, bc
   4A10 4E            [ 7]  546 	ld	c, (hl)
   4A11 06 00         [ 7]  547 	ld	b,#0x00
   4A13 69            [ 4]  548 	ld	l, c
   4A14 60            [ 4]  549 	ld	h, b
   4A15 29            [11]  550 	add	hl, hl
   4A16 09            [11]  551 	add	hl, bc
   4A17 29            [11]  552 	add	hl, hl
   4A18 29            [11]  553 	add	hl, hl
   4A19 29            [11]  554 	add	hl, hl
   4A1A 09            [11]  555 	add	hl, bc
   4A1B 29            [11]  556 	add	hl, hl
   4A1C 11 77 47      [10]  557 	ld	de, #_card_description
   4A1F 19            [11]  558 	add	hl, de
   4A20 01 96 01      [10]  559 	ld	bc, #0x0196
   4A23 C5            [11]  560 	push	bc
   4A24 3E 0A         [ 7]  561 	ld	a, #0x0a
   4A26 F5            [11]  562 	push	af
   4A27 33            [ 6]  563 	inc	sp
   4A28 E5            [11]  564 	push	hl
   4A29 CD 6C 4B      [17]  565 	call	_drawTextM1
   4A2C F1            [10]  566 	pop	af
   4A2D F1            [10]  567 	pop	af
   4A2E 33            [ 6]  568 	inc	sp
                            569 ;src/main.c:136: cpct_waitHalts(20);
   4A2F 2E 14         [ 7]  570 	ld	l, #0x14
   4A31 CD 2B 52      [17]  571 	call	_cpct_waitHalts
                            572 ;src/main.c:137: sprintf(aux_txt, "SELECTED:%1d", selected_card);
   4A34 21 D8 5F      [10]  573 	ld	hl,#_selected_card + 0
   4A37 4E            [ 7]  574 	ld	c, (hl)
   4A38 06 00         [ 7]  575 	ld	b, #0x00
   4A3A C5            [11]  576 	push	bc
   4A3B 21 5F 4A      [10]  577 	ld	hl, #___str_2
   4A3E E5            [11]  578 	push	hl
   4A3F 21 A6 5F      [10]  579 	ld	hl, #_aux_txt
   4A42 E5            [11]  580 	push	hl
   4A43 CD D0 52      [17]  581 	call	_sprintf
   4A46 21 06 00      [10]  582 	ld	hl, #6
   4A49 39            [11]  583 	add	hl, sp
   4A4A F9            [ 6]  584 	ld	sp, hl
                            585 ;src/main.c:138: drawTextM1(aux_txt,10,160,NORMALHEIGHT);
   4A4B 21 A0 01      [10]  586 	ld	hl, #0x01a0
   4A4E E5            [11]  587 	push	hl
   4A4F 3E 0A         [ 7]  588 	ld	a, #0x0a
   4A51 F5            [11]  589 	push	af
   4A52 33            [ 6]  590 	inc	sp
   4A53 21 A6 5F      [10]  591 	ld	hl, #_aux_txt
   4A56 E5            [11]  592 	push	hl
   4A57 CD 6C 4B      [17]  593 	call	_drawTextM1
   4A5A DD F9         [10]  594 	ld	sp,ix
   4A5C DD E1         [14]  595 	pop	ix
   4A5E C9            [10]  596 	ret
   4A5F                     597 ___str_2:
   4A5F 53 45 4C 45 43 54   598 	.ascii "SELECTED:%1d"
        45 44 3A 25 31 64
   4A6B 00                  599 	.db 0x00
                            600 ;src/main.c:142: void main(void) {
                            601 ;	---------------------------------
                            602 ; Function main
                            603 ; ---------------------------------
   4A6C                     604 _main::
                            605 ;src/main.c:144: initCPC();
   4A6C CD DB 47      [17]  606 	call	_initCPC
                            607 ;src/main.c:146: selected_card = 4;
   4A6F 21 D8 5F      [10]  608 	ld	hl,#_selected_card + 0
   4A72 36 04         [10]  609 	ld	(hl), #0x04
                            610 ;src/main.c:147: previous_card = 4;
   4A74 21 D9 5F      [10]  611 	ld	hl,#_previous_card + 0
   4A77 36 04         [10]  612 	ld	(hl), #0x04
                            613 ;src/main.c:148: moved = NO;
   4A79 21 DA 5F      [10]  614 	ld	hl,#_moved + 0
   4A7C 36 00         [10]  615 	ld	(hl), #0x00
                            616 ;src/main.c:150: draw_cards();
   4A7E CD 5B 48      [17]  617 	call	_draw_cards
                            618 ;src/main.c:152: drawTextM1("!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",10,190,NORMALHEIGHT);
   4A81 21 BE 01      [10]  619 	ld	hl, #0x01be
   4A84 E5            [11]  620 	push	hl
   4A85 3E 0A         [ 7]  621 	ld	a, #0x0a
   4A87 F5            [11]  622 	push	af
   4A88 33            [ 6]  623 	inc	sp
   4A89 21 A6 4A      [10]  624 	ld	hl, #___str_3
   4A8C E5            [11]  625 	push	hl
   4A8D CD 6C 4B      [17]  626 	call	_drawTextM1
   4A90 F1            [10]  627 	pop	af
   4A91 F1            [10]  628 	pop	af
   4A92 33            [ 6]  629 	inc	sp
                            630 ;src/main.c:155: while (1){
   4A93                     631 00104$:
                            632 ;src/main.c:156: check_keyboard();
   4A93 CD 14 48      [17]  633 	call	_check_keyboard
                            634 ;src/main.c:157: if (moved){
   4A96 3A DA 5F      [13]  635 	ld	a,(#_moved + 0)
   4A99 B7            [ 4]  636 	or	a, a
   4A9A 28 F7         [12]  637 	jr	Z,00104$
                            638 ;src/main.c:158: draw_cards();
   4A9C CD 5B 48      [17]  639 	call	_draw_cards
                            640 ;src/main.c:159: moved = NO;
   4A9F 21 DA 5F      [10]  641 	ld	hl,#_moved + 0
   4AA2 36 00         [10]  642 	ld	(hl), #0x00
   4AA4 18 ED         [12]  643 	jr	00104$
   4AA6                     644 ___str_3:
   4AA6 21 2C 2D 2E 30 31   645 	.ascii "!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        32 33 34 35 36 37
        38 39 3A 3F 40 41
        42 43 44 45 46 47
        48 49 4A 4B 4C 4D
        4E 4F 50 51 52 53
        54 55 56 57 58 59
        5A
   4AD1 00                  646 	.db 0x00
                            647 	.area _CODE
                            648 	.area _INITIALIZER
                            649 	.area _CABS (ABS)
