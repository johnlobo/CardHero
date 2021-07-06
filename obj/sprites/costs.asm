;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module costs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _s_costs_5
	.globl _s_costs_4
	.globl _s_costs_3
	.globl _s_costs_2
	.globl _s_costs_1
	.globl _s_costs_0
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
	.area _CODE
_s_costs_0:
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
	.db #0xf5	; 245
	.db #0xf0	; 240
_s_costs_1:
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xfa	; 250
_s_costs_2:
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf5	; 245
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
_s_costs_3:
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
_s_costs_4:
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
_s_costs_5:
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xfa	; 250
	.db #0xff	; 255
	.db #0xfa	; 250
	.area _INITIALIZER
	.area _CABS (ABS)
