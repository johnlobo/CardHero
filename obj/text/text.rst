                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
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
   4AD2                      54 _strLength::
                             55 ;src/text/text.c:58: while (str[result] != '\0')
   4AD2 0E 00         [ 7]   56 	ld	c, #0x00
   4AD4                      57 00101$:
   4AD4 21 02 00      [10]   58 	ld	hl, #2
   4AD7 39            [11]   59 	add	hl, sp
   4AD8 7E            [ 7]   60 	ld	a, (hl)
   4AD9 23            [ 6]   61 	inc	hl
   4ADA 66            [ 7]   62 	ld	h, (hl)
   4ADB 6F            [ 4]   63 	ld	l, a
   4ADC 06 00         [ 7]   64 	ld	b, #0x00
   4ADE 09            [11]   65 	add	hl, bc
   4ADF 7E            [ 7]   66 	ld	a, (hl)
   4AE0 B7            [ 4]   67 	or	a, a
   4AE1 28 03         [12]   68 	jr	Z,00103$
                             69 ;src/text/text.c:60: result++;
   4AE3 0C            [ 4]   70 	inc	c
   4AE4 18 EE         [12]   71 	jr	00101$
   4AE6                      72 00103$:
                             73 ;src/text/text.c:62: return result;
   4AE6 69            [ 4]   74 	ld	l, c
   4AE7 C9            [10]   75 	ret
   4AE8                      76 _swapColors:
   4AE8 55                   77 	.db #0x55	; 85	'U'
   4AE9 EE                   78 	.db #0xee	; 238
   4AEA DD                   79 	.db #0xdd	; 221
   4AEB FF                   80 	.db #0xff	; 255
   4AEC 14                   81 	.db #0x14	; 20
   4AED 6C                   82 	.db #0x6c	; 108	'l'
   4AEE 9C                   83 	.db #0x9c	; 156
   4AEF 3C                   84 	.db #0x3c	; 60
   4AF0 50                   85 	.db #0x50	; 80	'P'
   4AF1 E4                   86 	.db #0xe4	; 228
   4AF2 D8                   87 	.db #0xd8	; 216
   4AF3 F0                   88 	.db #0xf0	; 240
   4AF4 11                   89 	.db #0x11	; 17
   4AF5 66                   90 	.db #0x66	; 102	'f'
   4AF6 99                   91 	.db #0x99	; 153
   4AF7 33                   92 	.db #0x33	; 51	'3'
   4AF8 10                   93 	.db #0x10	; 16
   4AF9 35                   94 	.db #0x35	; 53	'5'
   4AFA 3A                   95 	.db #0x3a	; 58
   4AFB 30                   96 	.db #0x30	; 48	'0'
   4AFC 45                   97 	.db #0x45	; 69	'E'
   4AFD CE                   98 	.db #0xce	; 206
   4AFE CD                   99 	.db #0xcd	; 205
   4AFF CF                  100 	.db #0xcf	; 207
                            101 ;src/text/text.c:75: void strCopy(u8 source[], u8 dest[])
                            102 ;	---------------------------------
                            103 ; Function strCopy
                            104 ; ---------------------------------
   4B00                     105 _strCopy::
   4B00 DD E5         [15]  106 	push	ix
   4B02 DD 21 00 00   [14]  107 	ld	ix,#0
   4B06 DD 39         [15]  108 	add	ix,sp
                            109 ;src/text/text.c:78: while ((dest[i] = source[i]) != '\0')
   4B08 0E 00         [ 7]  110 	ld	c, #0x00
   4B0A                     111 00101$:
   4B0A DD 7E 06      [19]  112 	ld	a, 6 (ix)
   4B0D 81            [ 4]  113 	add	a, c
   4B0E 5F            [ 4]  114 	ld	e, a
   4B0F DD 7E 07      [19]  115 	ld	a, 7 (ix)
   4B12 CE 00         [ 7]  116 	adc	a, #0x00
   4B14 57            [ 4]  117 	ld	d, a
   4B15 DD 6E 04      [19]  118 	ld	l,4 (ix)
   4B18 DD 66 05      [19]  119 	ld	h,5 (ix)
   4B1B 06 00         [ 7]  120 	ld	b, #0x00
   4B1D 09            [11]  121 	add	hl, bc
   4B1E 7E            [ 7]  122 	ld	a, (hl)
   4B1F 12            [ 7]  123 	ld	(de), a
   4B20 B7            [ 4]  124 	or	a, a
   4B21 28 03         [12]  125 	jr	Z,00104$
                            126 ;src/text/text.c:80: i++;
   4B23 0C            [ 4]  127 	inc	c
   4B24 18 E4         [12]  128 	jr	00101$
   4B26                     129 00104$:
   4B26 DD E1         [14]  130 	pop	ix
   4B28 C9            [10]  131 	ret
                            132 ;src/text/text.c:94: u8 strCmp(u8 str1[], u8 str2[])
                            133 ;	---------------------------------
                            134 ; Function strCmp
                            135 ; ---------------------------------
   4B29                     136 _strCmp::
                            137 ;src/text/text.c:99: while ((str1[i] == str2[i]) && ((str1[i] != '\0') && (str2[i] != '\0')))
   4B29 0E 00         [ 7]  138 	ld	c, #0x00
   4B2B                     139 00103$:
   4B2B 21 02 00      [10]  140 	ld	hl, #2
   4B2E 39            [11]  141 	add	hl, sp
   4B2F 7E            [ 7]  142 	ld	a, (hl)
   4B30 23            [ 6]  143 	inc	hl
   4B31 66            [ 7]  144 	ld	h, (hl)
   4B32 6F            [ 4]  145 	ld	l, a
   4B33 06 00         [ 7]  146 	ld	b, #0x00
   4B35 09            [11]  147 	add	hl, bc
   4B36 46            [ 7]  148 	ld	b, (hl)
   4B37 FD 21 04 00   [14]  149 	ld	iy, #4
   4B3B FD 39         [15]  150 	add	iy, sp
   4B3D FD 7E 00      [19]  151 	ld	a, 0 (iy)
   4B40 81            [ 4]  152 	add	a, c
   4B41 5F            [ 4]  153 	ld	e, a
   4B42 FD 7E 01      [19]  154 	ld	a, 1 (iy)
   4B45 CE 00         [ 7]  155 	adc	a, #0x00
   4B47 57            [ 4]  156 	ld	d, a
   4B48 1A            [ 7]  157 	ld	a, (de)
   4B49 57            [ 4]  158 	ld	d, a
   4B4A 78            [ 4]  159 	ld	a, b
   4B4B 92            [ 4]  160 	sub	a, d
   4B4C 20 04         [12]  161 	jr	NZ,00132$
   4B4E 3E 01         [ 7]  162 	ld	a,#0x01
   4B50 18 01         [12]  163 	jr	00133$
   4B52                     164 00132$:
   4B52 AF            [ 4]  165 	xor	a,a
   4B53                     166 00133$:
   4B53 5F            [ 4]  167 	ld	e,a
   4B54 B7            [ 4]  168 	or	a, a
   4B55 28 0B         [12]  169 	jr	Z,00105$
   4B57 78            [ 4]  170 	ld	a, b
   4B58 B7            [ 4]  171 	or	a, a
   4B59 28 07         [12]  172 	jr	Z,00105$
   4B5B 7A            [ 4]  173 	ld	a, d
   4B5C B7            [ 4]  174 	or	a, a
   4B5D 28 03         [12]  175 	jr	Z,00105$
                            176 ;src/text/text.c:101: i++;
   4B5F 0C            [ 4]  177 	inc	c
   4B60 18 C9         [12]  178 	jr	00103$
   4B62                     179 00105$:
                            180 ;src/text/text.c:103: if (str1[i] == str2[i])
   4B62 7B            [ 4]  181 	ld	a, e
   4B63 B7            [ 4]  182 	or	a, a
   4B64 28 03         [12]  183 	jr	Z,00107$
                            184 ;src/text/text.c:105: return YES;
   4B66 2E 01         [ 7]  185 	ld	l, #0x01
   4B68 C9            [10]  186 	ret
   4B69                     187 00107$:
                            188 ;src/text/text.c:109: return NO;
   4B69 2E 00         [ 7]  189 	ld	l, #0x00
   4B6B C9            [10]  190 	ret
                            191 ;src/text/text.c:125: void drawTextM1(u8 *text, u8 xPos, u8 yPos, u8 size)
                            192 ;	---------------------------------
                            193 ; Function drawTextM1
                            194 ; ---------------------------------
   4B6C                     195 _drawTextM1::
   4B6C DD E5         [15]  196 	push	ix
   4B6E DD 21 00 00   [14]  197 	ld	ix,#0
   4B72 DD 39         [15]  198 	add	ix,sp
   4B74 21 CC FF      [10]  199 	ld	hl, #-52
   4B77 39            [11]  200 	add	hl, sp
   4B78 F9            [ 6]  201 	ld	sp, hl
                            202 ;src/text/text.c:140: character = text[x];
   4B79 DD 7E 04      [19]  203 	ld	a, 4 (ix)
   4B7C DD 77 FE      [19]  204 	ld	-2 (ix), a
   4B7F DD 7E 05      [19]  205 	ld	a, 5 (ix)
   4B82 DD 77 FF      [19]  206 	ld	-1 (ix), a
   4B85 DD 6E FE      [19]  207 	ld	l,-2 (ix)
   4B88 DD 66 FF      [19]  208 	ld	h,-1 (ix)
   4B8B 7E            [ 7]  209 	ld	a, (hl)
   4B8C DD 77 FD      [19]  210 	ld	-3 (ix), a
                            211 ;src/text/text.c:142: while (character != '\0')
   4B8F 21 01 00      [10]  212 	ld	hl, #0x0001
   4B92 39            [11]  213 	add	hl, sp
   4B93 DD 75 FB      [19]  214 	ld	-5 (ix), l
   4B96 DD 74 FC      [19]  215 	ld	-4 (ix), h
   4B99 DD 7E FB      [19]  216 	ld	a, -5 (ix)
   4B9C DD 77 F9      [19]  217 	ld	-7 (ix), a
   4B9F DD 7E FC      [19]  218 	ld	a, -4 (ix)
   4BA2 DD 77 FA      [19]  219 	ld	-6 (ix), a
   4BA5 DD 7E 08      [19]  220 	ld	a, 8 (ix)
   4BA8 3D            [ 4]  221 	dec	a
   4BA9 20 04         [12]  222 	jr	NZ,00246$
   4BAB 3E 01         [ 7]  223 	ld	a,#0x01
   4BAD 18 01         [12]  224 	jr	00247$
   4BAF                     225 00246$:
   4BAF AF            [ 4]  226 	xor	a,a
   4BB0                     227 00247$:
   4BB0 DD 77 F8      [19]  228 	ld	-8 (ix), a
   4BB3 DD 7E 08      [19]  229 	ld	a, 8 (ix)
   4BB6 4F            [ 4]  230 	ld	c, a
   4BB7 87            [ 4]  231 	add	a, a
   4BB8 87            [ 4]  232 	add	a, a
   4BB9 87            [ 4]  233 	add	a, a
   4BBA 81            [ 4]  234 	add	a, c
   4BBB DD 77 F7      [19]  235 	ld	-9 (ix), a
   4BBE DD 7E FB      [19]  236 	ld	a, -5 (ix)
   4BC1 DD 77 F5      [19]  237 	ld	-11 (ix), a
   4BC4 DD 7E FC      [19]  238 	ld	a, -4 (ix)
   4BC7 DD 77 F6      [19]  239 	ld	-10 (ix), a
   4BCA DD 36 F1 00   [19]  240 	ld	-15 (ix), #0x00
   4BCE                     241 00133$:
   4BCE DD 7E FD      [19]  242 	ld	a, -3 (ix)
   4BD1 B7            [ 4]  243 	or	a, a
   4BD2 CA 79 4D      [10]  244 	jp	Z, 00138$
                            245 ;src/text/text.c:145: if ((character == 33) ||                        // !
   4BD5 DD 7E FD      [19]  246 	ld	a, -3 (ix)
   4BD8 D6 21         [ 7]  247 	sub	a, #0x21
   4BDA 20 04         [12]  248 	jr	NZ,00248$
   4BDC 3E 01         [ 7]  249 	ld	a,#0x01
   4BDE 18 01         [12]  250 	jr	00249$
   4BE0                     251 00248$:
   4BE0 AF            [ 4]  252 	xor	a,a
   4BE1                     253 00249$:
   4BE1 4F            [ 4]  254 	ld	c,a
   4BE2 B7            [ 4]  255 	or	a, a
   4BE3 20 2C         [12]  256 	jr	NZ,00125$
                            257 ;src/text/text.c:146: ((character > 43) && (character < 47)) ||   // ,-.
   4BE5 3E 2B         [ 7]  258 	ld	a, #0x2b
   4BE7 DD 96 FD      [19]  259 	sub	a, -3 (ix)
   4BEA 30 07         [12]  260 	jr	NC,00130$
   4BEC DD 7E FD      [19]  261 	ld	a, -3 (ix)
   4BEF D6 2F         [ 7]  262 	sub	a, #0x2f
   4BF1 38 1E         [12]  263 	jr	C,00125$
   4BF3                     264 00130$:
                            265 ;src/text/text.c:147: ((character > 47) && (character < 59)) ||   // 0123456789:
   4BF3 3E 2F         [ 7]  266 	ld	a, #0x2f
   4BF5 DD 96 FD      [19]  267 	sub	a, -3 (ix)
   4BF8 30 07         [12]  268 	jr	NC,00132$
   4BFA DD 7E FD      [19]  269 	ld	a, -3 (ix)
   4BFD D6 3B         [ 7]  270 	sub	a, #0x3b
   4BFF 38 10         [12]  271 	jr	C,00125$
   4C01                     272 00132$:
                            273 ;src/text/text.c:148: ((character > 62) && (character < 91)))     // ABCDEFGHIJKLMNOPQRSTUVWXYZ
   4C01 3E 3E         [ 7]  274 	ld	a, #0x3e
   4C03 DD 96 FD      [19]  275 	sub	a, -3 (ix)
   4C06 D2 5F 4D      [10]  276 	jp	NC, 00126$
   4C09 DD 7E FD      [19]  277 	ld	a, -3 (ix)
   4C0C D6 5B         [ 7]  278 	sub	a, #0x5b
   4C0E D2 5F 4D      [10]  279 	jp	NC, 00126$
   4C11                     280 00125$:
                            281 ;src/text/text.c:152: switch (character)
   4C11 79            [ 4]  282 	ld	a, c
   4C12 B7            [ 4]  283 	or	a, a
   4C13 20 64         [12]  284 	jr	NZ,00101$
   4C15 DD 7E FD      [19]  285 	ld	a, -3 (ix)
   4C18 D6 2C         [ 7]  286 	sub	a, #0x2c
   4C1A 28 63         [12]  287 	jr	Z,00104$
   4C1C DD 7E FD      [19]  288 	ld	a, -3 (ix)
   4C1F D6 2D         [ 7]  289 	sub	a, #0x2d
   4C21 28 5C         [12]  290 	jr	Z,00104$
   4C23 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   4C26 D6 2E         [ 7]  292 	sub	a, #0x2e
   4C28 28 55         [12]  293 	jr	Z,00104$
   4C2A DD 7E FD      [19]  294 	ld	a, -3 (ix)
   4C2D D6 30         [ 7]  295 	sub	a, #0x30
   4C2F 28 58         [12]  296 	jr	Z,00115$
   4C31 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   4C34 D6 31         [ 7]  298 	sub	a, #0x31
   4C36 28 51         [12]  299 	jr	Z,00115$
   4C38 DD 7E FD      [19]  300 	ld	a, -3 (ix)
   4C3B D6 32         [ 7]  301 	sub	a, #0x32
   4C3D 28 4A         [12]  302 	jr	Z,00115$
   4C3F DD 7E FD      [19]  303 	ld	a, -3 (ix)
   4C42 D6 33         [ 7]  304 	sub	a, #0x33
   4C44 28 43         [12]  305 	jr	Z,00115$
   4C46 DD 7E FD      [19]  306 	ld	a, -3 (ix)
   4C49 D6 34         [ 7]  307 	sub	a, #0x34
   4C4B 28 3C         [12]  308 	jr	Z,00115$
   4C4D DD 7E FD      [19]  309 	ld	a, -3 (ix)
   4C50 D6 35         [ 7]  310 	sub	a, #0x35
   4C52 28 35         [12]  311 	jr	Z,00115$
   4C54 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   4C57 D6 36         [ 7]  313 	sub	a, #0x36
   4C59 28 2E         [12]  314 	jr	Z,00115$
   4C5B DD 7E FD      [19]  315 	ld	a, -3 (ix)
   4C5E D6 37         [ 7]  316 	sub	a, #0x37
   4C60 28 27         [12]  317 	jr	Z,00115$
   4C62 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   4C65 D6 38         [ 7]  319 	sub	a, #0x38
   4C67 28 20         [12]  320 	jr	Z,00115$
   4C69 DD 7E FD      [19]  321 	ld	a, -3 (ix)
   4C6C D6 39         [ 7]  322 	sub	a, #0x39
   4C6E 28 19         [12]  323 	jr	Z,00115$
   4C70 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   4C73 D6 3A         [ 7]  325 	sub	a, #0x3a
   4C75 28 12         [12]  326 	jr	Z,00115$
   4C77 18 1C         [12]  327 	jr	00116$
                            328 ;src/text/text.c:155: case 33:
   4C79                     329 00101$:
                            330 ;src/text/text.c:156: character = 48;
   4C79 DD 36 FD 30   [19]  331 	ld	-3 (ix), #0x30
                            332 ;src/text/text.c:157: break;
   4C7D 18 16         [12]  333 	jr	00116$
                            334 ;src/text/text.c:162: case 46:
   4C7F                     335 00104$:
                            336 ;src/text/text.c:163: character += 5;
   4C7F DD 7E FD      [19]  337 	ld	a, -3 (ix)
   4C82 C6 05         [ 7]  338 	add	a, #0x05
   4C84 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:164: break;
   4C87 18 0C         [12]  341 	jr	00116$
                            342 ;src/text/text.c:177: case 58:
   4C89                     343 00115$:
                            344 ;src/text/text.c:178: character += 4;
   4C89 DD 34 FD      [23]  345 	inc	-3 (ix)
   4C8C DD 34 FD      [23]  346 	inc	-3 (ix)
   4C8F DD 34 FD      [23]  347 	inc	-3 (ix)
   4C92 DD 34 FD      [23]  348 	inc	-3 (ix)
                            349 ;src/text/text.c:180: }
   4C95                     350 00116$:
                            351 ;src/text/text.c:183: character -= 48;
   4C95 DD 7E FD      [19]  352 	ld	a, -3 (ix)
   4C98 C6 D0         [ 7]  353 	add	a, #0xd0
   4C9A 4F            [ 4]  354 	ld	c, a
                            355 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   4C9B 06 00         [ 7]  356 	ld	b,#0x00
   4C9D 69            [ 4]  357 	ld	l, c
   4C9E 60            [ 4]  358 	ld	h, b
   4C9F 29            [11]  359 	add	hl, hl
   4CA0 29            [11]  360 	add	hl, hl
   4CA1 29            [11]  361 	add	hl, hl
   4CA2 09            [11]  362 	add	hl, bc
   4CA3 45            [ 4]  363 	ld	b, l
   4CA4 54            [ 4]  364 	ld	d, h
   4CA5 1E 00         [ 7]  365 	ld	e, #0x00
   4CA7                     366 00136$:
                            367 ;src/text/text.c:188: pChar = (u8 *)s_fonts_1 + (character * 9) + i;
   4CA7 3E 00         [ 7]  368 	ld	a, #<(_s_fonts_1)
   4CA9 80            [ 4]  369 	add	a, b
   4CAA 6F            [ 4]  370 	ld	l, a
   4CAB 3E 40         [ 7]  371 	ld	a, #>(_s_fonts_1)
   4CAD 8A            [ 4]  372 	adc	a, d
   4CAE 67            [ 4]  373 	ld	h, a
   4CAF 7D            [ 4]  374 	ld	a, l
   4CB0 83            [ 4]  375 	add	a, e
   4CB1 6F            [ 4]  376 	ld	l, a
   4CB2 7C            [ 4]  377 	ld	a, h
   4CB3 CE 00         [ 7]  378 	adc	a, #0x00
   4CB5 67            [ 4]  379 	ld	h, a
                            380 ;src/text/text.c:193: colorchar[i] = *pChar;
   4CB6 DD 75 F2      [19]  381 	ld	-14 (ix), l
   4CB9 DD 74 F3      [19]  382 	ld	-13 (ix), h
   4CBC 7E            [ 7]  383 	ld	a, (hl)
   4CBD DD 77 F4      [19]  384 	ld	-12 (ix), a
                            385 ;src/text/text.c:190: if (size == 1)
   4CC0 DD 7E F8      [19]  386 	ld	a, -8 (ix)
   4CC3 B7            [ 4]  387 	or	a, a
   4CC4 28 11         [12]  388 	jr	Z,00118$
                            389 ;src/text/text.c:193: colorchar[i] = *pChar;
   4CC6 DD 7E F9      [19]  390 	ld	a, -7 (ix)
   4CC9 83            [ 4]  391 	add	a, e
   4CCA 6F            [ 4]  392 	ld	l, a
   4CCB DD 7E FA      [19]  393 	ld	a, -6 (ix)
   4CCE CE 00         [ 7]  394 	adc	a, #0x00
   4CD0 67            [ 4]  395 	ld	h, a
   4CD1 DD 7E F4      [19]  396 	ld	a, -12 (ix)
   4CD4 77            [ 7]  397 	ld	(hl), a
   4CD5 18 4A         [12]  398 	jr	00137$
   4CD7                     399 00118$:
                            400 ;src/text/text.c:198: pos = (i * size) - (i % FONT_1_W);
   4CD7 D5            [11]  401 	push	de
   4CD8 C5            [11]  402 	push	bc
   4CD9 DD 66 08      [19]  403 	ld	h, 8 (ix)
   4CDC 2E 00         [ 7]  404 	ld	l, #0x00
   4CDE 55            [ 4]  405 	ld	d, l
   4CDF 06 08         [ 7]  406 	ld	b, #0x08
   4CE1                     407 00264$:
   4CE1 29            [11]  408 	add	hl, hl
   4CE2 30 01         [12]  409 	jr	NC,00265$
   4CE4 19            [11]  410 	add	hl, de
   4CE5                     411 00265$:
   4CE5 10 FA         [13]  412 	djnz	00264$
   4CE7 C1            [10]  413 	pop	bc
   4CE8 D1            [10]  414 	pop	de
   4CE9 26 00         [ 7]  415 	ld	h, #0x00
   4CEB 7D            [ 4]  416 	ld	a, l
   4CEC 94            [ 4]  417 	sub	a, h
   4CED DD 77 CC      [19]  418 	ld	-52 (ix), a
                            419 ;src/text/text.c:200: colorchar[pos] = *pChar;
   4CF0 DD 7E FB      [19]  420 	ld	a, -5 (ix)
   4CF3 DD 86 CC      [19]  421 	add	a, -52 (ix)
   4CF6 6F            [ 4]  422 	ld	l, a
   4CF7 DD 7E FC      [19]  423 	ld	a, -4 (ix)
   4CFA CE 00         [ 7]  424 	adc	a, #0x00
   4CFC 67            [ 4]  425 	ld	h, a
   4CFD DD 7E F4      [19]  426 	ld	a, -12 (ix)
   4D00 77            [ 7]  427 	ld	(hl), a
                            428 ;src/text/text.c:201: colorchar[pos + FONT_1_W] = *pChar;
   4D01 DD 6E CC      [19]  429 	ld	l, -52 (ix)
   4D04 2C            [ 4]  430 	inc	l
   4D05 E5            [11]  431 	push	hl
   4D06 DD 6E FB      [19]  432 	ld	l, -5 (ix)
   4D09 DD 66 FC      [19]  433 	ld	h, -4 (ix)
   4D0C E5            [11]  434 	push	hl
   4D0D FD E1         [14]  435 	pop	iy
   4D0F E1            [10]  436 	pop	hl
   4D10 C5            [11]  437 	push	bc
   4D11 4D            [ 4]  438 	ld	c,l
   4D12 06 00         [ 7]  439 	ld	b,#0x00
   4D14 FD 09         [15]  440 	add	iy, bc
   4D16 C1            [10]  441 	pop	bc
   4D17 DD 6E F2      [19]  442 	ld	l,-14 (ix)
   4D1A DD 66 F3      [19]  443 	ld	h,-13 (ix)
   4D1D 6E            [ 7]  444 	ld	l, (hl)
   4D1E FD 75 00      [19]  445 	ld	0 (iy), l
   4D21                     446 00137$:
                            447 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   4D21 1C            [ 4]  448 	inc	e
   4D22 7B            [ 4]  449 	ld	a, e
   4D23 D6 09         [ 7]  450 	sub	a, #0x09
   4D25 DA A7 4C      [10]  451 	jp	C, 00136$
                            452 ;src/text/text.c:205: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   4D28 C5            [11]  453 	push	bc
   4D29 DD 66 07      [19]  454 	ld	h, 7 (ix)
   4D2C DD 6E 06      [19]  455 	ld	l, 6 (ix)
   4D2F E5            [11]  456 	push	hl
   4D30 21 00 C0      [10]  457 	ld	hl, #0xc000
   4D33 E5            [11]  458 	push	hl
   4D34 CD D6 53      [17]  459 	call	_cpct_getScreenPtr
   4D37 C1            [10]  460 	pop	bc
                            461 ;src/text/text.c:209: cpct_drawSprite(colorchar, pvideo, FONT_1_W, FONT_H * size);
   4D38 E5            [11]  462 	push	hl
   4D39 FD E1         [14]  463 	pop	iy
   4D3B DD 5E F5      [19]  464 	ld	e,-11 (ix)
   4D3E DD 56 F6      [19]  465 	ld	d,-10 (ix)
   4D41 C5            [11]  466 	push	bc
   4D42 DD 46 F7      [19]  467 	ld	b, -9 (ix)
   4D45 0E 01         [ 7]  468 	ld	c,#0x01
   4D47 C5            [11]  469 	push	bc
   4D48 FD E5         [15]  470 	push	iy
   4D4A D5            [11]  471 	push	de
   4D4B CD 7C 51      [17]  472 	call	_cpct_drawSprite
   4D4E C1            [10]  473 	pop	bc
                            474 ;src/text/text.c:212: if (character == 48 || character == 60 || character == 57)
   4D4F 79            [ 4]  475 	ld	a,c
   4D50 FE 30         [ 7]  476 	cp	a,#0x30
   4D52 28 08         [12]  477 	jr	Z,00121$
   4D54 FE 3C         [ 7]  478 	cp	a,#0x3c
   4D56 28 04         [12]  479 	jr	Z,00121$
   4D58 D6 39         [ 7]  480 	sub	a, #0x39
   4D5A 20 03         [12]  481 	jr	NZ,00126$
   4D5C                     482 00121$:
                            483 ;src/text/text.c:213: xPos--;
   4D5C DD 35 06      [23]  484 	dec	6 (ix)
   4D5F                     485 00126$:
                            486 ;src/text/text.c:215: character = text[++x];
   4D5F DD 34 F1      [23]  487 	inc	-15 (ix)
   4D62 DD 7E FE      [19]  488 	ld	a, -2 (ix)
   4D65 DD 86 F1      [19]  489 	add	a, -15 (ix)
   4D68 6F            [ 4]  490 	ld	l, a
   4D69 DD 7E FF      [19]  491 	ld	a, -1 (ix)
   4D6C CE 00         [ 7]  492 	adc	a, #0x00
   4D6E 67            [ 4]  493 	ld	h, a
   4D6F 7E            [ 7]  494 	ld	a, (hl)
   4D70 DD 77 FD      [19]  495 	ld	-3 (ix), a
                            496 ;src/text/text.c:216: xPos += FONT_1_W;
   4D73 DD 34 06      [23]  497 	inc	6 (ix)
   4D76 C3 CE 4B      [10]  498 	jp	00133$
   4D79                     499 00138$:
   4D79 DD F9         [10]  500 	ld	sp, ix
   4D7B DD E1         [14]  501 	pop	ix
   4D7D C9            [10]  502 	ret
                            503 ;src/text/text.c:232: void drawText(u8 *text, u8 xPos, u8 yPos, u8 color, u8 size)
                            504 ;	---------------------------------
                            505 ; Function drawText
                            506 ; ---------------------------------
   4D7E                     507 _drawText::
   4D7E DD E5         [15]  508 	push	ix
   4D80 DD 21 00 00   [14]  509 	ld	ix,#0
   4D84 DD 39         [15]  510 	add	ix,sp
   4D86 21 B2 FF      [10]  511 	ld	hl, #-78
   4D89 39            [11]  512 	add	hl, sp
   4D8A F9            [ 6]  513 	ld	sp, hl
                            514 ;src/text/text.c:245: color1 = swapColors[color][0];
   4D8B 01 E8 4A      [10]  515 	ld	bc, #_swapColors+0
   4D8E DD 6E 08      [19]  516 	ld	l, 8 (ix)
   4D91 26 00         [ 7]  517 	ld	h, #0x00
   4D93 29            [11]  518 	add	hl, hl
   4D94 29            [11]  519 	add	hl, hl
   4D95 09            [11]  520 	add	hl, bc
   4D96 E5            [11]  521 	push	hl
   4D97 FD E1         [14]  522 	pop	iy
   4D99 FD 7E 00      [19]  523 	ld	a, 0 (iy)
   4D9C DD 77 D9      [19]  524 	ld	-39 (ix), a
                            525 ;src/text/text.c:246: color2 = swapColors[color][1];
   4D9F FD E5         [15]  526 	push	iy
   4DA1 E1            [10]  527 	pop	hl
   4DA2 23            [ 6]  528 	inc	hl
   4DA3 7E            [ 7]  529 	ld	a, (hl)
   4DA4 DD 77 D8      [19]  530 	ld	-40 (ix), a
                            531 ;src/text/text.c:247: color3 = swapColors[color][2];
   4DA7 FD E5         [15]  532 	push	iy
   4DA9 E1            [10]  533 	pop	hl
   4DAA 23            [ 6]  534 	inc	hl
   4DAB 23            [ 6]  535 	inc	hl
   4DAC 7E            [ 7]  536 	ld	a, (hl)
   4DAD DD 77 D7      [19]  537 	ld	-41 (ix), a
                            538 ;src/text/text.c:248: color4 = swapColors[color][3];
   4DB0 FD 7E 03      [19]  539 	ld	a, 3 (iy)
   4DB3 DD 77 D6      [19]  540 	ld	-42 (ix), a
                            541 ;src/text/text.c:253: character = text[x];
   4DB6 DD 7E 04      [19]  542 	ld	a, 4 (ix)
   4DB9 DD 77 FE      [19]  543 	ld	-2 (ix), a
   4DBC DD 7E 05      [19]  544 	ld	a, 5 (ix)
   4DBF DD 77 FF      [19]  545 	ld	-1 (ix), a
   4DC2 DD 6E FE      [19]  546 	ld	l,-2 (ix)
   4DC5 DD 66 FF      [19]  547 	ld	h,-1 (ix)
   4DC8 7E            [ 7]  548 	ld	a, (hl)
   4DC9 DD 77 FD      [19]  549 	ld	-3 (ix), a
                            550 ;src/text/text.c:255: while (character != '\0')
   4DCC 21 00 00      [10]  551 	ld	hl, #0x0000
   4DCF 39            [11]  552 	add	hl, sp
   4DD0 DD 75 FB      [19]  553 	ld	-5 (ix), l
   4DD3 DD 74 FC      [19]  554 	ld	-4 (ix), h
   4DD6 DD 7E FB      [19]  555 	ld	a, -5 (ix)
   4DD9 DD 77 F9      [19]  556 	ld	-7 (ix), a
   4DDC DD 7E FC      [19]  557 	ld	a, -4 (ix)
   4DDF DD 77 FA      [19]  558 	ld	-6 (ix), a
   4DE2 DD 7E FB      [19]  559 	ld	a, -5 (ix)
   4DE5 DD 77 F7      [19]  560 	ld	-9 (ix), a
   4DE8 DD 7E FC      [19]  561 	ld	a, -4 (ix)
   4DEB DD 77 F8      [19]  562 	ld	-8 (ix), a
   4DEE DD 7E FB      [19]  563 	ld	a, -5 (ix)
   4DF1 DD 77 F5      [19]  564 	ld	-11 (ix), a
   4DF4 DD 7E FC      [19]  565 	ld	a, -4 (ix)
   4DF7 DD 77 F6      [19]  566 	ld	-10 (ix), a
   4DFA DD 7E FB      [19]  567 	ld	a, -5 (ix)
   4DFD DD 77 F3      [19]  568 	ld	-13 (ix), a
   4E00 DD 7E FC      [19]  569 	ld	a, -4 (ix)
   4E03 DD 77 F4      [19]  570 	ld	-12 (ix), a
   4E06 DD 7E FB      [19]  571 	ld	a, -5 (ix)
   4E09 DD 77 F1      [19]  572 	ld	-15 (ix), a
   4E0C DD 7E FC      [19]  573 	ld	a, -4 (ix)
   4E0F DD 77 F2      [19]  574 	ld	-14 (ix), a
   4E12 DD 7E FB      [19]  575 	ld	a, -5 (ix)
   4E15 DD 77 EF      [19]  576 	ld	-17 (ix), a
   4E18 DD 7E FC      [19]  577 	ld	a, -4 (ix)
   4E1B DD 77 F0      [19]  578 	ld	-16 (ix), a
   4E1E DD 7E FB      [19]  579 	ld	a, -5 (ix)
   4E21 DD 77 ED      [19]  580 	ld	-19 (ix), a
   4E24 DD 7E FC      [19]  581 	ld	a, -4 (ix)
   4E27 DD 77 EE      [19]  582 	ld	-18 (ix), a
   4E2A DD 7E FB      [19]  583 	ld	a, -5 (ix)
   4E2D DD 77 EB      [19]  584 	ld	-21 (ix), a
   4E30 DD 7E FC      [19]  585 	ld	a, -4 (ix)
   4E33 DD 77 EC      [19]  586 	ld	-20 (ix), a
   4E36 DD 7E FB      [19]  587 	ld	a, -5 (ix)
   4E39 DD 77 E9      [19]  588 	ld	-23 (ix), a
   4E3C DD 7E FC      [19]  589 	ld	a, -4 (ix)
   4E3F DD 77 EA      [19]  590 	ld	-22 (ix), a
   4E42 DD 7E 09      [19]  591 	ld	a, 9 (ix)
   4E45 3D            [ 4]  592 	dec	a
   4E46 20 04         [12]  593 	jr	NZ,00297$
   4E48 3E 01         [ 7]  594 	ld	a,#0x01
   4E4A 18 01         [12]  595 	jr	00298$
   4E4C                     596 00297$:
   4E4C AF            [ 4]  597 	xor	a,a
   4E4D                     598 00298$:
   4E4D DD 77 E8      [19]  599 	ld	-24 (ix), a
   4E50 DD 7E 09      [19]  600 	ld	a, 9 (ix)
   4E53 4F            [ 4]  601 	ld	c, a
   4E54 87            [ 4]  602 	add	a, a
   4E55 87            [ 4]  603 	add	a, a
   4E56 87            [ 4]  604 	add	a, a
   4E57 81            [ 4]  605 	add	a, c
   4E58 DD 77 E7      [19]  606 	ld	-25 (ix), a
   4E5B DD 7E FB      [19]  607 	ld	a, -5 (ix)
   4E5E DD 77 E5      [19]  608 	ld	-27 (ix), a
   4E61 DD 7E FC      [19]  609 	ld	a, -4 (ix)
   4E64 DD 77 E6      [19]  610 	ld	-26 (ix), a
   4E67 DD 36 DC 00   [19]  611 	ld	-36 (ix), #0x00
   4E6B                     612 00156$:
   4E6B DD 7E FD      [19]  613 	ld	a, -3 (ix)
   4E6E B7            [ 4]  614 	or	a, a
   4E6F CA 48 51      [10]  615 	jp	Z, 00161$
                            616 ;src/text/text.c:259: if ((character == 33) || ((character > 43) && (character < 47)) ||
   4E72 DD 7E FD      [19]  617 	ld	a, -3 (ix)
   4E75 D6 21         [ 7]  618 	sub	a, #0x21
   4E77 20 04         [12]  619 	jr	NZ,00299$
   4E79 3E 01         [ 7]  620 	ld	a,#0x01
   4E7B 18 01         [12]  621 	jr	00300$
   4E7D                     622 00299$:
   4E7D AF            [ 4]  623 	xor	a,a
   4E7E                     624 00300$:
   4E7E 4F            [ 4]  625 	ld	c,a
   4E7F B7            [ 4]  626 	or	a, a
   4E80 20 2C         [12]  627 	jr	NZ,00148$
   4E82 3E 2B         [ 7]  628 	ld	a, #0x2b
   4E84 DD 96 FD      [19]  629 	sub	a, -3 (ix)
   4E87 30 07         [12]  630 	jr	NC,00153$
   4E89 DD 7E FD      [19]  631 	ld	a, -3 (ix)
   4E8C D6 2F         [ 7]  632 	sub	a, #0x2f
   4E8E 38 1E         [12]  633 	jr	C,00148$
   4E90                     634 00153$:
                            635 ;src/text/text.c:260: ((character > 47) && (character < 58)) || ((character > 62) && (character < 91)))
   4E90 3E 2F         [ 7]  636 	ld	a, #0x2f
   4E92 DD 96 FD      [19]  637 	sub	a, -3 (ix)
   4E95 30 07         [12]  638 	jr	NC,00155$
   4E97 DD 7E FD      [19]  639 	ld	a, -3 (ix)
   4E9A D6 3A         [ 7]  640 	sub	a, #0x3a
   4E9C 38 10         [12]  641 	jr	C,00148$
   4E9E                     642 00155$:
   4E9E 3E 3E         [ 7]  643 	ld	a, #0x3e
   4EA0 DD 96 FD      [19]  644 	sub	a, -3 (ix)
   4EA3 D2 2B 51      [10]  645 	jp	NC, 00149$
   4EA6 DD 7E FD      [19]  646 	ld	a, -3 (ix)
   4EA9 D6 5B         [ 7]  647 	sub	a, #0x5b
   4EAB D2 2B 51      [10]  648 	jp	NC, 00149$
   4EAE                     649 00148$:
                            650 ;src/text/text.c:264: switch (character)
   4EAE 79            [ 4]  651 	ld	a, c
   4EAF B7            [ 4]  652 	or	a, a
   4EB0 20 5D         [12]  653 	jr	NZ,00101$
   4EB2 DD 7E FD      [19]  654 	ld	a, -3 (ix)
   4EB5 D6 2C         [ 7]  655 	sub	a, #0x2c
   4EB7 28 5C         [12]  656 	jr	Z,00104$
   4EB9 DD 7E FD      [19]  657 	ld	a, -3 (ix)
   4EBC D6 2D         [ 7]  658 	sub	a, #0x2d
   4EBE 28 55         [12]  659 	jr	Z,00104$
   4EC0 DD 7E FD      [19]  660 	ld	a, -3 (ix)
   4EC3 D6 2E         [ 7]  661 	sub	a, #0x2e
   4EC5 28 4E         [12]  662 	jr	Z,00104$
   4EC7 DD 7E FD      [19]  663 	ld	a, -3 (ix)
   4ECA D6 30         [ 7]  664 	sub	a, #0x30
   4ECC 28 51         [12]  665 	jr	Z,00114$
   4ECE DD 7E FD      [19]  666 	ld	a, -3 (ix)
   4ED1 D6 31         [ 7]  667 	sub	a, #0x31
   4ED3 28 4A         [12]  668 	jr	Z,00114$
   4ED5 DD 7E FD      [19]  669 	ld	a, -3 (ix)
   4ED8 D6 32         [ 7]  670 	sub	a, #0x32
   4EDA 28 43         [12]  671 	jr	Z,00114$
   4EDC DD 7E FD      [19]  672 	ld	a, -3 (ix)
   4EDF D6 33         [ 7]  673 	sub	a, #0x33
   4EE1 28 3C         [12]  674 	jr	Z,00114$
   4EE3 DD 7E FD      [19]  675 	ld	a, -3 (ix)
   4EE6 D6 34         [ 7]  676 	sub	a, #0x34
   4EE8 28 35         [12]  677 	jr	Z,00114$
   4EEA DD 7E FD      [19]  678 	ld	a, -3 (ix)
   4EED D6 35         [ 7]  679 	sub	a, #0x35
   4EEF 28 2E         [12]  680 	jr	Z,00114$
   4EF1 DD 7E FD      [19]  681 	ld	a, -3 (ix)
   4EF4 D6 36         [ 7]  682 	sub	a, #0x36
   4EF6 28 27         [12]  683 	jr	Z,00114$
   4EF8 DD 7E FD      [19]  684 	ld	a, -3 (ix)
   4EFB D6 37         [ 7]  685 	sub	a, #0x37
   4EFD 28 20         [12]  686 	jr	Z,00114$
   4EFF DD 7E FD      [19]  687 	ld	a, -3 (ix)
   4F02 D6 38         [ 7]  688 	sub	a, #0x38
   4F04 28 19         [12]  689 	jr	Z,00114$
   4F06 DD 7E FD      [19]  690 	ld	a, -3 (ix)
   4F09 D6 39         [ 7]  691 	sub	a, #0x39
   4F0B 28 12         [12]  692 	jr	Z,00114$
   4F0D 18 18         [12]  693 	jr	00115$
                            694 ;src/text/text.c:267: case 33:
   4F0F                     695 00101$:
                            696 ;src/text/text.c:268: character = 49;
   4F0F DD 36 FD 31   [19]  697 	ld	-3 (ix), #0x31
                            698 ;src/text/text.c:269: break;
   4F13 18 12         [12]  699 	jr	00115$
                            700 ;src/text/text.c:274: case 46:
   4F15                     701 00104$:
                            702 ;src/text/text.c:275: character += 6;
   4F15 DD 7E FD      [19]  703 	ld	a, -3 (ix)
   4F18 C6 06         [ 7]  704 	add	a, #0x06
   4F1A DD 77 FD      [19]  705 	ld	-3 (ix), a
                            706 ;src/text/text.c:276: break;
   4F1D 18 08         [12]  707 	jr	00115$
                            708 ;src/text/text.c:288: case 57:
   4F1F                     709 00114$:
                            710 ;src/text/text.c:289: character += 5;
   4F1F DD 7E FD      [19]  711 	ld	a, -3 (ix)
   4F22 C6 05         [ 7]  712 	add	a, #0x05
   4F24 DD 77 FD      [19]  713 	ld	-3 (ix), a
                            714 ;src/text/text.c:291: }
   4F27                     715 00115$:
                            716 ;src/text/text.c:294: character -= 49;
   4F27 DD 7E FD      [19]  717 	ld	a, -3 (ix)
   4F2A C6 CF         [ 7]  718 	add	a, #0xcf
   4F2C 4F            [ 4]  719 	ld	c, a
                            720 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   4F2D 06 00         [ 7]  721 	ld	b,#0x00
   4F2F 69            [ 4]  722 	ld	l, c
   4F30 60            [ 4]  723 	ld	h, b
   4F31 29            [11]  724 	add	hl, hl
   4F32 29            [11]  725 	add	hl, hl
   4F33 29            [11]  726 	add	hl, hl
   4F34 09            [11]  727 	add	hl, bc
   4F35 29            [11]  728 	add	hl, hl
   4F36 EB            [ 4]  729 	ex	de,hl
   4F37 06 00         [ 7]  730 	ld	b, #0x00
   4F39                     731 00159$:
                            732 ;src/text/text.c:299: pChar = (u8 *)s_fonts_0 + (character * 18) + i;
   4F39 21 87 41      [10]  733 	ld	hl, #_s_fonts_0
   4F3C 19            [11]  734 	add	hl, de
   4F3D 7D            [ 4]  735 	ld	a, l
   4F3E 80            [ 4]  736 	add	a, b
   4F3F 6F            [ 4]  737 	ld	l, a
   4F40 7C            [ 4]  738 	ld	a, h
   4F41 CE 00         [ 7]  739 	adc	a, #0x00
   4F43 67            [ 4]  740 	ld	h, a
                            741 ;src/text/text.c:304: if (*pChar == 0x55)
   4F44 DD 75 DA      [19]  742 	ld	-38 (ix), l
   4F47 DD 74 DB      [19]  743 	ld	-37 (ix), h
   4F4A 7E            [ 7]  744 	ld	a, (hl)
   4F4B DD 77 E4      [19]  745 	ld	-28 (ix), a
   4F4E D6 55         [ 7]  746 	sub	a, #0x55
   4F50 20 04         [12]  747 	jr	NZ,00314$
   4F52 3E 01         [ 7]  748 	ld	a,#0x01
   4F54 18 01         [12]  749 	jr	00315$
   4F56                     750 00314$:
   4F56 AF            [ 4]  751 	xor	a,a
   4F57                     752 00315$:
   4F57 DD 77 E3      [19]  753 	ld	-29 (ix), a
                            754 ;src/text/text.c:306: else if (*pChar == 0xee)
   4F5A DD 7E E4      [19]  755 	ld	a, -28 (ix)
   4F5D D6 EE         [ 7]  756 	sub	a, #0xee
   4F5F 20 04         [12]  757 	jr	NZ,00316$
   4F61 3E 01         [ 7]  758 	ld	a,#0x01
   4F63 18 01         [12]  759 	jr	00317$
   4F65                     760 00316$:
   4F65 AF            [ 4]  761 	xor	a,a
   4F66                     762 00317$:
   4F66 DD 77 E2      [19]  763 	ld	-30 (ix), a
                            764 ;src/text/text.c:308: else if (*pChar == 0xdd)
   4F69 DD 7E E4      [19]  765 	ld	a, -28 (ix)
   4F6C D6 DD         [ 7]  766 	sub	a, #0xdd
   4F6E 20 04         [12]  767 	jr	NZ,00318$
   4F70 3E 01         [ 7]  768 	ld	a,#0x01
   4F72 18 01         [12]  769 	jr	00319$
   4F74                     770 00318$:
   4F74 AF            [ 4]  771 	xor	a,a
   4F75                     772 00319$:
   4F75 DD 77 E1      [19]  773 	ld	-31 (ix), a
                            774 ;src/text/text.c:310: else if (*pChar == 0xff)
   4F78 DD 7E E4      [19]  775 	ld	a, -28 (ix)
   4F7B 3C            [ 4]  776 	inc	a
   4F7C 20 04         [12]  777 	jr	NZ,00320$
   4F7E 3E 01         [ 7]  778 	ld	a,#0x01
   4F80 18 01         [12]  779 	jr	00321$
   4F82                     780 00320$:
   4F82 AF            [ 4]  781 	xor	a,a
   4F83                     782 00321$:
   4F83 DD 77 E0      [19]  783 	ld	-32 (ix), a
                            784 ;src/text/text.c:301: if (size == 1)
   4F86 DD 7E E8      [19]  785 	ld	a, -24 (ix)
   4F89 B7            [ 4]  786 	or	a, a
   4F8A 28 72         [12]  787 	jr	Z,00141$
                            788 ;src/text/text.c:304: if (*pChar == 0x55)
   4F8C DD 7E E3      [19]  789 	ld	a, -29 (ix)
   4F8F B7            [ 4]  790 	or	a, a
   4F90 28 12         [12]  791 	jr	Z,00126$
                            792 ;src/text/text.c:305: colorchar[i] = color1;
   4F92 DD 7E E9      [19]  793 	ld	a, -23 (ix)
   4F95 80            [ 4]  794 	add	a, b
   4F96 6F            [ 4]  795 	ld	l, a
   4F97 DD 7E EA      [19]  796 	ld	a, -22 (ix)
   4F9A CE 00         [ 7]  797 	adc	a, #0x00
   4F9C 67            [ 4]  798 	ld	h, a
   4F9D DD 7E D9      [19]  799 	ld	a, -39 (ix)
   4FA0 77            [ 7]  800 	ld	(hl), a
   4FA1 C3 ED 50      [10]  801 	jp	00160$
   4FA4                     802 00126$:
                            803 ;src/text/text.c:306: else if (*pChar == 0xee)
   4FA4 DD 7E E2      [19]  804 	ld	a, -30 (ix)
   4FA7 B7            [ 4]  805 	or	a, a
   4FA8 28 12         [12]  806 	jr	Z,00123$
                            807 ;src/text/text.c:307: colorchar[i] = color2;
   4FAA DD 7E EB      [19]  808 	ld	a, -21 (ix)
   4FAD 80            [ 4]  809 	add	a, b
   4FAE 6F            [ 4]  810 	ld	l, a
   4FAF DD 7E EC      [19]  811 	ld	a, -20 (ix)
   4FB2 CE 00         [ 7]  812 	adc	a, #0x00
   4FB4 67            [ 4]  813 	ld	h, a
   4FB5 DD 7E D8      [19]  814 	ld	a, -40 (ix)
   4FB8 77            [ 7]  815 	ld	(hl), a
   4FB9 C3 ED 50      [10]  816 	jp	00160$
   4FBC                     817 00123$:
                            818 ;src/text/text.c:308: else if (*pChar == 0xdd)
   4FBC DD 7E E1      [19]  819 	ld	a, -31 (ix)
   4FBF B7            [ 4]  820 	or	a, a
   4FC0 28 12         [12]  821 	jr	Z,00120$
                            822 ;src/text/text.c:309: colorchar[i] = color3;
   4FC2 DD 7E ED      [19]  823 	ld	a, -19 (ix)
   4FC5 80            [ 4]  824 	add	a, b
   4FC6 6F            [ 4]  825 	ld	l, a
   4FC7 DD 7E EE      [19]  826 	ld	a, -18 (ix)
   4FCA CE 00         [ 7]  827 	adc	a, #0x00
   4FCC 67            [ 4]  828 	ld	h, a
   4FCD DD 7E D7      [19]  829 	ld	a, -41 (ix)
   4FD0 77            [ 7]  830 	ld	(hl), a
   4FD1 C3 ED 50      [10]  831 	jp	00160$
   4FD4                     832 00120$:
                            833 ;src/text/text.c:310: else if (*pChar == 0xff)
   4FD4 DD 7E E0      [19]  834 	ld	a, -32 (ix)
   4FD7 B7            [ 4]  835 	or	a, a
   4FD8 28 12         [12]  836 	jr	Z,00117$
                            837 ;src/text/text.c:311: colorchar[i] = color4;
   4FDA DD 7E EF      [19]  838 	ld	a, -17 (ix)
   4FDD 80            [ 4]  839 	add	a, b
   4FDE 6F            [ 4]  840 	ld	l, a
   4FDF DD 7E F0      [19]  841 	ld	a, -16 (ix)
   4FE2 CE 00         [ 7]  842 	adc	a, #0x00
   4FE4 67            [ 4]  843 	ld	h, a
   4FE5 DD 7E D6      [19]  844 	ld	a, -42 (ix)
   4FE8 77            [ 7]  845 	ld	(hl), a
   4FE9 C3 ED 50      [10]  846 	jp	00160$
   4FEC                     847 00117$:
                            848 ;src/text/text.c:313: colorchar[i] = *pChar;
   4FEC DD 7E F1      [19]  849 	ld	a, -15 (ix)
   4FEF 80            [ 4]  850 	add	a, b
   4FF0 6F            [ 4]  851 	ld	l, a
   4FF1 DD 7E F2      [19]  852 	ld	a, -14 (ix)
   4FF4 CE 00         [ 7]  853 	adc	a, #0x00
   4FF6 67            [ 4]  854 	ld	h, a
   4FF7 DD 7E E4      [19]  855 	ld	a, -28 (ix)
   4FFA 77            [ 7]  856 	ld	(hl), a
   4FFB C3 ED 50      [10]  857 	jp	00160$
   4FFE                     858 00141$:
                            859 ;src/text/text.c:319: pos = (i * size) - (i % FONT_0_W);
   4FFE D5            [11]  860 	push	de
   4FFF C5            [11]  861 	push	bc
   5000 DD 5E 09      [19]  862 	ld	e, 9 (ix)
   5003 60            [ 4]  863 	ld	h, b
   5004 2E 00         [ 7]  864 	ld	l, #0x00
   5006 55            [ 4]  865 	ld	d, l
   5007 06 08         [ 7]  866 	ld	b, #0x08
   5009                     867 00322$:
   5009 29            [11]  868 	add	hl, hl
   500A 30 01         [12]  869 	jr	NC,00323$
   500C 19            [11]  870 	add	hl, de
   500D                     871 00323$:
   500D 10 FA         [13]  872 	djnz	00322$
   500F C1            [10]  873 	pop	bc
   5010 D1            [10]  874 	pop	de
   5011 78            [ 4]  875 	ld	a, b
   5012 E6 01         [ 7]  876 	and	a, #0x01
   5014 67            [ 4]  877 	ld	h, a
   5015 7D            [ 4]  878 	ld	a, l
   5016 94            [ 4]  879 	sub	a, h
                            880 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   5017 6F            [ 4]  881 	ld	l,a
   5018 C6 02         [ 7]  882 	add	a, #0x02
   501A DD 77 DF      [19]  883 	ld	-33 (ix), a
                            884 ;src/text/text.c:321: if (*pChar == 0x55)
   501D DD 7E E3      [19]  885 	ld	a, -29 (ix)
   5020 B7            [ 4]  886 	or	a, a
   5021 28 23         [12]  887 	jr	Z,00138$
                            888 ;src/text/text.c:323: colorchar[pos] = color1;
   5023 DD 7E F3      [19]  889 	ld	a, -13 (ix)
   5026 85            [ 4]  890 	add	a, l
   5027 6F            [ 4]  891 	ld	l, a
   5028 DD 7E F4      [19]  892 	ld	a, -12 (ix)
   502B CE 00         [ 7]  893 	adc	a, #0x00
   502D 67            [ 4]  894 	ld	h, a
   502E DD 7E D9      [19]  895 	ld	a, -39 (ix)
   5031 77            [ 7]  896 	ld	(hl), a
                            897 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   5032 DD 7E F3      [19]  898 	ld	a, -13 (ix)
   5035 DD 86 DF      [19]  899 	add	a, -33 (ix)
   5038 6F            [ 4]  900 	ld	l, a
   5039 DD 7E F4      [19]  901 	ld	a, -12 (ix)
   503C CE 00         [ 7]  902 	adc	a, #0x00
   503E 67            [ 4]  903 	ld	h, a
   503F DD 7E D9      [19]  904 	ld	a, -39 (ix)
   5042 77            [ 7]  905 	ld	(hl), a
   5043 C3 ED 50      [10]  906 	jp	00160$
   5046                     907 00138$:
                            908 ;src/text/text.c:326: else if (*pChar == 0xee)
   5046 DD 7E E2      [19]  909 	ld	a, -30 (ix)
   5049 B7            [ 4]  910 	or	a, a
   504A 28 23         [12]  911 	jr	Z,00135$
                            912 ;src/text/text.c:328: colorchar[pos] = color2;
   504C DD 7E F5      [19]  913 	ld	a, -11 (ix)
   504F 85            [ 4]  914 	add	a, l
   5050 6F            [ 4]  915 	ld	l, a
   5051 DD 7E F6      [19]  916 	ld	a, -10 (ix)
   5054 CE 00         [ 7]  917 	adc	a, #0x00
   5056 67            [ 4]  918 	ld	h, a
   5057 DD 7E D8      [19]  919 	ld	a, -40 (ix)
   505A 77            [ 7]  920 	ld	(hl), a
                            921 ;src/text/text.c:329: colorchar[pos + FONT_0_W] = color2;
   505B DD 7E F5      [19]  922 	ld	a, -11 (ix)
   505E DD 86 DF      [19]  923 	add	a, -33 (ix)
   5061 6F            [ 4]  924 	ld	l, a
   5062 DD 7E F6      [19]  925 	ld	a, -10 (ix)
   5065 CE 00         [ 7]  926 	adc	a, #0x00
   5067 67            [ 4]  927 	ld	h, a
   5068 DD 7E D8      [19]  928 	ld	a, -40 (ix)
   506B 77            [ 7]  929 	ld	(hl), a
   506C C3 ED 50      [10]  930 	jp	00160$
   506F                     931 00135$:
                            932 ;src/text/text.c:331: else if (*pChar == 0xdd)
   506F DD 7E E1      [19]  933 	ld	a, -31 (ix)
   5072 B7            [ 4]  934 	or	a, a
   5073 28 22         [12]  935 	jr	Z,00132$
                            936 ;src/text/text.c:333: colorchar[pos] = color3;
   5075 DD 7E F7      [19]  937 	ld	a, -9 (ix)
   5078 85            [ 4]  938 	add	a, l
   5079 6F            [ 4]  939 	ld	l, a
   507A DD 7E F8      [19]  940 	ld	a, -8 (ix)
   507D CE 00         [ 7]  941 	adc	a, #0x00
   507F 67            [ 4]  942 	ld	h, a
   5080 DD 7E D7      [19]  943 	ld	a, -41 (ix)
   5083 77            [ 7]  944 	ld	(hl), a
                            945 ;src/text/text.c:334: colorchar[pos + FONT_0_W] = color3;
   5084 DD 7E F7      [19]  946 	ld	a, -9 (ix)
   5087 DD 86 DF      [19]  947 	add	a, -33 (ix)
   508A 6F            [ 4]  948 	ld	l, a
   508B DD 7E F8      [19]  949 	ld	a, -8 (ix)
   508E CE 00         [ 7]  950 	adc	a, #0x00
   5090 67            [ 4]  951 	ld	h, a
   5091 DD 7E D7      [19]  952 	ld	a, -41 (ix)
   5094 77            [ 7]  953 	ld	(hl), a
   5095 18 56         [12]  954 	jr	00160$
   5097                     955 00132$:
                            956 ;src/text/text.c:336: else if (*pChar == 0xff)
   5097 DD 7E E0      [19]  957 	ld	a, -32 (ix)
   509A B7            [ 4]  958 	or	a, a
   509B 28 22         [12]  959 	jr	Z,00129$
                            960 ;src/text/text.c:338: colorchar[pos] = color4;
   509D DD 7E F9      [19]  961 	ld	a, -7 (ix)
   50A0 85            [ 4]  962 	add	a, l
   50A1 6F            [ 4]  963 	ld	l, a
   50A2 DD 7E FA      [19]  964 	ld	a, -6 (ix)
   50A5 CE 00         [ 7]  965 	adc	a, #0x00
   50A7 67            [ 4]  966 	ld	h, a
   50A8 DD 7E D6      [19]  967 	ld	a, -42 (ix)
   50AB 77            [ 7]  968 	ld	(hl), a
                            969 ;src/text/text.c:339: colorchar[pos + FONT_0_W] = color4;
   50AC DD 7E F9      [19]  970 	ld	a, -7 (ix)
   50AF DD 86 DF      [19]  971 	add	a, -33 (ix)
   50B2 6F            [ 4]  972 	ld	l, a
   50B3 DD 7E FA      [19]  973 	ld	a, -6 (ix)
   50B6 CE 00         [ 7]  974 	adc	a, #0x00
   50B8 67            [ 4]  975 	ld	h, a
   50B9 DD 7E D6      [19]  976 	ld	a, -42 (ix)
   50BC 77            [ 7]  977 	ld	(hl), a
   50BD 18 2E         [12]  978 	jr	00160$
   50BF                     979 00129$:
                            980 ;src/text/text.c:343: colorchar[pos] = *pChar;
   50BF DD 7E FB      [19]  981 	ld	a, -5 (ix)
   50C2 85            [ 4]  982 	add	a, l
   50C3 6F            [ 4]  983 	ld	l, a
   50C4 DD 7E FC      [19]  984 	ld	a, -4 (ix)
   50C7 CE 00         [ 7]  985 	adc	a, #0x00
   50C9 67            [ 4]  986 	ld	h, a
   50CA DD 7E E4      [19]  987 	ld	a, -28 (ix)
   50CD 77            [ 7]  988 	ld	(hl), a
                            989 ;src/text/text.c:344: colorchar[pos + FONT_0_W] = *pChar;
   50CE DD 7E FB      [19]  990 	ld	a, -5 (ix)
   50D1 DD 86 DF      [19]  991 	add	a, -33 (ix)
   50D4 DD 77 DD      [19]  992 	ld	-35 (ix), a
   50D7 DD 7E FC      [19]  993 	ld	a, -4 (ix)
   50DA CE 00         [ 7]  994 	adc	a, #0x00
   50DC DD 77 DE      [19]  995 	ld	-34 (ix), a
   50DF DD 6E DA      [19]  996 	ld	l,-38 (ix)
   50E2 DD 66 DB      [19]  997 	ld	h,-37 (ix)
   50E5 7E            [ 7]  998 	ld	a, (hl)
   50E6 DD 6E DD      [19]  999 	ld	l,-35 (ix)
   50E9 DD 66 DE      [19] 1000 	ld	h,-34 (ix)
   50EC 77            [ 7] 1001 	ld	(hl), a
   50ED                    1002 00160$:
                           1003 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   50ED 04            [ 4] 1004 	inc	b
   50EE 78            [ 4] 1005 	ld	a, b
   50EF D6 12         [ 7] 1006 	sub	a, #0x12
   50F1 DA 39 4F      [10] 1007 	jp	C, 00159$
                           1008 ;src/text/text.c:349: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   50F4 C5            [11] 1009 	push	bc
   50F5 DD 66 07      [19] 1010 	ld	h, 7 (ix)
   50F8 DD 6E 06      [19] 1011 	ld	l, 6 (ix)
   50FB E5            [11] 1012 	push	hl
   50FC 21 00 C0      [10] 1013 	ld	hl, #0xc000
   50FF E5            [11] 1014 	push	hl
   5100 CD D6 53      [17] 1015 	call	_cpct_getScreenPtr
   5103 C1            [10] 1016 	pop	bc
                           1017 ;src/text/text.c:353: cpct_drawSprite(colorchar, pvideo, FONT_0_W, FONT_H * size);
   5104 E5            [11] 1018 	push	hl
   5105 FD E1         [14] 1019 	pop	iy
   5107 DD 5E E5      [19] 1020 	ld	e,-27 (ix)
   510A DD 56 E6      [19] 1021 	ld	d,-26 (ix)
   510D C5            [11] 1022 	push	bc
   510E DD 46 E7      [19] 1023 	ld	b, -25 (ix)
   5111 0E 02         [ 7] 1024 	ld	c,#0x02
   5113 C5            [11] 1025 	push	bc
   5114 FD E5         [15] 1026 	push	iy
   5116 D5            [11] 1027 	push	de
   5117 CD 7C 51      [17] 1028 	call	_cpct_drawSprite
   511A C1            [10] 1029 	pop	bc
                           1030 ;src/text/text.c:356: if (character == 48 || character == 60 || character == 57)
   511B 79            [ 4] 1031 	ld	a,c
   511C FE 30         [ 7] 1032 	cp	a,#0x30
   511E 28 08         [12] 1033 	jr	Z,00144$
   5120 FE 3C         [ 7] 1034 	cp	a,#0x3c
   5122 28 04         [12] 1035 	jr	Z,00144$
   5124 D6 39         [ 7] 1036 	sub	a, #0x39
   5126 20 03         [12] 1037 	jr	NZ,00149$
   5128                    1038 00144$:
                           1039 ;src/text/text.c:357: xPos--;
   5128 DD 35 06      [23] 1040 	dec	6 (ix)
   512B                    1041 00149$:
                           1042 ;src/text/text.c:359: character = text[++x];
   512B DD 34 DC      [23] 1043 	inc	-36 (ix)
   512E DD 7E FE      [19] 1044 	ld	a, -2 (ix)
   5131 DD 86 DC      [19] 1045 	add	a, -36 (ix)
   5134 6F            [ 4] 1046 	ld	l, a
   5135 DD 7E FF      [19] 1047 	ld	a, -1 (ix)
   5138 CE 00         [ 7] 1048 	adc	a, #0x00
   513A 67            [ 4] 1049 	ld	h, a
   513B 7E            [ 7] 1050 	ld	a, (hl)
   513C DD 77 FD      [19] 1051 	ld	-3 (ix), a
                           1052 ;src/text/text.c:360: xPos += FONT_0_W;
   513F DD 34 06      [23] 1053 	inc	6 (ix)
   5142 DD 34 06      [23] 1054 	inc	6 (ix)
   5145 C3 6B 4E      [10] 1055 	jp	00156$
   5148                    1056 00161$:
   5148 DD F9         [10] 1057 	ld	sp, ix
   514A DD E1         [14] 1058 	pop	ix
   514C C9            [10] 1059 	ret
                           1060 	.area _CODE
                           1061 	.area _INITIALIZER
                           1062 	.area _CABS (ABS)
