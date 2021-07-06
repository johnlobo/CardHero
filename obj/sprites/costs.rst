                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module costs
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _s_costs_5
                             12 	.globl _s_costs_4
                             13 	.globl _s_costs_3
                             14 	.globl _s_costs_2
                             15 	.globl _s_costs_1
                             16 	.globl _s_costs_0
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _INITIALIZED
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 	.area _CODE
   01C7                      49 _s_costs_0:
   01C7 F5                   50 	.db #0xf5	; 245
   01C8 F0                   51 	.db #0xf0	; 240
   01C9 F5                   52 	.db #0xf5	; 245
   01CA F0                   53 	.db #0xf0	; 240
   01CB F5                   54 	.db #0xf5	; 245
   01CC F0                   55 	.db #0xf0	; 240
   01CD F5                   56 	.db #0xf5	; 245
   01CE F0                   57 	.db #0xf0	; 240
   01CF F5                   58 	.db #0xf5	; 245
   01D0 F0                   59 	.db #0xf0	; 240
   01D1 F5                   60 	.db #0xf5	; 245
   01D2 F0                   61 	.db #0xf0	; 240
   01D3                      62 _s_costs_1:
   01D3 FF                   63 	.db #0xff	; 255
   01D4 FA                   64 	.db #0xfa	; 250
   01D5 F0                   65 	.db #0xf0	; 240
   01D6 FA                   66 	.db #0xfa	; 250
   01D7 FF                   67 	.db #0xff	; 255
   01D8 FA                   68 	.db #0xfa	; 250
   01D9 FA                   69 	.db #0xfa	; 250
   01DA F0                   70 	.db #0xf0	; 240
   01DB FA                   71 	.db #0xfa	; 250
   01DC F0                   72 	.db #0xf0	; 240
   01DD FF                   73 	.db #0xff	; 255
   01DE FA                   74 	.db #0xfa	; 250
   01DF                      75 _s_costs_2:
   01DF FF                   76 	.db #0xff	; 255
   01E0 FA                   77 	.db #0xfa	; 250
   01E1 F0                   78 	.db #0xf0	; 240
   01E2 FA                   79 	.db #0xfa	; 250
   01E3 F0                   80 	.db #0xf0	; 240
   01E4 FA                   81 	.db #0xfa	; 250
   01E5 F5                   82 	.db #0xf5	; 245
   01E6 FA                   83 	.db #0xfa	; 250
   01E7 F0                   84 	.db #0xf0	; 240
   01E8 FA                   85 	.db #0xfa	; 250
   01E9 FF                   86 	.db #0xff	; 255
   01EA FA                   87 	.db #0xfa	; 250
   01EB                      88 _s_costs_3:
   01EB FA                   89 	.db #0xfa	; 250
   01EC FA                   90 	.db #0xfa	; 250
   01ED FA                   91 	.db #0xfa	; 250
   01EE FA                   92 	.db #0xfa	; 250
   01EF FA                   93 	.db #0xfa	; 250
   01F0 FA                   94 	.db #0xfa	; 250
   01F1 FF                   95 	.db #0xff	; 255
   01F2 FA                   96 	.db #0xfa	; 250
   01F3 F0                   97 	.db #0xf0	; 240
   01F4 FA                   98 	.db #0xfa	; 250
   01F5 F0                   99 	.db #0xf0	; 240
   01F6 FA                  100 	.db #0xfa	; 250
   01F7                     101 _s_costs_4:
   01F7 FF                  102 	.db #0xff	; 255
   01F8 FA                  103 	.db #0xfa	; 250
   01F9 FA                  104 	.db #0xfa	; 250
   01FA F0                  105 	.db #0xf0	; 240
   01FB FF                  106 	.db #0xff	; 255
   01FC FA                  107 	.db #0xfa	; 250
   01FD F0                  108 	.db #0xf0	; 240
   01FE FA                  109 	.db #0xfa	; 250
   01FF F0                  110 	.db #0xf0	; 240
   0200 FA                  111 	.db #0xfa	; 250
   0201 FF                  112 	.db #0xff	; 255
   0202 FA                  113 	.db #0xfa	; 250
   0203                     114 _s_costs_5:
   0203 FF                  115 	.db #0xff	; 255
   0204 FA                  116 	.db #0xfa	; 250
   0205 FA                  117 	.db #0xfa	; 250
   0206 F0                  118 	.db #0xf0	; 240
   0207 FF                  119 	.db #0xff	; 255
   0208 FA                  120 	.db #0xfa	; 250
   0209 FA                  121 	.db #0xfa	; 250
   020A FA                  122 	.db #0xfa	; 250
   020B FA                  123 	.db #0xfa	; 250
   020C FA                  124 	.db #0xfa	; 250
   020D FF                  125 	.db #0xff	; 255
   020E FA                  126 	.db #0xfa	; 250
                            127 	.area _INITIALIZER
                            128 	.area _CABS (ABS)
