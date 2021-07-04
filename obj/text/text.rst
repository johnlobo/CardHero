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
   0B95                      54 _strLength::
                             55 ;src/text/text.c:58: while (str[result] != '\0')
   0B95 0E 00         [ 7]   56 	ld	c, #0x00
   0B97                      57 00101$:
   0B97 21 02 00      [10]   58 	ld	hl, #2
   0B9A 39            [11]   59 	add	hl, sp
   0B9B 7E            [ 7]   60 	ld	a, (hl)
   0B9C 23            [ 6]   61 	inc	hl
   0B9D 66            [ 7]   62 	ld	h, (hl)
   0B9E 6F            [ 4]   63 	ld	l, a
   0B9F 06 00         [ 7]   64 	ld	b, #0x00
   0BA1 09            [11]   65 	add	hl, bc
   0BA2 7E            [ 7]   66 	ld	a, (hl)
   0BA3 B7            [ 4]   67 	or	a, a
   0BA4 28 03         [12]   68 	jr	Z,00103$
                             69 ;src/text/text.c:60: result++;
   0BA6 0C            [ 4]   70 	inc	c
   0BA7 18 EE         [12]   71 	jr	00101$
   0BA9                      72 00103$:
                             73 ;src/text/text.c:62: return result;
   0BA9 69            [ 4]   74 	ld	l, c
   0BAA C9            [10]   75 	ret
   0BAB                      76 _swapColors:
   0BAB 55                   77 	.db #0x55	; 85	'U'
   0BAC EE                   78 	.db #0xee	; 238
   0BAD DD                   79 	.db #0xdd	; 221
   0BAE FF                   80 	.db #0xff	; 255
   0BAF 14                   81 	.db #0x14	; 20
   0BB0 6C                   82 	.db #0x6c	; 108	'l'
   0BB1 9C                   83 	.db #0x9c	; 156
   0BB2 3C                   84 	.db #0x3c	; 60
   0BB3 50                   85 	.db #0x50	; 80	'P'
   0BB4 E4                   86 	.db #0xe4	; 228
   0BB5 D8                   87 	.db #0xd8	; 216
   0BB6 F0                   88 	.db #0xf0	; 240
   0BB7 11                   89 	.db #0x11	; 17
   0BB8 66                   90 	.db #0x66	; 102	'f'
   0BB9 99                   91 	.db #0x99	; 153
   0BBA 33                   92 	.db #0x33	; 51	'3'
   0BBB 10                   93 	.db #0x10	; 16
   0BBC 35                   94 	.db #0x35	; 53	'5'
   0BBD 3A                   95 	.db #0x3a	; 58
   0BBE 30                   96 	.db #0x30	; 48	'0'
   0BBF 45                   97 	.db #0x45	; 69	'E'
   0BC0 CE                   98 	.db #0xce	; 206
   0BC1 CD                   99 	.db #0xcd	; 205
   0BC2 CF                  100 	.db #0xcf	; 207
                            101 ;src/text/text.c:75: void strCopy(u8 source[], u8 dest[])
                            102 ;	---------------------------------
                            103 ; Function strCopy
                            104 ; ---------------------------------
   0BC3                     105 _strCopy::
   0BC3 DD E5         [15]  106 	push	ix
   0BC5 DD 21 00 00   [14]  107 	ld	ix,#0
   0BC9 DD 39         [15]  108 	add	ix,sp
                            109 ;src/text/text.c:78: while ((dest[i] = source[i]) != '\0')
   0BCB 0E 00         [ 7]  110 	ld	c, #0x00
   0BCD                     111 00101$:
   0BCD DD 7E 06      [19]  112 	ld	a, 6 (ix)
   0BD0 81            [ 4]  113 	add	a, c
   0BD1 5F            [ 4]  114 	ld	e, a
   0BD2 DD 7E 07      [19]  115 	ld	a, 7 (ix)
   0BD5 CE 00         [ 7]  116 	adc	a, #0x00
   0BD7 57            [ 4]  117 	ld	d, a
   0BD8 DD 6E 04      [19]  118 	ld	l,4 (ix)
   0BDB DD 66 05      [19]  119 	ld	h,5 (ix)
   0BDE 06 00         [ 7]  120 	ld	b, #0x00
   0BE0 09            [11]  121 	add	hl, bc
   0BE1 7E            [ 7]  122 	ld	a, (hl)
   0BE2 12            [ 7]  123 	ld	(de), a
   0BE3 B7            [ 4]  124 	or	a, a
   0BE4 28 03         [12]  125 	jr	Z,00104$
                            126 ;src/text/text.c:80: i++;
   0BE6 0C            [ 4]  127 	inc	c
   0BE7 18 E4         [12]  128 	jr	00101$
   0BE9                     129 00104$:
   0BE9 DD E1         [14]  130 	pop	ix
   0BEB C9            [10]  131 	ret
                            132 ;src/text/text.c:94: u8 strCmp(u8 str1[], u8 str2[])
                            133 ;	---------------------------------
                            134 ; Function strCmp
                            135 ; ---------------------------------
   0BEC                     136 _strCmp::
                            137 ;src/text/text.c:99: while ((str1[i] == str2[i]) && ((str1[i] != '\0') && (str2[i] != '\0')))
   0BEC 0E 00         [ 7]  138 	ld	c, #0x00
   0BEE                     139 00103$:
   0BEE 21 02 00      [10]  140 	ld	hl, #2
   0BF1 39            [11]  141 	add	hl, sp
   0BF2 7E            [ 7]  142 	ld	a, (hl)
   0BF3 23            [ 6]  143 	inc	hl
   0BF4 66            [ 7]  144 	ld	h, (hl)
   0BF5 6F            [ 4]  145 	ld	l, a
   0BF6 06 00         [ 7]  146 	ld	b, #0x00
   0BF8 09            [11]  147 	add	hl, bc
   0BF9 46            [ 7]  148 	ld	b, (hl)
   0BFA FD 21 04 00   [14]  149 	ld	iy, #4
   0BFE FD 39         [15]  150 	add	iy, sp
   0C00 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   0C03 81            [ 4]  152 	add	a, c
   0C04 5F            [ 4]  153 	ld	e, a
   0C05 FD 7E 01      [19]  154 	ld	a, 1 (iy)
   0C08 CE 00         [ 7]  155 	adc	a, #0x00
   0C0A 57            [ 4]  156 	ld	d, a
   0C0B 1A            [ 7]  157 	ld	a, (de)
   0C0C 57            [ 4]  158 	ld	d, a
   0C0D 78            [ 4]  159 	ld	a, b
   0C0E 92            [ 4]  160 	sub	a, d
   0C0F 20 04         [12]  161 	jr	NZ,00132$
   0C11 3E 01         [ 7]  162 	ld	a,#0x01
   0C13 18 01         [12]  163 	jr	00133$
   0C15                     164 00132$:
   0C15 AF            [ 4]  165 	xor	a,a
   0C16                     166 00133$:
   0C16 5F            [ 4]  167 	ld	e,a
   0C17 B7            [ 4]  168 	or	a, a
   0C18 28 0B         [12]  169 	jr	Z,00105$
   0C1A 78            [ 4]  170 	ld	a, b
   0C1B B7            [ 4]  171 	or	a, a
   0C1C 28 07         [12]  172 	jr	Z,00105$
   0C1E 7A            [ 4]  173 	ld	a, d
   0C1F B7            [ 4]  174 	or	a, a
   0C20 28 03         [12]  175 	jr	Z,00105$
                            176 ;src/text/text.c:101: i++;
   0C22 0C            [ 4]  177 	inc	c
   0C23 18 C9         [12]  178 	jr	00103$
   0C25                     179 00105$:
                            180 ;src/text/text.c:103: if (str1[i] == str2[i])
   0C25 7B            [ 4]  181 	ld	a, e
   0C26 B7            [ 4]  182 	or	a, a
   0C27 28 03         [12]  183 	jr	Z,00107$
                            184 ;src/text/text.c:105: return YES;
   0C29 2E 01         [ 7]  185 	ld	l, #0x01
   0C2B C9            [10]  186 	ret
   0C2C                     187 00107$:
                            188 ;src/text/text.c:109: return NO;
   0C2C 2E 00         [ 7]  189 	ld	l, #0x00
   0C2E C9            [10]  190 	ret
                            191 ;src/text/text.c:125: void drawTextM1(u8 *text, u8 xPos, u8 yPos, u8 size)
                            192 ;	---------------------------------
                            193 ; Function drawTextM1
                            194 ; ---------------------------------
   0C2F                     195 _drawTextM1::
   0C2F DD E5         [15]  196 	push	ix
   0C31 DD 21 00 00   [14]  197 	ld	ix,#0
   0C35 DD 39         [15]  198 	add	ix,sp
   0C37 21 CC FF      [10]  199 	ld	hl, #-52
   0C3A 39            [11]  200 	add	hl, sp
   0C3B F9            [ 6]  201 	ld	sp, hl
                            202 ;src/text/text.c:140: character = text[x];
   0C3C DD 7E 04      [19]  203 	ld	a, 4 (ix)
   0C3F DD 77 FA      [19]  204 	ld	-6 (ix), a
   0C42 DD 7E 05      [19]  205 	ld	a, 5 (ix)
   0C45 DD 77 FB      [19]  206 	ld	-5 (ix), a
   0C48 DD 6E FA      [19]  207 	ld	l,-6 (ix)
   0C4B DD 66 FB      [19]  208 	ld	h,-5 (ix)
   0C4E 7E            [ 7]  209 	ld	a, (hl)
   0C4F DD 77 FD      [19]  210 	ld	-3 (ix), a
                            211 ;src/text/text.c:142: while (character != '\0')
   0C52 21 03 00      [10]  212 	ld	hl, #0x0003
   0C55 39            [11]  213 	add	hl, sp
   0C56 DD 75 F4      [19]  214 	ld	-12 (ix), l
   0C59 DD 74 F5      [19]  215 	ld	-11 (ix), h
   0C5C DD 7E F4      [19]  216 	ld	a, -12 (ix)
   0C5F DD 77 FE      [19]  217 	ld	-2 (ix), a
   0C62 DD 7E F5      [19]  218 	ld	a, -11 (ix)
   0C65 DD 77 FF      [19]  219 	ld	-1 (ix), a
   0C68 DD 7E 08      [19]  220 	ld	a, 8 (ix)
   0C6B 3D            [ 4]  221 	dec	a
   0C6C 20 04         [12]  222 	jr	NZ,00246$
   0C6E 3E 01         [ 7]  223 	ld	a,#0x01
   0C70 18 01         [12]  224 	jr	00247$
   0C72                     225 00246$:
   0C72 AF            [ 4]  226 	xor	a,a
   0C73                     227 00247$:
   0C73 DD 77 FC      [19]  228 	ld	-4 (ix), a
   0C76 DD 7E 08      [19]  229 	ld	a, 8 (ix)
   0C79 4F            [ 4]  230 	ld	c, a
   0C7A 87            [ 4]  231 	add	a, a
   0C7B 87            [ 4]  232 	add	a, a
   0C7C 87            [ 4]  233 	add	a, a
   0C7D 81            [ 4]  234 	add	a, c
   0C7E DD 77 F9      [19]  235 	ld	-7 (ix), a
   0C81 DD 7E F4      [19]  236 	ld	a, -12 (ix)
   0C84 DD 77 F7      [19]  237 	ld	-9 (ix), a
   0C87 DD 7E F5      [19]  238 	ld	a, -11 (ix)
   0C8A DD 77 F8      [19]  239 	ld	-8 (ix), a
   0C8D DD 36 F3 00   [19]  240 	ld	-13 (ix), #0x00
   0C91                     241 00133$:
   0C91 DD 7E FD      [19]  242 	ld	a, -3 (ix)
   0C94 B7            [ 4]  243 	or	a, a
   0C95 CA 3C 0E      [10]  244 	jp	Z, 00138$
                            245 ;src/text/text.c:145: if ((character == 33) ||                        // !
   0C98 DD 7E FD      [19]  246 	ld	a, -3 (ix)
   0C9B D6 21         [ 7]  247 	sub	a, #0x21
   0C9D 20 04         [12]  248 	jr	NZ,00248$
   0C9F 3E 01         [ 7]  249 	ld	a,#0x01
   0CA1 18 01         [12]  250 	jr	00249$
   0CA3                     251 00248$:
   0CA3 AF            [ 4]  252 	xor	a,a
   0CA4                     253 00249$:
   0CA4 4F            [ 4]  254 	ld	c,a
   0CA5 B7            [ 4]  255 	or	a, a
   0CA6 20 2C         [12]  256 	jr	NZ,00125$
                            257 ;src/text/text.c:146: ((character > 43) && (character < 47)) ||   // ,-.
   0CA8 3E 2B         [ 7]  258 	ld	a, #0x2b
   0CAA DD 96 FD      [19]  259 	sub	a, -3 (ix)
   0CAD 30 07         [12]  260 	jr	NC,00130$
   0CAF DD 7E FD      [19]  261 	ld	a, -3 (ix)
   0CB2 D6 2F         [ 7]  262 	sub	a, #0x2f
   0CB4 38 1E         [12]  263 	jr	C,00125$
   0CB6                     264 00130$:
                            265 ;src/text/text.c:147: ((character > 47) && (character < 59)) ||   // 0123456789:
   0CB6 3E 2F         [ 7]  266 	ld	a, #0x2f
   0CB8 DD 96 FD      [19]  267 	sub	a, -3 (ix)
   0CBB 30 07         [12]  268 	jr	NC,00132$
   0CBD DD 7E FD      [19]  269 	ld	a, -3 (ix)
   0CC0 D6 3B         [ 7]  270 	sub	a, #0x3b
   0CC2 38 10         [12]  271 	jr	C,00125$
   0CC4                     272 00132$:
                            273 ;src/text/text.c:148: ((character > 62) && (character < 91)))     // ABCDEFGHIJKLMNOPQRSTUVWXYZ
   0CC4 3E 3E         [ 7]  274 	ld	a, #0x3e
   0CC6 DD 96 FD      [19]  275 	sub	a, -3 (ix)
   0CC9 D2 22 0E      [10]  276 	jp	NC, 00126$
   0CCC DD 7E FD      [19]  277 	ld	a, -3 (ix)
   0CCF D6 5B         [ 7]  278 	sub	a, #0x5b
   0CD1 D2 22 0E      [10]  279 	jp	NC, 00126$
   0CD4                     280 00125$:
                            281 ;src/text/text.c:152: switch (character)
   0CD4 79            [ 4]  282 	ld	a, c
   0CD5 B7            [ 4]  283 	or	a, a
   0CD6 20 64         [12]  284 	jr	NZ,00101$
   0CD8 DD 7E FD      [19]  285 	ld	a, -3 (ix)
   0CDB D6 2C         [ 7]  286 	sub	a, #0x2c
   0CDD 28 63         [12]  287 	jr	Z,00104$
   0CDF DD 7E FD      [19]  288 	ld	a, -3 (ix)
   0CE2 D6 2D         [ 7]  289 	sub	a, #0x2d
   0CE4 28 5C         [12]  290 	jr	Z,00104$
   0CE6 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   0CE9 D6 2E         [ 7]  292 	sub	a, #0x2e
   0CEB 28 55         [12]  293 	jr	Z,00104$
   0CED DD 7E FD      [19]  294 	ld	a, -3 (ix)
   0CF0 D6 30         [ 7]  295 	sub	a, #0x30
   0CF2 28 58         [12]  296 	jr	Z,00115$
   0CF4 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   0CF7 D6 31         [ 7]  298 	sub	a, #0x31
   0CF9 28 51         [12]  299 	jr	Z,00115$
   0CFB DD 7E FD      [19]  300 	ld	a, -3 (ix)
   0CFE D6 32         [ 7]  301 	sub	a, #0x32
   0D00 28 4A         [12]  302 	jr	Z,00115$
   0D02 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   0D05 D6 33         [ 7]  304 	sub	a, #0x33
   0D07 28 43         [12]  305 	jr	Z,00115$
   0D09 DD 7E FD      [19]  306 	ld	a, -3 (ix)
   0D0C D6 34         [ 7]  307 	sub	a, #0x34
   0D0E 28 3C         [12]  308 	jr	Z,00115$
   0D10 DD 7E FD      [19]  309 	ld	a, -3 (ix)
   0D13 D6 35         [ 7]  310 	sub	a, #0x35
   0D15 28 35         [12]  311 	jr	Z,00115$
   0D17 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   0D1A D6 36         [ 7]  313 	sub	a, #0x36
   0D1C 28 2E         [12]  314 	jr	Z,00115$
   0D1E DD 7E FD      [19]  315 	ld	a, -3 (ix)
   0D21 D6 37         [ 7]  316 	sub	a, #0x37
   0D23 28 27         [12]  317 	jr	Z,00115$
   0D25 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   0D28 D6 38         [ 7]  319 	sub	a, #0x38
   0D2A 28 20         [12]  320 	jr	Z,00115$
   0D2C DD 7E FD      [19]  321 	ld	a, -3 (ix)
   0D2F D6 39         [ 7]  322 	sub	a, #0x39
   0D31 28 19         [12]  323 	jr	Z,00115$
   0D33 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   0D36 D6 3A         [ 7]  325 	sub	a, #0x3a
   0D38 28 12         [12]  326 	jr	Z,00115$
   0D3A 18 1C         [12]  327 	jr	00116$
                            328 ;src/text/text.c:155: case 33:
   0D3C                     329 00101$:
                            330 ;src/text/text.c:156: character = 48;
   0D3C DD 36 FD 30   [19]  331 	ld	-3 (ix), #0x30
                            332 ;src/text/text.c:157: break;
   0D40 18 16         [12]  333 	jr	00116$
                            334 ;src/text/text.c:162: case 46:
   0D42                     335 00104$:
                            336 ;src/text/text.c:163: character += 5;
   0D42 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   0D45 C6 05         [ 7]  338 	add	a, #0x05
   0D47 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:164: break;
   0D4A 18 0C         [12]  341 	jr	00116$
                            342 ;src/text/text.c:177: case 58:
   0D4C                     343 00115$:
                            344 ;src/text/text.c:178: character += 4;
   0D4C DD 34 FD      [23]  345 	inc	-3 (ix)
   0D4F DD 34 FD      [23]  346 	inc	-3 (ix)
   0D52 DD 34 FD      [23]  347 	inc	-3 (ix)
   0D55 DD 34 FD      [23]  348 	inc	-3 (ix)
                            349 ;src/text/text.c:180: }
   0D58                     350 00116$:
                            351 ;src/text/text.c:183: character -= 48;
   0D58 DD 7E FD      [19]  352 	ld	a, -3 (ix)
   0D5B C6 D0         [ 7]  353 	add	a, #0xd0
   0D5D 4F            [ 4]  354 	ld	c, a
                            355 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   0D5E 06 00         [ 7]  356 	ld	b,#0x00
   0D60 69            [ 4]  357 	ld	l, c
   0D61 60            [ 4]  358 	ld	h, b
   0D62 29            [11]  359 	add	hl, hl
   0D63 29            [11]  360 	add	hl, hl
   0D64 29            [11]  361 	add	hl, hl
   0D65 09            [11]  362 	add	hl, bc
   0D66 45            [ 4]  363 	ld	b, l
   0D67 54            [ 4]  364 	ld	d, h
   0D68 1E 00         [ 7]  365 	ld	e, #0x00
   0D6A                     366 00136$:
                            367 ;src/text/text.c:188: pChar = (u8 *)s_fonts_1 + (character * 9) + i;
   0D6A 3E 40         [ 7]  368 	ld	a, #<(_s_fonts_1)
   0D6C 80            [ 4]  369 	add	a, b
   0D6D 6F            [ 4]  370 	ld	l, a
   0D6E 3E 00         [ 7]  371 	ld	a, #>(_s_fonts_1)
   0D70 8A            [ 4]  372 	adc	a, d
   0D71 67            [ 4]  373 	ld	h, a
   0D72 7D            [ 4]  374 	ld	a, l
   0D73 83            [ 4]  375 	add	a, e
   0D74 6F            [ 4]  376 	ld	l, a
   0D75 7C            [ 4]  377 	ld	a, h
   0D76 CE 00         [ 7]  378 	adc	a, #0x00
   0D78 67            [ 4]  379 	ld	h, a
                            380 ;src/text/text.c:193: colorchar[i] = *pChar;
   0D79 DD 75 CD      [19]  381 	ld	-51 (ix), l
   0D7C DD 74 CE      [19]  382 	ld	-50 (ix), h
   0D7F 7E            [ 7]  383 	ld	a, (hl)
   0D80 DD 77 F6      [19]  384 	ld	-10 (ix), a
                            385 ;src/text/text.c:190: if (size == 1)
   0D83 DD 7E FC      [19]  386 	ld	a, -4 (ix)
   0D86 B7            [ 4]  387 	or	a, a
   0D87 28 11         [12]  388 	jr	Z,00118$
                            389 ;src/text/text.c:193: colorchar[i] = *pChar;
   0D89 DD 7E FE      [19]  390 	ld	a, -2 (ix)
   0D8C 83            [ 4]  391 	add	a, e
   0D8D 6F            [ 4]  392 	ld	l, a
   0D8E DD 7E FF      [19]  393 	ld	a, -1 (ix)
   0D91 CE 00         [ 7]  394 	adc	a, #0x00
   0D93 67            [ 4]  395 	ld	h, a
   0D94 DD 7E F6      [19]  396 	ld	a, -10 (ix)
   0D97 77            [ 7]  397 	ld	(hl), a
   0D98 18 4A         [12]  398 	jr	00137$
   0D9A                     399 00118$:
                            400 ;src/text/text.c:198: pos = (i * size) - (i % FONT_1_W);
   0D9A D5            [11]  401 	push	de
   0D9B C5            [11]  402 	push	bc
   0D9C DD 66 08      [19]  403 	ld	h, 8 (ix)
   0D9F 2E 00         [ 7]  404 	ld	l, #0x00
   0DA1 55            [ 4]  405 	ld	d, l
   0DA2 06 08         [ 7]  406 	ld	b, #0x08
   0DA4                     407 00264$:
   0DA4 29            [11]  408 	add	hl, hl
   0DA5 30 01         [12]  409 	jr	NC,00265$
   0DA7 19            [11]  410 	add	hl, de
   0DA8                     411 00265$:
   0DA8 10 FA         [13]  412 	djnz	00264$
   0DAA C1            [10]  413 	pop	bc
   0DAB D1            [10]  414 	pop	de
   0DAC 26 00         [ 7]  415 	ld	h, #0x00
   0DAE 7D            [ 4]  416 	ld	a, l
   0DAF 94            [ 4]  417 	sub	a, h
   0DB0 DD 77 CC      [19]  418 	ld	-52 (ix), a
                            419 ;src/text/text.c:200: colorchar[pos] = *pChar;
   0DB3 DD 7E F4      [19]  420 	ld	a, -12 (ix)
   0DB6 DD 86 CC      [19]  421 	add	a, -52 (ix)
   0DB9 6F            [ 4]  422 	ld	l, a
   0DBA DD 7E F5      [19]  423 	ld	a, -11 (ix)
   0DBD CE 00         [ 7]  424 	adc	a, #0x00
   0DBF 67            [ 4]  425 	ld	h, a
   0DC0 DD 7E F6      [19]  426 	ld	a, -10 (ix)
   0DC3 77            [ 7]  427 	ld	(hl), a
                            428 ;src/text/text.c:201: colorchar[pos + FONT_1_W] = *pChar;
   0DC4 DD 6E CC      [19]  429 	ld	l, -52 (ix)
   0DC7 2C            [ 4]  430 	inc	l
   0DC8 E5            [11]  431 	push	hl
   0DC9 DD 6E F4      [19]  432 	ld	l, -12 (ix)
   0DCC DD 66 F5      [19]  433 	ld	h, -11 (ix)
   0DCF E5            [11]  434 	push	hl
   0DD0 FD E1         [14]  435 	pop	iy
   0DD2 E1            [10]  436 	pop	hl
   0DD3 C5            [11]  437 	push	bc
   0DD4 4D            [ 4]  438 	ld	c,l
   0DD5 06 00         [ 7]  439 	ld	b,#0x00
   0DD7 FD 09         [15]  440 	add	iy, bc
   0DD9 C1            [10]  441 	pop	bc
   0DDA DD 6E CD      [19]  442 	ld	l,-51 (ix)
   0DDD DD 66 CE      [19]  443 	ld	h,-50 (ix)
   0DE0 6E            [ 7]  444 	ld	l, (hl)
   0DE1 FD 75 00      [19]  445 	ld	0 (iy), l
   0DE4                     446 00137$:
                            447 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   0DE4 1C            [ 4]  448 	inc	e
   0DE5 7B            [ 4]  449 	ld	a, e
   0DE6 D6 09         [ 7]  450 	sub	a, #0x09
   0DE8 DA 6A 0D      [10]  451 	jp	C, 00136$
                            452 ;src/text/text.c:205: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   0DEB C5            [11]  453 	push	bc
   0DEC DD 66 07      [19]  454 	ld	h, 7 (ix)
   0DEF DD 6E 06      [19]  455 	ld	l, 6 (ix)
   0DF2 E5            [11]  456 	push	hl
   0DF3 21 00 C0      [10]  457 	ld	hl, #0xc000
   0DF6 E5            [11]  458 	push	hl
   0DF7 CD 16 15      [17]  459 	call	_cpct_getScreenPtr
   0DFA C1            [10]  460 	pop	bc
                            461 ;src/text/text.c:209: cpct_drawSprite(colorchar, pvideo, FONT_1_W, FONT_H * size);
   0DFB E5            [11]  462 	push	hl
   0DFC FD E1         [14]  463 	pop	iy
   0DFE DD 5E F7      [19]  464 	ld	e,-9 (ix)
   0E01 DD 56 F8      [19]  465 	ld	d,-8 (ix)
   0E04 C5            [11]  466 	push	bc
   0E05 DD 46 F9      [19]  467 	ld	b, -7 (ix)
   0E08 0E 01         [ 7]  468 	ld	c,#0x01
   0E0A C5            [11]  469 	push	bc
   0E0B FD E5         [15]  470 	push	iy
   0E0D D5            [11]  471 	push	de
   0E0E CD 3F 12      [17]  472 	call	_cpct_drawSprite
   0E11 C1            [10]  473 	pop	bc
                            474 ;src/text/text.c:212: if (character == 48 || character == 60 || character == 57)
   0E12 79            [ 4]  475 	ld	a,c
   0E13 FE 30         [ 7]  476 	cp	a,#0x30
   0E15 28 08         [12]  477 	jr	Z,00121$
   0E17 FE 3C         [ 7]  478 	cp	a,#0x3c
   0E19 28 04         [12]  479 	jr	Z,00121$
   0E1B D6 39         [ 7]  480 	sub	a, #0x39
   0E1D 20 03         [12]  481 	jr	NZ,00126$
   0E1F                     482 00121$:
                            483 ;src/text/text.c:213: xPos--;
   0E1F DD 35 06      [23]  484 	dec	6 (ix)
   0E22                     485 00126$:
                            486 ;src/text/text.c:215: character = text[++x];
   0E22 DD 34 F3      [23]  487 	inc	-13 (ix)
   0E25 DD 7E FA      [19]  488 	ld	a, -6 (ix)
   0E28 DD 86 F3      [19]  489 	add	a, -13 (ix)
   0E2B 6F            [ 4]  490 	ld	l, a
   0E2C DD 7E FB      [19]  491 	ld	a, -5 (ix)
   0E2F CE 00         [ 7]  492 	adc	a, #0x00
   0E31 67            [ 4]  493 	ld	h, a
   0E32 7E            [ 7]  494 	ld	a, (hl)
   0E33 DD 77 FD      [19]  495 	ld	-3 (ix), a
                            496 ;src/text/text.c:216: xPos += FONT_1_W;
   0E36 DD 34 06      [23]  497 	inc	6 (ix)
   0E39 C3 91 0C      [10]  498 	jp	00133$
   0E3C                     499 00138$:
   0E3C DD F9         [10]  500 	ld	sp, ix
   0E3E DD E1         [14]  501 	pop	ix
   0E40 C9            [10]  502 	ret
                            503 ;src/text/text.c:232: void drawText(u8 *text, u8 xPos, u8 yPos, u8 color, u8 size)
                            504 ;	---------------------------------
                            505 ; Function drawText
                            506 ; ---------------------------------
   0E41                     507 _drawText::
   0E41 DD E5         [15]  508 	push	ix
   0E43 DD 21 00 00   [14]  509 	ld	ix,#0
   0E47 DD 39         [15]  510 	add	ix,sp
   0E49 21 B2 FF      [10]  511 	ld	hl, #-78
   0E4C 39            [11]  512 	add	hl, sp
   0E4D F9            [ 6]  513 	ld	sp, hl
                            514 ;src/text/text.c:245: color1 = swapColors[color][0];
   0E4E 01 AB 0B      [10]  515 	ld	bc, #_swapColors+0
   0E51 DD 6E 08      [19]  516 	ld	l, 8 (ix)
   0E54 26 00         [ 7]  517 	ld	h, #0x00
   0E56 29            [11]  518 	add	hl, hl
   0E57 29            [11]  519 	add	hl, hl
   0E58 09            [11]  520 	add	hl, bc
   0E59 E5            [11]  521 	push	hl
   0E5A FD E1         [14]  522 	pop	iy
   0E5C FD 7E 00      [19]  523 	ld	a, 0 (iy)
   0E5F DD 77 D9      [19]  524 	ld	-39 (ix), a
                            525 ;src/text/text.c:246: color2 = swapColors[color][1];
   0E62 FD E5         [15]  526 	push	iy
   0E64 E1            [10]  527 	pop	hl
   0E65 23            [ 6]  528 	inc	hl
   0E66 7E            [ 7]  529 	ld	a, (hl)
   0E67 DD 77 D8      [19]  530 	ld	-40 (ix), a
                            531 ;src/text/text.c:247: color3 = swapColors[color][2];
   0E6A FD E5         [15]  532 	push	iy
   0E6C E1            [10]  533 	pop	hl
   0E6D 23            [ 6]  534 	inc	hl
   0E6E 23            [ 6]  535 	inc	hl
   0E6F 7E            [ 7]  536 	ld	a, (hl)
   0E70 DD 77 D7      [19]  537 	ld	-41 (ix), a
                            538 ;src/text/text.c:248: color4 = swapColors[color][3];
   0E73 FD 7E 03      [19]  539 	ld	a, 3 (iy)
   0E76 DD 77 D6      [19]  540 	ld	-42 (ix), a
                            541 ;src/text/text.c:253: character = text[x];
   0E79 DD 7E 04      [19]  542 	ld	a, 4 (ix)
   0E7C DD 77 EB      [19]  543 	ld	-21 (ix), a
   0E7F DD 7E 05      [19]  544 	ld	a, 5 (ix)
   0E82 DD 77 EC      [19]  545 	ld	-20 (ix), a
   0E85 DD 6E EB      [19]  546 	ld	l,-21 (ix)
   0E88 DD 66 EC      [19]  547 	ld	h,-20 (ix)
   0E8B 7E            [ 7]  548 	ld	a, (hl)
   0E8C DD 77 EE      [19]  549 	ld	-18 (ix), a
                            550 ;src/text/text.c:255: while (character != '\0')
   0E8F 21 00 00      [10]  551 	ld	hl, #0x0000
   0E92 39            [11]  552 	add	hl, sp
   0E93 DD 75 F1      [19]  553 	ld	-15 (ix), l
   0E96 DD 74 F2      [19]  554 	ld	-14 (ix), h
   0E99 DD 7E F1      [19]  555 	ld	a, -15 (ix)
   0E9C DD 77 E7      [19]  556 	ld	-25 (ix), a
   0E9F DD 7E F2      [19]  557 	ld	a, -14 (ix)
   0EA2 DD 77 E8      [19]  558 	ld	-24 (ix), a
   0EA5 DD 7E F1      [19]  559 	ld	a, -15 (ix)
   0EA8 DD 77 F6      [19]  560 	ld	-10 (ix), a
   0EAB DD 7E F2      [19]  561 	ld	a, -14 (ix)
   0EAE DD 77 F7      [19]  562 	ld	-9 (ix), a
   0EB1 DD 7E F1      [19]  563 	ld	a, -15 (ix)
   0EB4 DD 77 E9      [19]  564 	ld	-23 (ix), a
   0EB7 DD 7E F2      [19]  565 	ld	a, -14 (ix)
   0EBA DD 77 EA      [19]  566 	ld	-22 (ix), a
   0EBD DD 7E F1      [19]  567 	ld	a, -15 (ix)
   0EC0 DD 77 E1      [19]  568 	ld	-31 (ix), a
   0EC3 DD 7E F2      [19]  569 	ld	a, -14 (ix)
   0EC6 DD 77 E2      [19]  570 	ld	-30 (ix), a
   0EC9 DD 7E F1      [19]  571 	ld	a, -15 (ix)
   0ECC DD 77 FE      [19]  572 	ld	-2 (ix), a
   0ECF DD 7E F2      [19]  573 	ld	a, -14 (ix)
   0ED2 DD 77 FF      [19]  574 	ld	-1 (ix), a
   0ED5 DD 7E F1      [19]  575 	ld	a, -15 (ix)
   0ED8 DD 77 E3      [19]  576 	ld	-29 (ix), a
   0EDB DD 7E F2      [19]  577 	ld	a, -14 (ix)
   0EDE DD 77 E4      [19]  578 	ld	-28 (ix), a
   0EE1 DD 7E F1      [19]  579 	ld	a, -15 (ix)
   0EE4 DD 77 E5      [19]  580 	ld	-27 (ix), a
   0EE7 DD 7E F2      [19]  581 	ld	a, -14 (ix)
   0EEA DD 77 E6      [19]  582 	ld	-26 (ix), a
   0EED DD 7E F1      [19]  583 	ld	a, -15 (ix)
   0EF0 DD 77 DF      [19]  584 	ld	-33 (ix), a
   0EF3 DD 7E F2      [19]  585 	ld	a, -14 (ix)
   0EF6 DD 77 E0      [19]  586 	ld	-32 (ix), a
   0EF9 DD 7E F1      [19]  587 	ld	a, -15 (ix)
   0EFC DD 77 EF      [19]  588 	ld	-17 (ix), a
   0EFF DD 7E F2      [19]  589 	ld	a, -14 (ix)
   0F02 DD 77 F0      [19]  590 	ld	-16 (ix), a
   0F05 DD 7E 09      [19]  591 	ld	a, 9 (ix)
   0F08 3D            [ 4]  592 	dec	a
   0F09 20 04         [12]  593 	jr	NZ,00297$
   0F0B 3E 01         [ 7]  594 	ld	a,#0x01
   0F0D 18 01         [12]  595 	jr	00298$
   0F0F                     596 00297$:
   0F0F AF            [ 4]  597 	xor	a,a
   0F10                     598 00298$:
   0F10 DD 77 ED      [19]  599 	ld	-19 (ix), a
   0F13 DD 7E 09      [19]  600 	ld	a, 9 (ix)
   0F16 4F            [ 4]  601 	ld	c, a
   0F17 87            [ 4]  602 	add	a, a
   0F18 87            [ 4]  603 	add	a, a
   0F19 87            [ 4]  604 	add	a, a
   0F1A 81            [ 4]  605 	add	a, c
   0F1B DD 77 F8      [19]  606 	ld	-8 (ix), a
   0F1E DD 7E F1      [19]  607 	ld	a, -15 (ix)
   0F21 DD 77 F4      [19]  608 	ld	-12 (ix), a
   0F24 DD 7E F2      [19]  609 	ld	a, -14 (ix)
   0F27 DD 77 F5      [19]  610 	ld	-11 (ix), a
   0F2A DD 36 DA 00   [19]  611 	ld	-38 (ix), #0x00
   0F2E                     612 00156$:
   0F2E DD 7E EE      [19]  613 	ld	a, -18 (ix)
   0F31 B7            [ 4]  614 	or	a, a
   0F32 CA 0B 12      [10]  615 	jp	Z, 00161$
                            616 ;src/text/text.c:259: if ((character == 33) || ((character > 43) && (character < 47)) ||
   0F35 DD 7E EE      [19]  617 	ld	a, -18 (ix)
   0F38 D6 21         [ 7]  618 	sub	a, #0x21
   0F3A 20 04         [12]  619 	jr	NZ,00299$
   0F3C 3E 01         [ 7]  620 	ld	a,#0x01
   0F3E 18 01         [12]  621 	jr	00300$
   0F40                     622 00299$:
   0F40 AF            [ 4]  623 	xor	a,a
   0F41                     624 00300$:
   0F41 4F            [ 4]  625 	ld	c,a
   0F42 B7            [ 4]  626 	or	a, a
   0F43 20 2C         [12]  627 	jr	NZ,00148$
   0F45 3E 2B         [ 7]  628 	ld	a, #0x2b
   0F47 DD 96 EE      [19]  629 	sub	a, -18 (ix)
   0F4A 30 07         [12]  630 	jr	NC,00153$
   0F4C DD 7E EE      [19]  631 	ld	a, -18 (ix)
   0F4F D6 2F         [ 7]  632 	sub	a, #0x2f
   0F51 38 1E         [12]  633 	jr	C,00148$
   0F53                     634 00153$:
                            635 ;src/text/text.c:260: ((character > 47) && (character < 58)) || ((character > 62) && (character < 91)))
   0F53 3E 2F         [ 7]  636 	ld	a, #0x2f
   0F55 DD 96 EE      [19]  637 	sub	a, -18 (ix)
   0F58 30 07         [12]  638 	jr	NC,00155$
   0F5A DD 7E EE      [19]  639 	ld	a, -18 (ix)
   0F5D D6 3A         [ 7]  640 	sub	a, #0x3a
   0F5F 38 10         [12]  641 	jr	C,00148$
   0F61                     642 00155$:
   0F61 3E 3E         [ 7]  643 	ld	a, #0x3e
   0F63 DD 96 EE      [19]  644 	sub	a, -18 (ix)
   0F66 D2 EE 11      [10]  645 	jp	NC, 00149$
   0F69 DD 7E EE      [19]  646 	ld	a, -18 (ix)
   0F6C D6 5B         [ 7]  647 	sub	a, #0x5b
   0F6E D2 EE 11      [10]  648 	jp	NC, 00149$
   0F71                     649 00148$:
                            650 ;src/text/text.c:264: switch (character)
   0F71 79            [ 4]  651 	ld	a, c
   0F72 B7            [ 4]  652 	or	a, a
   0F73 20 5D         [12]  653 	jr	NZ,00101$
   0F75 DD 7E EE      [19]  654 	ld	a, -18 (ix)
   0F78 D6 2C         [ 7]  655 	sub	a, #0x2c
   0F7A 28 5C         [12]  656 	jr	Z,00104$
   0F7C DD 7E EE      [19]  657 	ld	a, -18 (ix)
   0F7F D6 2D         [ 7]  658 	sub	a, #0x2d
   0F81 28 55         [12]  659 	jr	Z,00104$
   0F83 DD 7E EE      [19]  660 	ld	a, -18 (ix)
   0F86 D6 2E         [ 7]  661 	sub	a, #0x2e
   0F88 28 4E         [12]  662 	jr	Z,00104$
   0F8A DD 7E EE      [19]  663 	ld	a, -18 (ix)
   0F8D D6 30         [ 7]  664 	sub	a, #0x30
   0F8F 28 51         [12]  665 	jr	Z,00114$
   0F91 DD 7E EE      [19]  666 	ld	a, -18 (ix)
   0F94 D6 31         [ 7]  667 	sub	a, #0x31
   0F96 28 4A         [12]  668 	jr	Z,00114$
   0F98 DD 7E EE      [19]  669 	ld	a, -18 (ix)
   0F9B D6 32         [ 7]  670 	sub	a, #0x32
   0F9D 28 43         [12]  671 	jr	Z,00114$
   0F9F DD 7E EE      [19]  672 	ld	a, -18 (ix)
   0FA2 D6 33         [ 7]  673 	sub	a, #0x33
   0FA4 28 3C         [12]  674 	jr	Z,00114$
   0FA6 DD 7E EE      [19]  675 	ld	a, -18 (ix)
   0FA9 D6 34         [ 7]  676 	sub	a, #0x34
   0FAB 28 35         [12]  677 	jr	Z,00114$
   0FAD DD 7E EE      [19]  678 	ld	a, -18 (ix)
   0FB0 D6 35         [ 7]  679 	sub	a, #0x35
   0FB2 28 2E         [12]  680 	jr	Z,00114$
   0FB4 DD 7E EE      [19]  681 	ld	a, -18 (ix)
   0FB7 D6 36         [ 7]  682 	sub	a, #0x36
   0FB9 28 27         [12]  683 	jr	Z,00114$
   0FBB DD 7E EE      [19]  684 	ld	a, -18 (ix)
   0FBE D6 37         [ 7]  685 	sub	a, #0x37
   0FC0 28 20         [12]  686 	jr	Z,00114$
   0FC2 DD 7E EE      [19]  687 	ld	a, -18 (ix)
   0FC5 D6 38         [ 7]  688 	sub	a, #0x38
   0FC7 28 19         [12]  689 	jr	Z,00114$
   0FC9 DD 7E EE      [19]  690 	ld	a, -18 (ix)
   0FCC D6 39         [ 7]  691 	sub	a, #0x39
   0FCE 28 12         [12]  692 	jr	Z,00114$
   0FD0 18 18         [12]  693 	jr	00115$
                            694 ;src/text/text.c:267: case 33:
   0FD2                     695 00101$:
                            696 ;src/text/text.c:268: character = 49;
   0FD2 DD 36 EE 31   [19]  697 	ld	-18 (ix), #0x31
                            698 ;src/text/text.c:269: break;
   0FD6 18 12         [12]  699 	jr	00115$
                            700 ;src/text/text.c:274: case 46:
   0FD8                     701 00104$:
                            702 ;src/text/text.c:275: character += 6;
   0FD8 DD 7E EE      [19]  703 	ld	a, -18 (ix)
   0FDB C6 06         [ 7]  704 	add	a, #0x06
   0FDD DD 77 EE      [19]  705 	ld	-18 (ix), a
                            706 ;src/text/text.c:276: break;
   0FE0 18 08         [12]  707 	jr	00115$
                            708 ;src/text/text.c:288: case 57:
   0FE2                     709 00114$:
                            710 ;src/text/text.c:289: character += 5;
   0FE2 DD 7E EE      [19]  711 	ld	a, -18 (ix)
   0FE5 C6 05         [ 7]  712 	add	a, #0x05
   0FE7 DD 77 EE      [19]  713 	ld	-18 (ix), a
                            714 ;src/text/text.c:291: }
   0FEA                     715 00115$:
                            716 ;src/text/text.c:294: character -= 49;
   0FEA DD 7E EE      [19]  717 	ld	a, -18 (ix)
   0FED C6 CF         [ 7]  718 	add	a, #0xcf
   0FEF 4F            [ 4]  719 	ld	c, a
                            720 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   0FF0 06 00         [ 7]  721 	ld	b,#0x00
   0FF2 69            [ 4]  722 	ld	l, c
   0FF3 60            [ 4]  723 	ld	h, b
   0FF4 29            [11]  724 	add	hl, hl
   0FF5 29            [11]  725 	add	hl, hl
   0FF6 29            [11]  726 	add	hl, hl
   0FF7 09            [11]  727 	add	hl, bc
   0FF8 29            [11]  728 	add	hl, hl
   0FF9 EB            [ 4]  729 	ex	de,hl
   0FFA 06 00         [ 7]  730 	ld	b, #0x00
   0FFC                     731 00159$:
                            732 ;src/text/text.c:299: pChar = (u8 *)s_fonts_0 + (character * 18) + i;
   0FFC 21 C7 01      [10]  733 	ld	hl, #_s_fonts_0
   0FFF 19            [11]  734 	add	hl, de
   1000 7D            [ 4]  735 	ld	a, l
   1001 80            [ 4]  736 	add	a, b
   1002 6F            [ 4]  737 	ld	l, a
   1003 7C            [ 4]  738 	ld	a, h
   1004 CE 00         [ 7]  739 	adc	a, #0x00
   1006 67            [ 4]  740 	ld	h, a
                            741 ;src/text/text.c:304: if (*pChar == 0x55)
   1007 DD 75 DB      [19]  742 	ld	-37 (ix), l
   100A DD 74 DC      [19]  743 	ld	-36 (ix), h
   100D 7E            [ 7]  744 	ld	a, (hl)
   100E DD 77 F3      [19]  745 	ld	-13 (ix), a
   1011 D6 55         [ 7]  746 	sub	a, #0x55
   1013 20 04         [12]  747 	jr	NZ,00314$
   1015 3E 01         [ 7]  748 	ld	a,#0x01
   1017 18 01         [12]  749 	jr	00315$
   1019                     750 00314$:
   1019 AF            [ 4]  751 	xor	a,a
   101A                     752 00315$:
   101A DD 77 DE      [19]  753 	ld	-34 (ix), a
                            754 ;src/text/text.c:306: else if (*pChar == 0xee)
   101D DD 7E F3      [19]  755 	ld	a, -13 (ix)
   1020 D6 EE         [ 7]  756 	sub	a, #0xee
   1022 20 04         [12]  757 	jr	NZ,00316$
   1024 3E 01         [ 7]  758 	ld	a,#0x01
   1026 18 01         [12]  759 	jr	00317$
   1028                     760 00316$:
   1028 AF            [ 4]  761 	xor	a,a
   1029                     762 00317$:
   1029 DD 77 DD      [19]  763 	ld	-35 (ix), a
                            764 ;src/text/text.c:308: else if (*pChar == 0xdd)
   102C DD 7E F3      [19]  765 	ld	a, -13 (ix)
   102F D6 DD         [ 7]  766 	sub	a, #0xdd
   1031 20 04         [12]  767 	jr	NZ,00318$
   1033 3E 01         [ 7]  768 	ld	a,#0x01
   1035 18 01         [12]  769 	jr	00319$
   1037                     770 00318$:
   1037 AF            [ 4]  771 	xor	a,a
   1038                     772 00319$:
   1038 DD 77 FD      [19]  773 	ld	-3 (ix), a
                            774 ;src/text/text.c:310: else if (*pChar == 0xff)
   103B DD 7E F3      [19]  775 	ld	a, -13 (ix)
   103E 3C            [ 4]  776 	inc	a
   103F 20 04         [12]  777 	jr	NZ,00320$
   1041 3E 01         [ 7]  778 	ld	a,#0x01
   1043 18 01         [12]  779 	jr	00321$
   1045                     780 00320$:
   1045 AF            [ 4]  781 	xor	a,a
   1046                     782 00321$:
   1046 DD 77 FC      [19]  783 	ld	-4 (ix), a
                            784 ;src/text/text.c:301: if (size == 1)
   1049 DD 7E ED      [19]  785 	ld	a, -19 (ix)
   104C B7            [ 4]  786 	or	a, a
   104D 28 72         [12]  787 	jr	Z,00141$
                            788 ;src/text/text.c:304: if (*pChar == 0x55)
   104F DD 7E DE      [19]  789 	ld	a, -34 (ix)
   1052 B7            [ 4]  790 	or	a, a
   1053 28 12         [12]  791 	jr	Z,00126$
                            792 ;src/text/text.c:305: colorchar[i] = color1;
   1055 DD 7E EF      [19]  793 	ld	a, -17 (ix)
   1058 80            [ 4]  794 	add	a, b
   1059 6F            [ 4]  795 	ld	l, a
   105A DD 7E F0      [19]  796 	ld	a, -16 (ix)
   105D CE 00         [ 7]  797 	adc	a, #0x00
   105F 67            [ 4]  798 	ld	h, a
   1060 DD 7E D9      [19]  799 	ld	a, -39 (ix)
   1063 77            [ 7]  800 	ld	(hl), a
   1064 C3 B0 11      [10]  801 	jp	00160$
   1067                     802 00126$:
                            803 ;src/text/text.c:306: else if (*pChar == 0xee)
   1067 DD 7E DD      [19]  804 	ld	a, -35 (ix)
   106A B7            [ 4]  805 	or	a, a
   106B 28 12         [12]  806 	jr	Z,00123$
                            807 ;src/text/text.c:307: colorchar[i] = color2;
   106D DD 7E DF      [19]  808 	ld	a, -33 (ix)
   1070 80            [ 4]  809 	add	a, b
   1071 6F            [ 4]  810 	ld	l, a
   1072 DD 7E E0      [19]  811 	ld	a, -32 (ix)
   1075 CE 00         [ 7]  812 	adc	a, #0x00
   1077 67            [ 4]  813 	ld	h, a
   1078 DD 7E D8      [19]  814 	ld	a, -40 (ix)
   107B 77            [ 7]  815 	ld	(hl), a
   107C C3 B0 11      [10]  816 	jp	00160$
   107F                     817 00123$:
                            818 ;src/text/text.c:308: else if (*pChar == 0xdd)
   107F DD 7E FD      [19]  819 	ld	a, -3 (ix)
   1082 B7            [ 4]  820 	or	a, a
   1083 28 12         [12]  821 	jr	Z,00120$
                            822 ;src/text/text.c:309: colorchar[i] = color3;
   1085 DD 7E E5      [19]  823 	ld	a, -27 (ix)
   1088 80            [ 4]  824 	add	a, b
   1089 6F            [ 4]  825 	ld	l, a
   108A DD 7E E6      [19]  826 	ld	a, -26 (ix)
   108D CE 00         [ 7]  827 	adc	a, #0x00
   108F 67            [ 4]  828 	ld	h, a
   1090 DD 7E D7      [19]  829 	ld	a, -41 (ix)
   1093 77            [ 7]  830 	ld	(hl), a
   1094 C3 B0 11      [10]  831 	jp	00160$
   1097                     832 00120$:
                            833 ;src/text/text.c:310: else if (*pChar == 0xff)
   1097 DD 7E FC      [19]  834 	ld	a, -4 (ix)
   109A B7            [ 4]  835 	or	a, a
   109B 28 12         [12]  836 	jr	Z,00117$
                            837 ;src/text/text.c:311: colorchar[i] = color4;
   109D DD 7E E3      [19]  838 	ld	a, -29 (ix)
   10A0 80            [ 4]  839 	add	a, b
   10A1 6F            [ 4]  840 	ld	l, a
   10A2 DD 7E E4      [19]  841 	ld	a, -28 (ix)
   10A5 CE 00         [ 7]  842 	adc	a, #0x00
   10A7 67            [ 4]  843 	ld	h, a
   10A8 DD 7E D6      [19]  844 	ld	a, -42 (ix)
   10AB 77            [ 7]  845 	ld	(hl), a
   10AC C3 B0 11      [10]  846 	jp	00160$
   10AF                     847 00117$:
                            848 ;src/text/text.c:313: colorchar[i] = *pChar;
   10AF DD 7E FE      [19]  849 	ld	a, -2 (ix)
   10B2 80            [ 4]  850 	add	a, b
   10B3 6F            [ 4]  851 	ld	l, a
   10B4 DD 7E FF      [19]  852 	ld	a, -1 (ix)
   10B7 CE 00         [ 7]  853 	adc	a, #0x00
   10B9 67            [ 4]  854 	ld	h, a
   10BA DD 7E F3      [19]  855 	ld	a, -13 (ix)
   10BD 77            [ 7]  856 	ld	(hl), a
   10BE C3 B0 11      [10]  857 	jp	00160$
   10C1                     858 00141$:
                            859 ;src/text/text.c:319: pos = (i * size) - (i % FONT_0_W);
   10C1 D5            [11]  860 	push	de
   10C2 C5            [11]  861 	push	bc
   10C3 DD 5E 09      [19]  862 	ld	e, 9 (ix)
   10C6 60            [ 4]  863 	ld	h, b
   10C7 2E 00         [ 7]  864 	ld	l, #0x00
   10C9 55            [ 4]  865 	ld	d, l
   10CA 06 08         [ 7]  866 	ld	b, #0x08
   10CC                     867 00322$:
   10CC 29            [11]  868 	add	hl, hl
   10CD 30 01         [12]  869 	jr	NC,00323$
   10CF 19            [11]  870 	add	hl, de
   10D0                     871 00323$:
   10D0 10 FA         [13]  872 	djnz	00322$
   10D2 C1            [10]  873 	pop	bc
   10D3 D1            [10]  874 	pop	de
   10D4 78            [ 4]  875 	ld	a, b
   10D5 E6 01         [ 7]  876 	and	a, #0x01
   10D7 67            [ 4]  877 	ld	h, a
   10D8 7D            [ 4]  878 	ld	a, l
   10D9 94            [ 4]  879 	sub	a, h
                            880 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   10DA 6F            [ 4]  881 	ld	l,a
   10DB C6 02         [ 7]  882 	add	a, #0x02
   10DD DD 77 FB      [19]  883 	ld	-5 (ix), a
                            884 ;src/text/text.c:321: if (*pChar == 0x55)
   10E0 DD 7E DE      [19]  885 	ld	a, -34 (ix)
   10E3 B7            [ 4]  886 	or	a, a
   10E4 28 23         [12]  887 	jr	Z,00138$
                            888 ;src/text/text.c:323: colorchar[pos] = color1;
   10E6 DD 7E E1      [19]  889 	ld	a, -31 (ix)
   10E9 85            [ 4]  890 	add	a, l
   10EA 6F            [ 4]  891 	ld	l, a
   10EB DD 7E E2      [19]  892 	ld	a, -30 (ix)
   10EE CE 00         [ 7]  893 	adc	a, #0x00
   10F0 67            [ 4]  894 	ld	h, a
   10F1 DD 7E D9      [19]  895 	ld	a, -39 (ix)
   10F4 77            [ 7]  896 	ld	(hl), a
                            897 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   10F5 DD 7E E1      [19]  898 	ld	a, -31 (ix)
   10F8 DD 86 FB      [19]  899 	add	a, -5 (ix)
   10FB 6F            [ 4]  900 	ld	l, a
   10FC DD 7E E2      [19]  901 	ld	a, -30 (ix)
   10FF CE 00         [ 7]  902 	adc	a, #0x00
   1101 67            [ 4]  903 	ld	h, a
   1102 DD 7E D9      [19]  904 	ld	a, -39 (ix)
   1105 77            [ 7]  905 	ld	(hl), a
   1106 C3 B0 11      [10]  906 	jp	00160$
   1109                     907 00138$:
                            908 ;src/text/text.c:326: else if (*pChar == 0xee)
   1109 DD 7E DD      [19]  909 	ld	a, -35 (ix)
   110C B7            [ 4]  910 	or	a, a
   110D 28 23         [12]  911 	jr	Z,00135$
                            912 ;src/text/text.c:328: colorchar[pos] = color2;
   110F DD 7E E9      [19]  913 	ld	a, -23 (ix)
   1112 85            [ 4]  914 	add	a, l
   1113 6F            [ 4]  915 	ld	l, a
   1114 DD 7E EA      [19]  916 	ld	a, -22 (ix)
   1117 CE 00         [ 7]  917 	adc	a, #0x00
   1119 67            [ 4]  918 	ld	h, a
   111A DD 7E D8      [19]  919 	ld	a, -40 (ix)
   111D 77            [ 7]  920 	ld	(hl), a
                            921 ;src/text/text.c:329: colorchar[pos + FONT_0_W] = color2;
   111E DD 7E E9      [19]  922 	ld	a, -23 (ix)
   1121 DD 86 FB      [19]  923 	add	a, -5 (ix)
   1124 6F            [ 4]  924 	ld	l, a
   1125 DD 7E EA      [19]  925 	ld	a, -22 (ix)
   1128 CE 00         [ 7]  926 	adc	a, #0x00
   112A 67            [ 4]  927 	ld	h, a
   112B DD 7E D8      [19]  928 	ld	a, -40 (ix)
   112E 77            [ 7]  929 	ld	(hl), a
   112F C3 B0 11      [10]  930 	jp	00160$
   1132                     931 00135$:
                            932 ;src/text/text.c:331: else if (*pChar == 0xdd)
   1132 DD 7E FD      [19]  933 	ld	a, -3 (ix)
   1135 B7            [ 4]  934 	or	a, a
   1136 28 22         [12]  935 	jr	Z,00132$
                            936 ;src/text/text.c:333: colorchar[pos] = color3;
   1138 DD 7E F6      [19]  937 	ld	a, -10 (ix)
   113B 85            [ 4]  938 	add	a, l
   113C 6F            [ 4]  939 	ld	l, a
   113D DD 7E F7      [19]  940 	ld	a, -9 (ix)
   1140 CE 00         [ 7]  941 	adc	a, #0x00
   1142 67            [ 4]  942 	ld	h, a
   1143 DD 7E D7      [19]  943 	ld	a, -41 (ix)
   1146 77            [ 7]  944 	ld	(hl), a
                            945 ;src/text/text.c:334: colorchar[pos + FONT_0_W] = color3;
   1147 DD 7E F6      [19]  946 	ld	a, -10 (ix)
   114A DD 86 FB      [19]  947 	add	a, -5 (ix)
   114D 6F            [ 4]  948 	ld	l, a
   114E DD 7E F7      [19]  949 	ld	a, -9 (ix)
   1151 CE 00         [ 7]  950 	adc	a, #0x00
   1153 67            [ 4]  951 	ld	h, a
   1154 DD 7E D7      [19]  952 	ld	a, -41 (ix)
   1157 77            [ 7]  953 	ld	(hl), a
   1158 18 56         [12]  954 	jr	00160$
   115A                     955 00132$:
                            956 ;src/text/text.c:336: else if (*pChar == 0xff)
   115A DD 7E FC      [19]  957 	ld	a, -4 (ix)
   115D B7            [ 4]  958 	or	a, a
   115E 28 22         [12]  959 	jr	Z,00129$
                            960 ;src/text/text.c:338: colorchar[pos] = color4;
   1160 DD 7E E7      [19]  961 	ld	a, -25 (ix)
   1163 85            [ 4]  962 	add	a, l
   1164 6F            [ 4]  963 	ld	l, a
   1165 DD 7E E8      [19]  964 	ld	a, -24 (ix)
   1168 CE 00         [ 7]  965 	adc	a, #0x00
   116A 67            [ 4]  966 	ld	h, a
   116B DD 7E D6      [19]  967 	ld	a, -42 (ix)
   116E 77            [ 7]  968 	ld	(hl), a
                            969 ;src/text/text.c:339: colorchar[pos + FONT_0_W] = color4;
   116F DD 7E E7      [19]  970 	ld	a, -25 (ix)
   1172 DD 86 FB      [19]  971 	add	a, -5 (ix)
   1175 6F            [ 4]  972 	ld	l, a
   1176 DD 7E E8      [19]  973 	ld	a, -24 (ix)
   1179 CE 00         [ 7]  974 	adc	a, #0x00
   117B 67            [ 4]  975 	ld	h, a
   117C DD 7E D6      [19]  976 	ld	a, -42 (ix)
   117F 77            [ 7]  977 	ld	(hl), a
   1180 18 2E         [12]  978 	jr	00160$
   1182                     979 00129$:
                            980 ;src/text/text.c:343: colorchar[pos] = *pChar;
   1182 DD 7E F1      [19]  981 	ld	a, -15 (ix)
   1185 85            [ 4]  982 	add	a, l
   1186 6F            [ 4]  983 	ld	l, a
   1187 DD 7E F2      [19]  984 	ld	a, -14 (ix)
   118A CE 00         [ 7]  985 	adc	a, #0x00
   118C 67            [ 4]  986 	ld	h, a
   118D DD 7E F3      [19]  987 	ld	a, -13 (ix)
   1190 77            [ 7]  988 	ld	(hl), a
                            989 ;src/text/text.c:344: colorchar[pos + FONT_0_W] = *pChar;
   1191 DD 7E F1      [19]  990 	ld	a, -15 (ix)
   1194 DD 86 FB      [19]  991 	add	a, -5 (ix)
   1197 DD 77 F9      [19]  992 	ld	-7 (ix), a
   119A DD 7E F2      [19]  993 	ld	a, -14 (ix)
   119D CE 00         [ 7]  994 	adc	a, #0x00
   119F DD 77 FA      [19]  995 	ld	-6 (ix), a
   11A2 DD 6E DB      [19]  996 	ld	l,-37 (ix)
   11A5 DD 66 DC      [19]  997 	ld	h,-36 (ix)
   11A8 7E            [ 7]  998 	ld	a, (hl)
   11A9 DD 6E F9      [19]  999 	ld	l,-7 (ix)
   11AC DD 66 FA      [19] 1000 	ld	h,-6 (ix)
   11AF 77            [ 7] 1001 	ld	(hl), a
   11B0                    1002 00160$:
                           1003 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   11B0 04            [ 4] 1004 	inc	b
   11B1 78            [ 4] 1005 	ld	a, b
   11B2 D6 12         [ 7] 1006 	sub	a, #0x12
   11B4 DA FC 0F      [10] 1007 	jp	C, 00159$
                           1008 ;src/text/text.c:349: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   11B7 C5            [11] 1009 	push	bc
   11B8 DD 66 07      [19] 1010 	ld	h, 7 (ix)
   11BB DD 6E 06      [19] 1011 	ld	l, 6 (ix)
   11BE E5            [11] 1012 	push	hl
   11BF 21 00 C0      [10] 1013 	ld	hl, #0xc000
   11C2 E5            [11] 1014 	push	hl
   11C3 CD 16 15      [17] 1015 	call	_cpct_getScreenPtr
   11C6 C1            [10] 1016 	pop	bc
                           1017 ;src/text/text.c:353: cpct_drawSprite(colorchar, pvideo, FONT_0_W, FONT_H * size);
   11C7 E5            [11] 1018 	push	hl
   11C8 FD E1         [14] 1019 	pop	iy
   11CA DD 5E F4      [19] 1020 	ld	e,-12 (ix)
   11CD DD 56 F5      [19] 1021 	ld	d,-11 (ix)
   11D0 C5            [11] 1022 	push	bc
   11D1 DD 46 F8      [19] 1023 	ld	b, -8 (ix)
   11D4 0E 02         [ 7] 1024 	ld	c,#0x02
   11D6 C5            [11] 1025 	push	bc
   11D7 FD E5         [15] 1026 	push	iy
   11D9 D5            [11] 1027 	push	de
   11DA CD 3F 12      [17] 1028 	call	_cpct_drawSprite
   11DD C1            [10] 1029 	pop	bc
                           1030 ;src/text/text.c:356: if (character == 48 || character == 60 || character == 57)
   11DE 79            [ 4] 1031 	ld	a,c
   11DF FE 30         [ 7] 1032 	cp	a,#0x30
   11E1 28 08         [12] 1033 	jr	Z,00144$
   11E3 FE 3C         [ 7] 1034 	cp	a,#0x3c
   11E5 28 04         [12] 1035 	jr	Z,00144$
   11E7 D6 39         [ 7] 1036 	sub	a, #0x39
   11E9 20 03         [12] 1037 	jr	NZ,00149$
   11EB                    1038 00144$:
                           1039 ;src/text/text.c:357: xPos--;
   11EB DD 35 06      [23] 1040 	dec	6 (ix)
   11EE                    1041 00149$:
                           1042 ;src/text/text.c:359: character = text[++x];
   11EE DD 34 DA      [23] 1043 	inc	-38 (ix)
   11F1 DD 7E EB      [19] 1044 	ld	a, -21 (ix)
   11F4 DD 86 DA      [19] 1045 	add	a, -38 (ix)
   11F7 6F            [ 4] 1046 	ld	l, a
   11F8 DD 7E EC      [19] 1047 	ld	a, -20 (ix)
   11FB CE 00         [ 7] 1048 	adc	a, #0x00
   11FD 67            [ 4] 1049 	ld	h, a
   11FE 7E            [ 7] 1050 	ld	a, (hl)
   11FF DD 77 EE      [19] 1051 	ld	-18 (ix), a
                           1052 ;src/text/text.c:360: xPos += FONT_0_W;
   1202 DD 34 06      [23] 1053 	inc	6 (ix)
   1205 DD 34 06      [23] 1054 	inc	6 (ix)
   1208 C3 2E 0F      [10] 1055 	jp	00156$
   120B                    1056 00161$:
   120B DD F9         [10] 1057 	ld	sp, ix
   120D DD E1         [14] 1058 	pop	ix
   120F C9            [10] 1059 	ret
                           1060 	.area _CODE
                           1061 	.area _INITIALIZER
                           1062 	.area _CABS (ABS)
