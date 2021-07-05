                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _init_cards
                             13 	.globl _update_selected_card
                             14 	.globl _draw_cards
                             15 	.globl _check_keyboard
                             16 	.globl _initCPC
                             17 	.globl _myInterruptHandler
                             18 	.globl _drawText
                             19 	.globl _drawTextM1
                             20 	.globl _sprintf
                             21 	.globl _cpct_getRandom_mxor_u8
                             22 	.globl _cpct_setCRTCReg
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setVideoMemoryPage
                             25 	.globl _cpct_setPALColour
                             26 	.globl _cpct_setPalette
                             27 	.globl _cpct_waitVSYNC
                             28 	.globl _cpct_setVideoMode
                             29 	.globl _cpct_drawSprite
                             30 	.globl _cpct_drawSolidBox
                             31 	.globl _cpct_isKeyPressed
                             32 	.globl _cpct_scanKeyboard
                             33 	.globl _cpct_waitHalts
                             34 	.globl _cpct_setStackLocation
                             35 	.globl _cpct_memset
                             36 	.globl _cpct_setInterruptHandler
                             37 	.globl _cpct_disableFirmware
                             38 	.globl _moved
                             39 	.globl _num_cards
                             40 	.globl _cards
                             41 	.globl _previous_card
                             42 	.globl _selected_card
                             43 	.globl _aux_txt
                             44 	.globl _pvmem
                             45 	.globl _i_time
                             46 	.globl _card_description
                             47 	.globl _card_sprite
                             48 	.globl _card_types
                             49 ;--------------------------------------------------------
                             50 ; special function registers
                             51 ;--------------------------------------------------------
                             52 ;--------------------------------------------------------
                             53 ; ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DATA
   22A9                      56 _i_time::
   22A9                      57 	.ds 4
   22AD                      58 _pvmem::
   22AD                      59 	.ds 2
   22AF                      60 _aux_txt::
   22AF                      61 	.ds 50
   22E1                      62 _selected_card::
   22E1                      63 	.ds 1
   22E2                      64 _previous_card::
   22E2                      65 	.ds 1
   22E3                      66 _cards::
   22E3                      67 	.ds 20
   22F7                      68 _num_cards::
   22F7                      69 	.ds 1
   22F8                      70 _moved::
   22F8                      71 	.ds 1
   22F9                      72 _myInterruptHandler_g_nInterrupt_1_125:
   22F9                      73 	.ds 1
                             74 ;--------------------------------------------------------
                             75 ; ram data
                             76 ;--------------------------------------------------------
                             77 	.area _INITIALIZED
                             78 ;--------------------------------------------------------
                             79 ; absolute external ram data
                             80 ;--------------------------------------------------------
                             81 	.area _DABS (ABS)
                             82 ;--------------------------------------------------------
                             83 ; global & static initialisations
                             84 ;--------------------------------------------------------
                             85 	.area _HOME
                             86 	.area _GSINIT
                             87 	.area _GSFINAL
                             88 	.area _GSINIT
                             89 ;src/main.c:61: static u8 g_nInterrupt = 0; // Manage Interrupt
   22FA FD 21 F9 22   [14]   90 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
   22FE FD 36 00 00   [19]   91 	ld	0 (iy), #0x00
                             92 ;--------------------------------------------------------
                             93 ; Home
                             94 ;--------------------------------------------------------
                             95 	.area _HOME
                             96 	.area _HOME
                             97 ;--------------------------------------------------------
                             98 ; code
                             99 ;--------------------------------------------------------
                            100 	.area _CODE
                            101 ;src/main.c:60: void myInterruptHandler(){
                            102 ;	---------------------------------
                            103 ; Function myInterruptHandler
                            104 ; ---------------------------------
   075B                     105 _myInterruptHandler::
                            106 ;src/main.c:63: i_time++;
   075B FD 21 A9 22   [14]  107 	ld	iy, #_i_time
   075F FD 34 00      [23]  108 	inc	0 (iy)
   0762 20 0D         [12]  109 	jr	NZ,00130$
   0764 FD 34 01      [23]  110 	inc	1 (iy)
   0767 20 08         [12]  111 	jr	NZ,00130$
   0769 FD 34 02      [23]  112 	inc	2 (iy)
   076C 20 03         [12]  113 	jr	NZ,00130$
   076E FD 34 03      [23]  114 	inc	3 (iy)
   0771                     115 00130$:
                            116 ;src/main.c:64: g_nInterrupt++;
   0771 FD 21 F9 22   [14]  117 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
   0775 FD 34 00      [23]  118 	inc	0 (iy)
                            119 ;src/main.c:65: switch (g_nInterrupt){
   0778 FD 7E 00      [19]  120 	ld	a, 0 (iy)
   077B 3D            [ 4]  121 	dec	a
   077C 28 1E         [12]  122 	jr	Z,00101$
   077E FD 7E 00      [19]  123 	ld	a, 0 (iy)
   0781 D6 02         [ 7]  124 	sub	a, #0x02
   0783 28 1F         [12]  125 	jr	Z,00102$
   0785 FD 7E 00      [19]  126 	ld	a, 0 (iy)
   0788 D6 03         [ 7]  127 	sub	a, #0x03
   078A 28 30         [12]  128 	jr	Z,00103$
   078C FD 7E 00      [19]  129 	ld	a, 0 (iy)
   078F D6 04         [ 7]  130 	sub	a, #0x04
   0791 28 31         [12]  131 	jr	Z,00104$
   0793 FD 7E 00      [19]  132 	ld	a, 0 (iy)
   0796 D6 05         [ 7]  133 	sub	a, #0x05
   0798 28 32         [12]  134 	jr	Z,00105$
   079A 18 3F         [12]  135 	jr	00106$
                            136 ;src/main.c:66: case 1:
   079C                     137 00101$:
                            138 ;src/main.c:67: cpct_setBorder(HW_LIME);
   079C 21 10 1A      [10]  139 	ld	hl, #0x1a10
   079F E5            [11]  140 	push	hl
   07A0 CD F7 13      [17]  141 	call	_cpct_setPALColour
                            142 ;src/main.c:68: break;
   07A3 C9            [10]  143 	ret
                            144 ;src/main.c:69: case 2:
   07A4                     145 00102$:
                            146 ;src/main.c:74: cpct_setBorder(HW_CYAN);
   07A4 21 10 06      [10]  147 	ld	hl, #0x0610
   07A7 E5            [11]  148 	push	hl
   07A8 CD F7 13      [17]  149 	call	_cpct_setPALColour
                            150 ;src/main.c:75: cpct_setVideoMode(0);
   07AB 2E 00         [ 7]  151 	ld	l, #0x00
   07AD CD AE 15      [17]  152 	call	_cpct_setVideoMode
                            153 ;src/main.c:76: cpct_setPalette(g_palette0, 16);
   07B0 21 10 00      [10]  154 	ld	hl, #0x0010
   07B3 E5            [11]  155 	push	hl
   07B4 21 4B 07      [10]  156 	ld	hl, #_g_palette0
   07B7 E5            [11]  157 	push	hl
   07B8 CD D4 13      [17]  158 	call	_cpct_setPalette
                            159 ;src/main.c:77: break;
   07BB C9            [10]  160 	ret
                            161 ;src/main.c:78: case 3:
   07BC                     162 00103$:
                            163 ;src/main.c:79: cpct_setBorder(HW_RED);
   07BC 21 10 1C      [10]  164 	ld	hl, #0x1c10
   07BF E5            [11]  165 	push	hl
   07C0 CD F7 13      [17]  166 	call	_cpct_setPALColour
                            167 ;src/main.c:80: break;
   07C3 C9            [10]  168 	ret
                            169 ;src/main.c:81: case 4:
   07C4                     170 00104$:
                            171 ;src/main.c:82: cpct_setBorder(HW_YELLOW);
   07C4 21 10 1E      [10]  172 	ld	hl, #0x1e10
   07C7 E5            [11]  173 	push	hl
   07C8 CD F7 13      [17]  174 	call	_cpct_setPALColour
                            175 ;src/main.c:83: break;
   07CB C9            [10]  176 	ret
                            177 ;src/main.c:84: case 5:
   07CC                     178 00105$:
                            179 ;src/main.c:85: cpct_setBorder(HW_BLACK);
   07CC 21 10 14      [10]  180 	ld	hl, #0x1410
   07CF E5            [11]  181 	push	hl
   07D0 CD F7 13      [17]  182 	call	_cpct_setPALColour
                            183 ;src/main.c:91: cpct_setBorder(HW_MAGENTA);
   07D3 21 10 18      [10]  184 	ld	hl, #0x1810
   07D6 E5            [11]  185 	push	hl
   07D7 CD F7 13      [17]  186 	call	_cpct_setPALColour
                            187 ;src/main.c:92: break;
   07DA C9            [10]  188 	ret
                            189 ;src/main.c:93: default:
   07DB                     190 00106$:
                            191 ;src/main.c:94: cpct_setBorder(HW_BRIGHT_BLUE);
   07DB 21 10 15      [10]  192 	ld	hl, #0x1510
   07DE E5            [11]  193 	push	hl
   07DF CD F7 13      [17]  194 	call	_cpct_setPALColour
                            195 ;src/main.c:95: cpct_setVideoMode(1);
   07E2 2E 01         [ 7]  196 	ld	l, #0x01
   07E4 CD AE 15      [17]  197 	call	_cpct_setVideoMode
                            198 ;src/main.c:96: cpct_setPalette(g_palette1, 4);
   07E7 21 04 00      [10]  199 	ld	hl, #0x0004
   07EA E5            [11]  200 	push	hl
   07EB 21 C3 01      [10]  201 	ld	hl, #_g_palette1
   07EE E5            [11]  202 	push	hl
   07EF CD D4 13      [17]  203 	call	_cpct_setPalette
                            204 ;src/main.c:97: cpct_scanKeyboard();
   07F2 CD D8 16      [17]  205 	call	_cpct_scanKeyboard
                            206 ;src/main.c:98: g_nInterrupt = 0;
   07F5 21 F9 22      [10]  207 	ld	hl,#_myInterruptHandler_g_nInterrupt_1_125 + 0
   07F8 36 00         [10]  208 	ld	(hl), #0x00
                            209 ;src/main.c:100: }
   07FA C9            [10]  210 	ret
   07FB                     211 _card_types:
   07FB 02                  212 	.db #0x02	; 2
   07FC BB 04               213 	.dw _s_cards_0
   07FE 53 57 4F 52 44 3A   214 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   0827 00                  215 	.db 0x00
   0828 00                  216 	.db 0x00
   0829 00                  217 	.db 0x00
   082A 00                  218 	.db 0x00
   082B 00                  219 	.db 0x00
   082C 00                  220 	.db 0x00
   082D 00                  221 	.db 0x00
   082E 00                  222 	.db 0x00
   082F 00                  223 	.db 0x00
   0830 01                  224 	.db #0x01	; 1
   0831 03 06               225 	.dw _s_cards_1
   0833 53 48 49 45 4C 44   226 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   084E 00                  227 	.db 0x00
   084F 00                  228 	.db 0x00
   0850 00                  229 	.db 0x00
   0851 00                  230 	.db 0x00
   0852 00                  231 	.db 0x00
   0853 00                  232 	.db 0x00
   0854 00                  233 	.db 0x00
   0855 00                  234 	.db 0x00
   0856 00                  235 	.db 0x00
   0857 00                  236 	.db 0x00
   0858 00                  237 	.db 0x00
   0859 00                  238 	.db 0x00
   085A 00                  239 	.db 0x00
   085B 00                  240 	.db 0x00
   085C 00                  241 	.db 0x00
   085D 00                  242 	.db 0x00
   085E 00                  243 	.db 0x00
   085F 00                  244 	.db 0x00
   0860 00                  245 	.db 0x00
   0861 00                  246 	.db 0x00
   0862 00                  247 	.db 0x00
   0863 00                  248 	.db 0x00
   0864 00                  249 	.db 0x00
   0865                     250 _card_sprite:
   0865 BB 04               251 	.dw _s_cards_0
   0867 03 06               252 	.dw _s_cards_1
   0869                     253 _card_description:
   0869 53 57 4F 52 44 3A   254 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   0892 00                  255 	.db 0x00
   0893 00                  256 	.db 0x00
   0894 00                  257 	.db 0x00
   0895 00                  258 	.db 0x00
   0896 00                  259 	.db 0x00
   0897 00                  260 	.db 0x00
   0898 00                  261 	.db 0x00
   0899 00                  262 	.db 0x00
   089A 00                  263 	.db 0x00
   089B 53 48 49 45 4C 44   264 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   08B6 00                  265 	.db 0x00
   08B7 00                  266 	.db 0x00
   08B8 00                  267 	.db 0x00
   08B9 00                  268 	.db 0x00
   08BA 00                  269 	.db 0x00
   08BB 00                  270 	.db 0x00
   08BC 00                  271 	.db 0x00
   08BD 00                  272 	.db 0x00
   08BE 00                  273 	.db 0x00
   08BF 00                  274 	.db 0x00
   08C0 00                  275 	.db 0x00
   08C1 00                  276 	.db 0x00
   08C2 00                  277 	.db 0x00
   08C3 00                  278 	.db 0x00
   08C4 00                  279 	.db 0x00
   08C5 00                  280 	.db 0x00
   08C6 00                  281 	.db 0x00
   08C7 00                  282 	.db 0x00
   08C8 00                  283 	.db 0x00
   08C9 00                  284 	.db 0x00
   08CA 00                  285 	.db 0x00
   08CB 00                  286 	.db 0x00
   08CC 00                  287 	.db 0x00
                            288 ;src/main.c:103: void initCPC() {
                            289 ;	---------------------------------
                            290 ; Function initCPC
                            291 ; ---------------------------------
   08CD                     292 _initCPC::
                            293 ;src/main.c:108: cpct_setPalette(g_palette0, 16);
   08CD 21 10 00      [10]  294 	ld	hl, #0x0010
   08D0 E5            [11]  295 	push	hl
   08D1 21 4B 07      [10]  296 	ld	hl, #_g_palette0
   08D4 E5            [11]  297 	push	hl
   08D5 CD D4 13      [17]  298 	call	_cpct_setPalette
                            299 ;src/main.c:109: cpct_setVideoMode(0);
   08D8 2E 00         [ 7]  300 	ld	l, #0x00
   08DA CD AE 15      [17]  301 	call	_cpct_setVideoMode
                            302 ;src/main.c:110: cpct_memset((u8*)0x8000,0,0x8000);
   08DD 21 00 80      [10]  303 	ld	hl, #0x8000
   08E0 E5            [11]  304 	push	hl
   08E1 AF            [ 4]  305 	xor	a, a
   08E2 F5            [11]  306 	push	af
   08E3 33            [ 6]  307 	inc	sp
   08E4 2E 00         [ 7]  308 	ld	l, #0x00
   08E6 E5            [11]  309 	push	hl
   08E7 CD BC 15      [17]  310 	call	_cpct_memset
                            311 ;src/main.c:113: cpct_setCRTCReg(6, 34);
   08EA 21 06 22      [10]  312 	ld	hl, #0x2206
   08ED E5            [11]  313 	push	hl
   08EE CD AA 16      [17]  314 	call	_cpct_setCRTCReg
                            315 ;src/main.c:114: cpct_setCRTCReg(7, 35);
   08F1 21 07 23      [10]  316 	ld	hl, #0x2307
   08F4 E5            [11]  317 	push	hl
   08F5 CD AA 16      [17]  318 	call	_cpct_setCRTCReg
                            319 ;src/main.c:115: cpct_setVideoMemoryPage(cpct_page80);
   08F8 2E 20         [ 7]  320 	ld	l, #0x20
   08FA CD 0F 15      [17]  321 	call	_cpct_setVideoMemoryPage
                            322 ;src/main.c:118: cpct_waitVSYNC();
   08FD CD A6 15      [17]  323 	call	_cpct_waitVSYNC
                            324 ;src/main.c:119: cpct_waitHalts(2);
   0900 2E 02         [ 7]  325 	ld	l, #0x02
   0902 CD C9 14      [17]  326 	call	_cpct_waitHalts
                            327 ;src/main.c:120: cpct_waitVSYNC();
   0905 CD A6 15      [17]  328 	call	_cpct_waitVSYNC
                            329 ;src/main.c:121: cpct_setInterruptHandler(myInterruptHandler);
   0908 21 5B 07      [10]  330 	ld	hl, #_myInterruptHandler
   090B CD 09 17      [17]  331 	call	_cpct_setInterruptHandler
   090E C9            [10]  332 	ret
                            333 ;src/main.c:124: void check_keyboard(){
                            334 ;	---------------------------------
                            335 ; Function check_keyboard
                            336 ; ---------------------------------
   090F                     337 _check_keyboard::
                            338 ;src/main.c:125: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
   090F 21 01 01      [10]  339 	ld	hl, #0x0101
   0912 CD EB 13      [17]  340 	call	_cpct_isKeyPressed
   0915 7D            [ 4]  341 	ld	a, l
   0916 B7            [ 4]  342 	or	a, a
   0917 28 1A         [12]  343 	jr	Z,00105$
   0919 FD 21 E1 22   [14]  344 	ld	iy, #_selected_card
   091D FD 7E 00      [19]  345 	ld	a, 0 (iy)
   0920 B7            [ 4]  346 	or	a, a
   0921 28 10         [12]  347 	jr	Z,00105$
                            348 ;src/main.c:126: previous_card = selected_card;
   0923 FD 7E 00      [19]  349 	ld	a, 0 (iy)
   0926 32 E2 22      [13]  350 	ld	(#_previous_card + 0),a
                            351 ;src/main.c:127: selected_card--;
   0929 21 E1 22      [10]  352 	ld	hl, #_selected_card+0
   092C 35            [11]  353 	dec	(hl)
                            354 ;src/main.c:128: moved = YES;
   092D 21 F8 22      [10]  355 	ld	hl,#_moved + 0
   0930 36 01         [10]  356 	ld	(hl), #0x01
   0932 C9            [10]  357 	ret
   0933                     358 00105$:
                            359 ;src/main.c:129: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<num_cards-1)){
   0933 21 00 02      [10]  360 	ld	hl, #0x0200
   0936 CD EB 13      [17]  361 	call	_cpct_isKeyPressed
   0939 7D            [ 4]  362 	ld	a, l
   093A B7            [ 4]  363 	or	a, a
   093B C8            [11]  364 	ret	Z
   093C 21 F7 22      [10]  365 	ld	hl,#_num_cards + 0
   093F 4E            [ 7]  366 	ld	c, (hl)
   0940 06 00         [ 7]  367 	ld	b, #0x00
   0942 0B            [ 6]  368 	dec	bc
   0943 3A E1 22      [13]  369 	ld	a,(#_selected_card + 0)
   0946 16 00         [ 7]  370 	ld	d, #0x00
   0948 91            [ 4]  371 	sub	a, c
   0949 7A            [ 4]  372 	ld	a, d
   094A 98            [ 4]  373 	sbc	a, b
   094B E2 50 09      [10]  374 	jp	PO, 00126$
   094E EE 80         [ 7]  375 	xor	a, #0x80
   0950                     376 00126$:
   0950 F0            [11]  377 	ret	P
                            378 ;src/main.c:130: previous_card = selected_card;
   0951 3A E1 22      [13]  379 	ld	a,(#_selected_card + 0)
   0954 32 E2 22      [13]  380 	ld	(#_previous_card + 0),a
                            381 ;src/main.c:131: selected_card++;
   0957 21 E1 22      [10]  382 	ld	hl, #_selected_card+0
   095A 34            [11]  383 	inc	(hl)
                            384 ;src/main.c:132: moved = YES;
   095B 21 F8 22      [10]  385 	ld	hl,#_moved + 0
   095E 36 01         [10]  386 	ld	(hl), #0x01
   0960 C9            [10]  387 	ret
                            388 ;src/main.c:136: void draw_cards(){
                            389 ;	---------------------------------
                            390 ; Function draw_cards
                            391 ; ---------------------------------
   0961                     392 _draw_cards::
   0961 DD E5         [15]  393 	push	ix
   0963 DD 21 00 00   [14]  394 	ld	ix,#0
   0967 DD 39         [15]  395 	add	ix,sp
   0969 F5            [11]  396 	push	af
   096A 3B            [ 6]  397 	dec	sp
                            398 ;src/main.c:141: cpct_waitVSYNC();
   096B CD A6 15      [17]  399 	call	_cpct_waitVSYNC
                            400 ;src/main.c:144: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W-3))-2, 160);
   096E 3A E2 22      [13]  401 	ld	a,(#_previous_card + 0)
   0971 4F            [ 4]  402 	ld	c, a
   0972 87            [ 4]  403 	add	a, a
   0973 87            [ 4]  404 	add	a, a
   0974 81            [ 4]  405 	add	a, c
   0975 47            [ 4]  406 	ld	b, a
   0976 05            [ 4]  407 	dec	b
   0977 05            [ 4]  408 	dec	b
   0978 3E A0         [ 7]  409 	ld	a, #0xa0
   097A F5            [11]  410 	push	af
   097B 33            [ 6]  411 	inc	sp
   097C C5            [11]  412 	push	bc
   097D 33            [ 6]  413 	inc	sp
   097E 21 00 80      [10]  414 	ld	hl, #0x8000
   0981 E5            [11]  415 	push	hl
   0982 CD B8 16      [17]  416 	call	_cpct_getScreenPtr
   0985 22 AD 22      [16]  417 	ld	(_pvmem), hl
                            418 ;src/main.c:145: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);  
   0988 2A AD 22      [16]  419 	ld	hl, (_pvmem)
   098B 01 0C 2D      [10]  420 	ld	bc, #0x2d0c
   098E C5            [11]  421 	push	bc
   098F 01 33 00      [10]  422 	ld	bc, #0x0033
   0992 C5            [11]  423 	push	bc
   0993 E5            [11]  424 	push	hl
   0994 CD FF 15      [17]  425 	call	_cpct_drawSolidBox
                            426 ;src/main.c:148: for (i=0;i<selected_card;i++){
   0997 DD 36 FD 00   [19]  427 	ld	-3 (ix), #0x00
   099B                     428 00104$:
   099B 21 E1 22      [10]  429 	ld	hl, #_selected_card
   099E DD 7E FD      [19]  430 	ld	a, -3 (ix)
   09A1 96            [ 7]  431 	sub	a, (hl)
   09A2 D2 3C 0A      [10]  432 	jp	NC, 00101$
                            433 ;src/main.c:149: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(i*(S_CARDS_0_W-3)), 164);
   09A5 DD 7E FD      [19]  434 	ld	a, -3 (ix)
   09A8 4F            [ 4]  435 	ld	c, a
   09A9 87            [ 4]  436 	add	a, a
   09AA 87            [ 4]  437 	add	a, a
   09AB 81            [ 4]  438 	add	a, c
   09AC DD 77 FE      [19]  439 	ld	-2 (ix), a
   09AF 47            [ 4]  440 	ld	b, a
   09B0 04            [ 4]  441 	inc	b
   09B1 04            [ 4]  442 	inc	b
   09B2 3E A4         [ 7]  443 	ld	a, #0xa4
   09B4 F5            [11]  444 	push	af
   09B5 33            [ 6]  445 	inc	sp
   09B6 C5            [11]  446 	push	bc
   09B7 33            [ 6]  447 	inc	sp
   09B8 21 00 80      [10]  448 	ld	hl, #0x8000
   09BB E5            [11]  449 	push	hl
   09BC CD B8 16      [17]  450 	call	_cpct_getScreenPtr
   09BF 22 AD 22      [16]  451 	ld	(_pvmem), hl
                            452 ;src/main.c:150: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   09C2 FD 2A AD 22   [20]  453 	ld	iy, (_pvmem)
   09C6 DD 6E FD      [19]  454 	ld	l, -3 (ix)
   09C9 26 00         [ 7]  455 	ld	h, #0x00
   09CB 29            [11]  456 	add	hl, hl
   09CC 01 E3 22      [10]  457 	ld	bc,#_cards
   09CF 09            [11]  458 	add	hl,bc
   09D0 4D            [ 4]  459 	ld	c, l
   09D1 44            [ 4]  460 	ld	b, h
   09D2 0A            [ 7]  461 	ld	a, (bc)
   09D3 5F            [ 4]  462 	ld	e,a
   09D4 16 00         [ 7]  463 	ld	d,#0x00
   09D6 6B            [ 4]  464 	ld	l, e
   09D7 62            [ 4]  465 	ld	h, d
   09D8 29            [11]  466 	add	hl, hl
   09D9 19            [11]  467 	add	hl, de
   09DA 29            [11]  468 	add	hl, hl
   09DB 29            [11]  469 	add	hl, hl
   09DC 19            [11]  470 	add	hl, de
   09DD 29            [11]  471 	add	hl, hl
   09DE 29            [11]  472 	add	hl, hl
   09DF 19            [11]  473 	add	hl, de
   09E0 11 FB 07      [10]  474 	ld	de, #_card_types
   09E3 19            [11]  475 	add	hl, de
   09E4 23            [ 6]  476 	inc	hl
   09E5 5E            [ 7]  477 	ld	e, (hl)
   09E6 23            [ 6]  478 	inc	hl
   09E7 56            [ 7]  479 	ld	d, (hl)
   09E8 C5            [11]  480 	push	bc
   09E9 21 08 29      [10]  481 	ld	hl, #0x2908
   09EC E5            [11]  482 	push	hl
   09ED FD E5         [15]  483 	push	iy
   09EF D5            [11]  484 	push	de
   09F0 CD 03 14      [17]  485 	call	_cpct_drawSprite
   09F3 C1            [10]  486 	pop	bc
                            487 ;src/main.c:151: sprintf(aux_txt,"%1d", card_types[cards[i].type].cost);   
   09F4 0A            [ 7]  488 	ld	a, (bc)
   09F5 4F            [ 4]  489 	ld	c,a
   09F6 06 00         [ 7]  490 	ld	b,#0x00
   09F8 69            [ 4]  491 	ld	l, c
   09F9 60            [ 4]  492 	ld	h, b
   09FA 29            [11]  493 	add	hl, hl
   09FB 09            [11]  494 	add	hl, bc
   09FC 29            [11]  495 	add	hl, hl
   09FD 29            [11]  496 	add	hl, hl
   09FE 09            [11]  497 	add	hl, bc
   09FF 29            [11]  498 	add	hl, hl
   0A00 29            [11]  499 	add	hl, hl
   0A01 09            [11]  500 	add	hl, bc
   0A02 11 FB 07      [10]  501 	ld	de, #_card_types
   0A05 19            [11]  502 	add	hl, de
   0A06 4E            [ 7]  503 	ld	c, (hl)
   0A07 06 00         [ 7]  504 	ld	b, #0x00
   0A09 C5            [11]  505 	push	bc
   0A0A 21 2A 0C      [10]  506 	ld	hl, #___str_2
   0A0D E5            [11]  507 	push	hl
   0A0E 21 AF 22      [10]  508 	ld	hl, #_aux_txt
   0A11 E5            [11]  509 	push	hl
   0A12 CD 71 15      [17]  510 	call	_sprintf
   0A15 21 06 00      [10]  511 	ld	hl, #6
   0A18 39            [11]  512 	add	hl, sp
   0A19 F9            [ 6]  513 	ld	sp, hl
                            514 ;src/main.c:152: drawText(aux_txt, 3+(i*(S_CARDS_0_W-3)),165, COLORTXT_WHITE ,NORMALHEIGHT);
   0A1A DD 46 FE      [19]  515 	ld	b, -2 (ix)
   0A1D 04            [ 4]  516 	inc	b
   0A1E 04            [ 4]  517 	inc	b
   0A1F 04            [ 4]  518 	inc	b
   0A20 21 00 01      [10]  519 	ld	hl, #0x0100
   0A23 E5            [11]  520 	push	hl
   0A24 3E A5         [ 7]  521 	ld	a, #0xa5
   0A26 F5            [11]  522 	push	af
   0A27 33            [ 6]  523 	inc	sp
   0A28 C5            [11]  524 	push	bc
   0A29 33            [ 6]  525 	inc	sp
   0A2A 21 AF 22      [10]  526 	ld	hl, #_aux_txt
   0A2D E5            [11]  527 	push	hl
   0A2E CD 05 10      [17]  528 	call	_drawText
   0A31 21 06 00      [10]  529 	ld	hl, #6
   0A34 39            [11]  530 	add	hl, sp
   0A35 F9            [ 6]  531 	ld	sp, hl
                            532 ;src/main.c:148: for (i=0;i<selected_card;i++){
   0A36 DD 34 FD      [23]  533 	inc	-3 (ix)
   0A39 C3 9B 09      [10]  534 	jp	00104$
   0A3C                     535 00101$:
                            536 ;src/main.c:156: for (i=selected_card+1;i<num_cards;i++){
   0A3C 3A E1 22      [13]  537 	ld	a,(#_selected_card + 0)
   0A3F 3C            [ 4]  538 	inc	a
   0A40 DD 77 FE      [19]  539 	ld	-2 (ix), a
   0A43                     540 00107$:
   0A43 21 F7 22      [10]  541 	ld	hl, #_num_cards
   0A46 DD 7E FE      [19]  542 	ld	a, -2 (ix)
   0A49 96            [ 7]  543 	sub	a, (hl)
   0A4A D2 E6 0A      [10]  544 	jp	NC, 00102$
                            545 ;src/main.c:157: pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(i*(S_CARDS_0_W-3)), 164);
   0A4D DD 7E FE      [19]  546 	ld	a, -2 (ix)
   0A50 4F            [ 4]  547 	ld	c, a
   0A51 87            [ 4]  548 	add	a, a
   0A52 87            [ 4]  549 	add	a, a
   0A53 81            [ 4]  550 	add	a, c
   0A54 DD 77 FF      [19]  551 	ld	-1 (ix), a
   0A57 47            [ 4]  552 	ld	b, a
   0A58 04            [ 4]  553 	inc	b
   0A59 04            [ 4]  554 	inc	b
   0A5A 04            [ 4]  555 	inc	b
   0A5B 04            [ 4]  556 	inc	b
   0A5C 3E A4         [ 7]  557 	ld	a, #0xa4
   0A5E F5            [11]  558 	push	af
   0A5F 33            [ 6]  559 	inc	sp
   0A60 C5            [11]  560 	push	bc
   0A61 33            [ 6]  561 	inc	sp
   0A62 21 00 80      [10]  562 	ld	hl, #0x8000
   0A65 E5            [11]  563 	push	hl
   0A66 CD B8 16      [17]  564 	call	_cpct_getScreenPtr
   0A69 22 AD 22      [16]  565 	ld	(_pvmem), hl
                            566 ;src/main.c:158: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0A6C FD 2A AD 22   [20]  567 	ld	iy, (_pvmem)
   0A70 DD 6E FE      [19]  568 	ld	l, -2 (ix)
   0A73 26 00         [ 7]  569 	ld	h, #0x00
   0A75 29            [11]  570 	add	hl, hl
   0A76 01 E3 22      [10]  571 	ld	bc,#_cards
   0A79 09            [11]  572 	add	hl,bc
   0A7A 4D            [ 4]  573 	ld	c, l
   0A7B 44            [ 4]  574 	ld	b, h
   0A7C 0A            [ 7]  575 	ld	a, (bc)
   0A7D 5F            [ 4]  576 	ld	e,a
   0A7E 16 00         [ 7]  577 	ld	d,#0x00
   0A80 6B            [ 4]  578 	ld	l, e
   0A81 62            [ 4]  579 	ld	h, d
   0A82 29            [11]  580 	add	hl, hl
   0A83 19            [11]  581 	add	hl, de
   0A84 29            [11]  582 	add	hl, hl
   0A85 29            [11]  583 	add	hl, hl
   0A86 19            [11]  584 	add	hl, de
   0A87 29            [11]  585 	add	hl, hl
   0A88 29            [11]  586 	add	hl, hl
   0A89 19            [11]  587 	add	hl, de
   0A8A 11 FB 07      [10]  588 	ld	de, #_card_types
   0A8D 19            [11]  589 	add	hl, de
   0A8E 23            [ 6]  590 	inc	hl
   0A8F 5E            [ 7]  591 	ld	e, (hl)
   0A90 23            [ 6]  592 	inc	hl
   0A91 56            [ 7]  593 	ld	d, (hl)
   0A92 C5            [11]  594 	push	bc
   0A93 21 08 29      [10]  595 	ld	hl, #0x2908
   0A96 E5            [11]  596 	push	hl
   0A97 FD E5         [15]  597 	push	iy
   0A99 D5            [11]  598 	push	de
   0A9A CD 03 14      [17]  599 	call	_cpct_drawSprite
   0A9D C1            [10]  600 	pop	bc
                            601 ;src/main.c:159: sprintf(aux_txt,"%1d", card_types[cards[i].type].cost);   
   0A9E 0A            [ 7]  602 	ld	a, (bc)
   0A9F 4F            [ 4]  603 	ld	c,a
   0AA0 06 00         [ 7]  604 	ld	b,#0x00
   0AA2 69            [ 4]  605 	ld	l, c
   0AA3 60            [ 4]  606 	ld	h, b
   0AA4 29            [11]  607 	add	hl, hl
   0AA5 09            [11]  608 	add	hl, bc
   0AA6 29            [11]  609 	add	hl, hl
   0AA7 29            [11]  610 	add	hl, hl
   0AA8 09            [11]  611 	add	hl, bc
   0AA9 29            [11]  612 	add	hl, hl
   0AAA 29            [11]  613 	add	hl, hl
   0AAB 09            [11]  614 	add	hl, bc
   0AAC 11 FB 07      [10]  615 	ld	de, #_card_types
   0AAF 19            [11]  616 	add	hl, de
   0AB0 4E            [ 7]  617 	ld	c, (hl)
   0AB1 06 00         [ 7]  618 	ld	b, #0x00
   0AB3 C5            [11]  619 	push	bc
   0AB4 21 2A 0C      [10]  620 	ld	hl, #___str_2
   0AB7 E5            [11]  621 	push	hl
   0AB8 21 AF 22      [10]  622 	ld	hl, #_aux_txt
   0ABB E5            [11]  623 	push	hl
   0ABC CD 71 15      [17]  624 	call	_sprintf
   0ABF 21 06 00      [10]  625 	ld	hl, #6
   0AC2 39            [11]  626 	add	hl, sp
   0AC3 F9            [ 6]  627 	ld	sp, hl
                            628 ;src/main.c:160: drawText(aux_txt, 5+(i*(S_CARDS_0_W-3)),165, COLORTXT_WHITE ,NORMALHEIGHT);
   0AC4 DD 7E FF      [19]  629 	ld	a, -1 (ix)
   0AC7 C6 05         [ 7]  630 	add	a, #0x05
   0AC9 47            [ 4]  631 	ld	b, a
   0ACA 21 00 01      [10]  632 	ld	hl, #0x0100
   0ACD E5            [11]  633 	push	hl
   0ACE 3E A5         [ 7]  634 	ld	a, #0xa5
   0AD0 F5            [11]  635 	push	af
   0AD1 33            [ 6]  636 	inc	sp
   0AD2 C5            [11]  637 	push	bc
   0AD3 33            [ 6]  638 	inc	sp
   0AD4 21 AF 22      [10]  639 	ld	hl, #_aux_txt
   0AD7 E5            [11]  640 	push	hl
   0AD8 CD 05 10      [17]  641 	call	_drawText
   0ADB 21 06 00      [10]  642 	ld	hl, #6
   0ADE 39            [11]  643 	add	hl, sp
   0ADF F9            [ 6]  644 	ld	sp, hl
                            645 ;src/main.c:156: for (i=selected_card+1;i<num_cards;i++){
   0AE0 DD 34 FE      [23]  646 	inc	-2 (ix)
   0AE3 C3 43 0A      [10]  647 	jp	00107$
   0AE6                     648 00102$:
                            649 ;src/main.c:164: pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(selected_card*(S_CARDS_0_W-3)), 160);
   0AE6 3A E1 22      [13]  650 	ld	a,(#_selected_card + 0)
   0AE9 4F            [ 4]  651 	ld	c, a
   0AEA 87            [ 4]  652 	add	a, a
   0AEB 87            [ 4]  653 	add	a, a
   0AEC 81            [ 4]  654 	add	a, c
   0AED 47            [ 4]  655 	ld	b, a
   0AEE 04            [ 4]  656 	inc	b
   0AEF 04            [ 4]  657 	inc	b
   0AF0 04            [ 4]  658 	inc	b
   0AF1 3E A0         [ 7]  659 	ld	a, #0xa0
   0AF3 F5            [11]  660 	push	af
   0AF4 33            [ 6]  661 	inc	sp
   0AF5 C5            [11]  662 	push	bc
   0AF6 33            [ 6]  663 	inc	sp
   0AF7 21 00 80      [10]  664 	ld	hl, #0x8000
   0AFA E5            [11]  665 	push	hl
   0AFB CD B8 16      [17]  666 	call	_cpct_getScreenPtr
   0AFE 22 AD 22      [16]  667 	ld	(_pvmem), hl
                            668 ;src/main.c:165: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0B01 ED 4B AD 22   [20]  669 	ld	bc, (_pvmem)
   0B05 FD 21 E1 22   [14]  670 	ld	iy, #_selected_card
   0B09 FD 6E 00      [19]  671 	ld	l, 0 (iy)
   0B0C 26 00         [ 7]  672 	ld	h, #0x00
   0B0E 29            [11]  673 	add	hl, hl
   0B0F 11 E3 22      [10]  674 	ld	de, #_cards
   0B12 19            [11]  675 	add	hl, de
   0B13 5E            [ 7]  676 	ld	e, (hl)
   0B14 16 00         [ 7]  677 	ld	d,#0x00
   0B16 6B            [ 4]  678 	ld	l, e
   0B17 62            [ 4]  679 	ld	h, d
   0B18 29            [11]  680 	add	hl, hl
   0B19 19            [11]  681 	add	hl, de
   0B1A 29            [11]  682 	add	hl, hl
   0B1B 29            [11]  683 	add	hl, hl
   0B1C 19            [11]  684 	add	hl, de
   0B1D 29            [11]  685 	add	hl, hl
   0B1E 29            [11]  686 	add	hl, hl
   0B1F 19            [11]  687 	add	hl, de
   0B20 11 FB 07      [10]  688 	ld	de, #_card_types
   0B23 19            [11]  689 	add	hl, de
   0B24 23            [ 6]  690 	inc	hl
   0B25 5E            [ 7]  691 	ld	e, (hl)
   0B26 23            [ 6]  692 	inc	hl
   0B27 56            [ 7]  693 	ld	d, (hl)
   0B28 21 08 29      [10]  694 	ld	hl, #0x2908
   0B2B E5            [11]  695 	push	hl
   0B2C C5            [11]  696 	push	bc
   0B2D D5            [11]  697 	push	de
   0B2E CD 03 14      [17]  698 	call	_cpct_drawSprite
                            699 ;src/main.c:166: sprintf(aux_txt,"%1d", card_types[cards[selected_card].type].cost);   
   0B31 FD 21 E1 22   [14]  700 	ld	iy, #_selected_card
   0B35 FD 6E 00      [19]  701 	ld	l, 0 (iy)
   0B38 26 00         [ 7]  702 	ld	h, #0x00
   0B3A 29            [11]  703 	add	hl, hl
   0B3B 11 E3 22      [10]  704 	ld	de, #_cards
   0B3E 19            [11]  705 	add	hl, de
   0B3F 4E            [ 7]  706 	ld	c, (hl)
   0B40 06 00         [ 7]  707 	ld	b,#0x00
   0B42 69            [ 4]  708 	ld	l, c
   0B43 60            [ 4]  709 	ld	h, b
   0B44 29            [11]  710 	add	hl, hl
   0B45 09            [11]  711 	add	hl, bc
   0B46 29            [11]  712 	add	hl, hl
   0B47 29            [11]  713 	add	hl, hl
   0B48 09            [11]  714 	add	hl, bc
   0B49 29            [11]  715 	add	hl, hl
   0B4A 29            [11]  716 	add	hl, hl
   0B4B 09            [11]  717 	add	hl, bc
   0B4C 11 FB 07      [10]  718 	ld	de, #_card_types
   0B4F 19            [11]  719 	add	hl, de
   0B50 4E            [ 7]  720 	ld	c, (hl)
   0B51 06 00         [ 7]  721 	ld	b, #0x00
   0B53 C5            [11]  722 	push	bc
   0B54 21 2A 0C      [10]  723 	ld	hl, #___str_2
   0B57 E5            [11]  724 	push	hl
   0B58 21 AF 22      [10]  725 	ld	hl, #_aux_txt
   0B5B E5            [11]  726 	push	hl
   0B5C CD 71 15      [17]  727 	call	_sprintf
   0B5F 21 06 00      [10]  728 	ld	hl, #6
   0B62 39            [11]  729 	add	hl, sp
   0B63 F9            [ 6]  730 	ld	sp, hl
                            731 ;src/main.c:167: drawText(aux_txt, 4+(selected_card*(S_CARDS_0_W-3)), 161, COLORTXT_WHITE ,NORMALHEIGHT);
   0B64 3A E1 22      [13]  732 	ld	a,(#_selected_card + 0)
   0B67 4F            [ 4]  733 	ld	c, a
   0B68 87            [ 4]  734 	add	a, a
   0B69 87            [ 4]  735 	add	a, a
   0B6A 81            [ 4]  736 	add	a, c
   0B6B 47            [ 4]  737 	ld	b, a
   0B6C 04            [ 4]  738 	inc	b
   0B6D 04            [ 4]  739 	inc	b
   0B6E 04            [ 4]  740 	inc	b
   0B6F 04            [ 4]  741 	inc	b
   0B70 21 00 01      [10]  742 	ld	hl, #0x0100
   0B73 E5            [11]  743 	push	hl
   0B74 3E A1         [ 7]  744 	ld	a, #0xa1
   0B76 F5            [11]  745 	push	af
   0B77 33            [ 6]  746 	inc	sp
   0B78 C5            [11]  747 	push	bc
   0B79 33            [ 6]  748 	inc	sp
   0B7A 21 AF 22      [10]  749 	ld	hl, #_aux_txt
   0B7D E5            [11]  750 	push	hl
   0B7E CD 05 10      [17]  751 	call	_drawText
   0B81 21 06 00      [10]  752 	ld	hl, #6
   0B84 39            [11]  753 	add	hl, sp
   0B85 F9            [ 6]  754 	ld	sp, hl
                            755 ;src/main.c:171: pvmem = cpct_getScreenPtr((u8*) VM_START, 10, 234);
   0B86 21 0A EA      [10]  756 	ld	hl, #0xea0a
   0B89 E5            [11]  757 	push	hl
   0B8A 21 00 80      [10]  758 	ld	hl, #0x8000
   0B8D E5            [11]  759 	push	hl
   0B8E CD B8 16      [17]  760 	call	_cpct_getScreenPtr
   0B91 22 AD 22      [16]  761 	ld	(_pvmem), hl
                            762 ;src/main.c:172: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
   0B94 2A AD 22      [16]  763 	ld	hl, (_pvmem)
   0B97 01 32 09      [10]  764 	ld	bc, #0x0932
   0B9A C5            [11]  765 	push	bc
   0B9B 01 00 00      [10]  766 	ld	bc, #0x0000
   0B9E C5            [11]  767 	push	bc
   0B9F E5            [11]  768 	push	hl
   0BA0 CD FF 15      [17]  769 	call	_cpct_drawSolidBox
                            770 ;src/main.c:174: drawTextM1(card_types[cards[selected_card].type].description,10,234,NORMALHEIGHT);
   0BA3 FD 21 E1 22   [14]  771 	ld	iy, #_selected_card
   0BA7 FD 6E 00      [19]  772 	ld	l, 0 (iy)
   0BAA 26 00         [ 7]  773 	ld	h, #0x00
   0BAC 29            [11]  774 	add	hl, hl
   0BAD 11 E3 22      [10]  775 	ld	de, #_cards
   0BB0 19            [11]  776 	add	hl, de
   0BB1 4E            [ 7]  777 	ld	c, (hl)
   0BB2 06 00         [ 7]  778 	ld	b,#0x00
   0BB4 69            [ 4]  779 	ld	l, c
   0BB5 60            [ 4]  780 	ld	h, b
   0BB6 29            [11]  781 	add	hl, hl
   0BB7 09            [11]  782 	add	hl, bc
   0BB8 29            [11]  783 	add	hl, hl
   0BB9 29            [11]  784 	add	hl, hl
   0BBA 09            [11]  785 	add	hl, bc
   0BBB 29            [11]  786 	add	hl, hl
   0BBC 29            [11]  787 	add	hl, hl
   0BBD 09            [11]  788 	add	hl, bc
   0BBE 11 FB 07      [10]  789 	ld	de, #_card_types
   0BC1 19            [11]  790 	add	hl, de
   0BC2 23            [ 6]  791 	inc	hl
   0BC3 23            [ 6]  792 	inc	hl
   0BC4 23            [ 6]  793 	inc	hl
   0BC5 4D            [ 4]  794 	ld	c, l
   0BC6 44            [ 4]  795 	ld	b, h
   0BC7 21 EA 01      [10]  796 	ld	hl, #0x01ea
   0BCA E5            [11]  797 	push	hl
   0BCB 3E 0A         [ 7]  798 	ld	a, #0x0a
   0BCD F5            [11]  799 	push	af
   0BCE 33            [ 6]  800 	inc	sp
   0BCF C5            [11]  801 	push	bc
   0BD0 CD F9 0D      [17]  802 	call	_drawTextM1
   0BD3 F1            [10]  803 	pop	af
   0BD4 F1            [10]  804 	pop	af
   0BD5 33            [ 6]  805 	inc	sp
                            806 ;src/main.c:177: sprintf(aux_txt, "PREVIOUS:%1d", previous_card);
   0BD6 21 E2 22      [10]  807 	ld	hl,#_previous_card + 0
   0BD9 4E            [ 7]  808 	ld	c, (hl)
   0BDA 06 00         [ 7]  809 	ld	b, #0x00
   0BDC C5            [11]  810 	push	bc
   0BDD 21 2E 0C      [10]  811 	ld	hl, #___str_3
   0BE0 E5            [11]  812 	push	hl
   0BE1 21 AF 22      [10]  813 	ld	hl, #_aux_txt
   0BE4 E5            [11]  814 	push	hl
   0BE5 CD 71 15      [17]  815 	call	_sprintf
   0BE8 21 06 00      [10]  816 	ld	hl, #6
   0BEB 39            [11]  817 	add	hl, sp
   0BEC F9            [ 6]  818 	ld	sp, hl
                            819 ;src/main.c:178: drawTextM1(aux_txt,10,244,NORMALHEIGHT);
   0BED 21 F4 01      [10]  820 	ld	hl, #0x01f4
   0BF0 E5            [11]  821 	push	hl
   0BF1 3E 0A         [ 7]  822 	ld	a, #0x0a
   0BF3 F5            [11]  823 	push	af
   0BF4 33            [ 6]  824 	inc	sp
   0BF5 21 AF 22      [10]  825 	ld	hl, #_aux_txt
   0BF8 E5            [11]  826 	push	hl
   0BF9 CD F9 0D      [17]  827 	call	_drawTextM1
   0BFC F1            [10]  828 	pop	af
   0BFD F1            [10]  829 	pop	af
   0BFE 33            [ 6]  830 	inc	sp
                            831 ;src/main.c:179: sprintf(aux_txt, "SELECTED:%1d", selected_card);
   0BFF 21 E1 22      [10]  832 	ld	hl,#_selected_card + 0
   0C02 4E            [ 7]  833 	ld	c, (hl)
   0C03 06 00         [ 7]  834 	ld	b, #0x00
   0C05 C5            [11]  835 	push	bc
   0C06 21 3B 0C      [10]  836 	ld	hl, #___str_4
   0C09 E5            [11]  837 	push	hl
   0C0A 21 AF 22      [10]  838 	ld	hl, #_aux_txt
   0C0D E5            [11]  839 	push	hl
   0C0E CD 71 15      [17]  840 	call	_sprintf
   0C11 21 06 00      [10]  841 	ld	hl, #6
   0C14 39            [11]  842 	add	hl, sp
   0C15 F9            [ 6]  843 	ld	sp, hl
                            844 ;src/main.c:180: drawTextM1(aux_txt,10,254,NORMALHEIGHT);
   0C16 21 FE 01      [10]  845 	ld	hl, #0x01fe
   0C19 E5            [11]  846 	push	hl
   0C1A 3E 0A         [ 7]  847 	ld	a, #0x0a
   0C1C F5            [11]  848 	push	af
   0C1D 33            [ 6]  849 	inc	sp
   0C1E 21 AF 22      [10]  850 	ld	hl, #_aux_txt
   0C21 E5            [11]  851 	push	hl
   0C22 CD F9 0D      [17]  852 	call	_drawTextM1
   0C25 DD F9         [10]  853 	ld	sp,ix
   0C27 DD E1         [14]  854 	pop	ix
   0C29 C9            [10]  855 	ret
   0C2A                     856 ___str_2:
   0C2A 25 31 64            857 	.ascii "%1d"
   0C2D 00                  858 	.db 0x00
   0C2E                     859 ___str_3:
   0C2E 50 52 45 56 49 4F   860 	.ascii "PREVIOUS:%1d"
        55 53 3A 25 31 64
   0C3A 00                  861 	.db 0x00
   0C3B                     862 ___str_4:
   0C3B 53 45 4C 45 43 54   863 	.ascii "SELECTED:%1d"
        45 44 3A 25 31 64
   0C47 00                  864 	.db 0x00
                            865 ;src/main.c:184: void update_selected_card(){
                            866 ;	---------------------------------
                            867 ; Function update_selected_card
                            868 ; ---------------------------------
   0C48                     869 _update_selected_card::
                            870 ;src/main.c:186: if (selected_card>0){
   0C48 3A E1 22      [13]  871 	ld	a,(#_selected_card + 0)
   0C4B B7            [ 4]  872 	or	a, a
   0C4C 28 2A         [12]  873 	jr	Z,00102$
                            874 ;src/main.c:187: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W))-2, 160);
   0C4E 3A E2 22      [13]  875 	ld	a,(#_previous_card + 0)
   0C51 07            [ 4]  876 	rlca
   0C52 07            [ 4]  877 	rlca
   0C53 07            [ 4]  878 	rlca
   0C54 E6 F8         [ 7]  879 	and	a, #0xf8
   0C56 47            [ 4]  880 	ld	b, a
   0C57 05            [ 4]  881 	dec	b
   0C58 05            [ 4]  882 	dec	b
   0C59 3E A0         [ 7]  883 	ld	a, #0xa0
   0C5B F5            [11]  884 	push	af
   0C5C 33            [ 6]  885 	inc	sp
   0C5D C5            [11]  886 	push	bc
   0C5E 33            [ 6]  887 	inc	sp
   0C5F 21 00 80      [10]  888 	ld	hl, #0x8000
   0C62 E5            [11]  889 	push	hl
   0C63 CD B8 16      [17]  890 	call	_cpct_getScreenPtr
   0C66 22 AD 22      [16]  891 	ld	(_pvmem), hl
                            892 ;src/main.c:188: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
   0C69 2A AD 22      [16]  893 	ld	hl, (_pvmem)
   0C6C 01 08 05      [10]  894 	ld	bc, #0x0508
   0C6F C5            [11]  895 	push	bc
   0C70 01 33 00      [10]  896 	ld	bc, #0x0033
   0C73 C5            [11]  897 	push	bc
   0C74 E5            [11]  898 	push	hl
   0C75 CD FF 15      [17]  899 	call	_cpct_drawSolidBox
   0C78                     900 00102$:
                            901 ;src/main.c:191: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(selected_card*(S_CARDS_0_W-3)), 164);
   0C78 3A E1 22      [13]  902 	ld	a,(#_selected_card + 0)
   0C7B 4F            [ 4]  903 	ld	c, a
   0C7C 87            [ 4]  904 	add	a, a
   0C7D 87            [ 4]  905 	add	a, a
   0C7E 81            [ 4]  906 	add	a, c
   0C7F 47            [ 4]  907 	ld	b, a
   0C80 04            [ 4]  908 	inc	b
   0C81 04            [ 4]  909 	inc	b
   0C82 3E A4         [ 7]  910 	ld	a, #0xa4
   0C84 F5            [11]  911 	push	af
   0C85 33            [ 6]  912 	inc	sp
   0C86 C5            [11]  913 	push	bc
   0C87 33            [ 6]  914 	inc	sp
   0C88 21 00 80      [10]  915 	ld	hl, #0x8000
   0C8B E5            [11]  916 	push	hl
   0C8C CD B8 16      [17]  917 	call	_cpct_getScreenPtr
   0C8F 22 AD 22      [16]  918 	ld	(_pvmem), hl
                            919 ;src/main.c:192: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0C92 ED 5B AD 22   [20]  920 	ld	de, (_pvmem)
   0C96 01 E3 22      [10]  921 	ld	bc, #_cards+0
   0C99 FD 21 E1 22   [14]  922 	ld	iy, #_selected_card
   0C9D FD 6E 00      [19]  923 	ld	l, 0 (iy)
   0CA0 26 00         [ 7]  924 	ld	h, #0x00
   0CA2 29            [11]  925 	add	hl, hl
   0CA3 09            [11]  926 	add	hl, bc
   0CA4 4E            [ 7]  927 	ld	c, (hl)
   0CA5 06 00         [ 7]  928 	ld	b,#0x00
   0CA7 69            [ 4]  929 	ld	l, c
   0CA8 60            [ 4]  930 	ld	h, b
   0CA9 29            [11]  931 	add	hl, hl
   0CAA 09            [11]  932 	add	hl, bc
   0CAB 29            [11]  933 	add	hl, hl
   0CAC 29            [11]  934 	add	hl, hl
   0CAD 09            [11]  935 	add	hl, bc
   0CAE 29            [11]  936 	add	hl, hl
   0CAF 29            [11]  937 	add	hl, hl
   0CB0 09            [11]  938 	add	hl, bc
   0CB1 01 FB 07      [10]  939 	ld	bc, #_card_types
   0CB4 09            [11]  940 	add	hl, bc
   0CB5 23            [ 6]  941 	inc	hl
   0CB6 4E            [ 7]  942 	ld	c, (hl)
   0CB7 23            [ 6]  943 	inc	hl
   0CB8 46            [ 7]  944 	ld	b, (hl)
   0CB9 21 08 29      [10]  945 	ld	hl, #0x2908
   0CBC E5            [11]  946 	push	hl
   0CBD D5            [11]  947 	push	de
   0CBE C5            [11]  948 	push	bc
   0CBF CD 03 14      [17]  949 	call	_cpct_drawSprite
   0CC2 C9            [10]  950 	ret
                            951 ;src/main.c:195: void init_cards(){
                            952 ;	---------------------------------
                            953 ; Function init_cards
                            954 ; ---------------------------------
   0CC3                     955 _init_cards::
                            956 ;src/main.c:198: num_cards = (cpct_rand() % 9) + 1;
   0CC3 CD DA 15      [17]  957 	call	_cpct_getRandom_mxor_u8
   0CC6 45            [ 4]  958 	ld	b, l
   0CC7 3E 09         [ 7]  959 	ld	a, #0x09
   0CC9 F5            [11]  960 	push	af
   0CCA 33            [ 6]  961 	inc	sp
   0CCB C5            [11]  962 	push	bc
   0CCC 33            [ 6]  963 	inc	sp
   0CCD CD A8 14      [17]  964 	call	__moduchar
   0CD0 F1            [10]  965 	pop	af
   0CD1 7D            [ 4]  966 	ld	a, l
   0CD2 21 F7 22      [10]  967 	ld	hl, #_num_cards
   0CD5 3C            [ 4]  968 	inc	a
   0CD6 77            [ 7]  969 	ld	(hl), a
                            970 ;src/main.c:199: for (i=0;i<num_cards;i++){
   0CD7 0E 00         [ 7]  971 	ld	c, #0x00
   0CD9                     972 00103$:
   0CD9 21 F7 22      [10]  973 	ld	hl, #_num_cards
   0CDC 79            [ 4]  974 	ld	a, c
   0CDD 96            [ 7]  975 	sub	a, (hl)
   0CDE D2 61 09      [10]  976 	jp	NC,_draw_cards
                            977 ;src/main.c:200: cards[i].type = cpct_rand() % 2;
   0CE1 69            [ 4]  978 	ld	l, c
   0CE2 26 00         [ 7]  979 	ld	h, #0x00
   0CE4 29            [11]  980 	add	hl, hl
   0CE5 11 E3 22      [10]  981 	ld	de, #_cards
   0CE8 19            [11]  982 	add	hl, de
   0CE9 E5            [11]  983 	push	hl
   0CEA C5            [11]  984 	push	bc
   0CEB CD DA 15      [17]  985 	call	_cpct_getRandom_mxor_u8
   0CEE 7D            [ 4]  986 	ld	a, l
   0CEF C1            [10]  987 	pop	bc
   0CF0 E1            [10]  988 	pop	hl
   0CF1 E6 01         [ 7]  989 	and	a, #0x01
   0CF3 77            [ 7]  990 	ld	(hl), a
                            991 ;src/main.c:199: for (i=0;i<num_cards;i++){
   0CF4 0C            [ 4]  992 	inc	c
   0CF5 18 E2         [12]  993 	jr	00103$
                            994 ;src/main.c:203: draw_cards();
   0CF7 C3 61 09      [10]  995 	jp  _draw_cards
                            996 ;src/main.c:206: void main(void) {
                            997 ;	---------------------------------
                            998 ; Function main
                            999 ; ---------------------------------
   0CFA                    1000 _main::
                           1001 ;src/main.c:207: cpct_disableFirmware();
   0CFA CD CA 15      [17] 1002 	call	_cpct_disableFirmware
                           1003 ;src/main.c:208: cpct_setStackLocation((u8*) 0x7fff);
   0CFD 21 FF 7F      [10] 1004 	ld	hl, #0x7fff
   0D00 CD 18 15      [17] 1005 	call	_cpct_setStackLocation
                           1006 ;src/main.c:210: initCPC();
   0D03 CD CD 08      [17] 1007 	call	_initCPC
                           1008 ;src/main.c:212: selected_card = 4;
   0D06 21 E1 22      [10] 1009 	ld	hl,#_selected_card + 0
   0D09 36 04         [10] 1010 	ld	(hl), #0x04
                           1011 ;src/main.c:213: previous_card = 4;
   0D0B 21 E2 22      [10] 1012 	ld	hl,#_previous_card + 0
   0D0E 36 04         [10] 1013 	ld	(hl), #0x04
                           1014 ;src/main.c:214: moved = NO;
   0D10 21 F8 22      [10] 1015 	ld	hl,#_moved + 0
   0D13 36 00         [10] 1016 	ld	(hl), #0x00
                           1017 ;src/main.c:216: drawTextM1("CARD HERO - DECK BUILDING GAME",10,0,NORMALHEIGHT);
   0D15 21 00 01      [10] 1018 	ld	hl, #0x0100
   0D18 E5            [11] 1019 	push	hl
   0D19 3E 0A         [ 7] 1020 	ld	a, #0x0a
   0D1B F5            [11] 1021 	push	af
   0D1C 33            [ 6] 1022 	inc	sp
   0D1D 21 40 0D      [10] 1023 	ld	hl, #___str_5
   0D20 E5            [11] 1024 	push	hl
   0D21 CD F9 0D      [17] 1025 	call	_drawTextM1
   0D24 F1            [10] 1026 	pop	af
   0D25 F1            [10] 1027 	pop	af
   0D26 33            [ 6] 1028 	inc	sp
                           1029 ;src/main.c:218: init_cards();
   0D27 CD C3 0C      [17] 1030 	call	_init_cards
                           1031 ;src/main.c:220: draw_cards();
   0D2A CD 61 09      [17] 1032 	call	_draw_cards
                           1033 ;src/main.c:223: while (1){
   0D2D                    1034 00104$:
                           1035 ;src/main.c:224: check_keyboard();
   0D2D CD 0F 09      [17] 1036 	call	_check_keyboard
                           1037 ;src/main.c:225: if (moved){
   0D30 3A F8 22      [13] 1038 	ld	a,(#_moved + 0)
   0D33 B7            [ 4] 1039 	or	a, a
   0D34 28 F7         [12] 1040 	jr	Z,00104$
                           1041 ;src/main.c:226: draw_cards();
   0D36 CD 61 09      [17] 1042 	call	_draw_cards
                           1043 ;src/main.c:227: moved = NO;
   0D39 21 F8 22      [10] 1044 	ld	hl,#_moved + 0
   0D3C 36 00         [10] 1045 	ld	(hl), #0x00
   0D3E 18 ED         [12] 1046 	jr	00104$
   0D40                    1047 ___str_5:
   0D40 43 41 52 44 20 48  1048 	.ascii "CARD HERO - DECK BUILDING GAME"
        45 52 4F 20 2D 20
        44 45 43 4B 20 42
        55 49 4C 44 49 4E
        47 20 47 41 4D 45
   0D5E 00                 1049 	.db 0x00
                           1050 	.area _CODE
                           1051 	.area _INITIALIZER
                           1052 	.area _CABS (ABS)
