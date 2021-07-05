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
   0D5F                      54 _strLength::
                             55 ;src/text/text.c:58: while (str[result] != '\0')
   0D5F 0E 00         [ 7]   56 	ld	c, #0x00
   0D61                      57 00101$:
   0D61 21 02 00      [10]   58 	ld	hl, #2
   0D64 39            [11]   59 	add	hl, sp
   0D65 7E            [ 7]   60 	ld	a, (hl)
   0D66 23            [ 6]   61 	inc	hl
   0D67 66            [ 7]   62 	ld	h, (hl)
   0D68 6F            [ 4]   63 	ld	l, a
   0D69 06 00         [ 7]   64 	ld	b, #0x00
   0D6B 09            [11]   65 	add	hl, bc
   0D6C 7E            [ 7]   66 	ld	a, (hl)
   0D6D B7            [ 4]   67 	or	a, a
   0D6E 28 03         [12]   68 	jr	Z,00103$
                             69 ;src/text/text.c:60: result++;
   0D70 0C            [ 4]   70 	inc	c
   0D71 18 EE         [12]   71 	jr	00101$
   0D73                      72 00103$:
                             73 ;src/text/text.c:62: return result;
   0D73 69            [ 4]   74 	ld	l, c
   0D74 C9            [10]   75 	ret
   0D75                      76 _swapColors:
   0D75 55                   77 	.db #0x55	; 85	'U'
   0D76 EE                   78 	.db #0xee	; 238
   0D77 DD                   79 	.db #0xdd	; 221
   0D78 FF                   80 	.db #0xff	; 255
   0D79 14                   81 	.db #0x14	; 20
   0D7A 6C                   82 	.db #0x6c	; 108	'l'
   0D7B 9C                   83 	.db #0x9c	; 156
   0D7C 3C                   84 	.db #0x3c	; 60
   0D7D 50                   85 	.db #0x50	; 80	'P'
   0D7E E4                   86 	.db #0xe4	; 228
   0D7F D8                   87 	.db #0xd8	; 216
   0D80 F0                   88 	.db #0xf0	; 240
   0D81 11                   89 	.db #0x11	; 17
   0D82 66                   90 	.db #0x66	; 102	'f'
   0D83 99                   91 	.db #0x99	; 153
   0D84 33                   92 	.db #0x33	; 51	'3'
   0D85 10                   93 	.db #0x10	; 16
   0D86 35                   94 	.db #0x35	; 53	'5'
   0D87 3A                   95 	.db #0x3a	; 58
   0D88 30                   96 	.db #0x30	; 48	'0'
   0D89 45                   97 	.db #0x45	; 69	'E'
   0D8A CE                   98 	.db #0xce	; 206
   0D8B CD                   99 	.db #0xcd	; 205
   0D8C CF                  100 	.db #0xcf	; 207
                            101 ;src/text/text.c:75: void strCopy(u8 source[], u8 dest[])
                            102 ;	---------------------------------
                            103 ; Function strCopy
                            104 ; ---------------------------------
   0D8D                     105 _strCopy::
   0D8D DD E5         [15]  106 	push	ix
   0D8F DD 21 00 00   [14]  107 	ld	ix,#0
   0D93 DD 39         [15]  108 	add	ix,sp
                            109 ;src/text/text.c:78: while ((dest[i] = source[i]) != '\0')
   0D95 0E 00         [ 7]  110 	ld	c, #0x00
   0D97                     111 00101$:
   0D97 DD 7E 06      [19]  112 	ld	a, 6 (ix)
   0D9A 81            [ 4]  113 	add	a, c
   0D9B 5F            [ 4]  114 	ld	e, a
   0D9C DD 7E 07      [19]  115 	ld	a, 7 (ix)
   0D9F CE 00         [ 7]  116 	adc	a, #0x00
   0DA1 57            [ 4]  117 	ld	d, a
   0DA2 DD 6E 04      [19]  118 	ld	l,4 (ix)
   0DA5 DD 66 05      [19]  119 	ld	h,5 (ix)
   0DA8 06 00         [ 7]  120 	ld	b, #0x00
   0DAA 09            [11]  121 	add	hl, bc
   0DAB 7E            [ 7]  122 	ld	a, (hl)
   0DAC 12            [ 7]  123 	ld	(de), a
   0DAD B7            [ 4]  124 	or	a, a
   0DAE 28 03         [12]  125 	jr	Z,00104$
                            126 ;src/text/text.c:80: i++;
   0DB0 0C            [ 4]  127 	inc	c
   0DB1 18 E4         [12]  128 	jr	00101$
   0DB3                     129 00104$:
   0DB3 DD E1         [14]  130 	pop	ix
   0DB5 C9            [10]  131 	ret
                            132 ;src/text/text.c:94: u8 strCmp(u8 str1[], u8 str2[])
                            133 ;	---------------------------------
                            134 ; Function strCmp
                            135 ; ---------------------------------
   0DB6                     136 _strCmp::
                            137 ;src/text/text.c:99: while ((str1[i] == str2[i]) && ((str1[i] != '\0') && (str2[i] != '\0')))
   0DB6 0E 00         [ 7]  138 	ld	c, #0x00
   0DB8                     139 00103$:
   0DB8 21 02 00      [10]  140 	ld	hl, #2
   0DBB 39            [11]  141 	add	hl, sp
   0DBC 7E            [ 7]  142 	ld	a, (hl)
   0DBD 23            [ 6]  143 	inc	hl
   0DBE 66            [ 7]  144 	ld	h, (hl)
   0DBF 6F            [ 4]  145 	ld	l, a
   0DC0 06 00         [ 7]  146 	ld	b, #0x00
   0DC2 09            [11]  147 	add	hl, bc
   0DC3 46            [ 7]  148 	ld	b, (hl)
   0DC4 FD 21 04 00   [14]  149 	ld	iy, #4
   0DC8 FD 39         [15]  150 	add	iy, sp
   0DCA FD 7E 00      [19]  151 	ld	a, 0 (iy)
   0DCD 81            [ 4]  152 	add	a, c
   0DCE 5F            [ 4]  153 	ld	e, a
   0DCF FD 7E 01      [19]  154 	ld	a, 1 (iy)
   0DD2 CE 00         [ 7]  155 	adc	a, #0x00
   0DD4 57            [ 4]  156 	ld	d, a
   0DD5 1A            [ 7]  157 	ld	a, (de)
   0DD6 57            [ 4]  158 	ld	d, a
   0DD7 78            [ 4]  159 	ld	a, b
   0DD8 92            [ 4]  160 	sub	a, d
   0DD9 20 04         [12]  161 	jr	NZ,00132$
   0DDB 3E 01         [ 7]  162 	ld	a,#0x01
   0DDD 18 01         [12]  163 	jr	00133$
   0DDF                     164 00132$:
   0DDF AF            [ 4]  165 	xor	a,a
   0DE0                     166 00133$:
   0DE0 5F            [ 4]  167 	ld	e,a
   0DE1 B7            [ 4]  168 	or	a, a
   0DE2 28 0B         [12]  169 	jr	Z,00105$
   0DE4 78            [ 4]  170 	ld	a, b
   0DE5 B7            [ 4]  171 	or	a, a
   0DE6 28 07         [12]  172 	jr	Z,00105$
   0DE8 7A            [ 4]  173 	ld	a, d
   0DE9 B7            [ 4]  174 	or	a, a
   0DEA 28 03         [12]  175 	jr	Z,00105$
                            176 ;src/text/text.c:101: i++;
   0DEC 0C            [ 4]  177 	inc	c
   0DED 18 C9         [12]  178 	jr	00103$
   0DEF                     179 00105$:
                            180 ;src/text/text.c:103: if (str1[i] == str2[i])
   0DEF 7B            [ 4]  181 	ld	a, e
   0DF0 B7            [ 4]  182 	or	a, a
   0DF1 28 03         [12]  183 	jr	Z,00107$
                            184 ;src/text/text.c:105: return YES;
   0DF3 2E 01         [ 7]  185 	ld	l, #0x01
   0DF5 C9            [10]  186 	ret
   0DF6                     187 00107$:
                            188 ;src/text/text.c:109: return NO;
   0DF6 2E 00         [ 7]  189 	ld	l, #0x00
   0DF8 C9            [10]  190 	ret
                            191 ;src/text/text.c:125: void drawTextM1(u8 *text, u8 xPos, u8 yPos, u8 size)
                            192 ;	---------------------------------
                            193 ; Function drawTextM1
                            194 ; ---------------------------------
   0DF9                     195 _drawTextM1::
   0DF9 DD E5         [15]  196 	push	ix
   0DFB DD 21 00 00   [14]  197 	ld	ix,#0
   0DFF DD 39         [15]  198 	add	ix,sp
   0E01 21 CC FF      [10]  199 	ld	hl, #-52
   0E04 39            [11]  200 	add	hl, sp
   0E05 F9            [ 6]  201 	ld	sp, hl
                            202 ;src/text/text.c:140: character = text[x];
   0E06 DD 7E 04      [19]  203 	ld	a, 4 (ix)
   0E09 DD 77 FE      [19]  204 	ld	-2 (ix), a
   0E0C DD 7E 05      [19]  205 	ld	a, 5 (ix)
   0E0F DD 77 FF      [19]  206 	ld	-1 (ix), a
   0E12 DD 6E FE      [19]  207 	ld	l,-2 (ix)
   0E15 DD 66 FF      [19]  208 	ld	h,-1 (ix)
   0E18 7E            [ 7]  209 	ld	a, (hl)
   0E19 DD 77 FA      [19]  210 	ld	-6 (ix), a
                            211 ;src/text/text.c:142: while (character != '\0')
   0E1C 21 03 00      [10]  212 	ld	hl, #0x0003
   0E1F 39            [11]  213 	add	hl, sp
   0E20 DD 75 FC      [19]  214 	ld	-4 (ix), l
   0E23 DD 74 FD      [19]  215 	ld	-3 (ix), h
   0E26 DD 7E FC      [19]  216 	ld	a, -4 (ix)
   0E29 DD 77 F4      [19]  217 	ld	-12 (ix), a
   0E2C DD 7E FD      [19]  218 	ld	a, -3 (ix)
   0E2F DD 77 F5      [19]  219 	ld	-11 (ix), a
   0E32 DD 7E 08      [19]  220 	ld	a, 8 (ix)
   0E35 3D            [ 4]  221 	dec	a
   0E36 20 04         [12]  222 	jr	NZ,00246$
   0E38 3E 01         [ 7]  223 	ld	a,#0x01
   0E3A 18 01         [12]  224 	jr	00247$
   0E3C                     225 00246$:
   0E3C AF            [ 4]  226 	xor	a,a
   0E3D                     227 00247$:
   0E3D DD 77 FB      [19]  228 	ld	-5 (ix), a
   0E40 DD 7E 08      [19]  229 	ld	a, 8 (ix)
   0E43 4F            [ 4]  230 	ld	c, a
   0E44 87            [ 4]  231 	add	a, a
   0E45 87            [ 4]  232 	add	a, a
   0E46 87            [ 4]  233 	add	a, a
   0E47 81            [ 4]  234 	add	a, c
   0E48 DD 77 F9      [19]  235 	ld	-7 (ix), a
   0E4B DD 7E FC      [19]  236 	ld	a, -4 (ix)
   0E4E DD 77 F7      [19]  237 	ld	-9 (ix), a
   0E51 DD 7E FD      [19]  238 	ld	a, -3 (ix)
   0E54 DD 77 F8      [19]  239 	ld	-8 (ix), a
   0E57 DD 36 F3 00   [19]  240 	ld	-13 (ix), #0x00
   0E5B                     241 00133$:
   0E5B DD 7E FA      [19]  242 	ld	a, -6 (ix)
   0E5E B7            [ 4]  243 	or	a, a
   0E5F CA 00 10      [10]  244 	jp	Z, 00138$
                            245 ;src/text/text.c:145: if ((character == 33) ||                        // !
   0E62 DD 7E FA      [19]  246 	ld	a, -6 (ix)
   0E65 D6 21         [ 7]  247 	sub	a, #0x21
   0E67 20 04         [12]  248 	jr	NZ,00248$
   0E69 3E 01         [ 7]  249 	ld	a,#0x01
   0E6B 18 01         [12]  250 	jr	00249$
   0E6D                     251 00248$:
   0E6D AF            [ 4]  252 	xor	a,a
   0E6E                     253 00249$:
   0E6E 4F            [ 4]  254 	ld	c,a
   0E6F B7            [ 4]  255 	or	a, a
   0E70 20 2C         [12]  256 	jr	NZ,00125$
                            257 ;src/text/text.c:146: ((character > 43) && (character < 47)) ||   // ,-.
   0E72 3E 2B         [ 7]  258 	ld	a, #0x2b
   0E74 DD 96 FA      [19]  259 	sub	a, -6 (ix)
   0E77 30 07         [12]  260 	jr	NC,00130$
   0E79 DD 7E FA      [19]  261 	ld	a, -6 (ix)
   0E7C D6 2F         [ 7]  262 	sub	a, #0x2f
   0E7E 38 1E         [12]  263 	jr	C,00125$
   0E80                     264 00130$:
                            265 ;src/text/text.c:147: ((character > 47) && (character < 59)) ||   // 0123456789:
   0E80 3E 2F         [ 7]  266 	ld	a, #0x2f
   0E82 DD 96 FA      [19]  267 	sub	a, -6 (ix)
   0E85 30 07         [12]  268 	jr	NC,00132$
   0E87 DD 7E FA      [19]  269 	ld	a, -6 (ix)
   0E8A D6 3B         [ 7]  270 	sub	a, #0x3b
   0E8C 38 10         [12]  271 	jr	C,00125$
   0E8E                     272 00132$:
                            273 ;src/text/text.c:148: ((character > 62) && (character < 91)))     // ABCDEFGHIJKLMNOPQRSTUVWXYZ
   0E8E 3E 3E         [ 7]  274 	ld	a, #0x3e
   0E90 DD 96 FA      [19]  275 	sub	a, -6 (ix)
   0E93 D2 E6 0F      [10]  276 	jp	NC, 00126$
   0E96 DD 7E FA      [19]  277 	ld	a, -6 (ix)
   0E99 D6 5B         [ 7]  278 	sub	a, #0x5b
   0E9B D2 E6 0F      [10]  279 	jp	NC, 00126$
   0E9E                     280 00125$:
                            281 ;src/text/text.c:152: switch (character)
   0E9E 79            [ 4]  282 	ld	a, c
   0E9F B7            [ 4]  283 	or	a, a
   0EA0 20 64         [12]  284 	jr	NZ,00101$
   0EA2 DD 7E FA      [19]  285 	ld	a, -6 (ix)
   0EA5 D6 2C         [ 7]  286 	sub	a, #0x2c
   0EA7 28 63         [12]  287 	jr	Z,00104$
   0EA9 DD 7E FA      [19]  288 	ld	a, -6 (ix)
   0EAC D6 2D         [ 7]  289 	sub	a, #0x2d
   0EAE 28 5C         [12]  290 	jr	Z,00104$
   0EB0 DD 7E FA      [19]  291 	ld	a, -6 (ix)
   0EB3 D6 2E         [ 7]  292 	sub	a, #0x2e
   0EB5 28 55         [12]  293 	jr	Z,00104$
   0EB7 DD 7E FA      [19]  294 	ld	a, -6 (ix)
   0EBA D6 30         [ 7]  295 	sub	a, #0x30
   0EBC 28 58         [12]  296 	jr	Z,00115$
   0EBE DD 7E FA      [19]  297 	ld	a, -6 (ix)
   0EC1 D6 31         [ 7]  298 	sub	a, #0x31
   0EC3 28 51         [12]  299 	jr	Z,00115$
   0EC5 DD 7E FA      [19]  300 	ld	a, -6 (ix)
   0EC8 D6 32         [ 7]  301 	sub	a, #0x32
   0ECA 28 4A         [12]  302 	jr	Z,00115$
   0ECC DD 7E FA      [19]  303 	ld	a, -6 (ix)
   0ECF D6 33         [ 7]  304 	sub	a, #0x33
   0ED1 28 43         [12]  305 	jr	Z,00115$
   0ED3 DD 7E FA      [19]  306 	ld	a, -6 (ix)
   0ED6 D6 34         [ 7]  307 	sub	a, #0x34
   0ED8 28 3C         [12]  308 	jr	Z,00115$
   0EDA DD 7E FA      [19]  309 	ld	a, -6 (ix)
   0EDD D6 35         [ 7]  310 	sub	a, #0x35
   0EDF 28 35         [12]  311 	jr	Z,00115$
   0EE1 DD 7E FA      [19]  312 	ld	a, -6 (ix)
   0EE4 D6 36         [ 7]  313 	sub	a, #0x36
   0EE6 28 2E         [12]  314 	jr	Z,00115$
   0EE8 DD 7E FA      [19]  315 	ld	a, -6 (ix)
   0EEB D6 37         [ 7]  316 	sub	a, #0x37
   0EED 28 27         [12]  317 	jr	Z,00115$
   0EEF DD 7E FA      [19]  318 	ld	a, -6 (ix)
   0EF2 D6 38         [ 7]  319 	sub	a, #0x38
   0EF4 28 20         [12]  320 	jr	Z,00115$
   0EF6 DD 7E FA      [19]  321 	ld	a, -6 (ix)
   0EF9 D6 39         [ 7]  322 	sub	a, #0x39
   0EFB 28 19         [12]  323 	jr	Z,00115$
   0EFD DD 7E FA      [19]  324 	ld	a, -6 (ix)
   0F00 D6 3A         [ 7]  325 	sub	a, #0x3a
   0F02 28 12         [12]  326 	jr	Z,00115$
   0F04 18 1C         [12]  327 	jr	00116$
                            328 ;src/text/text.c:155: case 33:
   0F06                     329 00101$:
                            330 ;src/text/text.c:156: character = 48;
   0F06 DD 36 FA 30   [19]  331 	ld	-6 (ix), #0x30
                            332 ;src/text/text.c:157: break;
   0F0A 18 16         [12]  333 	jr	00116$
                            334 ;src/text/text.c:162: case 46:
   0F0C                     335 00104$:
                            336 ;src/text/text.c:163: character += 5;
   0F0C DD 7E FA      [19]  337 	ld	a, -6 (ix)
   0F0F C6 05         [ 7]  338 	add	a, #0x05
   0F11 DD 77 FA      [19]  339 	ld	-6 (ix), a
                            340 ;src/text/text.c:164: break;
   0F14 18 0C         [12]  341 	jr	00116$
                            342 ;src/text/text.c:177: case 58:
   0F16                     343 00115$:
                            344 ;src/text/text.c:178: character += 4;
   0F16 DD 34 FA      [23]  345 	inc	-6 (ix)
   0F19 DD 34 FA      [23]  346 	inc	-6 (ix)
   0F1C DD 34 FA      [23]  347 	inc	-6 (ix)
   0F1F DD 34 FA      [23]  348 	inc	-6 (ix)
                            349 ;src/text/text.c:180: }
   0F22                     350 00116$:
                            351 ;src/text/text.c:183: character -= 48;
   0F22 DD 7E FA      [19]  352 	ld	a, -6 (ix)
   0F25 C6 D0         [ 7]  353 	add	a, #0xd0
   0F27 4F            [ 4]  354 	ld	c, a
                            355 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   0F28 06 00         [ 7]  356 	ld	b,#0x00
   0F2A 69            [ 4]  357 	ld	l, c
   0F2B 60            [ 4]  358 	ld	h, b
   0F2C 29            [11]  359 	add	hl, hl
   0F2D 29            [11]  360 	add	hl, hl
   0F2E 29            [11]  361 	add	hl, hl
   0F2F 09            [11]  362 	add	hl, bc
   0F30 45            [ 4]  363 	ld	b, l
   0F31 54            [ 4]  364 	ld	d, h
   0F32 1E 00         [ 7]  365 	ld	e, #0x00
   0F34                     366 00136$:
                            367 ;src/text/text.c:188: pChar = (u8 *)s_fonts_1 + (character * 9) + i;
   0F34 3E 40         [ 7]  368 	ld	a, #<(_s_fonts_1)
   0F36 80            [ 4]  369 	add	a, b
   0F37 6F            [ 4]  370 	ld	l, a
   0F38 3E 00         [ 7]  371 	ld	a, #>(_s_fonts_1)
   0F3A 8A            [ 4]  372 	adc	a, d
   0F3B 67            [ 4]  373 	ld	h, a
   0F3C 7D            [ 4]  374 	ld	a, l
   0F3D 83            [ 4]  375 	add	a, e
   0F3E 6F            [ 4]  376 	ld	l, a
   0F3F 7C            [ 4]  377 	ld	a, h
   0F40 CE 00         [ 7]  378 	adc	a, #0x00
   0F42 67            [ 4]  379 	ld	h, a
   0F43 33            [ 6]  380 	inc	sp
   0F44 33            [ 6]  381 	inc	sp
   0F45 E5            [11]  382 	push	hl
                            383 ;src/text/text.c:193: colorchar[i] = *pChar;
   0F46 E1            [10]  384 	pop	hl
   0F47 E5            [11]  385 	push	hl
   0F48 7E            [ 7]  386 	ld	a, (hl)
   0F49 DD 77 F6      [19]  387 	ld	-10 (ix), a
                            388 ;src/text/text.c:190: if (size == 1)
   0F4C DD 7E FB      [19]  389 	ld	a, -5 (ix)
   0F4F B7            [ 4]  390 	or	a, a
   0F50 28 11         [12]  391 	jr	Z,00118$
                            392 ;src/text/text.c:193: colorchar[i] = *pChar;
   0F52 DD 7E F4      [19]  393 	ld	a, -12 (ix)
   0F55 83            [ 4]  394 	add	a, e
   0F56 6F            [ 4]  395 	ld	l, a
   0F57 DD 7E F5      [19]  396 	ld	a, -11 (ix)
   0F5A CE 00         [ 7]  397 	adc	a, #0x00
   0F5C 67            [ 4]  398 	ld	h, a
   0F5D DD 7E F6      [19]  399 	ld	a, -10 (ix)
   0F60 77            [ 7]  400 	ld	(hl), a
   0F61 18 46         [12]  401 	jr	00137$
   0F63                     402 00118$:
                            403 ;src/text/text.c:198: pos = (i * size) - (i % FONT_1_W);
   0F63 D5            [11]  404 	push	de
   0F64 C5            [11]  405 	push	bc
   0F65 DD 66 08      [19]  406 	ld	h, 8 (ix)
   0F68 2E 00         [ 7]  407 	ld	l, #0x00
   0F6A 55            [ 4]  408 	ld	d, l
   0F6B 06 08         [ 7]  409 	ld	b, #0x08
   0F6D                     410 00264$:
   0F6D 29            [11]  411 	add	hl, hl
   0F6E 30 01         [12]  412 	jr	NC,00265$
   0F70 19            [11]  413 	add	hl, de
   0F71                     414 00265$:
   0F71 10 FA         [13]  415 	djnz	00264$
   0F73 C1            [10]  416 	pop	bc
   0F74 D1            [10]  417 	pop	de
   0F75 26 00         [ 7]  418 	ld	h, #0x00
   0F77 7D            [ 4]  419 	ld	a, l
   0F78 94            [ 4]  420 	sub	a, h
   0F79 DD 77 CE      [19]  421 	ld	-50 (ix), a
                            422 ;src/text/text.c:200: colorchar[pos] = *pChar;
   0F7C DD 7E FC      [19]  423 	ld	a, -4 (ix)
   0F7F DD 86 CE      [19]  424 	add	a, -50 (ix)
   0F82 6F            [ 4]  425 	ld	l, a
   0F83 DD 7E FD      [19]  426 	ld	a, -3 (ix)
   0F86 CE 00         [ 7]  427 	adc	a, #0x00
   0F88 67            [ 4]  428 	ld	h, a
   0F89 DD 7E F6      [19]  429 	ld	a, -10 (ix)
   0F8C 77            [ 7]  430 	ld	(hl), a
                            431 ;src/text/text.c:201: colorchar[pos + FONT_1_W] = *pChar;
   0F8D DD 6E CE      [19]  432 	ld	l, -50 (ix)
   0F90 2C            [ 4]  433 	inc	l
   0F91 E5            [11]  434 	push	hl
   0F92 DD 6E FC      [19]  435 	ld	l, -4 (ix)
   0F95 DD 66 FD      [19]  436 	ld	h, -3 (ix)
   0F98 E5            [11]  437 	push	hl
   0F99 FD E1         [14]  438 	pop	iy
   0F9B E1            [10]  439 	pop	hl
   0F9C C5            [11]  440 	push	bc
   0F9D 4D            [ 4]  441 	ld	c,l
   0F9E 06 00         [ 7]  442 	ld	b,#0x00
   0FA0 FD 09         [15]  443 	add	iy, bc
   0FA2 C1            [10]  444 	pop	bc
   0FA3 E1            [10]  445 	pop	hl
   0FA4 E5            [11]  446 	push	hl
   0FA5 6E            [ 7]  447 	ld	l, (hl)
   0FA6 FD 75 00      [19]  448 	ld	0 (iy), l
   0FA9                     449 00137$:
                            450 ;src/text/text.c:186: for (i = 0; i < 9; i++)
   0FA9 1C            [ 4]  451 	inc	e
   0FAA 7B            [ 4]  452 	ld	a, e
   0FAB D6 09         [ 7]  453 	sub	a, #0x09
   0FAD 38 85         [12]  454 	jr	C,00136$
                            455 ;src/text/text.c:205: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
   0FAF C5            [11]  456 	push	bc
   0FB0 DD 66 07      [19]  457 	ld	h, 7 (ix)
   0FB3 DD 6E 06      [19]  458 	ld	l, 6 (ix)
   0FB6 E5            [11]  459 	push	hl
   0FB7 21 00 80      [10]  460 	ld	hl, #0x8000
   0FBA E5            [11]  461 	push	hl
   0FBB CD B8 16      [17]  462 	call	_cpct_getScreenPtr
   0FBE C1            [10]  463 	pop	bc
                            464 ;src/text/text.c:209: cpct_drawSprite(colorchar, pvideo, FONT_1_W, FONT_H * size);
   0FBF E5            [11]  465 	push	hl
   0FC0 FD E1         [14]  466 	pop	iy
   0FC2 DD 5E F7      [19]  467 	ld	e,-9 (ix)
   0FC5 DD 56 F8      [19]  468 	ld	d,-8 (ix)
   0FC8 C5            [11]  469 	push	bc
   0FC9 DD 46 F9      [19]  470 	ld	b, -7 (ix)
   0FCC 0E 01         [ 7]  471 	ld	c,#0x01
   0FCE C5            [11]  472 	push	bc
   0FCF FD E5         [15]  473 	push	iy
   0FD1 D5            [11]  474 	push	de
   0FD2 CD 03 14      [17]  475 	call	_cpct_drawSprite
   0FD5 C1            [10]  476 	pop	bc
                            477 ;src/text/text.c:212: if (character == 48 || character == 60 || character == 57)
   0FD6 79            [ 4]  478 	ld	a,c
   0FD7 FE 30         [ 7]  479 	cp	a,#0x30
   0FD9 28 08         [12]  480 	jr	Z,00121$
   0FDB FE 3C         [ 7]  481 	cp	a,#0x3c
   0FDD 28 04         [12]  482 	jr	Z,00121$
   0FDF D6 39         [ 7]  483 	sub	a, #0x39
   0FE1 20 03         [12]  484 	jr	NZ,00126$
   0FE3                     485 00121$:
                            486 ;src/text/text.c:213: xPos--;
   0FE3 DD 35 06      [23]  487 	dec	6 (ix)
   0FE6                     488 00126$:
                            489 ;src/text/text.c:215: character = text[++x];
   0FE6 DD 34 F3      [23]  490 	inc	-13 (ix)
   0FE9 DD 7E FE      [19]  491 	ld	a, -2 (ix)
   0FEC DD 86 F3      [19]  492 	add	a, -13 (ix)
   0FEF 6F            [ 4]  493 	ld	l, a
   0FF0 DD 7E FF      [19]  494 	ld	a, -1 (ix)
   0FF3 CE 00         [ 7]  495 	adc	a, #0x00
   0FF5 67            [ 4]  496 	ld	h, a
   0FF6 7E            [ 7]  497 	ld	a, (hl)
   0FF7 DD 77 FA      [19]  498 	ld	-6 (ix), a
                            499 ;src/text/text.c:216: xPos += FONT_1_W;
   0FFA DD 34 06      [23]  500 	inc	6 (ix)
   0FFD C3 5B 0E      [10]  501 	jp	00133$
   1000                     502 00138$:
   1000 DD F9         [10]  503 	ld	sp, ix
   1002 DD E1         [14]  504 	pop	ix
   1004 C9            [10]  505 	ret
                            506 ;src/text/text.c:232: void drawText(u8 *text, u8 xPos, u8 yPos, u8 color, u8 size)
                            507 ;	---------------------------------
                            508 ; Function drawText
                            509 ; ---------------------------------
   1005                     510 _drawText::
   1005 DD E5         [15]  511 	push	ix
   1007 DD 21 00 00   [14]  512 	ld	ix,#0
   100B DD 39         [15]  513 	add	ix,sp
   100D 21 B2 FF      [10]  514 	ld	hl, #-78
   1010 39            [11]  515 	add	hl, sp
   1011 F9            [ 6]  516 	ld	sp, hl
                            517 ;src/text/text.c:245: color1 = swapColors[color][0];
   1012 01 75 0D      [10]  518 	ld	bc, #_swapColors+0
   1015 DD 6E 08      [19]  519 	ld	l, 8 (ix)
   1018 26 00         [ 7]  520 	ld	h, #0x00
   101A 29            [11]  521 	add	hl, hl
   101B 29            [11]  522 	add	hl, hl
   101C 09            [11]  523 	add	hl, bc
   101D E5            [11]  524 	push	hl
   101E FD E1         [14]  525 	pop	iy
   1020 FD 7E 00      [19]  526 	ld	a, 0 (iy)
   1023 DD 77 B2      [19]  527 	ld	-78 (ix), a
                            528 ;src/text/text.c:246: color2 = swapColors[color][1];
   1026 FD E5         [15]  529 	push	iy
   1028 E1            [10]  530 	pop	hl
   1029 23            [ 6]  531 	inc	hl
   102A 7E            [ 7]  532 	ld	a, (hl)
   102B DD 77 DC      [19]  533 	ld	-36 (ix), a
                            534 ;src/text/text.c:247: color3 = swapColors[color][2];
   102E FD E5         [15]  535 	push	iy
   1030 E1            [10]  536 	pop	hl
   1031 23            [ 6]  537 	inc	hl
   1032 23            [ 6]  538 	inc	hl
   1033 7E            [ 7]  539 	ld	a, (hl)
   1034 DD 77 DB      [19]  540 	ld	-37 (ix), a
                            541 ;src/text/text.c:248: color4 = swapColors[color][3];
   1037 FD 7E 03      [19]  542 	ld	a, 3 (iy)
   103A DD 77 DA      [19]  543 	ld	-38 (ix), a
                            544 ;src/text/text.c:253: character = text[x];
   103D DD 7E 04      [19]  545 	ld	a, 4 (ix)
   1040 DD 77 EA      [19]  546 	ld	-22 (ix), a
   1043 DD 7E 05      [19]  547 	ld	a, 5 (ix)
   1046 DD 77 EB      [19]  548 	ld	-21 (ix), a
   1049 DD 6E EA      [19]  549 	ld	l,-22 (ix)
   104C DD 66 EB      [19]  550 	ld	h,-21 (ix)
   104F 7E            [ 7]  551 	ld	a, (hl)
   1050 DD 77 EE      [19]  552 	ld	-18 (ix), a
                            553 ;src/text/text.c:255: while (character != '\0')
   1053 21 01 00      [10]  554 	ld	hl, #0x0001
   1056 39            [11]  555 	add	hl, sp
   1057 DD 75 F1      [19]  556 	ld	-15 (ix), l
   105A DD 74 F2      [19]  557 	ld	-14 (ix), h
   105D DD 7E F1      [19]  558 	ld	a, -15 (ix)
   1060 DD 77 E6      [19]  559 	ld	-26 (ix), a
   1063 DD 7E F2      [19]  560 	ld	a, -14 (ix)
   1066 DD 77 E7      [19]  561 	ld	-25 (ix), a
   1069 DD 7E F1      [19]  562 	ld	a, -15 (ix)
   106C DD 77 E8      [19]  563 	ld	-24 (ix), a
   106F DD 7E F2      [19]  564 	ld	a, -14 (ix)
   1072 DD 77 E9      [19]  565 	ld	-23 (ix), a
   1075 DD 7E F1      [19]  566 	ld	a, -15 (ix)
   1078 DD 77 E0      [19]  567 	ld	-32 (ix), a
   107B DD 7E F2      [19]  568 	ld	a, -14 (ix)
   107E DD 77 E1      [19]  569 	ld	-31 (ix), a
   1081 DD 7E F1      [19]  570 	ld	a, -15 (ix)
   1084 DD 77 E2      [19]  571 	ld	-30 (ix), a
   1087 DD 7E F2      [19]  572 	ld	a, -14 (ix)
   108A DD 77 E3      [19]  573 	ld	-29 (ix), a
   108D DD 7E F1      [19]  574 	ld	a, -15 (ix)
   1090 DD 77 E4      [19]  575 	ld	-28 (ix), a
   1093 DD 7E F2      [19]  576 	ld	a, -14 (ix)
   1096 DD 77 E5      [19]  577 	ld	-27 (ix), a
   1099 DD 7E F1      [19]  578 	ld	a, -15 (ix)
   109C DD 77 EF      [19]  579 	ld	-17 (ix), a
   109F DD 7E F2      [19]  580 	ld	a, -14 (ix)
   10A2 DD 77 F0      [19]  581 	ld	-16 (ix), a
   10A5 DD 7E F1      [19]  582 	ld	a, -15 (ix)
   10A8 DD 77 DD      [19]  583 	ld	-35 (ix), a
   10AB DD 7E F2      [19]  584 	ld	a, -14 (ix)
   10AE DD 77 DE      [19]  585 	ld	-34 (ix), a
   10B1 DD 7E F1      [19]  586 	ld	a, -15 (ix)
   10B4 DD 77 F8      [19]  587 	ld	-8 (ix), a
   10B7 DD 7E F2      [19]  588 	ld	a, -14 (ix)
   10BA DD 77 F9      [19]  589 	ld	-7 (ix), a
   10BD DD 7E F1      [19]  590 	ld	a, -15 (ix)
   10C0 DD 77 EC      [19]  591 	ld	-20 (ix), a
   10C3 DD 7E F2      [19]  592 	ld	a, -14 (ix)
   10C6 DD 77 ED      [19]  593 	ld	-19 (ix), a
   10C9 DD 7E 09      [19]  594 	ld	a, 9 (ix)
   10CC 3D            [ 4]  595 	dec	a
   10CD 20 04         [12]  596 	jr	NZ,00297$
   10CF 3E 01         [ 7]  597 	ld	a,#0x01
   10D1 18 01         [12]  598 	jr	00298$
   10D3                     599 00297$:
   10D3 AF            [ 4]  600 	xor	a,a
   10D4                     601 00298$:
   10D4 DD 77 DF      [19]  602 	ld	-33 (ix), a
   10D7 DD 7E 09      [19]  603 	ld	a, 9 (ix)
   10DA 4F            [ 4]  604 	ld	c, a
   10DB 87            [ 4]  605 	add	a, a
   10DC 87            [ 4]  606 	add	a, a
   10DD 87            [ 4]  607 	add	a, a
   10DE 81            [ 4]  608 	add	a, c
   10DF DD 77 F5      [19]  609 	ld	-11 (ix), a
   10E2 DD 7E F1      [19]  610 	ld	a, -15 (ix)
   10E5 DD 77 FB      [19]  611 	ld	-5 (ix), a
   10E8 DD 7E F2      [19]  612 	ld	a, -14 (ix)
   10EB DD 77 FC      [19]  613 	ld	-4 (ix), a
   10EE DD 36 D7 00   [19]  614 	ld	-41 (ix), #0x00
   10F2                     615 00156$:
   10F2 DD 7E EE      [19]  616 	ld	a, -18 (ix)
   10F5 B7            [ 4]  617 	or	a, a
   10F6 CA CF 13      [10]  618 	jp	Z, 00161$
                            619 ;src/text/text.c:259: if ((character == 33) || ((character > 43) && (character < 47)) ||
   10F9 DD 7E EE      [19]  620 	ld	a, -18 (ix)
   10FC D6 21         [ 7]  621 	sub	a, #0x21
   10FE 20 04         [12]  622 	jr	NZ,00299$
   1100 3E 01         [ 7]  623 	ld	a,#0x01
   1102 18 01         [12]  624 	jr	00300$
   1104                     625 00299$:
   1104 AF            [ 4]  626 	xor	a,a
   1105                     627 00300$:
   1105 4F            [ 4]  628 	ld	c,a
   1106 B7            [ 4]  629 	or	a, a
   1107 20 2C         [12]  630 	jr	NZ,00148$
   1109 3E 2B         [ 7]  631 	ld	a, #0x2b
   110B DD 96 EE      [19]  632 	sub	a, -18 (ix)
   110E 30 07         [12]  633 	jr	NC,00153$
   1110 DD 7E EE      [19]  634 	ld	a, -18 (ix)
   1113 D6 2F         [ 7]  635 	sub	a, #0x2f
   1115 38 1E         [12]  636 	jr	C,00148$
   1117                     637 00153$:
                            638 ;src/text/text.c:260: ((character > 47) && (character < 58)) || ((character > 62) && (character < 91)))
   1117 3E 2F         [ 7]  639 	ld	a, #0x2f
   1119 DD 96 EE      [19]  640 	sub	a, -18 (ix)
   111C 30 07         [12]  641 	jr	NC,00155$
   111E DD 7E EE      [19]  642 	ld	a, -18 (ix)
   1121 D6 3A         [ 7]  643 	sub	a, #0x3a
   1123 38 10         [12]  644 	jr	C,00148$
   1125                     645 00155$:
   1125 3E 3E         [ 7]  646 	ld	a, #0x3e
   1127 DD 96 EE      [19]  647 	sub	a, -18 (ix)
   112A D2 B2 13      [10]  648 	jp	NC, 00149$
   112D DD 7E EE      [19]  649 	ld	a, -18 (ix)
   1130 D6 5B         [ 7]  650 	sub	a, #0x5b
   1132 D2 B2 13      [10]  651 	jp	NC, 00149$
   1135                     652 00148$:
                            653 ;src/text/text.c:264: switch (character)
   1135 79            [ 4]  654 	ld	a, c
   1136 B7            [ 4]  655 	or	a, a
   1137 20 5D         [12]  656 	jr	NZ,00101$
   1139 DD 7E EE      [19]  657 	ld	a, -18 (ix)
   113C D6 2C         [ 7]  658 	sub	a, #0x2c
   113E 28 5C         [12]  659 	jr	Z,00104$
   1140 DD 7E EE      [19]  660 	ld	a, -18 (ix)
   1143 D6 2D         [ 7]  661 	sub	a, #0x2d
   1145 28 55         [12]  662 	jr	Z,00104$
   1147 DD 7E EE      [19]  663 	ld	a, -18 (ix)
   114A D6 2E         [ 7]  664 	sub	a, #0x2e
   114C 28 4E         [12]  665 	jr	Z,00104$
   114E DD 7E EE      [19]  666 	ld	a, -18 (ix)
   1151 D6 30         [ 7]  667 	sub	a, #0x30
   1153 28 51         [12]  668 	jr	Z,00114$
   1155 DD 7E EE      [19]  669 	ld	a, -18 (ix)
   1158 D6 31         [ 7]  670 	sub	a, #0x31
   115A 28 4A         [12]  671 	jr	Z,00114$
   115C DD 7E EE      [19]  672 	ld	a, -18 (ix)
   115F D6 32         [ 7]  673 	sub	a, #0x32
   1161 28 43         [12]  674 	jr	Z,00114$
   1163 DD 7E EE      [19]  675 	ld	a, -18 (ix)
   1166 D6 33         [ 7]  676 	sub	a, #0x33
   1168 28 3C         [12]  677 	jr	Z,00114$
   116A DD 7E EE      [19]  678 	ld	a, -18 (ix)
   116D D6 34         [ 7]  679 	sub	a, #0x34
   116F 28 35         [12]  680 	jr	Z,00114$
   1171 DD 7E EE      [19]  681 	ld	a, -18 (ix)
   1174 D6 35         [ 7]  682 	sub	a, #0x35
   1176 28 2E         [12]  683 	jr	Z,00114$
   1178 DD 7E EE      [19]  684 	ld	a, -18 (ix)
   117B D6 36         [ 7]  685 	sub	a, #0x36
   117D 28 27         [12]  686 	jr	Z,00114$
   117F DD 7E EE      [19]  687 	ld	a, -18 (ix)
   1182 D6 37         [ 7]  688 	sub	a, #0x37
   1184 28 20         [12]  689 	jr	Z,00114$
   1186 DD 7E EE      [19]  690 	ld	a, -18 (ix)
   1189 D6 38         [ 7]  691 	sub	a, #0x38
   118B 28 19         [12]  692 	jr	Z,00114$
   118D DD 7E EE      [19]  693 	ld	a, -18 (ix)
   1190 D6 39         [ 7]  694 	sub	a, #0x39
   1192 28 12         [12]  695 	jr	Z,00114$
   1194 18 18         [12]  696 	jr	00115$
                            697 ;src/text/text.c:267: case 33:
   1196                     698 00101$:
                            699 ;src/text/text.c:268: character = 49;
   1196 DD 36 EE 31   [19]  700 	ld	-18 (ix), #0x31
                            701 ;src/text/text.c:269: break;
   119A 18 12         [12]  702 	jr	00115$
                            703 ;src/text/text.c:274: case 46:
   119C                     704 00104$:
                            705 ;src/text/text.c:275: character += 6;
   119C DD 7E EE      [19]  706 	ld	a, -18 (ix)
   119F C6 06         [ 7]  707 	add	a, #0x06
   11A1 DD 77 EE      [19]  708 	ld	-18 (ix), a
                            709 ;src/text/text.c:276: break;
   11A4 18 08         [12]  710 	jr	00115$
                            711 ;src/text/text.c:288: case 57:
   11A6                     712 00114$:
                            713 ;src/text/text.c:289: character += 5;
   11A6 DD 7E EE      [19]  714 	ld	a, -18 (ix)
   11A9 C6 05         [ 7]  715 	add	a, #0x05
   11AB DD 77 EE      [19]  716 	ld	-18 (ix), a
                            717 ;src/text/text.c:291: }
   11AE                     718 00115$:
                            719 ;src/text/text.c:294: character -= 49;
   11AE DD 7E EE      [19]  720 	ld	a, -18 (ix)
   11B1 C6 CF         [ 7]  721 	add	a, #0xcf
   11B3 4F            [ 4]  722 	ld	c, a
                            723 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   11B4 06 00         [ 7]  724 	ld	b,#0x00
   11B6 69            [ 4]  725 	ld	l, c
   11B7 60            [ 4]  726 	ld	h, b
   11B8 29            [11]  727 	add	hl, hl
   11B9 29            [11]  728 	add	hl, hl
   11BA 29            [11]  729 	add	hl, hl
   11BB 09            [11]  730 	add	hl, bc
   11BC 29            [11]  731 	add	hl, hl
   11BD EB            [ 4]  732 	ex	de,hl
   11BE 06 00         [ 7]  733 	ld	b, #0x00
   11C0                     734 00159$:
                            735 ;src/text/text.c:299: pChar = (u8 *)s_fonts_0 + (character * 18) + i;
   11C0 21 C7 01      [10]  736 	ld	hl, #_s_fonts_0
   11C3 19            [11]  737 	add	hl, de
   11C4 7D            [ 4]  738 	ld	a, l
   11C5 80            [ 4]  739 	add	a, b
   11C6 6F            [ 4]  740 	ld	l, a
   11C7 7C            [ 4]  741 	ld	a, h
   11C8 CE 00         [ 7]  742 	adc	a, #0x00
   11CA 67            [ 4]  743 	ld	h, a
                            744 ;src/text/text.c:304: if (*pChar == 0x55)
   11CB DD 75 D8      [19]  745 	ld	-40 (ix), l
   11CE DD 74 D9      [19]  746 	ld	-39 (ix), h
   11D1 7E            [ 7]  747 	ld	a, (hl)
   11D2 DD 77 FA      [19]  748 	ld	-6 (ix), a
   11D5 D6 55         [ 7]  749 	sub	a, #0x55
   11D7 20 04         [12]  750 	jr	NZ,00314$
   11D9 3E 01         [ 7]  751 	ld	a,#0x01
   11DB 18 01         [12]  752 	jr	00315$
   11DD                     753 00314$:
   11DD AF            [ 4]  754 	xor	a,a
   11DE                     755 00315$:
   11DE DD 77 F4      [19]  756 	ld	-12 (ix), a
                            757 ;src/text/text.c:306: else if (*pChar == 0xee)
   11E1 DD 7E FA      [19]  758 	ld	a, -6 (ix)
   11E4 D6 EE         [ 7]  759 	sub	a, #0xee
   11E6 20 04         [12]  760 	jr	NZ,00316$
   11E8 3E 01         [ 7]  761 	ld	a,#0x01
   11EA 18 01         [12]  762 	jr	00317$
   11EC                     763 00316$:
   11EC AF            [ 4]  764 	xor	a,a
   11ED                     765 00317$:
   11ED DD 77 F3      [19]  766 	ld	-13 (ix), a
                            767 ;src/text/text.c:308: else if (*pChar == 0xdd)
   11F0 DD 7E FA      [19]  768 	ld	a, -6 (ix)
   11F3 D6 DD         [ 7]  769 	sub	a, #0xdd
   11F5 20 04         [12]  770 	jr	NZ,00318$
   11F7 3E 01         [ 7]  771 	ld	a,#0x01
   11F9 18 01         [12]  772 	jr	00319$
   11FB                     773 00318$:
   11FB AF            [ 4]  774 	xor	a,a
   11FC                     775 00319$:
   11FC DD 77 FF      [19]  776 	ld	-1 (ix), a
                            777 ;src/text/text.c:310: else if (*pChar == 0xff)
   11FF DD 7E FA      [19]  778 	ld	a, -6 (ix)
   1202 3C            [ 4]  779 	inc	a
   1203 20 04         [12]  780 	jr	NZ,00320$
   1205 3E 01         [ 7]  781 	ld	a,#0x01
   1207 18 01         [12]  782 	jr	00321$
   1209                     783 00320$:
   1209 AF            [ 4]  784 	xor	a,a
   120A                     785 00321$:
   120A DD 77 FE      [19]  786 	ld	-2 (ix), a
                            787 ;src/text/text.c:301: if (size == 1)
   120D DD 7E DF      [19]  788 	ld	a, -33 (ix)
   1210 B7            [ 4]  789 	or	a, a
   1211 28 72         [12]  790 	jr	Z,00141$
                            791 ;src/text/text.c:304: if (*pChar == 0x55)
   1213 DD 7E F4      [19]  792 	ld	a, -12 (ix)
   1216 B7            [ 4]  793 	or	a, a
   1217 28 12         [12]  794 	jr	Z,00126$
                            795 ;src/text/text.c:305: colorchar[i] = color1;
   1219 DD 7E EC      [19]  796 	ld	a, -20 (ix)
   121C 80            [ 4]  797 	add	a, b
   121D 6F            [ 4]  798 	ld	l, a
   121E DD 7E ED      [19]  799 	ld	a, -19 (ix)
   1221 CE 00         [ 7]  800 	adc	a, #0x00
   1223 67            [ 4]  801 	ld	h, a
   1224 DD 7E B2      [19]  802 	ld	a, -78 (ix)
   1227 77            [ 7]  803 	ld	(hl), a
   1228 C3 74 13      [10]  804 	jp	00160$
   122B                     805 00126$:
                            806 ;src/text/text.c:306: else if (*pChar == 0xee)
   122B DD 7E F3      [19]  807 	ld	a, -13 (ix)
   122E B7            [ 4]  808 	or	a, a
   122F 28 12         [12]  809 	jr	Z,00123$
                            810 ;src/text/text.c:307: colorchar[i] = color2;
   1231 DD 7E F8      [19]  811 	ld	a, -8 (ix)
   1234 80            [ 4]  812 	add	a, b
   1235 6F            [ 4]  813 	ld	l, a
   1236 DD 7E F9      [19]  814 	ld	a, -7 (ix)
   1239 CE 00         [ 7]  815 	adc	a, #0x00
   123B 67            [ 4]  816 	ld	h, a
   123C DD 7E DC      [19]  817 	ld	a, -36 (ix)
   123F 77            [ 7]  818 	ld	(hl), a
   1240 C3 74 13      [10]  819 	jp	00160$
   1243                     820 00123$:
                            821 ;src/text/text.c:308: else if (*pChar == 0xdd)
   1243 DD 7E FF      [19]  822 	ld	a, -1 (ix)
   1246 B7            [ 4]  823 	or	a, a
   1247 28 12         [12]  824 	jr	Z,00120$
                            825 ;src/text/text.c:309: colorchar[i] = color3;
   1249 DD 7E DD      [19]  826 	ld	a, -35 (ix)
   124C 80            [ 4]  827 	add	a, b
   124D 6F            [ 4]  828 	ld	l, a
   124E DD 7E DE      [19]  829 	ld	a, -34 (ix)
   1251 CE 00         [ 7]  830 	adc	a, #0x00
   1253 67            [ 4]  831 	ld	h, a
   1254 DD 7E DB      [19]  832 	ld	a, -37 (ix)
   1257 77            [ 7]  833 	ld	(hl), a
   1258 C3 74 13      [10]  834 	jp	00160$
   125B                     835 00120$:
                            836 ;src/text/text.c:310: else if (*pChar == 0xff)
   125B DD 7E FE      [19]  837 	ld	a, -2 (ix)
   125E B7            [ 4]  838 	or	a, a
   125F 28 12         [12]  839 	jr	Z,00117$
                            840 ;src/text/text.c:311: colorchar[i] = color4;
   1261 DD 7E EF      [19]  841 	ld	a, -17 (ix)
   1264 80            [ 4]  842 	add	a, b
   1265 6F            [ 4]  843 	ld	l, a
   1266 DD 7E F0      [19]  844 	ld	a, -16 (ix)
   1269 CE 00         [ 7]  845 	adc	a, #0x00
   126B 67            [ 4]  846 	ld	h, a
   126C DD 7E DA      [19]  847 	ld	a, -38 (ix)
   126F 77            [ 7]  848 	ld	(hl), a
   1270 C3 74 13      [10]  849 	jp	00160$
   1273                     850 00117$:
                            851 ;src/text/text.c:313: colorchar[i] = *pChar;
   1273 DD 7E E4      [19]  852 	ld	a, -28 (ix)
   1276 80            [ 4]  853 	add	a, b
   1277 6F            [ 4]  854 	ld	l, a
   1278 DD 7E E5      [19]  855 	ld	a, -27 (ix)
   127B CE 00         [ 7]  856 	adc	a, #0x00
   127D 67            [ 4]  857 	ld	h, a
   127E DD 7E FA      [19]  858 	ld	a, -6 (ix)
   1281 77            [ 7]  859 	ld	(hl), a
   1282 C3 74 13      [10]  860 	jp	00160$
   1285                     861 00141$:
                            862 ;src/text/text.c:319: pos = (i * size) - (i % FONT_0_W);
   1285 D5            [11]  863 	push	de
   1286 C5            [11]  864 	push	bc
   1287 DD 5E 09      [19]  865 	ld	e, 9 (ix)
   128A 60            [ 4]  866 	ld	h, b
   128B 2E 00         [ 7]  867 	ld	l, #0x00
   128D 55            [ 4]  868 	ld	d, l
   128E 06 08         [ 7]  869 	ld	b, #0x08
   1290                     870 00322$:
   1290 29            [11]  871 	add	hl, hl
   1291 30 01         [12]  872 	jr	NC,00323$
   1293 19            [11]  873 	add	hl, de
   1294                     874 00323$:
   1294 10 FA         [13]  875 	djnz	00322$
   1296 C1            [10]  876 	pop	bc
   1297 D1            [10]  877 	pop	de
   1298 78            [ 4]  878 	ld	a, b
   1299 E6 01         [ 7]  879 	and	a, #0x01
   129B 67            [ 4]  880 	ld	h, a
   129C 7D            [ 4]  881 	ld	a, l
   129D 94            [ 4]  882 	sub	a, h
                            883 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   129E 6F            [ 4]  884 	ld	l,a
   129F C6 02         [ 7]  885 	add	a, #0x02
   12A1 DD 77 FD      [19]  886 	ld	-3 (ix), a
                            887 ;src/text/text.c:321: if (*pChar == 0x55)
   12A4 DD 7E F4      [19]  888 	ld	a, -12 (ix)
   12A7 B7            [ 4]  889 	or	a, a
   12A8 28 23         [12]  890 	jr	Z,00138$
                            891 ;src/text/text.c:323: colorchar[pos] = color1;
   12AA DD 7E E2      [19]  892 	ld	a, -30 (ix)
   12AD 85            [ 4]  893 	add	a, l
   12AE 6F            [ 4]  894 	ld	l, a
   12AF DD 7E E3      [19]  895 	ld	a, -29 (ix)
   12B2 CE 00         [ 7]  896 	adc	a, #0x00
   12B4 67            [ 4]  897 	ld	h, a
   12B5 DD 7E B2      [19]  898 	ld	a, -78 (ix)
   12B8 77            [ 7]  899 	ld	(hl), a
                            900 ;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
   12B9 DD 7E E2      [19]  901 	ld	a, -30 (ix)
   12BC DD 86 FD      [19]  902 	add	a, -3 (ix)
   12BF 6F            [ 4]  903 	ld	l, a
   12C0 DD 7E E3      [19]  904 	ld	a, -29 (ix)
   12C3 CE 00         [ 7]  905 	adc	a, #0x00
   12C5 67            [ 4]  906 	ld	h, a
   12C6 DD 7E B2      [19]  907 	ld	a, -78 (ix)
   12C9 77            [ 7]  908 	ld	(hl), a
   12CA C3 74 13      [10]  909 	jp	00160$
   12CD                     910 00138$:
                            911 ;src/text/text.c:326: else if (*pChar == 0xee)
   12CD DD 7E F3      [19]  912 	ld	a, -13 (ix)
   12D0 B7            [ 4]  913 	or	a, a
   12D1 28 23         [12]  914 	jr	Z,00135$
                            915 ;src/text/text.c:328: colorchar[pos] = color2;
   12D3 DD 7E E0      [19]  916 	ld	a, -32 (ix)
   12D6 85            [ 4]  917 	add	a, l
   12D7 6F            [ 4]  918 	ld	l, a
   12D8 DD 7E E1      [19]  919 	ld	a, -31 (ix)
   12DB CE 00         [ 7]  920 	adc	a, #0x00
   12DD 67            [ 4]  921 	ld	h, a
   12DE DD 7E DC      [19]  922 	ld	a, -36 (ix)
   12E1 77            [ 7]  923 	ld	(hl), a
                            924 ;src/text/text.c:329: colorchar[pos + FONT_0_W] = color2;
   12E2 DD 7E E0      [19]  925 	ld	a, -32 (ix)
   12E5 DD 86 FD      [19]  926 	add	a, -3 (ix)
   12E8 6F            [ 4]  927 	ld	l, a
   12E9 DD 7E E1      [19]  928 	ld	a, -31 (ix)
   12EC CE 00         [ 7]  929 	adc	a, #0x00
   12EE 67            [ 4]  930 	ld	h, a
   12EF DD 7E DC      [19]  931 	ld	a, -36 (ix)
   12F2 77            [ 7]  932 	ld	(hl), a
   12F3 C3 74 13      [10]  933 	jp	00160$
   12F6                     934 00135$:
                            935 ;src/text/text.c:331: else if (*pChar == 0xdd)
   12F6 DD 7E FF      [19]  936 	ld	a, -1 (ix)
   12F9 B7            [ 4]  937 	or	a, a
   12FA 28 22         [12]  938 	jr	Z,00132$
                            939 ;src/text/text.c:333: colorchar[pos] = color3;
   12FC DD 7E E8      [19]  940 	ld	a, -24 (ix)
   12FF 85            [ 4]  941 	add	a, l
   1300 6F            [ 4]  942 	ld	l, a
   1301 DD 7E E9      [19]  943 	ld	a, -23 (ix)
   1304 CE 00         [ 7]  944 	adc	a, #0x00
   1306 67            [ 4]  945 	ld	h, a
   1307 DD 7E DB      [19]  946 	ld	a, -37 (ix)
   130A 77            [ 7]  947 	ld	(hl), a
                            948 ;src/text/text.c:334: colorchar[pos + FONT_0_W] = color3;
   130B DD 7E E8      [19]  949 	ld	a, -24 (ix)
   130E DD 86 FD      [19]  950 	add	a, -3 (ix)
   1311 6F            [ 4]  951 	ld	l, a
   1312 DD 7E E9      [19]  952 	ld	a, -23 (ix)
   1315 CE 00         [ 7]  953 	adc	a, #0x00
   1317 67            [ 4]  954 	ld	h, a
   1318 DD 7E DB      [19]  955 	ld	a, -37 (ix)
   131B 77            [ 7]  956 	ld	(hl), a
   131C 18 56         [12]  957 	jr	00160$
   131E                     958 00132$:
                            959 ;src/text/text.c:336: else if (*pChar == 0xff)
   131E DD 7E FE      [19]  960 	ld	a, -2 (ix)
   1321 B7            [ 4]  961 	or	a, a
   1322 28 22         [12]  962 	jr	Z,00129$
                            963 ;src/text/text.c:338: colorchar[pos] = color4;
   1324 DD 7E E6      [19]  964 	ld	a, -26 (ix)
   1327 85            [ 4]  965 	add	a, l
   1328 6F            [ 4]  966 	ld	l, a
   1329 DD 7E E7      [19]  967 	ld	a, -25 (ix)
   132C CE 00         [ 7]  968 	adc	a, #0x00
   132E 67            [ 4]  969 	ld	h, a
   132F DD 7E DA      [19]  970 	ld	a, -38 (ix)
   1332 77            [ 7]  971 	ld	(hl), a
                            972 ;src/text/text.c:339: colorchar[pos + FONT_0_W] = color4;
   1333 DD 7E E6      [19]  973 	ld	a, -26 (ix)
   1336 DD 86 FD      [19]  974 	add	a, -3 (ix)
   1339 6F            [ 4]  975 	ld	l, a
   133A DD 7E E7      [19]  976 	ld	a, -25 (ix)
   133D CE 00         [ 7]  977 	adc	a, #0x00
   133F 67            [ 4]  978 	ld	h, a
   1340 DD 7E DA      [19]  979 	ld	a, -38 (ix)
   1343 77            [ 7]  980 	ld	(hl), a
   1344 18 2E         [12]  981 	jr	00160$
   1346                     982 00129$:
                            983 ;src/text/text.c:343: colorchar[pos] = *pChar;
   1346 DD 7E F1      [19]  984 	ld	a, -15 (ix)
   1349 85            [ 4]  985 	add	a, l
   134A 6F            [ 4]  986 	ld	l, a
   134B DD 7E F2      [19]  987 	ld	a, -14 (ix)
   134E CE 00         [ 7]  988 	adc	a, #0x00
   1350 67            [ 4]  989 	ld	h, a
   1351 DD 7E FA      [19]  990 	ld	a, -6 (ix)
   1354 77            [ 7]  991 	ld	(hl), a
                            992 ;src/text/text.c:344: colorchar[pos + FONT_0_W] = *pChar;
   1355 DD 7E F1      [19]  993 	ld	a, -15 (ix)
   1358 DD 86 FD      [19]  994 	add	a, -3 (ix)
   135B DD 77 F6      [19]  995 	ld	-10 (ix), a
   135E DD 7E F2      [19]  996 	ld	a, -14 (ix)
   1361 CE 00         [ 7]  997 	adc	a, #0x00
   1363 DD 77 F7      [19]  998 	ld	-9 (ix), a
   1366 DD 6E D8      [19]  999 	ld	l,-40 (ix)
   1369 DD 66 D9      [19] 1000 	ld	h,-39 (ix)
   136C 7E            [ 7] 1001 	ld	a, (hl)
   136D DD 6E F6      [19] 1002 	ld	l,-10 (ix)
   1370 DD 66 F7      [19] 1003 	ld	h,-9 (ix)
   1373 77            [ 7] 1004 	ld	(hl), a
   1374                    1005 00160$:
                           1006 ;src/text/text.c:297: for (i = 0; i < 18; i++)
   1374 04            [ 4] 1007 	inc	b
   1375 78            [ 4] 1008 	ld	a, b
   1376 D6 12         [ 7] 1009 	sub	a, #0x12
   1378 DA C0 11      [10] 1010 	jp	C, 00159$
                           1011 ;src/text/text.c:349: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
   137B C5            [11] 1012 	push	bc
   137C DD 66 07      [19] 1013 	ld	h, 7 (ix)
   137F DD 6E 06      [19] 1014 	ld	l, 6 (ix)
   1382 E5            [11] 1015 	push	hl
   1383 21 00 80      [10] 1016 	ld	hl, #0x8000
   1386 E5            [11] 1017 	push	hl
   1387 CD B8 16      [17] 1018 	call	_cpct_getScreenPtr
   138A C1            [10] 1019 	pop	bc
                           1020 ;src/text/text.c:353: cpct_drawSprite(colorchar, pvideo, FONT_0_W, FONT_H * size);
   138B E5            [11] 1021 	push	hl
   138C FD E1         [14] 1022 	pop	iy
   138E DD 5E FB      [19] 1023 	ld	e,-5 (ix)
   1391 DD 56 FC      [19] 1024 	ld	d,-4 (ix)
   1394 C5            [11] 1025 	push	bc
   1395 DD 46 F5      [19] 1026 	ld	b, -11 (ix)
   1398 0E 02         [ 7] 1027 	ld	c,#0x02
   139A C5            [11] 1028 	push	bc
   139B FD E5         [15] 1029 	push	iy
   139D D5            [11] 1030 	push	de
   139E CD 03 14      [17] 1031 	call	_cpct_drawSprite
   13A1 C1            [10] 1032 	pop	bc
                           1033 ;src/text/text.c:356: if (character == 48 || character == 60 || character == 57)
   13A2 79            [ 4] 1034 	ld	a,c
   13A3 FE 30         [ 7] 1035 	cp	a,#0x30
   13A5 28 08         [12] 1036 	jr	Z,00144$
   13A7 FE 3C         [ 7] 1037 	cp	a,#0x3c
   13A9 28 04         [12] 1038 	jr	Z,00144$
   13AB D6 39         [ 7] 1039 	sub	a, #0x39
   13AD 20 03         [12] 1040 	jr	NZ,00149$
   13AF                    1041 00144$:
                           1042 ;src/text/text.c:357: xPos--;
   13AF DD 35 06      [23] 1043 	dec	6 (ix)
   13B2                    1044 00149$:
                           1045 ;src/text/text.c:359: character = text[++x];
   13B2 DD 34 D7      [23] 1046 	inc	-41 (ix)
   13B5 DD 7E EA      [19] 1047 	ld	a, -22 (ix)
   13B8 DD 86 D7      [19] 1048 	add	a, -41 (ix)
   13BB 6F            [ 4] 1049 	ld	l, a
   13BC DD 7E EB      [19] 1050 	ld	a, -21 (ix)
   13BF CE 00         [ 7] 1051 	adc	a, #0x00
   13C1 67            [ 4] 1052 	ld	h, a
   13C2 7E            [ 7] 1053 	ld	a, (hl)
   13C3 DD 77 EE      [19] 1054 	ld	-18 (ix), a
                           1055 ;src/text/text.c:360: xPos += FONT_0_W;
   13C6 DD 34 06      [23] 1056 	inc	6 (ix)
   13C9 DD 34 06      [23] 1057 	inc	6 (ix)
   13CC C3 F2 10      [10] 1058 	jp	00156$
   13CF                    1059 00161$:
   13CF DD F9         [10] 1060 	ld	sp, ix
   13D1 DD E1         [14] 1061 	pop	ix
   13D3 C9            [10] 1062 	ret
                           1063 	.area _CODE
                           1064 	.area _INITIALIZER
                           1065 	.area _CABS (ABS)
