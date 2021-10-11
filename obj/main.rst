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
                             21 	.globl _cpct_setCRTCReg
                             22 	.globl _cpct_getScreenPtr
                             23 	.globl _cpct_setPALColour
                             24 	.globl _cpct_setPalette
                             25 	.globl _cpct_waitVSYNC
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_drawSprite
                             28 	.globl _cpct_drawSolidBox
                             29 	.globl _cpct_isKeyPressed
                             30 	.globl _cpct_scanKeyboard
                             31 	.globl _cpct_waitHalts
                             32 	.globl _cpct_setStackLocation
                             33 	.globl _cpct_memset
                             34 	.globl _cpct_setInterruptHandler
                             35 	.globl _cpct_disableFirmware
                             36 	.globl _moved
                             37 	.globl _num_cards
                             38 	.globl _cards
                             39 	.globl _previous_card
                             40 	.globl _selected_card
                             41 	.globl _aux_txt
                             42 	.globl _pvmem
                             43 	.globl _i_time
                             44 	.globl _cost_sprite
                             45 	.globl _card_description
                             46 	.globl _card_sprite
                             47 	.globl _card_types
                             48 ;--------------------------------------------------------
                             49 ; special function registers
                             50 ;--------------------------------------------------------
                             51 ;--------------------------------------------------------
                             52 ; ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DATA
   233B                      55 _i_time::
   233B                      56 	.ds 4
   233F                      57 _pvmem::
   233F                      58 	.ds 2
   2341                      59 _aux_txt::
   2341                      60 	.ds 50
   2373                      61 _selected_card::
   2373                      62 	.ds 1
   2374                      63 _previous_card::
   2374                      64 	.ds 1
   2375                      65 _cards::
   2375                      66 	.ds 20
   2389                      67 _num_cards::
   2389                      68 	.ds 1
   238A                      69 _moved::
   238A                      70 	.ds 1
   238B                      71 _myInterruptHandler_g_nInterrupt_1_125:
   238B                      72 	.ds 1
                             73 ;--------------------------------------------------------
                             74 ; ram data
                             75 ;--------------------------------------------------------
                             76 	.area _INITIALIZED
                             77 ;--------------------------------------------------------
                             78 ; absolute external ram data
                             79 ;--------------------------------------------------------
                             80 	.area _DABS (ABS)
                             81 ;--------------------------------------------------------
                             82 ; global & static initialisations
                             83 ;--------------------------------------------------------
                             84 	.area _HOME
                             85 	.area _GSINIT
                             86 	.area _GSFINAL
                             87 	.area _GSINIT
                             88 ;src/main.c:63: static u8 g_nInterrupt = 0; // Manage Interrupt
   238C FD 21 8B 23   [14]   89 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
   2390 FD 36 00 00   [19]   90 	ld	0 (iy), #0x00
                             91 ;--------------------------------------------------------
                             92 ; Home
                             93 ;--------------------------------------------------------
                             94 	.area _HOME
                             95 	.area _HOME
                             96 ;--------------------------------------------------------
                             97 ; code
                             98 ;--------------------------------------------------------
                             99 	.area _CODE
                            100 ;src/main.c:62: void myInterruptHandler(){
                            101 ;	---------------------------------
                            102 ; Function myInterruptHandler
                            103 ; ---------------------------------
   07A3                     104 _myInterruptHandler::
                            105 ;src/main.c:66: i_time++;
   07A3 FD 21 3B 23   [14]  106 	ld	iy, #_i_time
   07A7 FD 34 00      [23]  107 	inc	0 (iy)
   07AA 20 0D         [12]  108 	jr	NZ,00154$
   07AC FD 34 01      [23]  109 	inc	1 (iy)
   07AF 20 08         [12]  110 	jr	NZ,00154$
   07B1 FD 34 02      [23]  111 	inc	2 (iy)
   07B4 20 03         [12]  112 	jr	NZ,00154$
   07B6 FD 34 03      [23]  113 	inc	3 (iy)
   07B9                     114 00154$:
                            115 ;src/main.c:67: g_nInterrupt++;
   07B9 FD 21 8B 23   [14]  116 	ld	iy, #_myInterruptHandler_g_nInterrupt_1_125
   07BD FD 34 00      [23]  117 	inc	0 (iy)
                            118 ;src/main.c:68: switch (g_nInterrupt){
   07C0 FD 7E 00      [19]  119 	ld	a, 0 (iy)
   07C3 3D            [ 4]  120 	dec	a
   07C4 28 1E         [12]  121 	jr	Z,00101$
   07C6 FD 7E 00      [19]  122 	ld	a, 0 (iy)
   07C9 D6 02         [ 7]  123 	sub	a, #0x02
   07CB 28 1F         [12]  124 	jr	Z,00102$
   07CD FD 7E 00      [19]  125 	ld	a, 0 (iy)
   07D0 D6 03         [ 7]  126 	sub	a, #0x03
   07D2 28 41         [12]  127 	jr	Z,00106$
   07D4 FD 7E 00      [19]  128 	ld	a, 0 (iy)
   07D7 D6 04         [ 7]  129 	sub	a, #0x04
   07D9 28 42         [12]  130 	jr	Z,00107$
   07DB FD 7E 00      [19]  131 	ld	a, 0 (iy)
   07DE D6 05         [ 7]  132 	sub	a, #0x05
   07E0 28 43         [12]  133 	jr	Z,00108$
   07E2 18 6A         [12]  134 	jr	00112$
                            135 ;src/main.c:69: case 1:
   07E4                     136 00101$:
                            137 ;src/main.c:70: cpct_setBorder(HW_LIME);
   07E4 21 10 1A      [10]  138 	ld	hl, #0x1a10
   07E7 E5            [11]  139 	push	hl
   07E8 CD 92 14      [17]  140 	call	_cpct_setPALColour
                            141 ;src/main.c:71: break;
   07EB C9            [10]  142 	ret
                            143 ;src/main.c:72: case 2:
   07EC                     144 00102$:
                            145 ;src/main.c:73: cpct_setBorder(HW_BRIGHT_MAGENTA);
   07EC 21 10 0D      [10]  146 	ld	hl, #0x0d10
   07EF E5            [11]  147 	push	hl
   07F0 CD 92 14      [17]  148 	call	_cpct_setPALColour
                            149 ;src/main.c:75: while (i>0){
   07F3 01 0E 01      [10]  150 	ld	bc, #0x010e
   07F6                     151 00103$:
   07F6 78            [ 4]  152 	ld	a, b
   07F7 B1            [ 4]  153 	or	a,c
   07F8 28 03         [12]  154 	jr	Z,00105$
                            155 ;src/main.c:76: i--;
   07FA 0B            [ 6]  156 	dec	bc
   07FB 18 F9         [12]  157 	jr	00103$
   07FD                     158 00105$:
                            159 ;src/main.c:78: cpct_setBorder(HW_CYAN);
   07FD 21 10 06      [10]  160 	ld	hl, #0x0610
   0800 E5            [11]  161 	push	hl
   0801 CD 92 14      [17]  162 	call	_cpct_setPALColour
                            163 ;src/main.c:79: cpct_setVideoMode(0);
   0804 2E 00         [ 7]  164 	ld	l, #0x00
   0806 CD 40 16      [17]  165 	call	_cpct_setVideoMode
                            166 ;src/main.c:80: cpct_setPalette(g_palette0, 16);
   0809 21 10 00      [10]  167 	ld	hl, #0x0010
   080C E5            [11]  168 	push	hl
   080D 21 93 07      [10]  169 	ld	hl, #_g_palette0
   0810 E5            [11]  170 	push	hl
   0811 CD 6F 14      [17]  171 	call	_cpct_setPalette
                            172 ;src/main.c:81: break;
   0814 C9            [10]  173 	ret
                            174 ;src/main.c:82: case 3:
   0815                     175 00106$:
                            176 ;src/main.c:83: cpct_setBorder(HW_RED);
   0815 21 10 1C      [10]  177 	ld	hl, #0x1c10
   0818 E5            [11]  178 	push	hl
   0819 CD 92 14      [17]  179 	call	_cpct_setPALColour
                            180 ;src/main.c:84: break;
   081C C9            [10]  181 	ret
                            182 ;src/main.c:85: case 4:
   081D                     183 00107$:
                            184 ;src/main.c:86: cpct_setBorder(HW_YELLOW);
   081D 21 10 1E      [10]  185 	ld	hl, #0x1e10
   0820 E5            [11]  186 	push	hl
   0821 CD 92 14      [17]  187 	call	_cpct_setPALColour
                            188 ;src/main.c:87: break;
   0824 C9            [10]  189 	ret
                            190 ;src/main.c:88: case 5:
   0825                     191 00108$:
                            192 ;src/main.c:89: cpct_setBorder(HW_MAGENTA);
   0825 21 10 18      [10]  193 	ld	hl, #0x1810
   0828 E5            [11]  194 	push	hl
   0829 CD 92 14      [17]  195 	call	_cpct_setPALColour
                            196 ;src/main.c:91: while (i>0){
   082C 01 4A 01      [10]  197 	ld	bc, #0x014a
   082F                     198 00109$:
   082F 78            [ 4]  199 	ld	a, b
   0830 B1            [ 4]  200 	or	a,c
   0831 28 03         [12]  201 	jr	Z,00111$
                            202 ;src/main.c:92: i--;
   0833 0B            [ 6]  203 	dec	bc
   0834 18 F9         [12]  204 	jr	00109$
   0836                     205 00111$:
                            206 ;src/main.c:94: cpct_setBorder(HW_BRIGHT_CYAN);
   0836 21 10 13      [10]  207 	ld	hl, #0x1310
   0839 E5            [11]  208 	push	hl
   083A CD 92 14      [17]  209 	call	_cpct_setPALColour
                            210 ;src/main.c:95: cpct_setVideoMode(1);
   083D 2E 01         [ 7]  211 	ld	l, #0x01
   083F CD 40 16      [17]  212 	call	_cpct_setVideoMode
                            213 ;src/main.c:96: cpct_setPalette(g_palette1, 4);
   0842 21 04 00      [10]  214 	ld	hl, #0x0004
   0845 E5            [11]  215 	push	hl
   0846 21 C3 01      [10]  216 	ld	hl, #_g_palette1
   0849 E5            [11]  217 	push	hl
   084A CD 6F 14      [17]  218 	call	_cpct_setPalette
                            219 ;src/main.c:97: break;
   084D C9            [10]  220 	ret
                            221 ;src/main.c:98: default:
   084E                     222 00112$:
                            223 ;src/main.c:99: cpct_setBorder(HW_BRIGHT_BLUE);
   084E 21 10 15      [10]  224 	ld	hl, #0x1510
   0851 E5            [11]  225 	push	hl
   0852 CD 92 14      [17]  226 	call	_cpct_setPALColour
                            227 ;src/main.c:100: cpct_scanKeyboard();
   0855 CD 6A 17      [17]  228 	call	_cpct_scanKeyboard
                            229 ;src/main.c:101: g_nInterrupt = 0;
   0858 21 8B 23      [10]  230 	ld	hl,#_myInterruptHandler_g_nInterrupt_1_125 + 0
   085B 36 00         [10]  231 	ld	(hl), #0x00
                            232 ;src/main.c:103: }
   085D C9            [10]  233 	ret
   085E                     234 _card_types:
   085E 02                  235 	.db #0x02	; 2
   085F 03 05               236 	.dw _s_cards_0
   0861 53 57 4F 52 44 3A   237 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   088A 00                  238 	.db 0x00
   088B 00                  239 	.db 0x00
   088C 00                  240 	.db 0x00
   088D 00                  241 	.db 0x00
   088E 00                  242 	.db 0x00
   088F 00                  243 	.db 0x00
   0890 00                  244 	.db 0x00
   0891 00                  245 	.db 0x00
   0892 00                  246 	.db 0x00
   0893 01                  247 	.db #0x01	; 1
   0894 4B 06               248 	.dw _s_cards_1
   0896 53 48 49 45 4C 44   249 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   08B1 00                  250 	.db 0x00
   08B2 00                  251 	.db 0x00
   08B3 00                  252 	.db 0x00
   08B4 00                  253 	.db 0x00
   08B5 00                  254 	.db 0x00
   08B6 00                  255 	.db 0x00
   08B7 00                  256 	.db 0x00
   08B8 00                  257 	.db 0x00
   08B9 00                  258 	.db 0x00
   08BA 00                  259 	.db 0x00
   08BB 00                  260 	.db 0x00
   08BC 00                  261 	.db 0x00
   08BD 00                  262 	.db 0x00
   08BE 00                  263 	.db 0x00
   08BF 00                  264 	.db 0x00
   08C0 00                  265 	.db 0x00
   08C1 00                  266 	.db 0x00
   08C2 00                  267 	.db 0x00
   08C3 00                  268 	.db 0x00
   08C4 00                  269 	.db 0x00
   08C5 00                  270 	.db 0x00
   08C6 00                  271 	.db 0x00
   08C7 00                  272 	.db 0x00
   08C8                     273 _card_sprite:
   08C8 03 05               274 	.dw _s_cards_0
   08CA 4B 06               275 	.dw _s_cards_1
   08CC                     276 _card_description:
   08CC 53 57 4F 52 44 3A   277 	.ascii "SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY"
        50 52 4F 44 55 43
        45 53 20 44 49 52
        45 43 54 20 44 41
        4D 41 47 45 20 54
        4F 20 54 48 45 20
        45 4E 45 4D 59
   08F5 00                  278 	.db 0x00
   08F6 00                  279 	.db 0x00
   08F7 00                  280 	.db 0x00
   08F8 00                  281 	.db 0x00
   08F9 00                  282 	.db 0x00
   08FA 00                  283 	.db 0x00
   08FB 00                  284 	.db 0x00
   08FC 00                  285 	.db 0x00
   08FD 00                  286 	.db 0x00
   08FE 53 48 49 45 4C 44   287 	.ascii "SHIELD:PROTECTS SOME DAMAGE"
        3A 50 52 4F 54 45
        43 54 53 20 53 4F
        4D 45 20 44 41 4D
        41 47 45
   0919 00                  288 	.db 0x00
   091A 00                  289 	.db 0x00
   091B 00                  290 	.db 0x00
   091C 00                  291 	.db 0x00
   091D 00                  292 	.db 0x00
   091E 00                  293 	.db 0x00
   091F 00                  294 	.db 0x00
   0920 00                  295 	.db 0x00
   0921 00                  296 	.db 0x00
   0922 00                  297 	.db 0x00
   0923 00                  298 	.db 0x00
   0924 00                  299 	.db 0x00
   0925 00                  300 	.db 0x00
   0926 00                  301 	.db 0x00
   0927 00                  302 	.db 0x00
   0928 00                  303 	.db 0x00
   0929 00                  304 	.db 0x00
   092A 00                  305 	.db 0x00
   092B 00                  306 	.db 0x00
   092C 00                  307 	.db 0x00
   092D 00                  308 	.db 0x00
   092E 00                  309 	.db 0x00
   092F 00                  310 	.db 0x00
   0930                     311 _cost_sprite:
   0930 C7 01               312 	.dw _s_costs_0
   0932 D3 01               313 	.dw _s_costs_1
   0934 DF 01               314 	.dw _s_costs_2
   0936 EB 01               315 	.dw _s_costs_3
   0938 F7 01               316 	.dw _s_costs_4
   093A 03 02               317 	.dw _s_costs_5
                            318 ;src/main.c:106: void initCPC() {
                            319 ;	---------------------------------
                            320 ; Function initCPC
                            321 ; ---------------------------------
   093C                     322 _initCPC::
                            323 ;src/main.c:111: cpct_setPalette(g_palette0, 16);
   093C 21 10 00      [10]  324 	ld	hl, #0x0010
   093F E5            [11]  325 	push	hl
   0940 21 93 07      [10]  326 	ld	hl, #_g_palette0
   0943 E5            [11]  327 	push	hl
   0944 CD 6F 14      [17]  328 	call	_cpct_setPalette
                            329 ;src/main.c:112: cpct_setVideoMode(0);
   0947 2E 00         [ 7]  330 	ld	l, #0x00
   0949 CD 40 16      [17]  331 	call	_cpct_setVideoMode
                            332 ;src/main.c:113: cpct_memset((u8*)0x8000,0,0x8000);
   094C 21 00 80      [10]  333 	ld	hl, #0x8000
   094F E5            [11]  334 	push	hl
   0950 AF            [ 4]  335 	xor	a, a
   0951 F5            [11]  336 	push	af
   0952 33            [ 6]  337 	inc	sp
   0953 2E 00         [ 7]  338 	ld	l, #0x00
   0955 E5            [11]  339 	push	hl
   0956 CD 4E 16      [17]  340 	call	_cpct_memset
                            341 ;src/main.c:118: cpct_setCRTCReg(12, 0x2c);
   0959 21 0C 2C      [10]  342 	ld	hl, #0x2c0c
   095C E5            [11]  343 	push	hl
   095D CD 3C 17      [17]  344 	call	_cpct_setCRTCReg
                            345 ;src/main.c:122: cpct_waitVSYNC();
   0960 CD 38 16      [17]  346 	call	_cpct_waitVSYNC
                            347 ;src/main.c:123: cpct_waitHalts(2);
   0963 2E 02         [ 7]  348 	ld	l, #0x02
   0965 CD 64 15      [17]  349 	call	_cpct_waitHalts
                            350 ;src/main.c:124: cpct_waitVSYNC();
   0968 CD 38 16      [17]  351 	call	_cpct_waitVSYNC
                            352 ;src/main.c:125: cpct_setInterruptHandler(myInterruptHandler);
   096B 21 A3 07      [10]  353 	ld	hl, #_myInterruptHandler
   096E CD 9B 17      [17]  354 	call	_cpct_setInterruptHandler
   0971 C9            [10]  355 	ret
                            356 ;src/main.c:128: void check_keyboard(){
                            357 ;	---------------------------------
                            358 ; Function check_keyboard
                            359 ; ---------------------------------
   0972                     360 _check_keyboard::
                            361 ;src/main.c:129: if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
   0972 21 01 01      [10]  362 	ld	hl, #0x0101
   0975 CD 86 14      [17]  363 	call	_cpct_isKeyPressed
   0978 7D            [ 4]  364 	ld	a, l
   0979 B7            [ 4]  365 	or	a, a
   097A 28 1A         [12]  366 	jr	Z,00105$
   097C FD 21 73 23   [14]  367 	ld	iy, #_selected_card
   0980 FD 7E 00      [19]  368 	ld	a, 0 (iy)
   0983 B7            [ 4]  369 	or	a, a
   0984 28 10         [12]  370 	jr	Z,00105$
                            371 ;src/main.c:130: previous_card = selected_card;
   0986 FD 7E 00      [19]  372 	ld	a, 0 (iy)
   0989 32 74 23      [13]  373 	ld	(#_previous_card + 0),a
                            374 ;src/main.c:131: selected_card--;
   098C 21 73 23      [10]  375 	ld	hl, #_selected_card+0
   098F 35            [11]  376 	dec	(hl)
                            377 ;src/main.c:132: moved = YES;
   0990 21 8A 23      [10]  378 	ld	hl,#_moved + 0
   0993 36 01         [10]  379 	ld	(hl), #0x01
   0995 C9            [10]  380 	ret
   0996                     381 00105$:
                            382 ;src/main.c:133: } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<num_cards-1)){
   0996 21 00 02      [10]  383 	ld	hl, #0x0200
   0999 CD 86 14      [17]  384 	call	_cpct_isKeyPressed
   099C 7D            [ 4]  385 	ld	a, l
   099D B7            [ 4]  386 	or	a, a
   099E C8            [11]  387 	ret	Z
   099F 21 89 23      [10]  388 	ld	hl,#_num_cards + 0
   09A2 4E            [ 7]  389 	ld	c, (hl)
   09A3 06 00         [ 7]  390 	ld	b, #0x00
   09A5 0B            [ 6]  391 	dec	bc
   09A6 3A 73 23      [13]  392 	ld	a,(#_selected_card + 0)
   09A9 16 00         [ 7]  393 	ld	d, #0x00
   09AB 91            [ 4]  394 	sub	a, c
   09AC 7A            [ 4]  395 	ld	a, d
   09AD 98            [ 4]  396 	sbc	a, b
   09AE E2 B3 09      [10]  397 	jp	PO, 00126$
   09B1 EE 80         [ 7]  398 	xor	a, #0x80
   09B3                     399 00126$:
   09B3 F0            [11]  400 	ret	P
                            401 ;src/main.c:134: previous_card = selected_card;
   09B4 3A 73 23      [13]  402 	ld	a,(#_selected_card + 0)
   09B7 32 74 23      [13]  403 	ld	(#_previous_card + 0),a
                            404 ;src/main.c:135: selected_card++;
   09BA 21 73 23      [10]  405 	ld	hl, #_selected_card+0
   09BD 34            [11]  406 	inc	(hl)
                            407 ;src/main.c:136: moved = YES;
   09BE 21 8A 23      [10]  408 	ld	hl,#_moved + 0
   09C1 36 01         [10]  409 	ld	(hl), #0x01
   09C3 C9            [10]  410 	ret
                            411 ;src/main.c:140: void draw_cards(){
                            412 ;	---------------------------------
                            413 ; Function draw_cards
                            414 ; ---------------------------------
   09C4                     415 _draw_cards::
   09C4 DD E5         [15]  416 	push	ix
   09C6 DD 21 00 00   [14]  417 	ld	ix,#0
   09CA DD 39         [15]  418 	add	ix,sp
   09CC F5            [11]  419 	push	af
   09CD F5            [11]  420 	push	af
                            421 ;src/main.c:145: cpct_waitVSYNC();
   09CE CD 38 16      [17]  422 	call	_cpct_waitVSYNC
                            423 ;src/main.c:148: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W-3))-2, 136);
   09D1 3A 74 23      [13]  424 	ld	a,(#_previous_card + 0)
   09D4 4F            [ 4]  425 	ld	c, a
   09D5 87            [ 4]  426 	add	a, a
   09D6 87            [ 4]  427 	add	a, a
   09D7 81            [ 4]  428 	add	a, c
   09D8 47            [ 4]  429 	ld	b, a
   09D9 05            [ 4]  430 	dec	b
   09DA 05            [ 4]  431 	dec	b
   09DB 3E 88         [ 7]  432 	ld	a, #0x88
   09DD F5            [11]  433 	push	af
   09DE 33            [ 6]  434 	inc	sp
   09DF C5            [11]  435 	push	bc
   09E0 33            [ 6]  436 	inc	sp
   09E1 21 00 80      [10]  437 	ld	hl, #0x8000
   09E4 E5            [11]  438 	push	hl
   09E5 CD 4A 17      [17]  439 	call	_cpct_getScreenPtr
   09E8 22 3F 23      [16]  440 	ld	(_pvmem), hl
                            441 ;src/main.c:149: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);  
   09EB 2A 3F 23      [16]  442 	ld	hl, (_pvmem)
   09EE 01 0C 2D      [10]  443 	ld	bc, #0x2d0c
   09F1 C5            [11]  444 	push	bc
   09F2 01 33 00      [10]  445 	ld	bc, #0x0033
   09F5 C5            [11]  446 	push	bc
   09F6 E5            [11]  447 	push	hl
   09F7 CD 91 16      [17]  448 	call	_cpct_drawSolidBox
                            449 ;src/main.c:152: for (i=0;i<selected_card;i++){
   09FA DD 36 FC 00   [19]  450 	ld	-4 (ix), #0x00
   09FE                     451 00104$:
   09FE 21 73 23      [10]  452 	ld	hl, #_selected_card
   0A01 DD 7E FC      [19]  453 	ld	a, -4 (ix)
   0A04 96            [ 7]  454 	sub	a, (hl)
   0A05 D2 AA 0A      [10]  455 	jp	NC, 00101$
                            456 ;src/main.c:153: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(i*(S_CARDS_0_W-3)), 140);
   0A08 DD 7E FC      [19]  457 	ld	a, -4 (ix)
   0A0B 4F            [ 4]  458 	ld	c, a
   0A0C 87            [ 4]  459 	add	a, a
   0A0D 87            [ 4]  460 	add	a, a
   0A0E 81            [ 4]  461 	add	a, c
   0A0F DD 77 FD      [19]  462 	ld	-3 (ix), a
   0A12 47            [ 4]  463 	ld	b, a
   0A13 04            [ 4]  464 	inc	b
   0A14 04            [ 4]  465 	inc	b
   0A15 3E 8C         [ 7]  466 	ld	a, #0x8c
   0A17 F5            [11]  467 	push	af
   0A18 33            [ 6]  468 	inc	sp
   0A19 C5            [11]  469 	push	bc
   0A1A 33            [ 6]  470 	inc	sp
   0A1B 21 00 80      [10]  471 	ld	hl, #0x8000
   0A1E E5            [11]  472 	push	hl
   0A1F CD 4A 17      [17]  473 	call	_cpct_getScreenPtr
   0A22 22 3F 23      [16]  474 	ld	(_pvmem), hl
                            475 ;src/main.c:154: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0A25 2A 3F 23      [16]  476 	ld	hl, (_pvmem)
   0A28 DD 75 FE      [19]  477 	ld	-2 (ix), l
   0A2B DD 74 FF      [19]  478 	ld	-1 (ix), h
   0A2E DD 6E FC      [19]  479 	ld	l, -4 (ix)
   0A31 26 00         [ 7]  480 	ld	h, #0x00
   0A33 29            [11]  481 	add	hl, hl
   0A34 01 75 23      [10]  482 	ld	bc,#_cards
   0A37 09            [11]  483 	add	hl,bc
   0A38 4D            [ 4]  484 	ld	c, l
   0A39 44            [ 4]  485 	ld	b, h
   0A3A 0A            [ 7]  486 	ld	a, (bc)
   0A3B 5F            [ 4]  487 	ld	e,a
   0A3C 16 00         [ 7]  488 	ld	d,#0x00
   0A3E 6B            [ 4]  489 	ld	l, e
   0A3F 62            [ 4]  490 	ld	h, d
   0A40 29            [11]  491 	add	hl, hl
   0A41 19            [11]  492 	add	hl, de
   0A42 29            [11]  493 	add	hl, hl
   0A43 29            [11]  494 	add	hl, hl
   0A44 19            [11]  495 	add	hl, de
   0A45 29            [11]  496 	add	hl, hl
   0A46 29            [11]  497 	add	hl, hl
   0A47 19            [11]  498 	add	hl, de
   0A48 11 5E 08      [10]  499 	ld	de, #_card_types
   0A4B 19            [11]  500 	add	hl, de
   0A4C 23            [ 6]  501 	inc	hl
   0A4D 5E            [ 7]  502 	ld	e, (hl)
   0A4E 23            [ 6]  503 	inc	hl
   0A4F 56            [ 7]  504 	ld	d, (hl)
   0A50 C5            [11]  505 	push	bc
   0A51 21 08 29      [10]  506 	ld	hl, #0x2908
   0A54 E5            [11]  507 	push	hl
   0A55 DD 6E FE      [19]  508 	ld	l,-2 (ix)
   0A58 DD 66 FF      [19]  509 	ld	h,-1 (ix)
   0A5B E5            [11]  510 	push	hl
   0A5C D5            [11]  511 	push	de
   0A5D CD 9E 14      [17]  512 	call	_cpct_drawSprite
   0A60 C1            [10]  513 	pop	bc
                            514 ;src/main.c:155: pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(i*(S_CARDS_0_W-3)), 141);
   0A61 DD 56 FD      [19]  515 	ld	d, -3 (ix)
   0A64 14            [ 4]  516 	inc	d
   0A65 14            [ 4]  517 	inc	d
   0A66 14            [ 4]  518 	inc	d
   0A67 C5            [11]  519 	push	bc
   0A68 3E 8D         [ 7]  520 	ld	a, #0x8d
   0A6A F5            [11]  521 	push	af
   0A6B 33            [ 6]  522 	inc	sp
   0A6C D5            [11]  523 	push	de
   0A6D 33            [ 6]  524 	inc	sp
   0A6E 21 00 80      [10]  525 	ld	hl, #0x8000
   0A71 E5            [11]  526 	push	hl
   0A72 CD 4A 17      [17]  527 	call	_cpct_getScreenPtr
   0A75 C1            [10]  528 	pop	bc
   0A76 22 3F 23      [16]  529 	ld	(_pvmem), hl
                            530 ;src/main.c:156: cpct_drawSprite(cost_sprite[card_types[cards[i].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);
   0A79 ED 5B 3F 23   [20]  531 	ld	de, (_pvmem)
   0A7D 0A            [ 7]  532 	ld	a, (bc)
   0A7E 4F            [ 4]  533 	ld	c,a
   0A7F 06 00         [ 7]  534 	ld	b,#0x00
   0A81 69            [ 4]  535 	ld	l, c
   0A82 60            [ 4]  536 	ld	h, b
   0A83 29            [11]  537 	add	hl, hl
   0A84 09            [11]  538 	add	hl, bc
   0A85 29            [11]  539 	add	hl, hl
   0A86 29            [11]  540 	add	hl, hl
   0A87 09            [11]  541 	add	hl, bc
   0A88 29            [11]  542 	add	hl, hl
   0A89 29            [11]  543 	add	hl, hl
   0A8A 09            [11]  544 	add	hl, bc
   0A8B 01 5E 08      [10]  545 	ld	bc, #_card_types
   0A8E 09            [11]  546 	add	hl, bc
   0A8F 6E            [ 7]  547 	ld	l, (hl)
   0A90 2D            [ 4]  548 	dec	l
   0A91 26 00         [ 7]  549 	ld	h, #0x00
   0A93 29            [11]  550 	add	hl, hl
   0A94 01 30 09      [10]  551 	ld	bc, #_cost_sprite
   0A97 09            [11]  552 	add	hl, bc
   0A98 4E            [ 7]  553 	ld	c, (hl)
   0A99 23            [ 6]  554 	inc	hl
   0A9A 46            [ 7]  555 	ld	b, (hl)
   0A9B 21 02 06      [10]  556 	ld	hl, #0x0602
   0A9E E5            [11]  557 	push	hl
   0A9F D5            [11]  558 	push	de
   0AA0 C5            [11]  559 	push	bc
   0AA1 CD 9E 14      [17]  560 	call	_cpct_drawSprite
                            561 ;src/main.c:152: for (i=0;i<selected_card;i++){
   0AA4 DD 34 FC      [23]  562 	inc	-4 (ix)
   0AA7 C3 FE 09      [10]  563 	jp	00104$
   0AAA                     564 00101$:
                            565 ;src/main.c:160: for (i=selected_card+1;i<num_cards;i++){
   0AAA 3A 73 23      [13]  566 	ld	a,(#_selected_card + 0)
   0AAD 3C            [ 4]  567 	inc	a
   0AAE DD 77 FE      [19]  568 	ld	-2 (ix), a
   0AB1                     569 00107$:
   0AB1 21 89 23      [10]  570 	ld	hl, #_num_cards
   0AB4 DD 7E FE      [19]  571 	ld	a, -2 (ix)
   0AB7 96            [ 7]  572 	sub	a, (hl)
   0AB8 D2 55 0B      [10]  573 	jp	NC, 00102$
                            574 ;src/main.c:161: pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(i*(S_CARDS_0_W-3)), 140);
   0ABB DD 7E FE      [19]  575 	ld	a, -2 (ix)
   0ABE 4F            [ 4]  576 	ld	c, a
   0ABF 87            [ 4]  577 	add	a, a
   0AC0 87            [ 4]  578 	add	a, a
   0AC1 81            [ 4]  579 	add	a, c
   0AC2 DD 77 FD      [19]  580 	ld	-3 (ix), a
   0AC5 47            [ 4]  581 	ld	b, a
   0AC6 04            [ 4]  582 	inc	b
   0AC7 04            [ 4]  583 	inc	b
   0AC8 04            [ 4]  584 	inc	b
   0AC9 04            [ 4]  585 	inc	b
   0ACA 3E 8C         [ 7]  586 	ld	a, #0x8c
   0ACC F5            [11]  587 	push	af
   0ACD 33            [ 6]  588 	inc	sp
   0ACE C5            [11]  589 	push	bc
   0ACF 33            [ 6]  590 	inc	sp
   0AD0 21 00 80      [10]  591 	ld	hl, #0x8000
   0AD3 E5            [11]  592 	push	hl
   0AD4 CD 4A 17      [17]  593 	call	_cpct_getScreenPtr
   0AD7 22 3F 23      [16]  594 	ld	(_pvmem), hl
                            595 ;src/main.c:162: cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0ADA FD 2A 3F 23   [20]  596 	ld	iy, (_pvmem)
   0ADE DD 6E FE      [19]  597 	ld	l, -2 (ix)
   0AE1 26 00         [ 7]  598 	ld	h, #0x00
   0AE3 29            [11]  599 	add	hl, hl
   0AE4 01 75 23      [10]  600 	ld	bc,#_cards
   0AE7 09            [11]  601 	add	hl,bc
   0AE8 4D            [ 4]  602 	ld	c, l
   0AE9 44            [ 4]  603 	ld	b, h
   0AEA 0A            [ 7]  604 	ld	a, (bc)
   0AEB 5F            [ 4]  605 	ld	e,a
   0AEC 16 00         [ 7]  606 	ld	d,#0x00
   0AEE 6B            [ 4]  607 	ld	l, e
   0AEF 62            [ 4]  608 	ld	h, d
   0AF0 29            [11]  609 	add	hl, hl
   0AF1 19            [11]  610 	add	hl, de
   0AF2 29            [11]  611 	add	hl, hl
   0AF3 29            [11]  612 	add	hl, hl
   0AF4 19            [11]  613 	add	hl, de
   0AF5 29            [11]  614 	add	hl, hl
   0AF6 29            [11]  615 	add	hl, hl
   0AF7 19            [11]  616 	add	hl, de
   0AF8 11 5E 08      [10]  617 	ld	de, #_card_types
   0AFB 19            [11]  618 	add	hl, de
   0AFC 23            [ 6]  619 	inc	hl
   0AFD 5E            [ 7]  620 	ld	e, (hl)
   0AFE 23            [ 6]  621 	inc	hl
   0AFF 56            [ 7]  622 	ld	d, (hl)
   0B00 C5            [11]  623 	push	bc
   0B01 21 08 29      [10]  624 	ld	hl, #0x2908
   0B04 E5            [11]  625 	push	hl
   0B05 FD E5         [15]  626 	push	iy
   0B07 D5            [11]  627 	push	de
   0B08 CD 9E 14      [17]  628 	call	_cpct_drawSprite
   0B0B C1            [10]  629 	pop	bc
                            630 ;src/main.c:163: pvmem = cpct_getScreenPtr((u8*) VM_START, 5+(i*(S_CARDS_0_W-3)), 141);
   0B0C DD 7E FD      [19]  631 	ld	a, -3 (ix)
   0B0F C6 05         [ 7]  632 	add	a, #0x05
   0B11 57            [ 4]  633 	ld	d, a
   0B12 C5            [11]  634 	push	bc
   0B13 3E 8D         [ 7]  635 	ld	a, #0x8d
   0B15 F5            [11]  636 	push	af
   0B16 33            [ 6]  637 	inc	sp
   0B17 D5            [11]  638 	push	de
   0B18 33            [ 6]  639 	inc	sp
   0B19 21 00 80      [10]  640 	ld	hl, #0x8000
   0B1C E5            [11]  641 	push	hl
   0B1D CD 4A 17      [17]  642 	call	_cpct_getScreenPtr
   0B20 C1            [10]  643 	pop	bc
   0B21 22 3F 23      [16]  644 	ld	(_pvmem), hl
                            645 ;src/main.c:164: cpct_drawSprite(cost_sprite[card_types[cards[i].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);
   0B24 ED 5B 3F 23   [20]  646 	ld	de, (_pvmem)
   0B28 0A            [ 7]  647 	ld	a, (bc)
   0B29 4F            [ 4]  648 	ld	c,a
   0B2A 06 00         [ 7]  649 	ld	b,#0x00
   0B2C 69            [ 4]  650 	ld	l, c
   0B2D 60            [ 4]  651 	ld	h, b
   0B2E 29            [11]  652 	add	hl, hl
   0B2F 09            [11]  653 	add	hl, bc
   0B30 29            [11]  654 	add	hl, hl
   0B31 29            [11]  655 	add	hl, hl
   0B32 09            [11]  656 	add	hl, bc
   0B33 29            [11]  657 	add	hl, hl
   0B34 29            [11]  658 	add	hl, hl
   0B35 09            [11]  659 	add	hl, bc
   0B36 01 5E 08      [10]  660 	ld	bc, #_card_types
   0B39 09            [11]  661 	add	hl, bc
   0B3A 6E            [ 7]  662 	ld	l, (hl)
   0B3B 2D            [ 4]  663 	dec	l
   0B3C 26 00         [ 7]  664 	ld	h, #0x00
   0B3E 29            [11]  665 	add	hl, hl
   0B3F 01 30 09      [10]  666 	ld	bc, #_cost_sprite
   0B42 09            [11]  667 	add	hl, bc
   0B43 4E            [ 7]  668 	ld	c, (hl)
   0B44 23            [ 6]  669 	inc	hl
   0B45 46            [ 7]  670 	ld	b, (hl)
   0B46 21 02 06      [10]  671 	ld	hl, #0x0602
   0B49 E5            [11]  672 	push	hl
   0B4A D5            [11]  673 	push	de
   0B4B C5            [11]  674 	push	bc
   0B4C CD 9E 14      [17]  675 	call	_cpct_drawSprite
                            676 ;src/main.c:160: for (i=selected_card+1;i<num_cards;i++){
   0B4F DD 34 FE      [23]  677 	inc	-2 (ix)
   0B52 C3 B1 0A      [10]  678 	jp	00107$
   0B55                     679 00102$:
                            680 ;src/main.c:168: pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(selected_card*(S_CARDS_0_W-3)), 136);
   0B55 3A 73 23      [13]  681 	ld	a,(#_selected_card + 0)
   0B58 4F            [ 4]  682 	ld	c, a
   0B59 87            [ 4]  683 	add	a, a
   0B5A 87            [ 4]  684 	add	a, a
   0B5B 81            [ 4]  685 	add	a, c
   0B5C 47            [ 4]  686 	ld	b, a
   0B5D 04            [ 4]  687 	inc	b
   0B5E 04            [ 4]  688 	inc	b
   0B5F 04            [ 4]  689 	inc	b
   0B60 3E 88         [ 7]  690 	ld	a, #0x88
   0B62 F5            [11]  691 	push	af
   0B63 33            [ 6]  692 	inc	sp
   0B64 C5            [11]  693 	push	bc
   0B65 33            [ 6]  694 	inc	sp
   0B66 21 00 80      [10]  695 	ld	hl, #0x8000
   0B69 E5            [11]  696 	push	hl
   0B6A CD 4A 17      [17]  697 	call	_cpct_getScreenPtr
   0B6D 22 3F 23      [16]  698 	ld	(_pvmem), hl
                            699 ;src/main.c:169: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0B70 ED 4B 3F 23   [20]  700 	ld	bc, (_pvmem)
   0B74 FD 21 73 23   [14]  701 	ld	iy, #_selected_card
   0B78 FD 6E 00      [19]  702 	ld	l, 0 (iy)
   0B7B 26 00         [ 7]  703 	ld	h, #0x00
   0B7D 29            [11]  704 	add	hl, hl
   0B7E 11 75 23      [10]  705 	ld	de, #_cards
   0B81 19            [11]  706 	add	hl, de
   0B82 5E            [ 7]  707 	ld	e, (hl)
   0B83 16 00         [ 7]  708 	ld	d,#0x00
   0B85 6B            [ 4]  709 	ld	l, e
   0B86 62            [ 4]  710 	ld	h, d
   0B87 29            [11]  711 	add	hl, hl
   0B88 19            [11]  712 	add	hl, de
   0B89 29            [11]  713 	add	hl, hl
   0B8A 29            [11]  714 	add	hl, hl
   0B8B 19            [11]  715 	add	hl, de
   0B8C 29            [11]  716 	add	hl, hl
   0B8D 29            [11]  717 	add	hl, hl
   0B8E 19            [11]  718 	add	hl, de
   0B8F 11 5E 08      [10]  719 	ld	de, #_card_types
   0B92 19            [11]  720 	add	hl, de
   0B93 23            [ 6]  721 	inc	hl
   0B94 5E            [ 7]  722 	ld	e, (hl)
   0B95 23            [ 6]  723 	inc	hl
   0B96 56            [ 7]  724 	ld	d, (hl)
   0B97 21 08 29      [10]  725 	ld	hl, #0x2908
   0B9A E5            [11]  726 	push	hl
   0B9B C5            [11]  727 	push	bc
   0B9C D5            [11]  728 	push	de
   0B9D CD 9E 14      [17]  729 	call	_cpct_drawSprite
                            730 ;src/main.c:170: pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(selected_card*(S_CARDS_0_W-3)), 137);
   0BA0 3A 73 23      [13]  731 	ld	a,(#_selected_card + 0)
   0BA3 4F            [ 4]  732 	ld	c, a
   0BA4 87            [ 4]  733 	add	a, a
   0BA5 87            [ 4]  734 	add	a, a
   0BA6 81            [ 4]  735 	add	a, c
   0BA7 47            [ 4]  736 	ld	b, a
   0BA8 04            [ 4]  737 	inc	b
   0BA9 04            [ 4]  738 	inc	b
   0BAA 04            [ 4]  739 	inc	b
   0BAB 04            [ 4]  740 	inc	b
   0BAC 3E 89         [ 7]  741 	ld	a, #0x89
   0BAE F5            [11]  742 	push	af
   0BAF 33            [ 6]  743 	inc	sp
   0BB0 C5            [11]  744 	push	bc
   0BB1 33            [ 6]  745 	inc	sp
   0BB2 21 00 80      [10]  746 	ld	hl, #0x8000
   0BB5 E5            [11]  747 	push	hl
   0BB6 CD 4A 17      [17]  748 	call	_cpct_getScreenPtr
   0BB9 22 3F 23      [16]  749 	ld	(_pvmem), hl
                            750 ;src/main.c:171: cpct_drawSprite(cost_sprite[card_types[cards[selected_card].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);
   0BBC ED 4B 3F 23   [20]  751 	ld	bc, (_pvmem)
   0BC0 FD 21 73 23   [14]  752 	ld	iy, #_selected_card
   0BC4 FD 6E 00      [19]  753 	ld	l, 0 (iy)
   0BC7 26 00         [ 7]  754 	ld	h, #0x00
   0BC9 29            [11]  755 	add	hl, hl
   0BCA 11 75 23      [10]  756 	ld	de, #_cards
   0BCD 19            [11]  757 	add	hl, de
   0BCE 5E            [ 7]  758 	ld	e, (hl)
   0BCF 16 00         [ 7]  759 	ld	d,#0x00
   0BD1 6B            [ 4]  760 	ld	l, e
   0BD2 62            [ 4]  761 	ld	h, d
   0BD3 29            [11]  762 	add	hl, hl
   0BD4 19            [11]  763 	add	hl, de
   0BD5 29            [11]  764 	add	hl, hl
   0BD6 29            [11]  765 	add	hl, hl
   0BD7 19            [11]  766 	add	hl, de
   0BD8 29            [11]  767 	add	hl, hl
   0BD9 29            [11]  768 	add	hl, hl
   0BDA 19            [11]  769 	add	hl, de
   0BDB 11 5E 08      [10]  770 	ld	de, #_card_types
   0BDE 19            [11]  771 	add	hl, de
   0BDF 6E            [ 7]  772 	ld	l, (hl)
   0BE0 2D            [ 4]  773 	dec	l
   0BE1 26 00         [ 7]  774 	ld	h, #0x00
   0BE3 29            [11]  775 	add	hl, hl
   0BE4 11 30 09      [10]  776 	ld	de, #_cost_sprite
   0BE7 19            [11]  777 	add	hl, de
   0BE8 5E            [ 7]  778 	ld	e, (hl)
   0BE9 23            [ 6]  779 	inc	hl
   0BEA 56            [ 7]  780 	ld	d, (hl)
   0BEB 21 02 06      [10]  781 	ld	hl, #0x0602
   0BEE E5            [11]  782 	push	hl
   0BEF C5            [11]  783 	push	bc
   0BF0 D5            [11]  784 	push	de
   0BF1 CD 9E 14      [17]  785 	call	_cpct_drawSprite
                            786 ;src/main.c:175: pvmem = cpct_getScreenPtr((u8*) VM_START, 10, 190);
   0BF4 21 0A BE      [10]  787 	ld	hl, #0xbe0a
   0BF7 E5            [11]  788 	push	hl
   0BF8 21 00 80      [10]  789 	ld	hl, #0x8000
   0BFB E5            [11]  790 	push	hl
   0BFC CD 4A 17      [17]  791 	call	_cpct_getScreenPtr
   0BFF 22 3F 23      [16]  792 	ld	(_pvmem), hl
                            793 ;src/main.c:176: cpct_drawSolidBox(pvmem, 0x00, 50, 9);
   0C02 2A 3F 23      [16]  794 	ld	hl, (_pvmem)
   0C05 01 32 09      [10]  795 	ld	bc, #0x0932
   0C08 C5            [11]  796 	push	bc
   0C09 01 00 00      [10]  797 	ld	bc, #0x0000
   0C0C C5            [11]  798 	push	bc
   0C0D E5            [11]  799 	push	hl
   0C0E CD 91 16      [17]  800 	call	_cpct_drawSolidBox
                            801 ;src/main.c:178: drawTextM1(card_types[cards[selected_card].type].description,2,190,NORMALHEIGHT);
   0C11 FD 21 73 23   [14]  802 	ld	iy, #_selected_card
   0C15 FD 6E 00      [19]  803 	ld	l, 0 (iy)
   0C18 26 00         [ 7]  804 	ld	h, #0x00
   0C1A 29            [11]  805 	add	hl, hl
   0C1B 11 75 23      [10]  806 	ld	de, #_cards
   0C1E 19            [11]  807 	add	hl, de
   0C1F 4E            [ 7]  808 	ld	c, (hl)
   0C20 06 00         [ 7]  809 	ld	b,#0x00
   0C22 69            [ 4]  810 	ld	l, c
   0C23 60            [ 4]  811 	ld	h, b
   0C24 29            [11]  812 	add	hl, hl
   0C25 09            [11]  813 	add	hl, bc
   0C26 29            [11]  814 	add	hl, hl
   0C27 29            [11]  815 	add	hl, hl
   0C28 09            [11]  816 	add	hl, bc
   0C29 29            [11]  817 	add	hl, hl
   0C2A 29            [11]  818 	add	hl, hl
   0C2B 09            [11]  819 	add	hl, bc
   0C2C 11 5E 08      [10]  820 	ld	de, #_card_types
   0C2F 19            [11]  821 	add	hl, de
   0C30 23            [ 6]  822 	inc	hl
   0C31 23            [ 6]  823 	inc	hl
   0C32 23            [ 6]  824 	inc	hl
   0C33 4D            [ 4]  825 	ld	c, l
   0C34 44            [ 4]  826 	ld	b, h
   0C35 21 BE 01      [10]  827 	ld	hl, #0x01be
   0C38 E5            [11]  828 	push	hl
   0C39 3E 02         [ 7]  829 	ld	a, #0x02
   0C3B F5            [11]  830 	push	af
   0C3C 33            [ 6]  831 	inc	sp
   0C3D C5            [11]  832 	push	bc
   0C3E CD 8E 0E      [17]  833 	call	_drawTextM1
   0C41 F1            [10]  834 	pop	af
   0C42 F1            [10]  835 	pop	af
   0C43 33            [ 6]  836 	inc	sp
                            837 ;src/main.c:181: sprintf(aux_txt, "PREVIOUS:%1d", previous_card);
   0C44 21 74 23      [10]  838 	ld	hl,#_previous_card + 0
   0C47 4E            [ 7]  839 	ld	c, (hl)
   0C48 06 00         [ 7]  840 	ld	b, #0x00
   0C4A C5            [11]  841 	push	bc
   0C4B 21 98 0C      [10]  842 	ld	hl, #___str_2
   0C4E E5            [11]  843 	push	hl
   0C4F 21 41 23      [10]  844 	ld	hl, #_aux_txt
   0C52 E5            [11]  845 	push	hl
   0C53 CD 03 16      [17]  846 	call	_sprintf
   0C56 21 06 00      [10]  847 	ld	hl, #6
   0C59 39            [11]  848 	add	hl, sp
   0C5A F9            [ 6]  849 	ld	sp, hl
                            850 ;src/main.c:182: drawTextM1(aux_txt,40,190,NORMALHEIGHT);
   0C5B 21 BE 01      [10]  851 	ld	hl, #0x01be
   0C5E E5            [11]  852 	push	hl
   0C5F 3E 28         [ 7]  853 	ld	a, #0x28
   0C61 F5            [11]  854 	push	af
   0C62 33            [ 6]  855 	inc	sp
   0C63 21 41 23      [10]  856 	ld	hl, #_aux_txt
   0C66 E5            [11]  857 	push	hl
   0C67 CD 8E 0E      [17]  858 	call	_drawTextM1
   0C6A F1            [10]  859 	pop	af
   0C6B F1            [10]  860 	pop	af
   0C6C 33            [ 6]  861 	inc	sp
                            862 ;src/main.c:183: sprintf(aux_txt, "SELECTED:%1d", selected_card);
   0C6D 21 73 23      [10]  863 	ld	hl,#_selected_card + 0
   0C70 4E            [ 7]  864 	ld	c, (hl)
   0C71 06 00         [ 7]  865 	ld	b, #0x00
   0C73 C5            [11]  866 	push	bc
   0C74 21 A5 0C      [10]  867 	ld	hl, #___str_3
   0C77 E5            [11]  868 	push	hl
   0C78 21 41 23      [10]  869 	ld	hl, #_aux_txt
   0C7B E5            [11]  870 	push	hl
   0C7C CD 03 16      [17]  871 	call	_sprintf
   0C7F 21 06 00      [10]  872 	ld	hl, #6
   0C82 39            [11]  873 	add	hl, sp
   0C83 F9            [ 6]  874 	ld	sp, hl
                            875 ;src/main.c:184: drawTextM1(aux_txt,60,190,NORMALHEIGHT);
   0C84 21 BE 01      [10]  876 	ld	hl, #0x01be
   0C87 E5            [11]  877 	push	hl
   0C88 3E 3C         [ 7]  878 	ld	a, #0x3c
   0C8A F5            [11]  879 	push	af
   0C8B 33            [ 6]  880 	inc	sp
   0C8C 21 41 23      [10]  881 	ld	hl, #_aux_txt
   0C8F E5            [11]  882 	push	hl
   0C90 CD 8E 0E      [17]  883 	call	_drawTextM1
   0C93 DD F9         [10]  884 	ld	sp,ix
   0C95 DD E1         [14]  885 	pop	ix
   0C97 C9            [10]  886 	ret
   0C98                     887 ___str_2:
   0C98 50 52 45 56 49 4F   888 	.ascii "PREVIOUS:%1d"
        55 53 3A 25 31 64
   0CA4 00                  889 	.db 0x00
   0CA5                     890 ___str_3:
   0CA5 53 45 4C 45 43 54   891 	.ascii "SELECTED:%1d"
        45 44 3A 25 31 64
   0CB1 00                  892 	.db 0x00
                            893 ;src/main.c:188: void update_selected_card(){
                            894 ;	---------------------------------
                            895 ; Function update_selected_card
                            896 ; ---------------------------------
   0CB2                     897 _update_selected_card::
                            898 ;src/main.c:190: if (selected_card>0){
   0CB2 3A 73 23      [13]  899 	ld	a,(#_selected_card + 0)
   0CB5 B7            [ 4]  900 	or	a, a
   0CB6 28 2A         [12]  901 	jr	Z,00102$
                            902 ;src/main.c:191: pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W))-2, 140);
   0CB8 3A 74 23      [13]  903 	ld	a,(#_previous_card + 0)
   0CBB 07            [ 4]  904 	rlca
   0CBC 07            [ 4]  905 	rlca
   0CBD 07            [ 4]  906 	rlca
   0CBE E6 F8         [ 7]  907 	and	a, #0xf8
   0CC0 47            [ 4]  908 	ld	b, a
   0CC1 05            [ 4]  909 	dec	b
   0CC2 05            [ 4]  910 	dec	b
   0CC3 3E 8C         [ 7]  911 	ld	a, #0x8c
   0CC5 F5            [11]  912 	push	af
   0CC6 33            [ 6]  913 	inc	sp
   0CC7 C5            [11]  914 	push	bc
   0CC8 33            [ 6]  915 	inc	sp
   0CC9 21 00 80      [10]  916 	ld	hl, #0x8000
   0CCC E5            [11]  917 	push	hl
   0CCD CD 4A 17      [17]  918 	call	_cpct_getScreenPtr
   0CD0 22 3F 23      [16]  919 	ld	(_pvmem), hl
                            920 ;src/main.c:192: cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
   0CD3 2A 3F 23      [16]  921 	ld	hl, (_pvmem)
   0CD6 01 08 05      [10]  922 	ld	bc, #0x0508
   0CD9 C5            [11]  923 	push	bc
   0CDA 01 33 00      [10]  924 	ld	bc, #0x0033
   0CDD C5            [11]  925 	push	bc
   0CDE E5            [11]  926 	push	hl
   0CDF CD 91 16      [17]  927 	call	_cpct_drawSolidBox
   0CE2                     928 00102$:
                            929 ;src/main.c:195: pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(selected_card*(S_CARDS_0_W-3)), 144);
   0CE2 3A 73 23      [13]  930 	ld	a,(#_selected_card + 0)
   0CE5 4F            [ 4]  931 	ld	c, a
   0CE6 87            [ 4]  932 	add	a, a
   0CE7 87            [ 4]  933 	add	a, a
   0CE8 81            [ 4]  934 	add	a, c
   0CE9 47            [ 4]  935 	ld	b, a
   0CEA 04            [ 4]  936 	inc	b
   0CEB 04            [ 4]  937 	inc	b
   0CEC 3E 90         [ 7]  938 	ld	a, #0x90
   0CEE F5            [11]  939 	push	af
   0CEF 33            [ 6]  940 	inc	sp
   0CF0 C5            [11]  941 	push	bc
   0CF1 33            [ 6]  942 	inc	sp
   0CF2 21 00 80      [10]  943 	ld	hl, #0x8000
   0CF5 E5            [11]  944 	push	hl
   0CF6 CD 4A 17      [17]  945 	call	_cpct_getScreenPtr
   0CF9 22 3F 23      [16]  946 	ld	(_pvmem), hl
                            947 ;src/main.c:196: cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   0CFC ED 5B 3F 23   [20]  948 	ld	de, (_pvmem)
   0D00 01 75 23      [10]  949 	ld	bc, #_cards+0
   0D03 FD 21 73 23   [14]  950 	ld	iy, #_selected_card
   0D07 FD 6E 00      [19]  951 	ld	l, 0 (iy)
   0D0A 26 00         [ 7]  952 	ld	h, #0x00
   0D0C 29            [11]  953 	add	hl, hl
   0D0D 09            [11]  954 	add	hl, bc
   0D0E 4E            [ 7]  955 	ld	c, (hl)
   0D0F 06 00         [ 7]  956 	ld	b,#0x00
   0D11 69            [ 4]  957 	ld	l, c
   0D12 60            [ 4]  958 	ld	h, b
   0D13 29            [11]  959 	add	hl, hl
   0D14 09            [11]  960 	add	hl, bc
   0D15 29            [11]  961 	add	hl, hl
   0D16 29            [11]  962 	add	hl, hl
   0D17 09            [11]  963 	add	hl, bc
   0D18 29            [11]  964 	add	hl, hl
   0D19 29            [11]  965 	add	hl, hl
   0D1A 09            [11]  966 	add	hl, bc
   0D1B 01 5E 08      [10]  967 	ld	bc, #_card_types
   0D1E 09            [11]  968 	add	hl, bc
   0D1F 23            [ 6]  969 	inc	hl
   0D20 4E            [ 7]  970 	ld	c, (hl)
   0D21 23            [ 6]  971 	inc	hl
   0D22 46            [ 7]  972 	ld	b, (hl)
   0D23 21 08 29      [10]  973 	ld	hl, #0x2908
   0D26 E5            [11]  974 	push	hl
   0D27 D5            [11]  975 	push	de
   0D28 C5            [11]  976 	push	bc
   0D29 CD 9E 14      [17]  977 	call	_cpct_drawSprite
   0D2C C9            [10]  978 	ret
                            979 ;src/main.c:199: void init_cards(){
                            980 ;	---------------------------------
                            981 ; Function init_cards
                            982 ; ---------------------------------
   0D2D                     983 _init_cards::
                            984 ;src/main.c:202: num_cards = (cpct_rand() % 9) + 1;
   0D2D CD 6C 16      [17]  985 	call	_cpct_getRandom_mxor_u8
   0D30 45            [ 4]  986 	ld	b, l
   0D31 3E 09         [ 7]  987 	ld	a, #0x09
   0D33 F5            [11]  988 	push	af
   0D34 33            [ 6]  989 	inc	sp
   0D35 C5            [11]  990 	push	bc
   0D36 33            [ 6]  991 	inc	sp
   0D37 CD 43 15      [17]  992 	call	__moduchar
   0D3A F1            [10]  993 	pop	af
   0D3B 7D            [ 4]  994 	ld	a, l
   0D3C 21 89 23      [10]  995 	ld	hl, #_num_cards
   0D3F 3C            [ 4]  996 	inc	a
   0D40 77            [ 7]  997 	ld	(hl), a
                            998 ;src/main.c:203: for (i=0;i<num_cards;i++){
   0D41 0E 00         [ 7]  999 	ld	c, #0x00
   0D43                    1000 00103$:
   0D43 21 89 23      [10] 1001 	ld	hl, #_num_cards
   0D46 79            [ 4] 1002 	ld	a, c
   0D47 96            [ 7] 1003 	sub	a, (hl)
   0D48 D2 C4 09      [10] 1004 	jp	NC,_draw_cards
                           1005 ;src/main.c:204: cards[i].type = cpct_rand() % 2;
   0D4B 69            [ 4] 1006 	ld	l, c
   0D4C 26 00         [ 7] 1007 	ld	h, #0x00
   0D4E 29            [11] 1008 	add	hl, hl
   0D4F 11 75 23      [10] 1009 	ld	de, #_cards
   0D52 19            [11] 1010 	add	hl, de
   0D53 E5            [11] 1011 	push	hl
   0D54 C5            [11] 1012 	push	bc
   0D55 CD 6C 16      [17] 1013 	call	_cpct_getRandom_mxor_u8
   0D58 7D            [ 4] 1014 	ld	a, l
   0D59 C1            [10] 1015 	pop	bc
   0D5A E1            [10] 1016 	pop	hl
   0D5B E6 01         [ 7] 1017 	and	a, #0x01
   0D5D 77            [ 7] 1018 	ld	(hl), a
                           1019 ;src/main.c:203: for (i=0;i<num_cards;i++){
   0D5E 0C            [ 4] 1020 	inc	c
   0D5F 18 E2         [12] 1021 	jr	00103$
                           1022 ;src/main.c:207: draw_cards();
   0D61 C3 C4 09      [10] 1023 	jp  _draw_cards
                           1024 ;src/main.c:210: void main(void) {
                           1025 ;	---------------------------------
                           1026 ; Function main
                           1027 ; ---------------------------------
   0D64                    1028 _main::
                           1029 ;src/main.c:211: cpct_disableFirmware();
   0D64 CD 5C 16      [17] 1030 	call	_cpct_disableFirmware
                           1031 ;src/main.c:212: cpct_setStackLocation((u8*) 0x7fff);
   0D67 21 FF 7F      [10] 1032 	ld	hl, #0x7fff
   0D6A CD AA 15      [17] 1033 	call	_cpct_setStackLocation
                           1034 ;src/main.c:214: initCPC();
   0D6D CD 3C 09      [17] 1035 	call	_initCPC
                           1036 ;src/main.c:216: selected_card = 4;
   0D70 21 73 23      [10] 1037 	ld	hl,#_selected_card + 0
   0D73 36 04         [10] 1038 	ld	(hl), #0x04
                           1039 ;src/main.c:217: previous_card = 4;
   0D75 21 74 23      [10] 1040 	ld	hl,#_previous_card + 0
   0D78 36 04         [10] 1041 	ld	(hl), #0x04
                           1042 ;src/main.c:218: moved = NO;
   0D7A 21 8A 23      [10] 1043 	ld	hl,#_moved + 0
   0D7D 36 00         [10] 1044 	ld	(hl), #0x00
                           1045 ;src/main.c:220: drawTextM1("CARD HERO - DECK BUILDING GAME",10,0,NORMALHEIGHT);
   0D7F 21 00 01      [10] 1046 	ld	hl, #0x0100
   0D82 E5            [11] 1047 	push	hl
   0D83 3E 0A         [ 7] 1048 	ld	a, #0x0a
   0D85 F5            [11] 1049 	push	af
   0D86 33            [ 6] 1050 	inc	sp
   0D87 21 BB 0D      [10] 1051 	ld	hl, #___str_4
   0D8A E5            [11] 1052 	push	hl
   0D8B CD 8E 0E      [17] 1053 	call	_drawTextM1
   0D8E F1            [10] 1054 	pop	af
                           1055 ;src/main.c:221: drawTextM1("SECOND LINE, JUST IN CASE",10,10,NORMALHEIGHT);
   0D8F 33            [ 6] 1056 	inc	sp
   0D90 21 0A 01      [10] 1057 	ld	hl,#0x010a
   0D93 E3            [19] 1058 	ex	(sp),hl
   0D94 3E 0A         [ 7] 1059 	ld	a, #0x0a
   0D96 F5            [11] 1060 	push	af
   0D97 33            [ 6] 1061 	inc	sp
   0D98 21 DA 0D      [10] 1062 	ld	hl, #___str_5
   0D9B E5            [11] 1063 	push	hl
   0D9C CD 8E 0E      [17] 1064 	call	_drawTextM1
   0D9F F1            [10] 1065 	pop	af
   0DA0 F1            [10] 1066 	pop	af
   0DA1 33            [ 6] 1067 	inc	sp
                           1068 ;src/main.c:223: init_cards();
   0DA2 CD 2D 0D      [17] 1069 	call	_init_cards
                           1070 ;src/main.c:225: draw_cards();
   0DA5 CD C4 09      [17] 1071 	call	_draw_cards
                           1072 ;src/main.c:228: while (1){
   0DA8                    1073 00104$:
                           1074 ;src/main.c:229: check_keyboard();
   0DA8 CD 72 09      [17] 1075 	call	_check_keyboard
                           1076 ;src/main.c:230: if (moved){
   0DAB 3A 8A 23      [13] 1077 	ld	a,(#_moved + 0)
   0DAE B7            [ 4] 1078 	or	a, a
   0DAF 28 F7         [12] 1079 	jr	Z,00104$
                           1080 ;src/main.c:231: draw_cards();
   0DB1 CD C4 09      [17] 1081 	call	_draw_cards
                           1082 ;src/main.c:232: moved = NO;
   0DB4 21 8A 23      [10] 1083 	ld	hl,#_moved + 0
   0DB7 36 00         [10] 1084 	ld	(hl), #0x00
   0DB9 18 ED         [12] 1085 	jr	00104$
   0DBB                    1086 ___str_4:
   0DBB 43 41 52 44 20 48  1087 	.ascii "CARD HERO - DECK BUILDING GAME"
        45 52 4F 20 2D 20
        44 45 43 4B 20 42
        55 49 4C 44 49 4E
        47 20 47 41 4D 45
   0DD9 00                 1088 	.db 0x00
   0DDA                    1089 ___str_5:
   0DDA 53 45 43 4F 4E 44  1090 	.ascii "SECOND LINE, JUST IN CASE"
        20 4C 49 4E 45 2C
        20 4A 55 53 54 20
        49 4E 20 43 41 53
        45
   0DF3 00                 1091 	.db 0x00
                           1092 	.area _CODE
                           1093 	.area _INITIALIZER
                           1094 	.area _CABS (ABS)
