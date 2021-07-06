                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSprite
                             13 	.globl _swapColors
                             14 	.globl _strLength
                             15 	.globl _strCopy
                             16 	.globl _strCmp
                             17 	.globl _drawTextM1
                             18 	.globl _drawText
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _INITIALIZED
                             30 ;--------------------------------------------------------
                             31 ; absolute external ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DABS (ABS)
                             34 ;--------------------------------------------------------
                             35 ; global & static initialisations
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _GSINIT
                             39 	.area _GSFINAL
                             40 	.area _GSINIT
                             41 ;--------------------------------------------------------
                             42 ; Home
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _HOME
                             46 ;--------------------------------------------------------
                             47 ; code
                             48 ;--------------------------------------------------------
                             49 	.area _CODE
                             50 ;src/text/text.c:53: u8 strLength(u8 str[])
                             51 ;	---------------------------------
                             52 ; Function strLength
                             53 ; ---------------------------------
   0DF4                      54 _strLength::
                             55 ;src/text/text.c:58: while (str[result] != '\0')
   0DF4 0E 00         [ 7]   56 	ld	c, #0x00
   0DF6                      57 00101$:
   0DF6 21 02 00      [10]   58 	ld	hl, #2
   0DF9 39            [11]   59 	add	hl, sp
   0DFA 7E            [ 7]   60 	ld	a, (hl)
   0DFB 23            [ 6]   61 	inc	hl
   0DFC 66            [ 7]   62 	ld	h, (hl)
   0DFD 6F            [ 4]   63 	ld	l, a
   0DFE 06 00         [ 7]   64 	ld	b, #0x00
   0E00 09            [11]   65 	add	hl, bc
   0E01 7E            [ 7]   66 	ld	a, (hl)
   0E02 B7            [ 4]   67 	or	a, a
   0E03 28 03         [12]   68 	jr	Z,00103$
                             69 ;src/text/text.c:60: result++;
   0E05 0C            [ 4]   70 	inc	c
   0E06 18 EE         [12]   71 	jr	00101$
   0E08                      72 00103$:
                             73 ;src/text/text.c:62: return result;
   0E08 69            [ 4]   74 	ld	l, c
   0E09 C9            [10]   75 	ret
   0E0A                      76 _swapColors:
   0E0A 55                   77 	.db #0x55	; 85	'U'
   0E0B EE                   78 	.db #0xee	; 238
   0E0C DD                   79 	.db #0xdd	; 221
   0E0D FF                   80 	.db #0xff	; 255
   0E0E 14                   81 	.db #0x14	; 20
   0E0F 6C                   82 	.db #0x6c	; 108	'l'
   0E10 9C                   83 	.db #0x9c	; 156
   0E11 3C                   84 	.db #0x3c	; 60
   0E12 50                   85 	.db #0x50	; 80	'P'
   0E13 E4                   86 	.db #0xe4	; 228
   0E14 D8                   87 	.db #0xd8	; 216
   0E15 F0                   88 	.db #0xf0	; 240
   0E16 11                   89 	.db #0x11	; 17
   0E17 66                   90 	.db #0x66	; 102	'f'
   0E18 99                   91 	.db #0x99	; 153
   0E19 33                   92 	.db #0x33	; 51	'3'
   0E1A 10                   93 	.db #0x10	; 16
   0E1B 35                   94 	.db #0x35	; 53	'5'
   0E1C 3A                   95 	.db #0x3a	; 58
   0E1D 30                   96 	.db #0x30	; 48	'0'
   0E1E 45                   97 	.db #0x45	; 69	'E'
   0E1F CE                   98 	.db #0xce	; 206
   0E20 CD                   99 	.db #0xcd	; 205
   0E21 CF                  100 	.db #0xcf	; 207
                            101 ;src/text/text.c:75: void strCopy(u8 source[], u8 dest[])
                            102 ;	---------------------------------
                            103 ; Function strCopy
                            104 ; ---------------------------------
   0E22                     105 _strCopy::
   0E22 DD E5         [15]  106 	push	ix
   0E24 DD 21 00 00   [14]  107 	ld	ix,#0
   0E28 DD 39         [15]  108 	add	ix,sp
                            109 ;src/text/text.c:78: while ((dest[i] = source[i]) != '\0')
   0E2A 0E 00         [ 7]  110 	ld	c, #0x00
   0E2C                     111 00101$:
   0E2C DD 7E 06      [19]  112 	ld	a, 6 (ix)
   0E2F 81            [ 4]  113 	add	a, c
   0E30 5F            [ 4]  114 	ld	e, a
   0E31 DD 7E 07      [19]  115 	ld	a, 7 (ix)
   0E34 CE 00         [ 7]  116 	adc	a, #0x00
   0E36 57            [ 4]  117 	ld	d, a
   0E37 DD 6E 04      [19]  118 	ld	l,4 (ix)
   0E3A DD 66 05      [19]  119 	ld	h,5 (ix)
   0E3D 06 00         [ 7]  120 	ld	b, #0x00
   0E3F 09            [11]  121 	add	hl, bc
   0E40 7E            [ 7]  122 	ld	a, (hl)
   0E41 12            [ 7]  123 	ld	(de), a
   0E42 B7            [ 4]  124 	or	a, a
   0E43 28 03         [12]  125 	jr	Z,00104$
                            126 ;src/text/text.c:80: i++;
   0E45 0C            [ 4]  127 	inc	c
   0E46 18 E4         [12]  128 	jr	00101$
   0E48                     129 00104$:
   0E48 DD E1         [14]  130 	pop	ix
   0E4A C9            [10]  131 	ret
                            132 ;src/text/text.c:94: u8 strCmp(u8 str1[], u8 str2[])
                            133 ;	---------------------------------
                            134 ; Function strCmp
                            135 ; ---------------------------------
   0E4B                     136 _strCmp::
                            137 ;src/text/text.c:99: while ((str1[i] == str2[i]) && ((str1[i] != '\0') && (str2[i] != '\0')))
   0E4B 0E 00         [ 7]  138 	ld	c, #0x00
   0E4D                     139 00103$:
   0E4D 21 02 00      [10]  140 	ld	hl, #2
   0E50 39            [11]  141 	add	hl, sp
   0E51 7E            [ 7]  142 	ld	a, (hl)
   0E52 23            [ 6]  143 	inc	hl
   0E53 66            [ 7]  144 	ld	h, (hl)
   0E54 6F            [ 4]  145 	ld	l, a
   0E55 06 00         [ 7]  146 	ld	b, #0x00
   0E57 09            [11]  147 	add	hl, bc
   0E58 46            [ 7]  148 	ld	b, (hl)
   0E59 FD 21 04 00   [14]  149 	ld	iy, #4
   0E5D FD 39         [15]  150 	add	iy, sp
   0E5F FD 7E 00      [19]  151 	ld	a, 0 (iy)
   0E62 81            [ 4]  152 	add	a, c
   0E63 5F            [ 4]  153 	ld	e, a
   0E64 FD 7E 01      [19]  154 	ld	a, 1 (iy)
   0E67 CE 00         [ 7]  155 	adc	a, #0x00
   0E69 57            [ 4]  156 	ld	d, a
   0E6A 1A            [ 7]  157 	ld	a, (de)
   0E6B 57            [ 4]  158 	ld	d, a
   0E6C 78            [ 4]  159 	ld	a, b
   0E6D 92            [ 4]  160 	sub	a, d
   0E6E 20 04         [12]  161 	jr	NZ,00132$
   0E70 3E 01         [ 7]  162 	ld	a,#0x01
   0E72 18 01         [12]  163 	jr	00133$
   0E74                     164 00132$:
   0E74 AF            [ 4]  165 	xor	a,a
   0E75                     166 00133$:
   0E75 5F            [ 4]  167 	ld	e,a
   0E76 B7            [ 4]  168 	or	a, a
   0E77 28 0B         [12]  169 	jr	Z,00105$
   0E79 78            [ 4]  170 	ld	a, b
   0E7A B7            [ 4]  171 	or	a, a
   0E7B 28 07         [12]  172 	jr	Z,00105$
   0E7D 7A            [ 4]  173 	ld	a, d
   0E7E B7            [ 4]  174 	or	a, a
   0E7F 28 03         [12]  175 	jr	Z,00105$
                            176 ;src/text/text.c:101: i++;
   0E81 0C            [ 4]  177 	inc	c
   0E82 18 C9         [12]  178 	jr	00103$
   0E84                     179 00105$:
                            180 ;src/text/text.c:103: if (str1[i] == str2[i])
   0E84 7B            [ 4]  181 	ld	a, e
   0E85 B7            [ 4]  182 	or	a, a
   0E86 28 03         [12]  183 	jr	Z,00107$
                            184 ;src/text/text.c:105: return YES;
   0E88 2E 01         [ 7]  185 	ld	l, #0x01
   0E8A C9            [10]  186 	ret
   0E8B                     187 00107$:
                            188 ;src/text/text.c:109: return NO;
   0E8B 2E 00         [ 7]  189 	ld	l, #0x00
   0E8D C9            [10]  190 	ret
                            191 ;src/text/text.c:125: void drawTextM1(u8 *text, u8 xPos, u8 yPos, u8 size)
                            192 ;	---------------------------------
                            193 ; Function drawTextM1
                            194 ; ---------------------------------
   0E8E                     195 _drawTextM1::
   0E8E DD E5         [15]  196 	push	ix
   0E90 DD 21 00 00   [14]  197 	ld	ix,#0
   0E94 DD 39         [15]  198 	add	ix,sp
   0E96 21 CC FF      [10]  199 	ld	hl, #-52
   0E99 39            [11]  200 	add	hl, sp
   0E9A F9            [ 6]  201 	ld	sp, hl
                            202 ;src/text/text.c:140: character = text[x];
   0E9B DD 7E 04      [19]  203 	ld	a, 4 (ix)
   0E9E DD 77 FA      [19]  204 	ld	-6 (ix), a
   0EA1 DD 7E 05      [19]  205 	ld	a, 5 (ix)
   0EA4 DD 77 FB      [19]  206 	ld	-5 (ix), a
   0EA7 DD 6E FA      [19]  207 	ld	l,-6 (ix)
   0EAA DD 66 FB      [19]  208 	ld	h,-5 (ix)
   0EAD 7E            [ 7]  209 	ld	a, (hl)
   0EAE DD 77 FD      [19]  210 	ld	-3 (ix), a
                            211 ;src/text/text.c:142: while (character != '\0')
   0EB1 21 03 00      [10]  212 	ld	hl, #0x0003
   0EB4 39            [11]  213 	add	hl, sp
   0EB5 DD 75 F4      [19]  214 	ld	-12 (ix), l
   0EB8 DD 74 F5      [19]  215 	ld	-11 (ix), h
   0EBB DD 7E F4      [19]  216 	ld	a, -12 (ix)
   0EBE DD 77 FE      [19]  217 	ld	-2 (ix), a
   0EC1 DD 7E F5      [19]  218 	ld	a, -11 (ix)
   0EC4 DD 77 FF      [19]  219 	ld	-1 (ix), a
   0EC7 DD 7E 08      [19]  220 	ld	a, 8 (ix)
   0ECA 3D            [ 4]  221 	dec	a
   0ECB 20 04         [12]  222 	jr	NZ,00246$
   0ECD 3E 01         [ 7]  223 	ld	a,#0x01
   0ECF 18 01         [12]  224 	jr	00247$
   0ED1                     225 00246$:
   0ED1 AF            [ 4]  226 	xor	a,a
   0ED2                     227 00247$:
   0ED2 DD 77 FC      [19]  228 	ld	-4 (ix), a
   0ED5 DD 7E 08      [19]  229 	ld	a, 8 (ix)
   0ED8 4F            [ 4]  230 	ld	c, a
   0ED9 87            [ 4]  231 	add	a, a
   0EDA 87            [ 4]  232 	add	a, a
   0EDB 87            [ 4]  233 	add	a, a
   0EDC 81            [ 4]  234 	add	a, c
   0EDD DD 77 F9      [19]  235 	ld	-7 (ix), a
   0EE0 DD 7E F4      [19]  236 	ld	a, -12 (ix)
   0EE3 DD 77 F7      [19]  237 	ld	-9 (ix), a
   0EE6 DD 7E F5      [19]  238 	ld	a, -11 (ix)
   0EE9 DD 77 F8      [19]  239 	ld	-8 (ix), a
   0EEC DD 36 F3 00   [19]  240 	ld	-13 (ix), #0x00
   0EF0                     241 00133$:
   0EF0 DD 7E FD      [19]  242 	ld	a, -3 (ix)
   0EF3 B7            [ 4]  243 	or	a, a
   0EF4 CA 9B 10      [10]  244 	jp	Z, 00138$
                            245 ;src/text/text.c:145: if ((character == 33) ||                        // !
   0EF7 DD 7E FD      [19]  246 	ld	a, -3 (ix)
   0EFA D6 21         [ 7]  247 	sub	a, #0x21
   0EFC 20 04         [12]  248 	jr	NZ,00248$
   0EFE 3E 01         [ 7]  249 	ld	a,#0x01
   0F00 18 01         [12]  250 	jr	00249$
   0F02                     251 00248$:
   0F02 AF            [ 4]  252 	xor	a,a
   0F03                     253 00249$:
   0F03 4F            [ 4]  254 	ld	c,a
   0F04 B7            [ 4]  255 	or	a, a
   0F05 20 2C         [12]  256 	jr	NZ,00125$
                            257 ;src/text/text.c:146: ((character > 43) && (character < 47)) ||   // ,-.
   0F07 3E 2B         [ 7]  258 	ld	a, #0x2b
   0F09 DD 96 FD      [19]  259 	sub	a, -3 (ix)
   0F0C 30 07         [12]  260 	jr	NC,00130$
   0F0E DD 7E FD      [19]  261 	ld	a, -3 (ix)
   0F11 D6 2F         [ 7]  262 	sub	a, #0x2f
   0F13 38 1E         [12]  263 	jr	C,00125$
   0F15                     264 00130$:
                            265 ;src/text/text.c:147: ((character > 47) && (character < 59)) ||   // 0123456789:
   0F15 3E 2F         [ 7]  266 	ld	a, #0x2f
   0F17 DD 96 FD      [19]  267 	sub	a, -3 (ix)
   0F1A 30 07         [12]  268 	jr	NC,00132$
   0F1C DD 7E FD      [19]  269 	ld	a, -3 (ix)
   0F1F D6 3B         [ 7]  270 	sub	a, #0x3b
   0F21 38 10         [12]  271 	jr	C,00125$
   0F23                     272 00132$:
                            273 ;src/text/text.c:148: ((character > 62) && (character < 91)))     // ABCDEFGHIJKLMNOPQRSTUVWXYZ
   0F23 3E 3E         [ 7]  274 	ld	a, #0x3e
   0F25 DD 96 FD      [19]  275 	sub	a, -3 (ix)
   0F28 D2 81 10      [10]  276 	jp	NC, 00126$
   0F2B DD 7E FD      [19]  277 	ld	a, -3 (ix)
   0F2E D6 5B         [ 7]  278 	sub	a, #0x5b
   0F30 D2 81 10      [10]  279 	jp	NC, 00126$
   0F33                     280 00125$:
                            281 ;src/text/text.c:152: switch (character)
   0F33 79            [ 4]  282 	ld	a, c
   0F34 B7            [ 4]  283 	or	a, a
   0F35 20 64         [12]  284 	jr	NZ,00101$
   0F37 DD 7E FD      [19]  285 	ld	a, -3 (ix)
   0F3A D6 2C         [ 7]  286 	sub	a, #0x2c
   0F3C 28 63         [12]  287 	jr	Z,00104$
   0F3E DD 7E FD      [19]  288 	ld	a, -3 (ix)
   0F41 D6 2D         [ 7]  289 	sub	a, #0x2d
   0F43 28 5C         [12]  290 	jr	Z,00104$
   0F45 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   0F48 D6 2E         [ 7]  292 	sub	a, #0x2e
   0F4A 28 55         [12]  293 	jr	Z,00104$
   0F4C DD 7E FD      [19]  294 	ld	a, -3 (ix)
   0F4F D6 30         [ 7]  295 	sub	a, #0x30
   0F51 28 58         [12]  296 	jr	Z,00115$
   0F53 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   0F56 D6 31         [ 7]  298 	sub	a, #0x31
   0F58 28 51         [12]  299 	jr	Z,00115$
   0F5A DD 7E FD      [19]  300 	ld	a, -3 (ix)
   0F5D D6 32         [ 7]  301 	sub	a, #0x32
   0F5F 28 4A         [12]  302 	jr	Z,00115$
   0F61 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   0F64 D6 33         [ 7]  304 	sub	a, #0x33
   0F66 28 43         [12]  305 	jr	Z,00115$
   0F68 DD 7E FD      [19]  306 	ld	a, -3 (ix)
   0F6B D6 34         [ 7]  307 	sub	a, #0x34
   0F6D 28 3C         [12]  308 	jr	Z,00115$
   0F6F DD 7E FD      [19]  309 	ld	a, -3 (ix)
   0F72 D6 35         [ 7]  310 	sub	a, #0x35
   0F74 28 35         [12]  311 	jr	Z,00115$
   0F76 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   0F79 D6 36         [ 7]  313 	sub	a, #0x36
   0F7B 28 2E         [12]  314 	jr	Z,00115$
   0F7D DD 7E FD      [19]  315 	ld	a, -3 (ix)
   0F80 D6 37         [ 7]  316 	sub	a, #0x37
   0F82 28 27         [12]  317 	jr	Z,00115$
   0F84 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   0F87 D6 38         [ 7]  319 	sub	a, #0x38
   0F89 28 20         [12]  320 	jr	Z,00115$
   0F8B DD 7E FD      [19]  321 	ld	a, -3 (ix)
   0F8E D6 39         [ 7]  322 	sub	a, #0x39
   0F90 28 19         [12]  323 	jr	Z,00115$
   0F92 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   0F95 D6 3A         [ 7]  325 	sub	a, #0x3a
   0F97 28 12         [12]  326 	jr	Z,00115$
   0F99 18 1C         [12]  327 	jr	00116$
                            328 ;src/text/text.c:155: case 33:
   0F9B                     329 00101$:
                            330 ;src/text/text.c:156: character = 48;
   0F9B DD 36 FD 30   [19]  331 	ld	-3 (ix), #0x30
                            332 ;src/text/text.c:157: break;
   0F9F 18 16         [12]  333 	jr	00116$
                            334 ;src/text/text.c:162: case 46:
   0FA1                     335 00104$:
                            336 ;src/text/text.c:163: character += 5;
   0FA1 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   0FA4 C6 05         [ 7]  338 	add	a, #0x05
   0FA6 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:164: break;
   0FA9 18 0C         [12]  341 	jr	00116$
                            342 ;src/text/text.c:177: case 58:
   0FAB                     343 00115$:
                            344 ;src/text/text.c:178: character += 4;
   0FAB DD 34 FD      [23]  345 	inc	-3 (ix)
   0FAE DD 34 FD      [23]  346 	inc	-3 (ix)
   0FB1 DD 34 FD      [23]  347 	inc	-3 (ix)
   0FB4 DD 34 FD      [23]  348 	inc	-3 (ix)
                            349 ;src/text/text.c:180: }
   0FB7                     350 00116$:
                            351 ;src/text/text.c:183: character -= 48;
   0FB7 DD 7E FD      [19]  352 	ld	a, -3 (ix)
   0FBA C6 D0         [ 7]  353 	add	a, #0xd0
   0FBC 4F            [ 4]  354 	ld	c, a
                            355 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   0FBD 06 00         [ 7]  356 	ld	b,#0x00
   0FBF 69            [ 4]  357 	ld	l, c
   0FC0 60            [ 4]  358 	ld	h, b
   0FC1 29            [11]  359 	add	hl, hl
   0FC2 29            [11]  360 	add	hl, hl
   0FC3 29            [11]  361 	add	hl, hl
   0FC4 09            [11]  362 	add	hl, bc
   0FC5 45            [ 4]  363 	ld	b, l
   0FC6 54            [ 4]  364 	ld	d, h
   0FC7 1E 00         [ 7]  365 	ld	e, #0x00
   0FC9                     366 00136$:
                            367 ;src/text/text.c:188: pChar = (u8 *)s_fonts_1 + (character * 9) + i;
   0FC9 3E 40         [ 7]  368 	ld	a, #<(_s_fonts_1)
   0FCB 80            [ 4]  369 	add	a, b
   0FCC 6F            [ 4]  370 	ld	l, a
   0FCD 3E 00         [ 7]  371 	ld	a, #>(_s_fonts_1)
   0FCF 8A            [ 4]  372 	adc	a, d
   0FD0 67            [ 4]  373 	ld	h, a
   0FD1 7D            [ 4]  374 	ld	a, l
   0FD2 83            [ 4]  375 	add	a, e
   0FD3 6F            [ 4]  376 	ld	l, a
   0FD4 7C            [ 4]  377 	ld	a, h
   0FD5 CE 00         [ 7]  378 	adc	a, #0x00
   0FD7 67            [ 4]  379 	ld	h, a
                            380 ;src/text/text.c:193: colorchar[i] = *pChar;
   0FD8 DD 75 CD      [19]  381 	ld	-51 (ix), l
   0FDB DD 74 CE      [19]  382 	ld	-50 (ix), h
   0FDE 7E            [ 7]  383 	ld	a, (hl)
   0FDF DD 77 F6      [19]  384 	ld	-10 (ix), a
                            385 ;src/text/text.c:190: if (size == 1)
   0FE2 DD 7E FC      [19]  386 	ld	a, -4 (ix)
   0FE5 B7            [ 4]  387 	or	a, a
   0FE6 28 11         [12]  388 	jr	Z,00118$
                            389 ;src/text/text.c:193: colorchar[i] = *pChar;
   0FE8 DD 7E FE      [19]  390 	ld	a, -2 (ix)
   0FEB 83            [ 4]  391 	add	a, e
   0FEC 6F            [ 4]  392 	ld	l, a
   0FED DD 7E FF      [19]  393 	ld	a, -1 (ix)
   0FF0 CE 00         [ 7]  394 	adc	a, #0x00
   0FF2 67            [ 4]  395 	ld	h, a
   0FF3 DD 7E F6      [19]  396 	ld	a, -10 (ix)
   0FF6 77            [ 7]  397 	ld	(hl), a
   0FF7 18 4A         [12]  398 	jr	00137$
   0FF9                     399 00118$:
                            400 ;src/text/text.c:198: pos = (i * size) - (i % FONT_1_W);
   0FF9 D5            [11]  401 	push	de
   0FFA C5            [11]  402 	push	bc
   0FFB DD 66 08      [19]  403 	ld	h, 8 (ix)
   0FFE 2E 00         [ 7]  404 	ld	l, #0x00
   1000 55            [ 4]  405 	ld	d, l
   1001 06 08         [ 7]  406 	ld	b, #0x08
   1003                     407 00264$:
   1003 29            [11]  408 	add	hl, hl
   1004 30 01         [12]  409 	jr	NC,00265$
   1006 19            [11]  410 	add	hl, de
   1007                     411 00265$:
   1007 10 FA         [13]  412 	djnz	00264$
   1009 C1            [10]  413 	pop	bc
   100A D1            [10]  414 	pop	de
   100B 26 00         [ 7]  415 	ld	h, #0x00
   100D 7D            [ 4]  416 	ld	a, l
   100E 94            [ 4]  417 	sub	a, h
   100F DD 77 CC      [19]  418 	ld	-52 (ix), a
                            419 ;src/text/text.c:200: colorchar[pos] = *pChar;
   1012 DD 7E F4      [19]  420 	ld	a, -12 (ix)
   1015 DD 86 CC      [19]  421 	add	a, -52 (ix)
   1018 6F            [ 4]  422 	ld	l, a
   1019 DD 7E F5      [19]  423 	ld	a, -11 (ix)
   101C CE 00         [ 7]  424 	adc	a, #0x00
   101E 67            [ 4]  425 	ld	h, a
   101F DD 7E F6      [19]  426 	ld	a, -10 (ix)
   1022 77            [ 7]  427 	ld	(hl), a
                            428 ;src/text/text.c:201: colorchar[pos + FONT_1_W] = *pChar;
   1023 DD 6E CC      [19]  429 	ld	l, -52 (ix)
   1026 2C            [ 4]  430 	inc	l
   1027 E5            [11]  431 	push	hl
   1028 DD 6E F4      [19]  432 	ld	l, -12 (ix)
   102B DD 66 F5      [19]  433 	ld	h, -11 (ix)
   102E E5            [11]  434 	push	hl
   102F FD E1         [14]  435 	pop	iy
   1031 E1            [10]  436 	pop	hl
   1032 C5            [11]  437 	push	bc
   1033 4D            [ 4]  438 	ld	c,l
   1034 06 00         [ 7]  439 	ld	b,#0x00
   1036 FD 09         [15]  440 	add	iy, bc
   1038 C1            [10]  441 	pop	bc
   1039 DD 6E CD      [19]  442 	ld	l,-51 (ix)
   103C DD 66 CE      [19]  443 	ld	h,-50 (ix)
   103F 6E            [ 7]  444 	ld	l, (hl)
   1040 FD 75 00      [19]  445 	ld	0 (iy), l
   1043                     446 00137$:
                            447 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   1043 1C            [ 4]  448 	inc	e
   1044 7B            [ 4]  449 	ld	a, e
   1045 D6 09         [ 7]  450 	sub	a, #0x09
   1047 DA C9 0F      [10]  451 	jp	C, 00136$
                            452 ;src/text/text.c:205: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
   104A C5            [11]  453 	push	bc
   104B DD 66 07      [19]  454 	ld	h, 7 (ix)
   104E DD 6E 06      [19]  455 	ld	l, 6 (ix)
   1051 E5            [11]  456 	push	hl
   1052 21 00 80      [10]  457 	ld	hl, #0x8000
   1055 E5            [11]  458 	push	hl
   1056 CD 4A 17      [17]  459 	call	_cpct_getScreenPtr
   1059 C1            [10]  460 	pop	bc
                            461 ;src/text/text.c:209: cpct_drawSprite(colorchar, pvideo, FONT_1_W, FONT_H * size);
   105A E5            [11]  462 	push	hl
   105B FD E1         [14]  463 	pop	iy
   105D DD 5E F7      [19]  464 	ld	e,-9 (ix)
   1060 DD 56 F8      [19]  465 	ld	d,-8 (ix)
   1063 C5            [11]  466 	push	bc
   1064 DD 46 F9      [19]  467 	ld	b, -7 (ix)
   1067 0E 01         [ 7]  468 	ld	c,#0x01
   1069 C5            [11]  469 	push	bc
   106A FD E5         [15]  470 	push	iy
   106C D5            [11]  471 	push	de
   106D CD 9E 14      [17]  472 	call	_cpct_drawSprite
   1070 C1            [10]  473 	pop	bc
                            474 ;src/text/text.c:212: if (character == 48 || character == 60 || character == 57)
   1071 79            [ 4]  475 	ld	a,c
   1072 FE 30         [ 7]  476 	cp	a,#0x30
   1074 28 08         [12]  477 	jr	Z,00121$
   1076 FE 3C         [ 7]  478 	cp	a,#0x3c
   1078 28 04         [12]  479 	jr	Z,00121$
   107A D6 39         [ 7]  480 	sub	a, #0x39
   107C 20 03         [12]  481 	jr	NZ,00126$
   107E                     482 00121$:
                            483 ;src/text/text.c:213: xPos--;
   107E DD 35 06      [23]  484 	dec	6 (ix)
   1081                     485 00126$:
                            486 ;src/text/text.c:215: character = text[++x];
   1081 DD 34 F3      [23]  487 	inc	-13 (ix)
   1084 DD 7E FA      [19]  488 	ld	a, -6 (ix)
   1087 DD 86 F3      [19]  489 	add	a, -13 (ix)
   108A 6F            [ 4]  490 	ld	l, a
   108B DD 7E FB      [19]  491 	ld	a, -5 (ix)
   108E CE 00         [ 7]  492 	adc	a, #0x00
   1090 67            [ 4]  493 	ld	h, a
   1091 7E            [ 7]  494 	ld	a, (hl)
   1092 DD 77 FD      [19]  495 	ld	-3 (ix), a
                            496 ;src/text/text.c:216: xPos += FONT_1_W;
   1095 DD 34 06      [23]  497 	inc	6 (ix)
   1098 C3 F0 0E      [10]  498 	jp	00133$
   109B                     499 00138$:
   109B DD F9         [10]  500 	ld	sp, ix
   109D DD E1         [14]  501 	pop	ix
   109F C9            [10]  502 	ret
                            503 ;src/text/text.c:232: void drawText(u8 *text, u8 xPos, u8 yPos, u8 color, u8 size)
                            504 ;	---------------------------------
                            505 ; Function drawText
                            506 ; ---------------------------------
   10A0                     507 _drawText::
   10A0 DD E5         [15]  508 	push	ix
   10A2 DD 21 00 00   [14]  509 	ld	ix,#0
   10A6 DD 39         [15]  510 	add	ix,sp
   10A8 21 B2 FF      [10]  511 	ld	hl, #-78
   10AB 39            [11]  512 	add	hl, sp
   10AC F9            [ 6]  513 	ld	sp, hl
                            514 ;src/text/text.c:245: color1 = swapColors[color][0];
   10AD 01 0A 0E      [10]  515 	ld	bc, #_swapColors+0
   10B0 DD 6E 08      [19]  516 	ld	l, 8 (ix)
   10B3 26 00         [ 7]  517 	ld	h, #0x00
   10B5 29            [11]  518 	add	hl, hl
   10B6 29            [11]  519 	add	hl, hl
   10B7 09            [11]  520 	add	hl, bc
   10B8 E5            [11]  521 	push	hl
   10B9 FD E1         [14]  522 	pop	iy
   10BB FD 7E 00      [19]  523 	ld	a, 0 (iy)
   10BE DD 77 D9      [19]  524 	ld	-39 (ix), a
                            525 ;src/text/text.c:246: color2 = swapColors[color][1];
   10C1 FD E5         [15]  526 	push	iy
   10C3 E1            [10]  527 	pop	hl
   10C4 23            [ 6]  528 	inc	hl
   10C5 7E            [ 7]  529 	ld	a, (hl)
   10C6 DD 77 D8      [19]  530 	ld	-40 (ix), a
                            531 ;src/text/text.c:247: color3 = swapColors[color][2];
   10C9 FD E5         [15]  532 	push	iy
   10CB E1            [10]  533 	pop	hl
   10CC 23            [ 6]  534 	inc	hl
   10CD 23            [ 6]  535 	inc	hl
   10CE 7E            [ 7]  536 	ld	a, (hl)
   10CF DD 77 D7      [19]  537 	ld	-41 (ix), a
                            538 ;src/text/text.c:248: color4 = swapColors[color][3];
   10D2 FD 7E 03      [19]  539 	ld	a, 3 (iy)
   10D5 DD 77 D6      [19]  540 	ld	-42 (ix), a
                            541 ;src/text/text.c:253: character = text[x];
   10D8 DD 7E 04      [19]  542 	ld	a, 4 (ix)
   10DB DD 77 EB      [19]  543 	ld	-21 (ix), a
   10DE DD 7E 05      [19]  544 	ld	a, 5 (ix)
   10E1 DD 77 EC      [19]  545 	ld	-20 (ix), a
   10E4 DD 6E EB      [19]  546 	ld	l,-21 (ix)
   10E7 DD 66 EC      [19]  547 	ld	h,-20 (ix)
   10EA 7E            [ 7]  548 	ld	a, (hl)
   10EB DD 77 EE      [19]  549 	ld	-18 (ix), a
                            550 ;src/text/text.c:255: while (character != '\0')
   10EE 21 00 00      [10]  551 	ld	hl, #0x0000
   10F1 39            [11]  552 	add	hl, sp
   10F2 DD 75 F1      [19]  553 	ld	-15 (ix), l
   10F5 DD 74 F2      [19]  554 	ld	-14 (ix), h
   10F8 DD 7E F1      [19]  555 	ld	a, -15 (ix)
   10FB DD 77 E7      [19]  556 	ld	-25 (ix), a
   10FE DD 7E F2      [19]  557 	ld	a, -14 (ix)
   1101 DD 77 E8      [19]  558 	ld	-24 (ix), a
   1104 DD 7E F1      [19]  559 	ld	a, -15 (ix)
   1107 DD 77 F6      [19]  560 	ld	-10 (ix), a
   110A DD 7E F2      [19]  561 	ld	a, -14 (ix)
   110D DD 77 F7      [19]  562 	ld	-9 (ix), a
   1110 DD 7E F1      [19]  563 	ld	a, -15 (ix)
   1113 DD 77 E9      [19]  564 	ld	-23 (ix), a
   1116 DD 7E F2      [19]  565 	ld	a, -14 (ix)
   1119 DD 77 EA      [19]  566 	ld	-22 (ix), a
   111C DD 7E F1      [19]  567 	ld	a, -15 (ix)
   111F DD 77 E1      [19]  568 	ld	-31 (ix), a
   1122 DD 7E F2      [19]  569 	ld	a, -14 (ix)
   1125 DD 77 E2      [19]  570 	ld	-30 (ix), a
   1128 DD 7E F1      [19]  571 	ld	a, -15 (ix)
   112B DD 77 FE      [19]  572 	ld	-2 (ix), a
   112E DD 7E F2      [19]  573 	ld	a, -14 (ix)
   1131 DD 77 FF      [19]  574 	ld	-1 (ix), a
   1134 DD 7E F1      [19]  575 	ld	a, -15 (ix)
   1137 DD 77 E3      [19]  576 	ld	-29 (ix), a
   113A DD 7E F2      [19]  577 	ld	a, -14 (ix)
   113D DD 77 E4      [19]  578 	ld	-28 (ix), a
   1140 DD 7E F1      [19]  579 	ld	a, -15 (ix)
   1143 DD 77 E5      [19]  580 	ld	-27 (ix), a
   1146 DD 7E F2      [19]  581 	ld	a, -14 (ix)
   1149 DD 77 E6      [19]  582 	ld	-26 (ix), a
   114C DD 7E F1      [19]  583 	ld	a, -15 (ix)
   114F DD 77 DF      [19]  584 	ld	-33 (ix), a
   1152 DD 7E F2      [19]  585 	ld	a, -14 (ix)
   1155 DD 77 E0      [19]  586 	ld	-32 (ix), a
   1158 DD 7E F1      [19]  587 	ld	a, -15 (ix)
   115B DD 77 EF      [19]  588 	ld	-17 (ix), a
   115E DD 7E F2      [19]  589 	ld	a, -14 (ix)
   1161 DD 77 F0      [19]  590 	ld	-16 (ix), a
   1164 DD 7E 09      [19]  591 	ld	a, 9 (ix)
   1167 3D            [ 4]  592 	dec	a
   1168 20 04         [12]  593 	jr	NZ,00297$
   116A 3E 01         [ 7]  594 	ld	a,#0x01
   116C 18 01         [12]  595 	jr	00298$
   116E                     596 00297$:
   116E AF            [ 4]  597 	xor	a,a
   116F                     598 00298$:
   116F DD 77 ED      [19]  599 	ld	-19 (ix), a
   1172 DD 7E 09      [19]  600 	ld	a, 9 (ix)
   1175 4F            [ 4]  601 	ld	c, a
   1176 87            [ 4]  602 	add	a, a
   1177 87            [ 4]  603 	add	a, a
   1178 87            [ 4]  604 	add	a, a
   1179 81            [ 4]  605 	add	a, c
   117A DD 77 F8      [19]  606 	ld	-8 (ix), a
   117D DD 7E F1      [19]  607 	ld	a, -15 (ix)
   1180 DD 77 F4      [19]  608 	ld	-12 (ix), a
   1183 DD 7E F2      [19]  609 	ld	a, -14 (ix)
   1186 DD 77 F5      [19]  610 	ld	-11 (ix), a
   1189 DD 36 DA 00   [19]  611 	ld	-38 (ix), #0x00
   118D                     612 00156$:
   118D DD 7E EE      [19]  613 	ld	a, -18 (ix)
   1190 B7            [ 4]  614 	or	a, a
   1191 CA 6A 14      [10]  615 	jp	Z, 00161$
                            616 ;src/text/text.c:259: if ((character == 33) || ((character > 43) && (character < 47)) ||
   1194 DD 7E EE      [19]  617 	ld	a, -18 (ix)
   1197 D6 21         [ 7]  618 	sub	a, #0x21
   1199 20 04         [12]  619 	jr	NZ,00299$
   119B 3E 01         [ 7]  620 	ld	a,#0x01
   119D 18 01         [12]  621 	jr	00300$
   119F                     622 00299$:
   119F AF            [ 4]  623 	xor	a,a
   11A0                     624 00300$:
   11A0 4F            [ 4]  625 	ld	c,a
   11A1 B7            [ 4]  626 	or	a, a
   11A2 20 2C         [12]  627 	jr	NZ,00148$
   11A4 3E 2B         [ 7]  628 	ld	a, #0x2b
   11A6 DD 96 EE      [19]  629 	sub	a, -18 (ix)
   11A9 30 07         [12]  630 	jr	NC,00153$
   11AB DD 7E EE      [19]  631 	ld	a, -18 (ix)
   11AE D6 2F         [ 7]  632 	sub	a, #0x2f
   11B0 38 1E         [12]  633 	jr	C,00148$
   11B2                     634 00153$:
                            635 ;src/text/text.c:260: ((character > 47) && (character < 58)) || ((character > 62) && (character < 91)))
   11B2 3E 2F         [ 7]  636 	ld	a, #0x2f
   11B4 DD 96 EE      [19]  637 	sub	a, -18 (ix)
   11B7 30 07         [12]  638 	jr	NC,00155$
   11B9 DD 7E EE      [19]  639 	ld	a, -18 (ix)
   11BC D6 3A         [ 7]  640 	sub	a, #0x3a
   11BE 38 10         [12]  641 	jr	C,00148$
   11C0                     642 00155$:
   11C0 3E 3E         [ 7]  643 	ld	a, #0x3e
   11C2 DD 96 EE      [19]  644 	sub	a, -18 (ix)
   11C5 D2 4D 14      [10]  645 	jp	NC, 00149$
   11C8 DD 7E EE      [19]  646 	ld	a, -18 (ix)
   11CB D6 5B         [ 7]  647 	sub	a, #0x5b
   11CD D2 4D 14      [10]  648 	jp	NC, 00149$
   11D0                     649 00148$:
                            650 ;src/text/text.c:264: switch (character)
   11D0 79            [ 4]  651 	ld	a, c
   11D1 B7            [ 4]  652 	or	a, a
   11D2 20 5D         [12]  653 	jr	NZ,00101$
   11D4 DD 7E EE      [19]  654 	ld	a, -18 (ix)
   11D7 D6 2C         [ 7]  655 	sub	a, #0x2c
   11D9 28 5C         [12]  656 	jr	Z,00104$
   11DB DD 7E EE      [19]  657 	ld	a, -18 (ix)
   11DE D6 2D         [ 7]  658 	sub	a, #0x2d
   11E0 28 55         [12]  659 	jr	Z,00104$
   11E2 DD 7E EE      [19]  660 	ld	a, -18 (ix)
   11E5 D6 2E         [ 7]  661 	sub	a, #0x2e
   11E7 28 4E         [12]  662 	jr	Z,00104$
   11E9 DD 7E EE      [19]  663 	ld	a, -18 (ix)
   11EC D6 30         [ 7]  664 	sub	a, #0x30
   11EE 28 51         [12]  665 	jr	Z,00114$
   11F0 DD 7E EE      [19]  666 	ld	a, -18 (ix)
   11F3 D6 31         [ 7]  667 	sub	a, #0x31
   11F5 28 4A         [12]  668 	jr	Z,00114$
   11F7 DD 7E EE      [19]  669 	ld	a, -18 (ix)
   11FA D6 32         [ 7]  670 	sub	a, #0x32
   11FC 28 43         [12]  671 	jr	Z,00114$
   11FE DD 7E EE      [19]  672 	ld	a, -18 (ix)
   1201 D6 33         [ 7]  673 	sub	a, #0x33
   1203 28 3C         [12]  674 	jr	Z,00114$
   1205 DD 7E EE      [19]  675 	ld	a, -18 (ix)
   1208 D6 34         [ 7]  676 	sub	a, #0x34
   120A 28 35         [12]  677 	jr	Z,00114$
   120C DD 7E EE      [19]  678 	ld	a, -18 (ix)
   120F D6 35         [ 7]  679 	sub	a, #0x35
   1211 28 2E         [12]  680 	jr	Z,00114$
   1213 DD 7E EE      [19]  681 	ld	a, -18 (ix)
   1216 D6 36         [ 7]  682 	sub	a, #0x36
   1218 28 27         [12]  683 	jr	Z,00114$
   121A DD 7E EE      [19]  684 	ld	a, -18 (ix)
   121D D6 37         [ 7]  685 	sub	a, #0x37
   121F 28 20         [12]  686 	jr	Z,00114$
   1221 DD 7E EE      [19]  687 	ld	a, -18 (ix)
   1224 D6 38         [ 7]  688 	sub	a, #0x38
   1226 28 19         [12]  689 	jr	Z,00114$
   1228 DD 7E EE      [19]  690 	ld	a, -18 (ix)
   122B D6 39         [ 7]  691 	sub	a, #0x39
   122D 28 12         [12]  692 	jr	Z,00114$
   122F 18 18         [12]  693 	jr	00115$
                            694 ;src/text/text.c:267: case 33:
   1231                     695 00101$:
                            696 ;src/text/text.c:268: character = 49;
   1231 DD 36 EE 31   [19]  697 	ld	-18 (ix), #0x31
                            698 ;src/text/text.c:269: break;
   1235 18 12         [12]  699 	jr	00115$
                            700 ;src/text/text.c:274: case 46:
   1237                     701 00104$:
                            702 ;src/text/text.c:275: character += 6;
   1237 DD 7E EE      [19]  703 	ld	a, -18 (ix)
   123A C6 06         [ 7]  704 	add	a, #0x06
   123C DD 77 EE      [19]  705 	ld	-18 (ix), a
                            706 ;src/text/text.c:276: break;
   123F 18 08         [12]  707 	jr	00115$
                            708 ;src/text/text.c:288: case 57:
   1241                     709 00114$:
                            710 ;src/text/text.c:289: character += 5;
   1241 DD 7E EE      [19]  711 	ld	a, -18 (ix)
   1244 C6 05         [ 7]  712 	add	a, #0x05
   1246 DD 77 EE      [19]  713 	ld	-18 (ix), a
                            714 ;src/text/text.c:291: }
   1249                     715 00115$:
                            716 ;src/text/text.c:294: character -= 49;
   1249 DD 7E EE      [19]  717 	ld	a, -18 (ix)
   124C C6 CF         [ 7]  718 	add	a, #0xcf
   124E 4F            [ 4]  719 	ld	c, a
                            720 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   124F 06 00         [ 7]  721 	ld	b,#0x00
   1251 69            [ 4]  722 	ld	l, c
   1252 60            [ 4]  723 	ld	h, b
   1253 29            [11]  724 	add	hl, hl
   1254 29            [11]  725 	add	hl, hl
   1255 29            [11]  726 	add	hl, hl
   1256 09            [11]  727 	add	hl, bc
   1257 29            [11]  728 	add	hl, hl
   1258 EB            [ 4]  729 	ex	de,hl
   1259 06 00         [ 7]  730 	ld	b, #0x00
   125B                     731 00159$:
                            732 ;src/text/text.c:299: pChar = (u8 *)s_fonts_0 + (character * 18) + i;
   125B 21 0F 02      [10]  733 	ld	hl, #_s_fonts_0
   125E 19            [11]  734 	add	hl, de
   125F 7D            [ 4]  735 	ld	a, l
   1260 80            [ 4]  736 	add	a, b
   1261 6F            [ 4]  737 	ld	l, a
   1262 7C            [ 4]  738 	ld	a, h
   1263 CE 00         [ 7]  739 	adc	a, #0x00
   1265 67            [ 4]  740 	ld	h, a
                            741 ;src/text/text.c:304: if (*pChar == 0x55)
   1266 DD 75 DB      [19]  742 	ld	-37 (ix), l
   1269 DD 74 DC      [19]  743 	ld	-36 (ix), h
   126C 7E            [ 7]  744 	ld	a, (hl)
   126D DD 77 F3      [19]  745 	ld	-13 (ix), a
   1270 D6 55         [ 7]  746 	sub	a, #0x55
   1272 20 04         [12]  747 	jr	NZ,00314$
   1274 3E 01         [ 7]  748 	ld	a,#0x01
   1276 18 01         [12]  749 	jr	00315$
   1278                     750 00314$:
   1278 AF            [ 4]  751 	xor	a,a
   1279                     752 00315$:
   1279 DD 77 DE      [19]  753 	ld	-34 (ix), a
                            754 ;src/text/text.c:306: else if (*pChar == 0xee)
   127C DD 7E F3      [19]  755 	ld	a, -13 (ix)
   127F D6 EE         [ 7]  756 	sub	a, #0xee
   1281 20 04         [12]  757 	jr	NZ,00316$
   1283 3E 01         [ 7]  758 	ld	a,#0x01
   1285 18 01         [12]  759 	jr	00317$
   1287                     760 00316$:
   1287 AF            [ 4]  761 	xor	a,a
   1288                     762 00317$:
   1288 DD 77 DD      [19]  763 	ld	-35 (ix), a
                            764 ;src/text/text.c:308: else if (*pChar == 0xdd)
   128B DD 7E F3      [19]  765 	ld	a, -13 (ix)
   128E D6 DD         [ 7]  766 	sub	a, #0xdd
   1290 20 04         [12]  767 	jr	NZ,00318$
   1292 3E 01         [ 7]  768 	ld	a,#0x01
   1294 18 01         [12]  769 	jr	00319$
   1296                     770 00318$:
   1296 AF            [ 4]  771 	xor	a,a
   1297                     772 00319$:
   1297 DD 77 FD      [19]  773 	ld	-3 (ix), a
                            774 ;src/text/text.c:310: else if (*pChar == 0xff)
   129A DD 7E F3      [19]  775 	ld	a, -13 (ix)
   129D 3C            [ 4]  776 	inc	a
   129E 20 04         [12]  777 	jr	NZ,00320$
   12A0 3E 01         [ 7]  778 	ld	a,#0x01
   12A2 18 01         [12]  779 	jr	00321$
   12A4                     780 00320$:
   12A4 AF            [ 4]  781 	xor	a,a
   12A5                     782 00321$:
   12A5 DD 77 FC      [19]  783 	ld	-4 (ix), a
                            784 ;src/text/text.c:301: if (size == 1)
   12A8 DD 7E ED      [19]  785 	ld	a, -19 (ix)
   12AB B7            [ 4]  786 	or	a, a
   12AC 28 72         [12]  787 	jr	Z,00141$
                            788 ;src/text/text.c:304: if (*pChar == 0x55)
   12AE DD 7E DE      [19]  789 	ld	a, -34 (ix)
   12B1 B7            [ 4]  790 	or	a, a
   12B2 28 12         [12]  791 	jr	Z,00126$
                            792 ;src/text/text.c:305: colorchar[i] = color1;
   12B4 DD 7E EF      [19]  793 	ld	a, -17 (ix)
   12B7 80            [ 4]  794 	add	a, b
   12B8 6F            [ 4]  795 	ld	l, a
   12B9 DD 7E F0      [19]  796 	ld	a, -16 (ix)
   12BC CE 00         [ 7]  797 	adc	a, #0x00
   12BE 67            [ 4]  798 	ld	h, a
   12BF DD 7E D9      [19]  799 	ld	a, -39 (ix)
   12C2 77            [ 7]  800 	ld	(hl), a
   12C3 C3 0F 14      [10]  801 	jp	00160$
   12C6                     802 00126$:
                            803 ;src/text/text.c:306: else if (*pChar == 0xee)
   12C6 DD 7E DD      [19]  804 	ld	a, -35 (ix)
   12C9 B7            [ 4]  805 	or	a, a
   12CA 28 12         [12]  806 	jr	Z,00123$
                            807 ;src/text/text.c:307: colorchar[i] = color2;
   12CC DD 7E DF      [19]  808 	ld	a, -33 (ix)
   12CF 80            [ 4]  809 	add	a, b
   12D0 6F            [ 4]  810 	ld	l, a
   12D1 DD 7E E0      [19]  811 	ld	a, -32 (ix)
   12D4 CE 00         [ 7]  812 	adc	a, #0x00
   12D6 67            [ 4]  813 	ld	h, a
   12D7 DD 7E D8      [19]  814 	ld	a, -40 (ix)
   12DA 77            [ 7]  815 	ld	(hl), a
   12DB C3 0F 14      [10]  816 	jp	00160$
   12DE                     817 00123$:
                            818 ;src/text/text.c:308: else if (*pChar == 0xdd)
   12DE DD 7E FD      [19]  819 	ld	a, -3 (ix)
   12E1 B7            [ 4]  820 	or	a, a
   12E2 28 12         [12]  821 	jr	Z,00120$
                            822 ;src/text/text.c:309: colorchar[i] = color3;
   12E4 DD 7E E5      [19]  823 	ld	a, -27 (ix)
   12E7 80            [ 4]  824 	add	a, b
   12E8 6F            [ 4]  825 	ld	l, a
   12E9 DD 7E E6      [19]  826 	ld	a, -26 (ix)
   12EC CE 00         [ 7]  827 	adc	a, #0x00
   12EE 67            [ 4]  828 	ld	h, a
   12EF DD 7E D7      [19]  829 	ld	a, -41 (ix)
   12F2 77            [ 7]  830 	ld	(hl), a
   12F3 C3 0F 14      [10]  831 	jp	00160$
   12F6                     832 00120$:
                            833 ;src/text/text.c:310: else if (*pChar == 0xff)
   12F6 DD 7E FC      [19]  834 	ld	a, -4 (ix)
   12F9 B7            [ 4]  835 	or	a, a
   12FA 28 12         [12]  836 	jr	Z,00117$
                            837 ;src/text/text.c:311: colorchar[i] = color4;
   12FC DD 7E E3      [19]  838 	ld	a, -29 (ix)
   12FF 80            [ 4]  839 	add	a, b
   1300 6F            [ 4]  840 	ld	l, a
   1301 DD 7E E4      [19]  841 	ld	a, -28 (ix)
   1304 CE 00         [ 7]  842 	adc	a, #0x00
   1306 67            [ 4]  843 	ld	h, a
   1307 DD 7E D6      [19]  844 	ld	a, -42 (ix)
   130A 77            [ 7]  845 	ld	(hl), a
   130B C3 0F 14      [10]  846 	jp	00160$
   130E                     847 00117$:
                            848 ;src/text/text.c:313: colorchar[i] = *pChar;
   130E DD 7E FE      [19]  849 	ld	a, -2 (ix)
   1311 80            [ 4]  850 	add	a, b
   1312 6F            [ 4]  851 	ld	l, a
   1313 DD 7E FF      [19]  852 	ld	a, -1 (ix)
   1316 CE 00         [ 7]  853 	adc	a, #0x00
   1318 67            [ 4]  854 	ld	h, a
   1319 DD 7E F3      [19]  855 	ld	a, -13 (ix)
   131C 77            [ 7]  856 	ld	(hl), a
   131D C3 0F 14      [10]  857 	jp	00160$
   1320                     858 00141$:
                            859 ;src/text/text.c:319: pos = (i * size) - (i % FONT_0_W);
   1320 D5            [11]  860 	push	de
   1321 C5            [11]  861 	push	bc
   1322 DD 5E 09      [19]  862 	ld	e, 9 (ix)
   1325 60            [ 4]  863 	ld	h, b
   1326 2E 00         [ 7]  864 	ld	l, #0x00
   1328 55            [ 4]  865 	ld	d, l
   1329 06 08         [ 7]  866 	ld	b, #0x08
   132B                     867 00322$:
   132B 29            [11]  868 	add	hl, hl
   132C 30 01         [12]  869 	jr	NC,00323$
   132E 19            [11]  870 	add	hl, de
   132F                     871 00323$:
   132F 10 FA         [13]  872 	djnz	00322$
   1331 C1            [10]  873 	pop	bc
   1332 D1            [10]  874 	pop	de
   1333 78            [ 4]  875 	ld	a, b
   1334 E6 01         [ 7]  876 	and	a, #0x01
   1336 67            [ 4]  877 	ld	h, a
   1337 7D            [ 4]  878 	ld	a, l
   1338 94            [ 4]  879 	sub	a, h
                            880 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   1339 6F            [ 4]  881 	ld	l,a
   133A C6 02         [ 7]  882 	add	a, #0x02
   133C DD 77 FB      [19]  883 	ld	-5 (ix), a
                            884 ;src/text/text.c:321: if (*pChar == 0x55)
   133F DD 7E DE      [19]  885 	ld	a, -34 (ix)
   1342 B7            [ 4]  886 	or	a, a
   1343 28 23         [12]  887 	jr	Z,00138$
                            888 ;src/text/text.c:323: colorchar[pos] = color1;
   1345 DD 7E E1      [19]  889 	ld	a, -31 (ix)
   1348 85            [ 4]  890 	add	a, l
   1349 6F            [ 4]  891 	ld	l, a
   134A DD 7E E2      [19]  892 	ld	a, -30 (ix)
   134D CE 00         [ 7]  893 	adc	a, #0x00
   134F 67            [ 4]  894 	ld	h, a
   1350 DD 7E D9      [19]  895 	ld	a, -39 (ix)
   1353 77            [ 7]  896 	ld	(hl), a
                            897 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   1354 DD 7E E1      [19]  898 	ld	a, -31 (ix)
   1357 DD 86 FB      [19]  899 	add	a, -5 (ix)
   135A 6F            [ 4]  900 	ld	l, a
   135B DD 7E E2      [19]  901 	ld	a, -30 (ix)
   135E CE 00         [ 7]  902 	adc	a, #0x00
   1360 67            [ 4]  903 	ld	h, a
   1361 DD 7E D9      [19]  904 	ld	a, -39 (ix)
   1364 77            [ 7]  905 	ld	(hl), a
   1365 C3 0F 14      [10]  906 	jp	00160$
   1368                     907 00138$:
                            908 ;src/text/text.c:326: else if (*pChar == 0xee)
   1368 DD 7E DD      [19]  909 	ld	a, -35 (ix)
   136B B7            [ 4]  910 	or	a, a
   136C 28 23         [12]  911 	jr	Z,00135$
                            912 ;src/text/text.c:328: colorchar[pos] = color2;
   136E DD 7E E9      [19]  913 	ld	a, -23 (ix)
   1371 85            [ 4]  914 	add	a, l
   1372 6F            [ 4]  915 	ld	l, a
   1373 DD 7E EA      [19]  916 	ld	a, -22 (ix)
   1376 CE 00         [ 7]  917 	adc	a, #0x00
   1378 67            [ 4]  918 	ld	h, a
   1379 DD 7E D8      [19]  919 	ld	a, -40 (ix)
   137C 77            [ 7]  920 	ld	(hl), a
                            921 ;src/text/text.c:329: colorchar[pos + FONT_0_W] = color2;
   137D DD 7E E9      [19]  922 	ld	a, -23 (ix)
   1380 DD 86 FB      [19]  923 	add	a, -5 (ix)
   1383 6F            [ 4]  924 	ld	l, a
   1384 DD 7E EA      [19]  925 	ld	a, -22 (ix)
   1387 CE 00         [ 7]  926 	adc	a, #0x00
   1389 67            [ 4]  927 	ld	h, a
   138A DD 7E D8      [19]  928 	ld	a, -40 (ix)
   138D 77            [ 7]  929 	ld	(hl), a
   138E C3 0F 14      [10]  930 	jp	00160$
   1391                     931 00135$:
                            932 ;src/text/text.c:331: else if (*pChar == 0xdd)
   1391 DD 7E FD      [19]  933 	ld	a, -3 (ix)
   1394 B7            [ 4]  934 	or	a, a
   1395 28 22         [12]  935 	jr	Z,00132$
                            936 ;src/text/text.c:333: colorchar[pos] = color3;
   1397 DD 7E F6      [19]  937 	ld	a, -10 (ix)
   139A 85            [ 4]  938 	add	a, l
   139B 6F            [ 4]  939 	ld	l, a
   139C DD 7E F7      [19]  940 	ld	a, -9 (ix)
   139F CE 00         [ 7]  941 	adc	a, #0x00
   13A1 67            [ 4]  942 	ld	h, a
   13A2 DD 7E D7      [19]  943 	ld	a, -41 (ix)
   13A5 77            [ 7]  944 	ld	(hl), a
                            945 ;src/text/text.c:334: colorchar[pos + FONT_0_W] = color3;
   13A6 DD 7E F6      [19]  946 	ld	a, -10 (ix)
   13A9 DD 86 FB      [19]  947 	add	a, -5 (ix)
   13AC 6F            [ 4]  948 	ld	l, a
   13AD DD 7E F7      [19]  949 	ld	a, -9 (ix)
   13B0 CE 00         [ 7]  950 	adc	a, #0x00
   13B2 67            [ 4]  951 	ld	h, a
   13B3 DD 7E D7      [19]  952 	ld	a, -41 (ix)
   13B6 77            [ 7]  953 	ld	(hl), a
   13B7 18 56         [12]  954 	jr	00160$
   13B9                     955 00132$:
                            956 ;src/text/text.c:336: else if (*pChar == 0xff)
   13B9 DD 7E FC      [19]  957 	ld	a, -4 (ix)
   13BC B7            [ 4]  958 	or	a, a
   13BD 28 22         [12]  959 	jr	Z,00129$
                            960 ;src/text/text.c:338: colorchar[pos] = color4;
   13BF DD 7E E7      [19]  961 	ld	a, -25 (ix)
   13C2 85            [ 4]  962 	add	a, l
   13C3 6F            [ 4]  963 	ld	l, a
   13C4 DD 7E E8      [19]  964 	ld	a, -24 (ix)
   13C7 CE 00         [ 7]  965 	adc	a, #0x00
   13C9 67            [ 4]  966 	ld	h, a
   13CA DD 7E D6      [19]  967 	ld	a, -42 (ix)
   13CD 77            [ 7]  968 	ld	(hl), a
                            969 ;src/text/text.c:339: colorchar[pos + FONT_0_W] = color4;
   13CE DD 7E E7      [19]  970 	ld	a, -25 (ix)
   13D1 DD 86 FB      [19]  971 	add	a, -5 (ix)
   13D4 6F            [ 4]  972 	ld	l, a
   13D5 DD 7E E8      [19]  973 	ld	a, -24 (ix)
   13D8 CE 00         [ 7]  974 	adc	a, #0x00
   13DA 67            [ 4]  975 	ld	h, a
   13DB DD 7E D6      [19]  976 	ld	a, -42 (ix)
   13DE 77            [ 7]  977 	ld	(hl), a
   13DF 18 2E         [12]  978 	jr	00160$
   13E1                     979 00129$:
                            980 ;src/text/text.c:343: colorchar[pos] = *pChar;
   13E1 DD 7E F1      [19]  981 	ld	a, -15 (ix)
   13E4 85            [ 4]  982 	add	a, l
   13E5 6F            [ 4]  983 	ld	l, a
   13E6 DD 7E F2      [19]  984 	ld	a, -14 (ix)
   13E9 CE 00         [ 7]  985 	adc	a, #0x00
   13EB 67            [ 4]  986 	ld	h, a
   13EC DD 7E F3      [19]  987 	ld	a, -13 (ix)
   13EF 77            [ 7]  988 	ld	(hl), a
                            989 ;src/text/text.c:344: colorchar[pos + FONT_0_W] = *pChar;
   13F0 DD 7E F1      [19]  990 	ld	a, -15 (ix)
   13F3 DD 86 FB      [19]  991 	add	a, -5 (ix)
   13F6 DD 77 F9      [19]  992 	ld	-7 (ix), a
   13F9 DD 7E F2      [19]  993 	ld	a, -14 (ix)
   13FC CE 00         [ 7]  994 	adc	a, #0x00
   13FE DD 77 FA      [19]  995 	ld	-6 (ix), a
   1401 DD 6E DB      [19]  996 	ld	l,-37 (ix)
   1404 DD 66 DC      [19]  997 	ld	h,-36 (ix)
   1407 7E            [ 7]  998 	ld	a, (hl)
   1408 DD 6E F9      [19]  999 	ld	l,-7 (ix)
   140B DD 66 FA      [19] 1000 	ld	h,-6 (ix)
   140E 77            [ 7] 1001 	ld	(hl), a
   140F                    1002 00160$:
                           1003 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   140F 04            [ 4] 1004 	inc	b
   1410 78            [ 4] 1005 	ld	a, b
   1411 D6 12         [ 7] 1006 	sub	a, #0x12
   1413 DA 5B 12      [10] 1007 	jp	C, 00159$
                           1008 ;src/text/text.c:349: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
   1416 C5            [11] 1009 	push	bc
   1417 DD 66 07      [19] 1010 	ld	h, 7 (ix)
   141A DD 6E 06      [19] 1011 	ld	l, 6 (ix)
   141D E5            [11] 1012 	push	hl
   141E 21 00 80      [10] 1013 	ld	hl, #0x8000
   1421 E5            [11] 1014 	push	hl
   1422 CD 4A 17      [17] 1015 	call	_cpct_getScreenPtr
   1425 C1            [10] 1016 	pop	bc
                           1017 ;src/text/text.c:353: cpct_drawSprite(colorchar, pvideo, FONT_0_W, FONT_H * size);
   1426 E5            [11] 1018 	push	hl
   1427 FD E1         [14] 1019 	pop	iy
   1429 DD 5E F4      [19] 1020 	ld	e,-12 (ix)
   142C DD 56 F5      [19] 1021 	ld	d,-11 (ix)
   142F C5            [11] 1022 	push	bc
   1430 DD 46 F8      [19] 1023 	ld	b, -8 (ix)
   1433 0E 02         [ 7] 1024 	ld	c,#0x02
   1435 C5            [11] 1025 	push	bc
   1436 FD E5         [15] 1026 	push	iy
   1438 D5            [11] 1027 	push	de
   1439 CD 9E 14      [17] 1028 	call	_cpct_drawSprite
   143C C1            [10] 1029 	pop	bc
                           1030 ;src/text/text.c:356: if (character == 48 || character == 60 || character == 57)
   143D 79            [ 4] 1031 	ld	a,c
   143E FE 30         [ 7] 1032 	cp	a,#0x30
   1440 28 08         [12] 1033 	jr	Z,00144$
   1442 FE 3C         [ 7] 1034 	cp	a,#0x3c
   1444 28 04         [12] 1035 	jr	Z,00144$
   1446 D6 39         [ 7] 1036 	sub	a, #0x39
   1448 20 03         [12] 1037 	jr	NZ,00149$
   144A                    1038 00144$:
                           1039 ;src/text/text.c:357: xPos--;
   144A DD 35 06      [23] 1040 	dec	6 (ix)
   144D                    1041 00149$:
                           1042 ;src/text/text.c:359: character = text[++x];
   144D DD 34 DA      [23] 1043 	inc	-38 (ix)
   1450 DD 7E EB      [19] 1044 	ld	a, -21 (ix)
   1453 DD 86 DA      [19] 1045 	add	a, -38 (ix)
   1456 6F            [ 4] 1046 	ld	l, a
   1457 DD 7E EC      [19] 1047 	ld	a, -20 (ix)
   145A CE 00         [ 7] 1048 	adc	a, #0x00
   145C 67            [ 4] 1049 	ld	h, a
   145D 7E            [ 7] 1050 	ld	a, (hl)
   145E DD 77 EE      [19] 1051 	ld	-18 (ix), a
                           1052 ;src/text/text.c:360: xPos += FONT_0_W;
   1461 DD 34 06      [23] 1053 	inc	6 (ix)
   1464 DD 34 06      [23] 1054 	inc	6 (ix)
   1467 C3 8D 11      [10] 1055 	jp	00156$
   146A                    1056 00161$:
   146A DD F9         [10] 1057 	ld	sp, ix
   146C DD E1         [14] 1058 	pop	ix
   146E C9            [10] 1059 	ret
                           1060 	.area _CODE
                           1061 	.area _INITIALIZER
                           1062 	.area _CABS (ABS)
