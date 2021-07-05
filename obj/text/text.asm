;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module text
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _swapColors
	.globl _strLength
	.globl _strCopy
	.globl _strCmp
	.globl _drawTextM1
	.globl _drawText
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/text/text.c:53: u8 strLength(u8 str[])
;	---------------------------------
; Function strLength
; ---------------------------------
_strLength::
;src/text/text.c:58: while (str[result] != '\0')
	ld	c, #0x00
00101$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z,00103$
;src/text/text.c:60: result++;
	inc	c
	jr	00101$
00103$:
;src/text/text.c:62: return result;
	ld	l, c
	ret
_swapColors:
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0x6c	; 108	'l'
	.db #0x9c	; 156
	.db #0x3c	; 60
	.db #0x50	; 80	'P'
	.db #0xe4	; 228
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0x11	; 17
	.db #0x66	; 102	'f'
	.db #0x99	; 153
	.db #0x33	; 51	'3'
	.db #0x10	; 16
	.db #0x35	; 53	'5'
	.db #0x3a	; 58
	.db #0x30	; 48	'0'
	.db #0x45	; 69	'E'
	.db #0xce	; 206
	.db #0xcd	; 205
	.db #0xcf	; 207
;src/text/text.c:75: void strCopy(u8 source[], u8 dest[])
;	---------------------------------
; Function strCopy
; ---------------------------------
_strCopy::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/text/text.c:78: while ((dest[i] = source[i]) != '\0')
	ld	c, #0x00
00101$:
	ld	a, 6 (ix)
	add	a, c
	ld	e, a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	d, a
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
	or	a, a
	jr	Z,00104$
;src/text/text.c:80: i++;
	inc	c
	jr	00101$
00104$:
	pop	ix
	ret
;src/text/text.c:94: u8 strCmp(u8 str1[], u8 str2[])
;	---------------------------------
; Function strCmp
; ---------------------------------
_strCmp::
;src/text/text.c:99: while ((str1[i] == str2[i]) && ((str1[i] != '\0') && (str2[i] != '\0')))
	ld	c, #0x00
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	add	a, c
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	d, a
	ld	a, b
	sub	a, d
	jr	NZ,00132$
	ld	a,#0x01
	jr	00133$
00132$:
	xor	a,a
00133$:
	ld	e,a
	or	a, a
	jr	Z,00105$
	ld	a, b
	or	a, a
	jr	Z,00105$
	ld	a, d
	or	a, a
	jr	Z,00105$
;src/text/text.c:101: i++;
	inc	c
	jr	00103$
00105$:
;src/text/text.c:103: if (str1[i] == str2[i])
	ld	a, e
	or	a, a
	jr	Z,00107$
;src/text/text.c:105: return YES;
	ld	l, #0x01
	ret
00107$:
;src/text/text.c:109: return NO;
	ld	l, #0x00
	ret
;src/text/text.c:125: void drawTextM1(u8 *text, u8 xPos, u8 yPos, u8 size)
;	---------------------------------
; Function drawTextM1
; ---------------------------------
_drawTextM1::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-52
	add	hl, sp
	ld	sp, hl
;src/text/text.c:140: character = text[x];
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
;src/text/text.c:142: while (character != '\0')
	ld	hl, #0x0003
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00246$
	ld	a,#0x01
	jr	00247$
00246$:
	xor	a,a
00247$:
	ld	-5 (ix), a
	ld	a, 8 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-9 (ix), a
	ld	a, -3 (ix)
	ld	-8 (ix), a
	ld	-13 (ix), #0x00
00133$:
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00138$
;src/text/text.c:145: if ((character == 33) ||                        // !
	ld	a, -6 (ix)
	sub	a, #0x21
	jr	NZ,00248$
	ld	a,#0x01
	jr	00249$
00248$:
	xor	a,a
00249$:
	ld	c,a
	or	a, a
	jr	NZ,00125$
;src/text/text.c:146: ((character > 43) && (character < 47)) ||   // ,-.
	ld	a, #0x2b
	sub	a, -6 (ix)
	jr	NC,00130$
	ld	a, -6 (ix)
	sub	a, #0x2f
	jr	C,00125$
00130$:
;src/text/text.c:147: ((character > 47) && (character < 59)) ||   // 0123456789:
	ld	a, #0x2f
	sub	a, -6 (ix)
	jr	NC,00132$
	ld	a, -6 (ix)
	sub	a, #0x3b
	jr	C,00125$
00132$:
;src/text/text.c:148: ((character > 62) && (character < 91)))     // ABCDEFGHIJKLMNOPQRSTUVWXYZ
	ld	a, #0x3e
	sub	a, -6 (ix)
	jp	NC, 00126$
	ld	a, -6 (ix)
	sub	a, #0x5b
	jp	NC, 00126$
00125$:
;src/text/text.c:152: switch (character)
	ld	a, c
	or	a, a
	jr	NZ,00101$
	ld	a, -6 (ix)
	sub	a, #0x2c
	jr	Z,00104$
	ld	a, -6 (ix)
	sub	a, #0x2d
	jr	Z,00104$
	ld	a, -6 (ix)
	sub	a, #0x2e
	jr	Z,00104$
	ld	a, -6 (ix)
	sub	a, #0x30
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x31
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x32
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x33
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x34
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x35
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x36
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x37
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x38
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x39
	jr	Z,00115$
	ld	a, -6 (ix)
	sub	a, #0x3a
	jr	Z,00115$
	jr	00116$
;src/text/text.c:155: case 33:
00101$:
;src/text/text.c:156: character = 48;
	ld	-6 (ix), #0x30
;src/text/text.c:157: break;
	jr	00116$
;src/text/text.c:162: case 46:
00104$:
;src/text/text.c:163: character += 5;
	ld	a, -6 (ix)
	add	a, #0x05
	ld	-6 (ix), a
;src/text/text.c:164: break;
	jr	00116$
;src/text/text.c:177: case 58:
00115$:
;src/text/text.c:178: character += 4;
	inc	-6 (ix)
	inc	-6 (ix)
	inc	-6 (ix)
	inc	-6 (ix)
;src/text/text.c:180: }
00116$:
;src/text/text.c:183: character -= 48;
	ld	a, -6 (ix)
	add	a, #0xd0
	ld	c, a
;src/text/text.c:186: for (i = 0; i < 9; i++)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	b, l
	ld	d, h
	ld	e, #0x00
00136$:
;src/text/text.c:188: pChar = (u8 *)s_fonts_1 + (character * 9) + i;
	ld	a, #<(_s_fonts_1)
	add	a, b
	ld	l, a
	ld	a, #>(_s_fonts_1)
	adc	a, d
	ld	h, a
	ld	a, l
	add	a, e
	ld	l, a
	ld	a, h
	adc	a, #0x00
	ld	h, a
	inc	sp
	inc	sp
	push	hl
;src/text/text.c:193: colorchar[i] = *pChar;
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-10 (ix), a
;src/text/text.c:190: if (size == 1)
	ld	a, -5 (ix)
	or	a, a
	jr	Z,00118$
;src/text/text.c:193: colorchar[i] = *pChar;
	ld	a, -12 (ix)
	add	a, e
	ld	l, a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -10 (ix)
	ld	(hl), a
	jr	00137$
00118$:
;src/text/text.c:198: pos = (i * size) - (i % FONT_1_W);
	push	de
	push	bc
	ld	h, 8 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00264$:
	add	hl, hl
	jr	NC,00265$
	add	hl, de
00265$:
	djnz	00264$
	pop	bc
	pop	de
	ld	h, #0x00
	ld	a, l
	sub	a, h
	ld	-50 (ix), a
;src/text/text.c:200: colorchar[pos] = *pChar;
	ld	a, -4 (ix)
	add	a, -50 (ix)
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -10 (ix)
	ld	(hl), a
;src/text/text.c:201: colorchar[pos + FONT_1_W] = *pChar;
	ld	l, -50 (ix)
	inc	l
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	ld	c,l
	ld	b,#0x00
	add	iy, bc
	pop	bc
	pop	hl
	push	hl
	ld	l, (hl)
	ld	0 (iy), l
00137$:
;src/text/text.c:186: for (i = 0; i < 9; i++)
	inc	e
	ld	a, e
	sub	a, #0x09
	jr	C,00136$
;src/text/text.c:205: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
	push	bc
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/text/text.c:209: cpct_drawSprite(colorchar, pvideo, FONT_1_W, FONT_H * size);
	push	hl
	pop	iy
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	push	bc
	ld	b, -7 (ix)
	ld	c,#0x01
	push	bc
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
;src/text/text.c:212: if (character == 48 || character == 60 || character == 57)
	ld	a,c
	cp	a,#0x30
	jr	Z,00121$
	cp	a,#0x3c
	jr	Z,00121$
	sub	a, #0x39
	jr	NZ,00126$
00121$:
;src/text/text.c:213: xPos--;
	dec	6 (ix)
00126$:
;src/text/text.c:215: character = text[++x];
	inc	-13 (ix)
	ld	a, -2 (ix)
	add	a, -13 (ix)
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-6 (ix), a
;src/text/text.c:216: xPos += FONT_1_W;
	inc	6 (ix)
	jp	00133$
00138$:
	ld	sp, ix
	pop	ix
	ret
;src/text/text.c:232: void drawText(u8 *text, u8 xPos, u8 yPos, u8 color, u8 size)
;	---------------------------------
; Function drawText
; ---------------------------------
_drawText::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-78
	add	hl, sp
	ld	sp, hl
;src/text/text.c:245: color1 = swapColors[color][0];
	ld	bc, #_swapColors+0
	ld	l, 8 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	pop	iy
	ld	a, 0 (iy)
	ld	-78 (ix), a
;src/text/text.c:246: color2 = swapColors[color][1];
	push	iy
	pop	hl
	inc	hl
	ld	a, (hl)
	ld	-36 (ix), a
;src/text/text.c:247: color3 = swapColors[color][2];
	push	iy
	pop	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-37 (ix), a
;src/text/text.c:248: color4 = swapColors[color][3];
	ld	a, 3 (iy)
	ld	-38 (ix), a
;src/text/text.c:253: character = text[x];
	ld	a, 4 (ix)
	ld	-22 (ix), a
	ld	a, 5 (ix)
	ld	-21 (ix), a
	ld	l,-22 (ix)
	ld	h,-21 (ix)
	ld	a, (hl)
	ld	-18 (ix), a
;src/text/text.c:255: while (character != '\0')
	ld	hl, #0x0001
	add	hl, sp
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, -15 (ix)
	ld	-26 (ix), a
	ld	a, -14 (ix)
	ld	-25 (ix), a
	ld	a, -15 (ix)
	ld	-24 (ix), a
	ld	a, -14 (ix)
	ld	-23 (ix), a
	ld	a, -15 (ix)
	ld	-32 (ix), a
	ld	a, -14 (ix)
	ld	-31 (ix), a
	ld	a, -15 (ix)
	ld	-30 (ix), a
	ld	a, -14 (ix)
	ld	-29 (ix), a
	ld	a, -15 (ix)
	ld	-28 (ix), a
	ld	a, -14 (ix)
	ld	-27 (ix), a
	ld	a, -15 (ix)
	ld	-17 (ix), a
	ld	a, -14 (ix)
	ld	-16 (ix), a
	ld	a, -15 (ix)
	ld	-35 (ix), a
	ld	a, -14 (ix)
	ld	-34 (ix), a
	ld	a, -15 (ix)
	ld	-8 (ix), a
	ld	a, -14 (ix)
	ld	-7 (ix), a
	ld	a, -15 (ix)
	ld	-20 (ix), a
	ld	a, -14 (ix)
	ld	-19 (ix), a
	ld	a, 9 (ix)
	dec	a
	jr	NZ,00297$
	ld	a,#0x01
	jr	00298$
00297$:
	xor	a,a
00298$:
	ld	-33 (ix), a
	ld	a, 9 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	-11 (ix), a
	ld	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, -14 (ix)
	ld	-4 (ix), a
	ld	-41 (ix), #0x00
00156$:
	ld	a, -18 (ix)
	or	a, a
	jp	Z, 00161$
;src/text/text.c:259: if ((character == 33) || ((character > 43) && (character < 47)) ||
	ld	a, -18 (ix)
	sub	a, #0x21
	jr	NZ,00299$
	ld	a,#0x01
	jr	00300$
00299$:
	xor	a,a
00300$:
	ld	c,a
	or	a, a
	jr	NZ,00148$
	ld	a, #0x2b
	sub	a, -18 (ix)
	jr	NC,00153$
	ld	a, -18 (ix)
	sub	a, #0x2f
	jr	C,00148$
00153$:
;src/text/text.c:260: ((character > 47) && (character < 58)) || ((character > 62) && (character < 91)))
	ld	a, #0x2f
	sub	a, -18 (ix)
	jr	NC,00155$
	ld	a, -18 (ix)
	sub	a, #0x3a
	jr	C,00148$
00155$:
	ld	a, #0x3e
	sub	a, -18 (ix)
	jp	NC, 00149$
	ld	a, -18 (ix)
	sub	a, #0x5b
	jp	NC, 00149$
00148$:
;src/text/text.c:264: switch (character)
	ld	a, c
	or	a, a
	jr	NZ,00101$
	ld	a, -18 (ix)
	sub	a, #0x2c
	jr	Z,00104$
	ld	a, -18 (ix)
	sub	a, #0x2d
	jr	Z,00104$
	ld	a, -18 (ix)
	sub	a, #0x2e
	jr	Z,00104$
	ld	a, -18 (ix)
	sub	a, #0x30
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x31
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x32
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x33
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x34
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x35
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x36
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x37
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x38
	jr	Z,00114$
	ld	a, -18 (ix)
	sub	a, #0x39
	jr	Z,00114$
	jr	00115$
;src/text/text.c:267: case 33:
00101$:
;src/text/text.c:268: character = 49;
	ld	-18 (ix), #0x31
;src/text/text.c:269: break;
	jr	00115$
;src/text/text.c:274: case 46:
00104$:
;src/text/text.c:275: character += 6;
	ld	a, -18 (ix)
	add	a, #0x06
	ld	-18 (ix), a
;src/text/text.c:276: break;
	jr	00115$
;src/text/text.c:288: case 57:
00114$:
;src/text/text.c:289: character += 5;
	ld	a, -18 (ix)
	add	a, #0x05
	ld	-18 (ix), a
;src/text/text.c:291: }
00115$:
;src/text/text.c:294: character -= 49;
	ld	a, -18 (ix)
	add	a, #0xcf
	ld	c, a
;src/text/text.c:297: for (i = 0; i < 18; i++)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de,hl
	ld	b, #0x00
00159$:
;src/text/text.c:299: pChar = (u8 *)s_fonts_0 + (character * 18) + i;
	ld	hl, #_s_fonts_0
	add	hl, de
	ld	a, l
	add	a, b
	ld	l, a
	ld	a, h
	adc	a, #0x00
	ld	h, a
;src/text/text.c:304: if (*pChar == 0x55)
	ld	-40 (ix), l
	ld	-39 (ix), h
	ld	a, (hl)
	ld	-6 (ix), a
	sub	a, #0x55
	jr	NZ,00314$
	ld	a,#0x01
	jr	00315$
00314$:
	xor	a,a
00315$:
	ld	-12 (ix), a
;src/text/text.c:306: else if (*pChar == 0xee)
	ld	a, -6 (ix)
	sub	a, #0xee
	jr	NZ,00316$
	ld	a,#0x01
	jr	00317$
00316$:
	xor	a,a
00317$:
	ld	-13 (ix), a
;src/text/text.c:308: else if (*pChar == 0xdd)
	ld	a, -6 (ix)
	sub	a, #0xdd
	jr	NZ,00318$
	ld	a,#0x01
	jr	00319$
00318$:
	xor	a,a
00319$:
	ld	-1 (ix), a
;src/text/text.c:310: else if (*pChar == 0xff)
	ld	a, -6 (ix)
	inc	a
	jr	NZ,00320$
	ld	a,#0x01
	jr	00321$
00320$:
	xor	a,a
00321$:
	ld	-2 (ix), a
;src/text/text.c:301: if (size == 1)
	ld	a, -33 (ix)
	or	a, a
	jr	Z,00141$
;src/text/text.c:304: if (*pChar == 0x55)
	ld	a, -12 (ix)
	or	a, a
	jr	Z,00126$
;src/text/text.c:305: colorchar[i] = color1;
	ld	a, -20 (ix)
	add	a, b
	ld	l, a
	ld	a, -19 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -78 (ix)
	ld	(hl), a
	jp	00160$
00126$:
;src/text/text.c:306: else if (*pChar == 0xee)
	ld	a, -13 (ix)
	or	a, a
	jr	Z,00123$
;src/text/text.c:307: colorchar[i] = color2;
	ld	a, -8 (ix)
	add	a, b
	ld	l, a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -36 (ix)
	ld	(hl), a
	jp	00160$
00123$:
;src/text/text.c:308: else if (*pChar == 0xdd)
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00120$
;src/text/text.c:309: colorchar[i] = color3;
	ld	a, -35 (ix)
	add	a, b
	ld	l, a
	ld	a, -34 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -37 (ix)
	ld	(hl), a
	jp	00160$
00120$:
;src/text/text.c:310: else if (*pChar == 0xff)
	ld	a, -2 (ix)
	or	a, a
	jr	Z,00117$
;src/text/text.c:311: colorchar[i] = color4;
	ld	a, -17 (ix)
	add	a, b
	ld	l, a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -38 (ix)
	ld	(hl), a
	jp	00160$
00117$:
;src/text/text.c:313: colorchar[i] = *pChar;
	ld	a, -28 (ix)
	add	a, b
	ld	l, a
	ld	a, -27 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -6 (ix)
	ld	(hl), a
	jp	00160$
00141$:
;src/text/text.c:319: pos = (i * size) - (i % FONT_0_W);
	push	de
	push	bc
	ld	e, 9 (ix)
	ld	h, b
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00322$:
	add	hl, hl
	jr	NC,00323$
	add	hl, de
00323$:
	djnz	00322$
	pop	bc
	pop	de
	ld	a, b
	and	a, #0x01
	ld	h, a
	ld	a, l
	sub	a, h
;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
	ld	l,a
	add	a, #0x02
	ld	-3 (ix), a
;src/text/text.c:321: if (*pChar == 0x55)
	ld	a, -12 (ix)
	or	a, a
	jr	Z,00138$
;src/text/text.c:323: colorchar[pos] = color1;
	ld	a, -30 (ix)
	add	a, l
	ld	l, a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -78 (ix)
	ld	(hl), a
;src/text/text.c:324: colorchar[pos + FONT_0_W] = color1;
	ld	a, -30 (ix)
	add	a, -3 (ix)
	ld	l, a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -78 (ix)
	ld	(hl), a
	jp	00160$
00138$:
;src/text/text.c:326: else if (*pChar == 0xee)
	ld	a, -13 (ix)
	or	a, a
	jr	Z,00135$
;src/text/text.c:328: colorchar[pos] = color2;
	ld	a, -32 (ix)
	add	a, l
	ld	l, a
	ld	a, -31 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -36 (ix)
	ld	(hl), a
;src/text/text.c:329: colorchar[pos + FONT_0_W] = color2;
	ld	a, -32 (ix)
	add	a, -3 (ix)
	ld	l, a
	ld	a, -31 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -36 (ix)
	ld	(hl), a
	jp	00160$
00135$:
;src/text/text.c:331: else if (*pChar == 0xdd)
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00132$
;src/text/text.c:333: colorchar[pos] = color3;
	ld	a, -24 (ix)
	add	a, l
	ld	l, a
	ld	a, -23 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -37 (ix)
	ld	(hl), a
;src/text/text.c:334: colorchar[pos + FONT_0_W] = color3;
	ld	a, -24 (ix)
	add	a, -3 (ix)
	ld	l, a
	ld	a, -23 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -37 (ix)
	ld	(hl), a
	jr	00160$
00132$:
;src/text/text.c:336: else if (*pChar == 0xff)
	ld	a, -2 (ix)
	or	a, a
	jr	Z,00129$
;src/text/text.c:338: colorchar[pos] = color4;
	ld	a, -26 (ix)
	add	a, l
	ld	l, a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -38 (ix)
	ld	(hl), a
;src/text/text.c:339: colorchar[pos + FONT_0_W] = color4;
	ld	a, -26 (ix)
	add	a, -3 (ix)
	ld	l, a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -38 (ix)
	ld	(hl), a
	jr	00160$
00129$:
;src/text/text.c:343: colorchar[pos] = *pChar;
	ld	a, -15 (ix)
	add	a, l
	ld	l, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -6 (ix)
	ld	(hl), a
;src/text/text.c:344: colorchar[pos + FONT_0_W] = *pChar;
	ld	a, -15 (ix)
	add	a, -3 (ix)
	ld	-10 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l,-40 (ix)
	ld	h,-39 (ix)
	ld	a, (hl)
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	(hl), a
00160$:
;src/text/text.c:297: for (i = 0; i < 18; i++)
	inc	b
	ld	a, b
	sub	a, #0x12
	jp	C, 00159$
;src/text/text.c:349: pvideo = cpct_getScreenPtr((u8*)VM_START, xPos, yPos);
	push	bc
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	hl, #0x8000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/text/text.c:353: cpct_drawSprite(colorchar, pvideo, FONT_0_W, FONT_H * size);
	push	hl
	pop	iy
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	push	bc
	ld	b, -11 (ix)
	ld	c,#0x02
	push	bc
	push	iy
	push	de
	call	_cpct_drawSprite
	pop	bc
;src/text/text.c:356: if (character == 48 || character == 60 || character == 57)
	ld	a,c
	cp	a,#0x30
	jr	Z,00144$
	cp	a,#0x3c
	jr	Z,00144$
	sub	a, #0x39
	jr	NZ,00149$
00144$:
;src/text/text.c:357: xPos--;
	dec	6 (ix)
00149$:
;src/text/text.c:359: character = text[++x];
	inc	-41 (ix)
	ld	a, -22 (ix)
	add	a, -41 (ix)
	ld	l, a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-18 (ix), a
;src/text/text.c:360: xPos += FONT_0_W;
	inc	6 (ix)
	inc	6 (ix)
	jp	00156$
00161$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
