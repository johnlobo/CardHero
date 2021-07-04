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
                             18 	.globl _drawTextM1
                             19 	.globl _sprintf
                             20 	.globl _cpct_getRandom_mxor_u8
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setPALColour
                             23 	.globl _cpct_setPalette
                             24 	.globl _cpct_waitVSYNC
                             25 	.globl _cpct_setVideoMode
                             26 	.globl _cpct_drawSprite
                             27 	.globl _cpct_drawSolidBox
                             28 	.globl _cpct_isKeyPressed
                             29 	.globl _cpct_scanKeyboard
                             30 	.globl _cpct_waitHalts
                             31 	.globl _cpct_memset_f64
                             32 	.globl _cpct_setInterruptHandler
                             33 	.globl _cpct_disableFirmware
                             34 	.globl _moved
                             35 	.globl _num_cards
                             36 	.globl _cards
                             37 	.globl _previous_card
                             38 	.globl _selected_card
                             39 	.globl _aux_txt
                             40 	.globl _pvmem
                             41 	.globl _i_time
                             42 	.globl _card_description
                             43 	.globl _card_sprite
                             44 ;--------------------------------------------------------
                             45 ; special function registers
                             46 ;--------------------------------------------------------
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DATA
   2107                      51 _i_time::
   2107                      52 	.ds 4
   210B                      53 _pvmem::
   210B                      54 	.ds 2
   210D                      55 _aux_txt::
   210D                      56 	.ds 50
   213F                      57 _selected_card::
   213F                      58 	.ds 1
   2140                      59 _previous_card::
   2140                      60 	.ds 1
   2141                      61 _cards::
   2141                      62 	.ds 10
   214B                      63 _num_cards::
   214B                      64 	.ds 1
   214C                      65 _moved::
   214C                      66 	.ds 1
   214D                      67 _myInterruptHandler_g_nInterrupt_1_124:
   214D                      68 	.ds 1
                             69 ;--------------------------------------------------------
                             70 ; ram data
                             71 ;--------------------------------------------------------
                             72 	.area _INITIALIZED
                             73 ;--------------------------------------------------------
                             74 ; absolute external ram data
                             75 ;--------------------------------------------------------
                             76 	.area _DABS (ABS)
                             77 ;--------------------------------------------------------
                             78 ; global & static initialisations
                             79 ;--------------------------------------------------------
                             80 	.area _HOME
                             81 	.area _GSINIT
                             82 	.area _GSFINAL
                             83 	.area _GSINIT
                             84 ;src/main.c:53: static u8 g_nInterrupt = 0; // Manage Interrupt
   214E FD 21 4D 21   [14]   85 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
   2152 FD 36 00 00   [19]   86 	ld	0 (iy), #0x00
                             87 ;--------------------------------------------------------
                             88 ; Home
                             89 ;--------------------------------------------------------
                             90 	.area _HOME
                             91 	.area _HOME
                             92 ;--------------------------------------------------------
                             93 ; code
                             94 ;--------------------------------------------------------
                             95 	.area _CODE
                             96 ;src/main.c:52: void myInterruptHandler(){
                             97 ;	---------------------------------
                             98 ; Function myInterruptHandler
                             99 ; ---------------------------------
   075B                     100 _myInterruptHandler::
                            101 ;src/main.c:55: i_time++;
   075B FD 21 07 21   [14]  102 	ld	iy, #_i_time
   075F FD 34 00      [23]  103 	inc	0 (iy)
   0762 20 0D         [12]  104 	jr	NZ,00144$
   0764 FD 34 01      [23]  105 	inc	1 (iy)
   0767 20 08         [12]  106 	jr	NZ,00144$
   0769 FD 34 02      [23]  107 	inc	2 (iy)
   076C 20 03         [12]  108 	jr	NZ,00144$
   076E FD 34 03      [23]  109 	inc	3 (iy)
   0771                     110 00144$:
                            111 ;src/main.c:56: g_nInterrupt++;
   0771 FD 21 4D 21   [14]  112 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_124
   0775 FD 34 00      [23]  113 	inc	0 (iy)
                            114 ;src/main.c:57: if (g_nInterrupt == 1){
   0778 FD 7E 00      [19]  115 	ld	a, 0 (iy)
                            116 ;src/main.c:58: cpct_setVideoMode(0);
   077B 3D            [ 4]  117 	dec	a
   077C 20 17         [12]  118 	jr	NZ,00116$
   077E 6F            [ 4]  119 	ld	l,a
   077F CD 28 14      [17]  120 	call	_cpct_setVideoMode
                            121 ;src/main.c:59: cpct_setPalette(g_palette0, 16);
   0782 21 10 00      [10]  122 	ld	hl, #0x0010
   0785 E5            [11]  123 	push	hl
   0786 21 4B 07      [10]  124 	ld	hl, #_g_palette0
   0789 E5            [11]  125 	push	hl
   078A CD 10 12      [17]  126 	call	_cpct_setPalette
                            127 ;src/main.c:60: cpct_setBorder(HW_BLACK);
   078D 21 10 14      [10]  128 	ld	hl, #0x1410
   0790 E5            [11]  129 	push	hl
   0791 CD 33 12      [17]  130 	call	_cpct_setPALColour
   0794 C9            [10]  131 	ret
   0795                     132 00116$:
                            133 ;src/main.c:62: if (g_nInterrupt == 2){
   0795 3A 4D 21      [13]  134 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   0798 D6 02         [ 7]  135 	sub	a, #0x02
   079A 20 08         [12]  136 	jr	NZ,00113$
                            137 ;src/main.c:63: cpct_setBorder(HW_BLUE);
   079C 21 10 04      [10]  138 	ld	hl, #0x0410
   079F E5            [11]  139 	push	hl
   07A0 CD 33 12      [17]  140 	call	_cpct_setPALColour
   07A3 C9            [10]  141 	ret
   07A4                     142 00113$:
                            143 ;src/main.c:65: if (g_nInterrupt == 3){
   07A4 3A 4D 21      [13]  144 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   07A7 D6 03         [ 7]  145 	sub	a, #0x03
   07A9 20 08         [12]  146 	jr	NZ,00110$
                            147 ;src/main.c:66: cpct_setBorder(HW_RED);
   07AB 21 10 1C      [10]  148 	ld	hl, #0x1c10
   07AE E5            [11]  149 	push	hl
   07AF CD 33 12      [17]  150 	call	_cpct_setPALColour
   07B2 C9            [10]  151 	ret
   07B3                     152 00110$:
                            153 ;src/main.c:68: if (g_nInterrupt == 4){
   07B3 3A 4D 21      [13]  154 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   07B6 D6 04         [ 7]  155 	sub	a, #0x04
   07B8 20 08         [12]  156 	jr	NZ,00107$
                            157 ;src/main.c:69: cpct_setBorder(HW_YELLOW);
   07BA 21 10 1E      [10]  158 	ld	hl, #0x1e10
   07BD E5            [11]  159 	push	hl
   07BE CD 33 12      [17]  160 	call	_cpct_setPALColour
   07C1 C9            [10]  161 	ret
   07C2                     162 00107$:
                            163 ;src/main.c:71: if (g_nInterrupt == 5){
   07C2 3A 4D 21      [13]  164 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   07C5 D6 05         [ 7]  165 	sub	a, #0x05
   07C7 20 18         [12]  166 	jr	NZ,00104$
                            167 ;src/main.c:72: cpct_setVideoMode(1);
   07C9 2E 01         [ 7]  168 	ld	l, #0x01
   07CB CD 28 14      [17]  169 	call	_cpct_setVideoMode
                            170 ;src/main.c:73: cpct_setPalette(g_palette1, 4);
   07CE 21 04 00      [10]  171 	ld	hl, #0x0004
   07D1 E5            [11]  172 	push	hl
   07D2 21 C3 01      [10]  173 	ld	hl, #_g_palette1
   07D5 E5            [11]  174 	push	hl
   07D6 CD 10 12      [17]  175 	call	_cpct_setPalette
                            176 ;src/main.c:74: cpct_setBorder(HW_MAGENTA);
   07D9 21 10 18      [10]  177 	ld	hl, #0x1810
   07DC E5            [11]  178 	push	hl
   07DD CD 33 12      [17]  179 	call	_cpct_setPALColour
   07E0 C9            [10]  180 	ret
   07E1                     181 00104$:
                            182 ;src/main.c:75: }else if (g_nInterrupt == 6){
   07E1 3A 4D 21      [13]  183 	ld	a,(#_myInterruptHandler_g_nInterrupt_1_124 + 0)
   07E4 D6 06         [ 7]  184 	sub	a, #0x06
   07E6 C0            [11]  185 	ret	NZ
                            186 ;src/main.c:76: cpct_scanKeyboard();
   07E7 CD 36 15      [17]  187 	call	_cpct_scanKeyboard
                            188 ;src/main.c:77: g_nInterrupt = 0;
   07EA 21 4D 21      [10]  189 	ld	hl,#_myInterruptHandler_g_nInterrupt_1_124 + 0
   07ED 36 00         [10]  190 	ld	(hl), #0x00
                            191 ;src/main.c:78: cpct_setBorder(HW_BRIGHT_BLUE);
   07EF 21 10 15      [10]  192 	ld	hl, #0x1510
   07F2 E5            [11]  193 	push	hl
   07F3 CD 33 12      [17]  194 	call	_cpct_setPALColour
   07F6 C9            [10]  195 	ret
   07F7                     196 _card_sprite:
   07F7 BB 04               197 	.dw _s_cards_0
   07F9 03 06               198 	.dw _s_cards_1
   07FB                     199 _card_description:
   07FB 53 57 4F 52 44 3A   200 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   0824 00                  201 	.db 0x00
   0825 00                  202 	.db 0x00
   0826 00                  203 	.db 0x00
   0827 00                  204 	.db 0x00
   0828 00                  205 	.db 0x00
   0829 00                  206 	.db 0x00
   082A 00                  207 	.db 0x00
   082B 00                  208 	.db 0x00
   082C 00                  209 	.db 0x00
   082D 53 48 49 45 4C 44   210 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   0848 00                  211 	.db 0x00
   0849 00                  212 	.db 0x00
   084A 00                  213 	.db 0x00
   084B 00                  214 	.db 0x00
   084C 00                  215 	.db 0x00
   084D 00                  216 	.db 0x00
   084E 00                  217 	.db 0x00
   084F 00                  218 	.db 0x00
   0850 00                  219 	.db 0x00
   0851 00                  220 	.db 0x00
   0852 00                  221 	.db 0x00
   0853 00                  222 	.db 0x00
   0854 00                  223 	.db 0x00
   0855 00                  224 	.db 0x00
   0856 00                  225 	.db 0x00
   0857 00                  226 	.db 0x00
   0858 00                  227 	.db 0x00
   0859 00                  228 	.db 0x00
   085A 00                  229 	.db 0x00
   085B 00                  230 	.db 0x00
   085C 00                  231 	.db 0x00
   085D 00                  232 	.db 0x00
   085E 00                  233 	.db 0x00
                            234 ;src/main.c:82: void initCPC() {
                            235 ;	---------------------------------
                            236 ; Function initCPC
                            237 ; ---------------------------------
   085F                     238 _initCPC::
                            239 ;src/main.c:83: cpct_disableFirmware();
   085F CD 36 14      [17]  240 	call	_cpct_disableFirmware
                            241 ;src/main.c:84: cpct_clearScreen_f64(0x0000);      // with black.
   0862 21 00 40      [10]  242 	ld	hl, #0x4000
   0865 E5            [11]  243 	push	hl
   0866 26 00         [ 7]  244 	ld	h, #0x00
   0868 E5            [11]  245 	push	hl
   0869 26 C0         [ 7]  246 	ld	h, #0xc0
   086B E5            [11]  247 	push	hl
   086C CD 4B 13      [17]  248 	call	_cpct_memset_f64
                            249 ;src/main.c:85: cpct_setPalette(g_palette0, 16);
   086F 21 10 00      [10]  250 	ld	hl, #0x0010
   0872 E5            [11]  251 	push	hl
   0873 21 4B 07      [10]  252 	ld	hl, #_g_palette0
   0876 E5            [11]  253 	push	hl
   0877 CD 10 12      [17]  254 	call	_cpct_setPalette
                            255 ;src/main.c:86: cpct_setVideoMode(0);
   087A 2E 00         [ 7]  256 	ld	l, #0x00
   087C CD 28 14      [17]  257 	call	_cpct_setVideoMode
                            258 ;src/main.c:87: cpct_setBorder(HW_WHITE);
   087F 21 10 00      [10]  259 	ld	hl, #0x0010
   0882 E5            [11]  260 	push	hl
   0883 CD 33 12      [17]  261 	call	_cpct_setPALColour
                            262 ;src/main.c:90: cpct_waitVSYNC();
   0886 CD 20 14      [17]  263 	call	_cpct_waitVSYNC
                            264 ;src/main.c:91: cpct_waitHalts(2);
   0889 2E 02         [ 7]  265 	ld	l, #0x02
   088B CD 05 13      [17]  266 	call	_cpct_waitHalts
                            267 ;src/main.c:92: cpct_waitVSYNC();
   088E CD 20 14      [17]  268 	call	_cpct_waitVSYNC
                            269 ;src/main.c:93: cpct_setInterruptHandler(myInterruptHandler);
   0891 21 5B 07      [10]  270 	ld	hl, #_myInterruptHandler
   0894 CD 67 15      [17]  271 	call	_cpct_setInterruptHandler
   0897 C9            [10]  272 	ret
                            273 ;src/main.c:97: void check_keyboard(){
                            274 ;	---------------------------------
                            275 ; Function check_keyboard
                            276 ; ---------------------------------
   0898                     277 _check_keyboard::
                            278 ;src/main.c:98: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
   0898 21 01 01      [10]  279 	ld	hl, #0x0101
   089B CD 27 12      [17]  280 	call	_cpct_isKeyPressed
   089E 7D            [ 4]  281 	ld	a, l
   089F B7            [ 4]  282 	or	a, a
   08A0 28 1A         [12]  283 	jr	Z,00105$
   08A2 FD 21 3F 21   [14]  284 	ld	iy, #_selected_card
   08A6 FD 7E 00      [19]  285 	ld	a, 0 (iy)
   08A9 B7            [ 4]  286 	or	a, a
   08AA 28 10         [12]  287 	jr	Z,00105$
                            288 ;src/main.c:99: previous_card = selected_card;
   08AC FD 7E 00      [19]  289 	ld	a, 0 (iy)
   08AF 32 40 21      [13]  290 	ld	(#_previous_card + 0),a
                            291 ;src/main.c:100: selected_card--;
   08B2 21 3F 21      [10]  292 	ld	hl, #_selected_card+0
   08B5 35            [11]  293 	dec	(hl)
                            294 ;src/main.c:101: moved = YES;
   08B6 21 4C 21      [10]  295 	ld	hl,#_moved + 0
   08B9 36 01         [10]  296 	ld	(hl), #0x01
   08BB C9            [10]  297 	ret
   08BC                     298 00105$:
                            299 ;src/main.c:102: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<9)){
   08BC 21 00 02      [10]  300 	ld	hl, #0x0200
   08BF CD 27 12      [17]  301 	call	_cpct_isKeyPressed
   08C2 7D            [ 4]  302 	ld	a, l
   08C3 B7            [ 4]  303 	or	a, a
   08C4 C8            [11]  304 	ret	Z
   08C5 FD 21 3F 21   [14]  305 	ld	iy, #_selected_card
   08C9 FD 7E 00      [19]  306 	ld	a, 0 (iy)
   08CC D6 09         [ 7]  307 	sub	a, #0x09
   08CE D0            [11]  308 	ret	NC
                            309 ;src/main.c:103: previous_card = selected_card;
   08CF FD 7E 00      [19]  310 	ld	a, 0 (iy)
   08D2 32 40 21      [13]  311 	ld	(#_previous_card + 0),a
                            312 ;src/main.c:104: selected_card++;
   08D5 21 3F 21      [10]  313 	ld	hl, #_selected_card+0
   08D8 34            [11]  314 	inc	(hl)
                            315 ;src/main.c:105: moved = YES;
   08D9 21 4C 21      [10]  316 	ld	hl,#_moved + 0
   08DC 36 01         [10]  317 	ld	(hl), #0x01
   08DE C9            [10]  318 	ret
                            319 ;src/main.c:109: void draw_cards(){
                            320 ;	---------------------------------
                            321 ; Function draw_cards
                            322 ; ---------------------------------
   08DF                     323 _draw_cards::
                            324 ;src/main.c:114: cpct_waitVSYNC();
   08DF CD 20 14      [17]  325 	call	_cpct_waitVSYNC
                            326 ;src/main.c:117: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W-3))-2, 95);
   08E2 3A 40 21      [13]  327 	ld	a,(#_previous_card + 0)
   08E5 4F            [ 4]  328 	ld	c, a
   08E6 87            [ 4]  329 	add	a, a
   08E7 87            [ 4]  330 	add	a, a
   08E8 81            [ 4]  331 	add	a, c
   08E9 47            [ 4]  332 	ld	b, a
   08EA 05            [ 4]  333 	dec	b
   08EB 05            [ 4]  334 	dec	b
   08EC 3E 5F         [ 7]  335 	ld	a, #0x5f
   08EE F5            [11]  336 	push	af
   08EF 33            [ 6]  337 	inc	sp
   08F0 C5            [11]  338 	push	bc
   08F1 33            [ 6]  339 	inc	sp
   08F2 21 00 C0      [10]  340 	ld	hl, #0xc000
   08F5 E5            [11]  341 	push	hl
   08F6 CD 16 15      [17]  342 	call	_cpct_getScreenPtr
   08F9 22 0B 21      [16]  343 	ld	(_pvmem), hl
                            344 ;src/main.c:118: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);
   08FC 2A 0B 21      [16]  345 	ld	hl, (_pvmem)
   08FF 01 0C 2D      [10]  346 	ld	bc, #0x2d0c
   0902 C5            [11]  347 	push	bc
   0903 01 33 00      [10]  348 	ld	bc, #0x0033
   0906 C5            [11]  349 	push	bc
   0907 E5            [11]  350 	push	hl
   0908 CD 6B 14      [17]  351 	call	_cpct_drawSolidBox
                            352 ;src/main.c:120: cpct_waitHalts(20);
   090B 2E 14         [ 7]  353 	ld	l, #0x14
   090D CD 05 13      [17]  354 	call	_cpct_waitHalts
                            355 ;src/main.c:122: pvmem = cpct_getScreenPtr((u8*) 0xC000, 10, 150);
   0910 21 0A 96      [10]  356 	ld	hl, #0x960a
   0913 E5            [11]  357 	push	hl
   0914 21 00 C0      [10]  358 	ld	hl, #0xc000
   0917 E5            [11]  359 	push	hl
   0918 CD 16 15      [17]  360 	call	_cpct_getScreenPtr
   091B 22 0B 21      [16]  361 	ld	(_pvmem), hl
                            362 ;src/main.c:123: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
   091E 2A 0B 21      [16]  363 	ld	hl, (_pvmem)
   0921 01 32 09      [10]  364 	ld	bc, #0x0932
   0924 C5            [11]  365 	push	bc
   0925 01 00 00      [10]  366 	ld	bc, #0x0000
   0928 C5            [11]  367 	push	bc
   0929 E5            [11]  368 	push	hl
   092A CD 6B 14      [17]  369 	call	_cpct_drawSolidBox
                            370 ;src/main.c:125: cpct_waitHalts(20);
   092D 2E 14         [ 7]  371 	ld	l, #0x14
   092F CD 05 13      [17]  372 	call	_cpct_waitHalts
                            373 ;src/main.c:127: for (i=0;i<selected_card;i++){
   0932 0E 00         [ 7]  374 	ld	c, #0x00
   0934                     375 00104$:
   0934 21 3F 21      [10]  376 	ld	hl, #_selected_card
   0937 79            [ 4]  377 	ld	a, c
   0938 96            [ 7]  378 	sub	a, (hl)
   0939 30 45         [12]  379 	jr	NC,00101$
                            380 ;src/main.c:128: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
   093B 69            [ 4]  381 	ld	l, c
   093C 29            [11]  382 	add	hl, hl
   093D 29            [11]  383 	add	hl, hl
   093E 09            [11]  384 	add	hl, bc
   093F 45            [ 4]  385 	ld	b, l
   0940 04            [ 4]  386 	inc	b
   0941 04            [ 4]  387 	inc	b
   0942 C5            [11]  388 	push	bc
   0943 3E 63         [ 7]  389 	ld	a, #0x63
   0945 F5            [11]  390 	push	af
   0946 33            [ 6]  391 	inc	sp
   0947 C5            [11]  392 	push	bc
   0948 33            [ 6]  393 	inc	sp
   0949 21 00 C0      [10]  394 	ld	hl, #0xc000
   094C E5            [11]  395 	push	hl
   094D CD 16 15      [17]  396 	call	_cpct_getScreenPtr
   0950 C1            [10]  397 	pop	bc
   0951 22 0B 21      [16]  398 	ld	(_pvmem), hl
                            399 ;src/main.c:129: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0954 ED 5B 0B 21   [20]  400 	ld	de, (_pvmem)
   0958 21 41 21      [10]  401 	ld	hl, #_cards
   095B 06 00         [ 7]  402 	ld	b, #0x00
   095D 09            [11]  403 	add	hl, bc
   095E 6E            [ 7]  404 	ld	l, (hl)
   095F 26 00         [ 7]  405 	ld	h, #0x00
   0961 29            [11]  406 	add	hl, hl
   0962 3E F7         [ 7]  407 	ld	a, #<(_card_sprite)
   0964 85            [ 4]  408 	add	a, l
   0965 6F            [ 4]  409 	ld	l, a
   0966 3E 07         [ 7]  410 	ld	a, #>(_card_sprite)
   0968 8C            [ 4]  411 	adc	a, h
   0969 67            [ 4]  412 	ld	h, a
   096A 7E            [ 7]  413 	ld	a, (hl)
   096B 23            [ 6]  414 	inc	hl
   096C 66            [ 7]  415 	ld	h, (hl)
   096D 6F            [ 4]  416 	ld	l, a
   096E E5            [11]  417 	push	hl
   096F FD E1         [14]  418 	pop	iy
   0971 C5            [11]  419 	push	bc
   0972 21 08 29      [10]  420 	ld	hl, #0x2908
   0975 E5            [11]  421 	push	hl
   0976 D5            [11]  422 	push	de
   0977 FD E5         [15]  423 	push	iy
   0979 CD 3F 12      [17]  424 	call	_cpct_drawSprite
   097C C1            [10]  425 	pop	bc
                            426 ;src/main.c:127: for (i=0;i<selected_card;i++){
   097D 0C            [ 4]  427 	inc	c
   097E 18 B4         [12]  428 	jr	00104$
   0980                     429 00101$:
                            430 ;src/main.c:132: cpct_waitHalts(20);
   0980 2E 14         [ 7]  431 	ld	l, #0x14
   0982 CD 05 13      [17]  432 	call	_cpct_waitHalts
                            433 ;src/main.c:134: for (i=selected_card+1;i<10;i++){
   0985 21 3F 21      [10]  434 	ld	hl,#_selected_card + 0
   0988 4E            [ 7]  435 	ld	c, (hl)
   0989 0C            [ 4]  436 	inc	c
   098A                     437 00107$:
                            438 ;src/main.c:135: pvmem = cpct_getScreenPtr((u8*) 0xC000, 4+(i*(S_CARDS_0_W-3)), 99);
   098A 79            [ 4]  439 	ld	a,c
   098B FE 0A         [ 7]  440 	cp	a,#0x0a
   098D 30 3E         [12]  441 	jr	NC,00102$
   098F 87            [ 4]  442 	add	a, a
   0990 87            [ 4]  443 	add	a, a
   0991 81            [ 4]  444 	add	a, c
   0992 47            [ 4]  445 	ld	b, a
   0993 04            [ 4]  446 	inc	b
   0994 04            [ 4]  447 	inc	b
   0995 04            [ 4]  448 	inc	b
   0996 04            [ 4]  449 	inc	b
   0997 C5            [11]  450 	push	bc
   0998 3E 63         [ 7]  451 	ld	a, #0x63
   099A F5            [11]  452 	push	af
   099B 33            [ 6]  453 	inc	sp
   099C C5            [11]  454 	push	bc
   099D 33            [ 6]  455 	inc	sp
   099E 21 00 C0      [10]  456 	ld	hl, #0xc000
   09A1 E5            [11]  457 	push	hl
   09A2 CD 16 15      [17]  458 	call	_cpct_getScreenPtr
   09A5 C1            [10]  459 	pop	bc
   09A6 22 0B 21      [16]  460 	ld	(_pvmem), hl
                            461 ;src/main.c:136: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   09A9 FD 2A 0B 21   [20]  462 	ld	iy, (_pvmem)
   09AD 21 41 21      [10]  463 	ld	hl, #_cards
   09B0 06 00         [ 7]  464 	ld	b, #0x00
   09B2 09            [11]  465 	add	hl, bc
   09B3 6E            [ 7]  466 	ld	l, (hl)
   09B4 26 00         [ 7]  467 	ld	h, #0x00
   09B6 29            [11]  468 	add	hl, hl
   09B7 11 F7 07      [10]  469 	ld	de, #_card_sprite
   09BA 19            [11]  470 	add	hl, de
   09BB 5E            [ 7]  471 	ld	e, (hl)
   09BC 23            [ 6]  472 	inc	hl
   09BD 56            [ 7]  473 	ld	d, (hl)
   09BE C5            [11]  474 	push	bc
   09BF 21 08 29      [10]  475 	ld	hl, #0x2908
   09C2 E5            [11]  476 	push	hl
   09C3 FD E5         [15]  477 	push	iy
   09C5 D5            [11]  478 	push	de
   09C6 CD 3F 12      [17]  479 	call	_cpct_drawSprite
   09C9 C1            [10]  480 	pop	bc
                            481 ;src/main.c:134: for (i=selected_card+1;i<10;i++){
   09CA 0C            [ 4]  482 	inc	c
   09CB 18 BD         [12]  483 	jr	00107$
   09CD                     484 00102$:
                            485 ;src/main.c:139: cpct_waitHalts(20);
   09CD 2E 14         [ 7]  486 	ld	l, #0x14
   09CF CD 05 13      [17]  487 	call	_cpct_waitHalts
                            488 ;src/main.c:141: pvmem = cpct_getScreenPtr((u8*) 0xC000, 3+(selected_card*(S_CARDS_0_W-3)), 95);
   09D2 3A 3F 21      [13]  489 	ld	a,(#_selected_card + 0)
   09D5 4F            [ 4]  490 	ld	c, a
   09D6 87            [ 4]  491 	add	a, a
   09D7 87            [ 4]  492 	add	a, a
   09D8 81            [ 4]  493 	add	a, c
   09D9 47            [ 4]  494 	ld	b, a
   09DA 04            [ 4]  495 	inc	b
   09DB 04            [ 4]  496 	inc	b
   09DC 04            [ 4]  497 	inc	b
   09DD 3E 5F         [ 7]  498 	ld	a, #0x5f
   09DF F5            [11]  499 	push	af
   09E0 33            [ 6]  500 	inc	sp
   09E1 C5            [11]  501 	push	bc
   09E2 33            [ 6]  502 	inc	sp
   09E3 21 00 C0      [10]  503 	ld	hl, #0xc000
   09E6 E5            [11]  504 	push	hl
   09E7 CD 16 15      [17]  505 	call	_cpct_getScreenPtr
   09EA 22 0B 21      [16]  506 	ld	(_pvmem), hl
                            507 ;src/main.c:142: cpct_drawSprite(card_sprite[cards[selected_card]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   09ED ED 4B 0B 21   [20]  508 	ld	bc, (_pvmem)
   09F1 FD 21 41 21   [14]  509 	ld	iy, #_cards
   09F5 ED 5B 3F 21   [20]  510 	ld	de, (_selected_card)
   09F9 16 00         [ 7]  511 	ld	d, #0x00
   09FB FD 19         [15]  512 	add	iy, de
   09FD FD 6E 00      [19]  513 	ld	l, 0 (iy)
   0A00 26 00         [ 7]  514 	ld	h, #0x00
   0A02 29            [11]  515 	add	hl, hl
   0A03 11 F7 07      [10]  516 	ld	de, #_card_sprite
   0A06 19            [11]  517 	add	hl, de
   0A07 5E            [ 7]  518 	ld	e, (hl)
   0A08 23            [ 6]  519 	inc	hl
   0A09 56            [ 7]  520 	ld	d, (hl)
   0A0A 21 08 29      [10]  521 	ld	hl, #0x2908
   0A0D E5            [11]  522 	push	hl
   0A0E C5            [11]  523 	push	bc
   0A0F D5            [11]  524 	push	de
   0A10 CD 3F 12      [17]  525 	call	_cpct_drawSprite
                            526 ;src/main.c:144: cpct_waitHalts(20);
   0A13 2E 14         [ 7]  527 	ld	l, #0x14
   0A15 CD 05 13      [17]  528 	call	_cpct_waitHalts
                            529 ;src/main.c:145: drawTextM1(card_description[cards[selected_card]],10,150,NORMALHEIGHT);
   0A18 3E 41         [ 7]  530 	ld	a, #<(_cards)
   0A1A 21 3F 21      [10]  531 	ld	hl, #_selected_card
   0A1D 86            [ 7]  532 	add	a, (hl)
   0A1E 4F            [ 4]  533 	ld	c, a
   0A1F 3E 21         [ 7]  534 	ld	a, #>(_cards)
   0A21 CE 00         [ 7]  535 	adc	a, #0x00
   0A23 47            [ 4]  536 	ld	b, a
   0A24 0A            [ 7]  537 	ld	a, (bc)
   0A25 4F            [ 4]  538 	ld	c,a
   0A26 06 00         [ 7]  539 	ld	b,#0x00
   0A28 69            [ 4]  540 	ld	l, c
   0A29 60            [ 4]  541 	ld	h, b
   0A2A 29            [11]  542 	add	hl, hl
   0A2B 09            [11]  543 	add	hl, bc
   0A2C 29            [11]  544 	add	hl, hl
   0A2D 29            [11]  545 	add	hl, hl
   0A2E 29            [11]  546 	add	hl, hl
   0A2F 09            [11]  547 	add	hl, bc
   0A30 29            [11]  548 	add	hl, hl
   0A31 11 FB 07      [10]  549 	ld	de, #_card_description
   0A34 19            [11]  550 	add	hl, de
   0A35 01 96 01      [10]  551 	ld	bc, #0x0196
   0A38 C5            [11]  552 	push	bc
   0A39 3E 0A         [ 7]  553 	ld	a, #0x0a
   0A3B F5            [11]  554 	push	af
   0A3C 33            [ 6]  555 	inc	sp
   0A3D E5            [11]  556 	push	hl
   0A3E CD 2F 0C      [17]  557 	call	_drawTextM1
   0A41 F1            [10]  558 	pop	af
   0A42 F1            [10]  559 	pop	af
   0A43 33            [ 6]  560 	inc	sp
                            561 ;src/main.c:147: cpct_waitHalts(20);
   0A44 2E 14         [ 7]  562 	ld	l, #0x14
   0A46 CD 05 13      [17]  563 	call	_cpct_waitHalts
                            564 ;src/main.c:148: sprintf(aux_txt, "SELECTED:%1d", selected_card);
   0A49 21 3F 21      [10]  565 	ld	hl,#_selected_card + 0
   0A4C 4E            [ 7]  566 	ld	c, (hl)
   0A4D 06 00         [ 7]  567 	ld	b, #0x00
   0A4F C5            [11]  568 	push	bc
   0A50 21 73 0A      [10]  569 	ld	hl, #___str_2
   0A53 E5            [11]  570 	push	hl
   0A54 21 0D 21      [10]  571 	ld	hl, #_aux_txt
   0A57 E5            [11]  572 	push	hl
   0A58 CD EB 13      [17]  573 	call	_sprintf
   0A5B 21 06 00      [10]  574 	ld	hl, #6
   0A5E 39            [11]  575 	add	hl, sp
   0A5F F9            [ 6]  576 	ld	sp, hl
                            577 ;src/main.c:149: drawTextM1(aux_txt,10,160,NORMALHEIGHT);
   0A60 21 A0 01      [10]  578 	ld	hl, #0x01a0
   0A63 E5            [11]  579 	push	hl
   0A64 3E 0A         [ 7]  580 	ld	a, #0x0a
   0A66 F5            [11]  581 	push	af
   0A67 33            [ 6]  582 	inc	sp
   0A68 21 0D 21      [10]  583 	ld	hl, #_aux_txt
   0A6B E5            [11]  584 	push	hl
   0A6C CD 2F 0C      [17]  585 	call	_drawTextM1
   0A6F F1            [10]  586 	pop	af
   0A70 F1            [10]  587 	pop	af
   0A71 33            [ 6]  588 	inc	sp
   0A72 C9            [10]  589 	ret
   0A73                     590 ___str_2:
   0A73 53 45 4C 45 43 54   591 	.ascii "SELECTED:%1d"
        45 44 3A 25 31 64
   0A7F 00                  592 	.db 0x00
                            593 ;src/main.c:153: void update_selected_card(){
                            594 ;	---------------------------------
                            595 ; Function update_selected_card
                            596 ; ---------------------------------
   0A80                     597 _update_selected_card::
   0A80 DD E5         [15]  598 	push	ix
   0A82 DD 21 00 00   [14]  599 	ld	ix,#0
   0A86 DD 39         [15]  600 	add	ix,sp
   0A88 3B            [ 6]  601 	dec	sp
                            602 ;src/main.c:156: if (selected_card>0){
   0A89 3A 3F 21      [13]  603 	ld	a,(#_selected_card + 0)
   0A8C B7            [ 4]  604 	or	a, a
   0A8D 28 2A         [12]  605 	jr	Z,00102$
                            606 ;src/main.c:157: pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W))-2, 95);
   0A8F 3A 40 21      [13]  607 	ld	a,(#_previous_card + 0)
   0A92 07            [ 4]  608 	rlca
   0A93 07            [ 4]  609 	rlca
   0A94 07            [ 4]  610 	rlca
   0A95 E6 F8         [ 7]  611 	and	a, #0xf8
   0A97 47            [ 4]  612 	ld	b, a
   0A98 05            [ 4]  613 	dec	b
   0A99 05            [ 4]  614 	dec	b
   0A9A 3E 5F         [ 7]  615 	ld	a, #0x5f
   0A9C F5            [11]  616 	push	af
   0A9D 33            [ 6]  617 	inc	sp
   0A9E C5            [11]  618 	push	bc
   0A9F 33            [ 6]  619 	inc	sp
   0AA0 21 00 C0      [10]  620 	ld	hl, #0xc000
   0AA3 E5            [11]  621 	push	hl
   0AA4 CD 16 15      [17]  622 	call	_cpct_getScreenPtr
   0AA7 22 0B 21      [16]  623 	ld	(_pvmem), hl
                            624 ;src/main.c:158: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
   0AAA 2A 0B 21      [16]  625 	ld	hl, (_pvmem)
   0AAD 01 08 05      [10]  626 	ld	bc, #0x0508
   0AB0 C5            [11]  627 	push	bc
   0AB1 01 33 00      [10]  628 	ld	bc, #0x0033
   0AB4 C5            [11]  629 	push	bc
   0AB5 E5            [11]  630 	push	hl
   0AB6 CD 6B 14      [17]  631 	call	_cpct_drawSolidBox
   0AB9                     632 00102$:
                            633 ;src/main.c:161: pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
   0AB9 DD 7E FF      [19]  634 	ld	a, -1 (ix)
   0ABC 4F            [ 4]  635 	ld	c, a
   0ABD 87            [ 4]  636 	add	a, a
   0ABE 87            [ 4]  637 	add	a, a
   0ABF 81            [ 4]  638 	add	a, c
   0AC0 47            [ 4]  639 	ld	b, a
   0AC1 04            [ 4]  640 	inc	b
   0AC2 04            [ 4]  641 	inc	b
   0AC3 3E 63         [ 7]  642 	ld	a, #0x63
   0AC5 F5            [11]  643 	push	af
   0AC6 33            [ 6]  644 	inc	sp
   0AC7 C5            [11]  645 	push	bc
   0AC8 33            [ 6]  646 	inc	sp
   0AC9 21 00 C0      [10]  647 	ld	hl, #0xc000
   0ACC E5            [11]  648 	push	hl
   0ACD CD 16 15      [17]  649 	call	_cpct_getScreenPtr
   0AD0 22 0B 21      [16]  650 	ld	(_pvmem), hl
                            651 ;src/main.c:162: cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0AD3 ED 5B 0B 21   [20]  652 	ld	de, (_pvmem)
   0AD7 DD 7E FF      [19]  653 	ld	a, -1 (ix)
   0ADA C6 41         [ 7]  654 	add	a, #<(_cards)
   0ADC 6F            [ 4]  655 	ld	l, a
   0ADD 3E 00         [ 7]  656 	ld	a, #0x00
   0ADF CE 21         [ 7]  657 	adc	a, #>(_cards)
   0AE1 67            [ 4]  658 	ld	h, a
   0AE2 6E            [ 7]  659 	ld	l, (hl)
   0AE3 26 00         [ 7]  660 	ld	h, #0x00
   0AE5 29            [11]  661 	add	hl, hl
   0AE6 01 F7 07      [10]  662 	ld	bc, #_card_sprite
   0AE9 09            [11]  663 	add	hl, bc
   0AEA 4E            [ 7]  664 	ld	c, (hl)
   0AEB 23            [ 6]  665 	inc	hl
   0AEC 46            [ 7]  666 	ld	b, (hl)
   0AED 21 08 29      [10]  667 	ld	hl, #0x2908
   0AF0 E5            [11]  668 	push	hl
   0AF1 D5            [11]  669 	push	de
   0AF2 C5            [11]  670 	push	bc
   0AF3 CD 3F 12      [17]  671 	call	_cpct_drawSprite
   0AF6 33            [ 6]  672 	inc	sp
   0AF7 DD E1         [14]  673 	pop	ix
   0AF9 C9            [10]  674 	ret
                            675 ;src/main.c:165: void init_cards(){
                            676 ;	---------------------------------
                            677 ; Function init_cards
                            678 ; ---------------------------------
   0AFA                     679 _init_cards::
                            680 ;src/main.c:168: num_cards = (cpct_rand() % 9) + 1;
   0AFA CD 46 14      [17]  681 	call	_cpct_getRandom_mxor_u8
   0AFD 45            [ 4]  682 	ld	b, l
   0AFE 3E 09         [ 7]  683 	ld	a, #0x09
   0B00 F5            [11]  684 	push	af
   0B01 33            [ 6]  685 	inc	sp
   0B02 C5            [11]  686 	push	bc
   0B03 33            [ 6]  687 	inc	sp
   0B04 CD E4 12      [17]  688 	call	__moduchar
   0B07 F1            [10]  689 	pop	af
   0B08 7D            [ 4]  690 	ld	a, l
   0B09 21 4B 21      [10]  691 	ld	hl, #_num_cards
   0B0C 3C            [ 4]  692 	inc	a
   0B0D 77            [ 7]  693 	ld	(hl), a
                            694 ;src/main.c:169: for (i=0;i<num_cards;i++){
   0B0E 0E 00         [ 7]  695 	ld	c, #0x00
   0B10                     696 00103$:
   0B10 21 4B 21      [10]  697 	ld	hl, #_num_cards
   0B13 79            [ 4]  698 	ld	a, c
   0B14 96            [ 7]  699 	sub	a, (hl)
   0B15 D2 DF 08      [10]  700 	jp	NC,_draw_cards
                            701 ;src/main.c:170: cards[i] = cpct_rand() % 2;
   0B18 21 41 21      [10]  702 	ld	hl, #_cards
   0B1B 06 00         [ 7]  703 	ld	b, #0x00
   0B1D 09            [11]  704 	add	hl, bc
   0B1E E5            [11]  705 	push	hl
   0B1F C5            [11]  706 	push	bc
   0B20 CD 46 14      [17]  707 	call	_cpct_getRandom_mxor_u8
   0B23 7D            [ 4]  708 	ld	a, l
   0B24 C1            [10]  709 	pop	bc
   0B25 E1            [10]  710 	pop	hl
   0B26 E6 01         [ 7]  711 	and	a, #0x01
   0B28 77            [ 7]  712 	ld	(hl), a
                            713 ;src/main.c:169: for (i=0;i<num_cards;i++){
   0B29 0C            [ 4]  714 	inc	c
   0B2A 18 E4         [12]  715 	jr	00103$
                            716 ;src/main.c:173: draw_cards();
   0B2C C3 DF 08      [10]  717 	jp  _draw_cards
                            718 ;src/main.c:176: void main(void) {
                            719 ;	---------------------------------
                            720 ; Function main
                            721 ; ---------------------------------
   0B2F                     722 _main::
                            723 ;src/main.c:178: initCPC();
   0B2F CD 5F 08      [17]  724 	call	_initCPC
                            725 ;src/main.c:180: selected_card = 4;
   0B32 21 3F 21      [10]  726 	ld	hl,#_selected_card + 0
   0B35 36 04         [10]  727 	ld	(hl), #0x04
                            728 ;src/main.c:181: previous_card = 4;
   0B37 21 40 21      [10]  729 	ld	hl,#_previous_card + 0
   0B3A 36 04         [10]  730 	ld	(hl), #0x04
                            731 ;src/main.c:182: moved = NO;
   0B3C 21 4C 21      [10]  732 	ld	hl,#_moved + 0
   0B3F 36 00         [10]  733 	ld	(hl), #0x00
                            734 ;src/main.c:184: draw_cards();
   0B41 CD DF 08      [17]  735 	call	_draw_cards
                            736 ;src/main.c:186: drawTextM1("!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",10,190,NORMALHEIGHT);
   0B44 21 BE 01      [10]  737 	ld	hl, #0x01be
   0B47 E5            [11]  738 	push	hl
   0B48 3E 0A         [ 7]  739 	ld	a, #0x0a
   0B4A F5            [11]  740 	push	af
   0B4B 33            [ 6]  741 	inc	sp
   0B4C 21 69 0B      [10]  742 	ld	hl, #___str_3
   0B4F E5            [11]  743 	push	hl
   0B50 CD 2F 0C      [17]  744 	call	_drawTextM1
   0B53 F1            [10]  745 	pop	af
   0B54 F1            [10]  746 	pop	af
   0B55 33            [ 6]  747 	inc	sp
                            748 ;src/main.c:189: while (1){
   0B56                     749 00104$:
                            750 ;src/main.c:190: check_keyboard();
   0B56 CD 98 08      [17]  751 	call	_check_keyboard
                            752 ;src/main.c:191: if (moved){
   0B59 3A 4C 21      [13]  753 	ld	a,(#_moved + 0)
   0B5C B7            [ 4]  754 	or	a, a
   0B5D 28 F7         [12]  755 	jr	Z,00104$
                            756 ;src/main.c:192: draw_cards();
   0B5F CD DF 08      [17]  757 	call	_draw_cards
                            758 ;src/main.c:193: moved = NO;
   0B62 21 4C 21      [10]  759 	ld	hl,#_moved + 0
   0B65 36 00         [10]  760 	ld	(hl), #0x00
   0B67 18 ED         [12]  761 	jr	00104$
   0B69                     762 ___str_3:
   0B69 21 2C 2D 2E 30 31   763 	.ascii "!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        32 33 34 35 36 37
        38 39 3A 3F 40 41
        42 43 44 45 46 47
        48 49 4A 4B 4C 4D
        4E 4F 50 51 52 53
        54 55 56 57 58 59
        5A
   0B94 00                  764 	.db 0x00
                            765 	.area _CODE
                            766 	.area _INITIALIZER
                            767 	.area _CABS (ABS)
