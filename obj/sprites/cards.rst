                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module cards
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _s_cards_1
                             12 	.globl _s_cards_0
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 	.area _CODE
   0503                      45 _s_cards_0:
   0503 14                   46 	.db #0x14	; 20
   0504 F0                   47 	.db #0xf0	; 240
   0505 A0                   48 	.db #0xa0	; 160
   0506 00                   49 	.db #0x00	; 0
   0507 00                   50 	.db #0x00	; 0
   0508 00                   51 	.db #0x00	; 0
   0509 00                   52 	.db #0x00	; 0
   050A 00                   53 	.db #0x00	; 0
   050B 78                   54 	.db #0x78	; 120	'x'
   050C F0                   55 	.db #0xf0	; 240
   050D F0                   56 	.db #0xf0	; 240
   050E FF                   57 	.db #0xff	; 255
   050F FF                   58 	.db #0xff	; 255
   0510 FF                   59 	.db #0xff	; 255
   0511 FF                   60 	.db #0xff	; 255
   0512 08                   61 	.db #0x08	; 8
   0513 F0                   62 	.db #0xf0	; 240
   0514 F0                   63 	.db #0xf0	; 240
   0515 F0                   64 	.db #0xf0	; 240
   0516 08                   65 	.db #0x08	; 8
   0517 00                   66 	.db #0x00	; 0
   0518 00                   67 	.db #0x00	; 0
   0519 00                   68 	.db #0x00	; 0
   051A AA                   69 	.db #0xaa	; 170
   051B F0                   70 	.db #0xf0	; 240
   051C F0                   71 	.db #0xf0	; 240
   051D F0                   72 	.db #0xf0	; 240
   051E 08                   73 	.db #0x08	; 8
   051F 00                   74 	.db #0x00	; 0
   0520 00                   75 	.db #0x00	; 0
   0521 00                   76 	.db #0x00	; 0
   0522 AA                   77 	.db #0xaa	; 170
   0523 F0                   78 	.db #0xf0	; 240
   0524 F0                   79 	.db #0xf0	; 240
   0525 F0                   80 	.db #0xf0	; 240
   0526 08                   81 	.db #0x08	; 8
   0527 00                   82 	.db #0x00	; 0
   0528 00                   83 	.db #0x00	; 0
   0529 00                   84 	.db #0x00	; 0
   052A AA                   85 	.db #0xaa	; 170
   052B F0                   86 	.db #0xf0	; 240
   052C F0                   87 	.db #0xf0	; 240
   052D F0                   88 	.db #0xf0	; 240
   052E 08                   89 	.db #0x08	; 8
   052F 00                   90 	.db #0x00	; 0
   0530 00                   91 	.db #0x00	; 0
   0531 00                   92 	.db #0x00	; 0
   0532 AA                   93 	.db #0xaa	; 170
   0533 F0                   94 	.db #0xf0	; 240
   0534 F0                   95 	.db #0xf0	; 240
   0535 F0                   96 	.db #0xf0	; 240
   0536 08                   97 	.db #0x08	; 8
   0537 00                   98 	.db #0x00	; 0
   0538 00                   99 	.db #0x00	; 0
   0539 00                  100 	.db #0x00	; 0
   053A AA                  101 	.db #0xaa	; 170
   053B 50                  102 	.db #0x50	; 80	'P'
   053C F0                  103 	.db #0xf0	; 240
   053D A4                  104 	.db #0xa4	; 164
   053E 00                  105 	.db #0x00	; 0
   053F 00                  106 	.db #0x00	; 0
   0540 00                  107 	.db #0x00	; 0
   0541 00                  108 	.db #0x00	; 0
   0542 AA                  109 	.db #0xaa	; 170
   0543 55                  110 	.db #0x55	; 85	'U'
   0544 0C                  111 	.db #0x0c	; 12
   0545 08                  112 	.db #0x08	; 8
   0546 00                  113 	.db #0x00	; 0
   0547 00                  114 	.db #0x00	; 0
   0548 00                  115 	.db #0x00	; 0
   0549 00                  116 	.db #0x00	; 0
   054A AA                  117 	.db #0xaa	; 170
   054B 55                  118 	.db #0x55	; 85	'U'
   054C 00                  119 	.db #0x00	; 0
   054D 00                  120 	.db #0x00	; 0
   054E 00                  121 	.db #0x00	; 0
   054F 00                  122 	.db #0x00	; 0
   0550 00                  123 	.db #0x00	; 0
   0551 00                  124 	.db #0x00	; 0
   0552 AA                  125 	.db #0xaa	; 170
   0553 55                  126 	.db #0x55	; 85	'U'
   0554 00                  127 	.db #0x00	; 0
   0555 00                  128 	.db #0x00	; 0
   0556 00                  129 	.db #0x00	; 0
   0557 00                  130 	.db #0x00	; 0
   0558 00                  131 	.db #0x00	; 0
   0559 00                  132 	.db #0x00	; 0
   055A AA                  133 	.db #0xaa	; 170
   055B 55                  134 	.db #0x55	; 85	'U'
   055C 00                  135 	.db #0x00	; 0
   055D AA                  136 	.db #0xaa	; 170
   055E 00                  137 	.db #0x00	; 0
   055F 00                  138 	.db #0x00	; 0
   0560 00                  139 	.db #0x00	; 0
   0561 00                  140 	.db #0x00	; 0
   0562 AA                  141 	.db #0xaa	; 170
   0563 55                  142 	.db #0x55	; 85	'U'
   0564 00                  143 	.db #0x00	; 0
   0565 0C                  144 	.db #0x0c	; 12
   0566 00                  145 	.db #0x00	; 0
   0567 00                  146 	.db #0x00	; 0
   0568 00                  147 	.db #0x00	; 0
   0569 00                  148 	.db #0x00	; 0
   056A AA                  149 	.db #0xaa	; 170
   056B 55                  150 	.db #0x55	; 85	'U'
   056C 00                  151 	.db #0x00	; 0
   056D 04                  152 	.db #0x04	; 4
   056E 00                  153 	.db #0x00	; 0
   056F 00                  154 	.db #0x00	; 0
   0570 00                  155 	.db #0x00	; 0
   0571 00                  156 	.db #0x00	; 0
   0572 AA                  157 	.db #0xaa	; 170
   0573 55                  158 	.db #0x55	; 85	'U'
   0574 00                  159 	.db #0x00	; 0
   0575 04                  160 	.db #0x04	; 4
   0576 00                  161 	.db #0x00	; 0
   0577 00                  162 	.db #0x00	; 0
   0578 00                  163 	.db #0x00	; 0
   0579 00                  164 	.db #0x00	; 0
   057A AA                  165 	.db #0xaa	; 170
   057B 55                  166 	.db #0x55	; 85	'U'
   057C 00                  167 	.db #0x00	; 0
   057D 04                  168 	.db #0x04	; 4
   057E 08                  169 	.db #0x08	; 8
   057F 00                  170 	.db #0x00	; 0
   0580 00                  171 	.db #0x00	; 0
   0581 00                  172 	.db #0x00	; 0
   0582 AA                  173 	.db #0xaa	; 170
   0583 55                  174 	.db #0x55	; 85	'U'
   0584 00                  175 	.db #0x00	; 0
   0585 04                  176 	.db #0x04	; 4
   0586 08                  177 	.db #0x08	; 8
   0587 00                  178 	.db #0x00	; 0
   0588 00                  179 	.db #0x00	; 0
   0589 00                  180 	.db #0x00	; 0
   058A AA                  181 	.db #0xaa	; 170
   058B 55                  182 	.db #0x55	; 85	'U'
   058C 00                  183 	.db #0x00	; 0
   058D 00                  184 	.db #0x00	; 0
   058E 08                  185 	.db #0x08	; 8
   058F 00                  186 	.db #0x00	; 0
   0590 00                  187 	.db #0x00	; 0
   0591 00                  188 	.db #0x00	; 0
   0592 AA                  189 	.db #0xaa	; 170
   0593 55                  190 	.db #0x55	; 85	'U'
   0594 00                  191 	.db #0x00	; 0
   0595 00                  192 	.db #0x00	; 0
   0596 08                  193 	.db #0x08	; 8
   0597 00                  194 	.db #0x00	; 0
   0598 00                  195 	.db #0x00	; 0
   0599 00                  196 	.db #0x00	; 0
   059A AA                  197 	.db #0xaa	; 170
   059B 55                  198 	.db #0x55	; 85	'U'
   059C 00                  199 	.db #0x00	; 0
   059D 00                  200 	.db #0x00	; 0
   059E 0C                  201 	.db #0x0c	; 12
   059F 00                  202 	.db #0x00	; 0
   05A0 00                  203 	.db #0x00	; 0
   05A1 00                  204 	.db #0x00	; 0
   05A2 AA                  205 	.db #0xaa	; 170
   05A3 55                  206 	.db #0x55	; 85	'U'
   05A4 00                  207 	.db #0x00	; 0
   05A5 00                  208 	.db #0x00	; 0
   05A6 0C                  209 	.db #0x0c	; 12
   05A7 00                  210 	.db #0x00	; 0
   05A8 00                  211 	.db #0x00	; 0
   05A9 00                  212 	.db #0x00	; 0
   05AA AA                  213 	.db #0xaa	; 170
   05AB 55                  214 	.db #0x55	; 85	'U'
   05AC 00                  215 	.db #0x00	; 0
   05AD 00                  216 	.db #0x00	; 0
   05AE 04                  217 	.db #0x04	; 4
   05AF 00                  218 	.db #0x00	; 0
   05B0 00                  219 	.db #0x00	; 0
   05B1 00                  220 	.db #0x00	; 0
   05B2 AA                  221 	.db #0xaa	; 170
   05B3 55                  222 	.db #0x55	; 85	'U'
   05B4 00                  223 	.db #0x00	; 0
   05B5 00                  224 	.db #0x00	; 0
   05B6 04                  225 	.db #0x04	; 4
   05B7 00                  226 	.db #0x00	; 0
   05B8 00                  227 	.db #0x00	; 0
   05B9 00                  228 	.db #0x00	; 0
   05BA AA                  229 	.db #0xaa	; 170
   05BB 55                  230 	.db #0x55	; 85	'U'
   05BC 00                  231 	.db #0x00	; 0
   05BD 00                  232 	.db #0x00	; 0
   05BE 04                  233 	.db #0x04	; 4
   05BF 08                  234 	.db #0x08	; 8
   05C0 00                  235 	.db #0x00	; 0
   05C1 00                  236 	.db #0x00	; 0
   05C2 AA                  237 	.db #0xaa	; 170
   05C3 55                  238 	.db #0x55	; 85	'U'
   05C4 00                  239 	.db #0x00	; 0
   05C5 00                  240 	.db #0x00	; 0
   05C6 04                  241 	.db #0x04	; 4
   05C7 08                  242 	.db #0x08	; 8
   05C8 00                  243 	.db #0x00	; 0
   05C9 00                  244 	.db #0x00	; 0
   05CA AA                  245 	.db #0xaa	; 170
   05CB 55                  246 	.db #0x55	; 85	'U'
   05CC 00                  247 	.db #0x00	; 0
   05CD 00                  248 	.db #0x00	; 0
   05CE 04                  249 	.db #0x04	; 4
   05CF 08                  250 	.db #0x08	; 8
   05D0 00                  251 	.db #0x00	; 0
   05D1 00                  252 	.db #0x00	; 0
   05D2 AA                  253 	.db #0xaa	; 170
   05D3 55                  254 	.db #0x55	; 85	'U'
   05D4 00                  255 	.db #0x00	; 0
   05D5 00                  256 	.db #0x00	; 0
   05D6 00                  257 	.db #0x00	; 0
   05D7 08                  258 	.db #0x08	; 8
   05D8 00                  259 	.db #0x00	; 0
   05D9 00                  260 	.db #0x00	; 0
   05DA AA                  261 	.db #0xaa	; 170
   05DB 55                  262 	.db #0x55	; 85	'U'
   05DC 00                  263 	.db #0x00	; 0
   05DD 00                  264 	.db #0x00	; 0
   05DE 00                  265 	.db #0x00	; 0
   05DF 0C                  266 	.db #0x0c	; 12
   05E0 30                  267 	.db #0x30	; 48	'0'
   05E1 00                  268 	.db #0x00	; 0
   05E2 AA                  269 	.db #0xaa	; 170
   05E3 55                  270 	.db #0x55	; 85	'U'
   05E4 00                  271 	.db #0x00	; 0
   05E5 00                  272 	.db #0x00	; 0
   05E6 00                  273 	.db #0x00	; 0
   05E7 18                  274 	.db #0x18	; 24
   05E8 20                  275 	.db #0x20	; 32
   05E9 00                  276 	.db #0x00	; 0
   05EA AA                  277 	.db #0xaa	; 170
   05EB 55                  278 	.db #0x55	; 85	'U'
   05EC 00                  279 	.db #0x00	; 0
   05ED 00                  280 	.db #0x00	; 0
   05EE 00                  281 	.db #0x00	; 0
   05EF 30                  282 	.db #0x30	; 48	'0'
   05F0 00                  283 	.db #0x00	; 0
   05F1 00                  284 	.db #0x00	; 0
   05F2 AA                  285 	.db #0xaa	; 170
   05F3 55                  286 	.db #0x55	; 85	'U'
   05F4 00                  287 	.db #0x00	; 0
   05F5 00                  288 	.db #0x00	; 0
   05F6 10                  289 	.db #0x10	; 16
   05F7 30                  290 	.db #0x30	; 48	'0'
   05F8 00                  291 	.db #0x00	; 0
   05F9 00                  292 	.db #0x00	; 0
   05FA AA                  293 	.db #0xaa	; 170
   05FB 55                  294 	.db #0x55	; 85	'U'
   05FC 00                  295 	.db #0x00	; 0
   05FD 00                  296 	.db #0x00	; 0
   05FE 10                  297 	.db #0x10	; 16
   05FF 10                  298 	.db #0x10	; 16
   0600 20                  299 	.db #0x20	; 32
   0601 00                  300 	.db #0x00	; 0
   0602 AA                  301 	.db #0xaa	; 170
   0603 55                  302 	.db #0x55	; 85	'U'
   0604 00                  303 	.db #0x00	; 0
   0605 00                  304 	.db #0x00	; 0
   0606 00                  305 	.db #0x00	; 0
   0607 10                  306 	.db #0x10	; 16
   0608 20                  307 	.db #0x20	; 32
   0609 00                  308 	.db #0x00	; 0
   060A AA                  309 	.db #0xaa	; 170
   060B 55                  310 	.db #0x55	; 85	'U'
   060C 00                  311 	.db #0x00	; 0
   060D 00                  312 	.db #0x00	; 0
   060E 00                  313 	.db #0x00	; 0
   060F 00                  314 	.db #0x00	; 0
   0610 20                  315 	.db #0x20	; 32
   0611 00                  316 	.db #0x00	; 0
   0612 AA                  317 	.db #0xaa	; 170
   0613 55                  318 	.db #0x55	; 85	'U'
   0614 00                  319 	.db #0x00	; 0
   0615 00                  320 	.db #0x00	; 0
   0616 00                  321 	.db #0x00	; 0
   0617 00                  322 	.db #0x00	; 0
   0618 30                  323 	.db #0x30	; 48	'0'
   0619 00                  324 	.db #0x00	; 0
   061A AA                  325 	.db #0xaa	; 170
   061B 55                  326 	.db #0x55	; 85	'U'
   061C 00                  327 	.db #0x00	; 0
   061D 00                  328 	.db #0x00	; 0
   061E 00                  329 	.db #0x00	; 0
   061F 00                  330 	.db #0x00	; 0
   0620 30                  331 	.db #0x30	; 48	'0'
   0621 00                  332 	.db #0x00	; 0
   0622 AA                  333 	.db #0xaa	; 170
   0623 55                  334 	.db #0x55	; 85	'U'
   0624 00                  335 	.db #0x00	; 0
   0625 00                  336 	.db #0x00	; 0
   0626 00                  337 	.db #0x00	; 0
   0627 00                  338 	.db #0x00	; 0
   0628 10                  339 	.db #0x10	; 16
   0629 00                  340 	.db #0x00	; 0
   062A AA                  341 	.db #0xaa	; 170
   062B 55                  342 	.db #0x55	; 85	'U'
   062C 00                  343 	.db #0x00	; 0
   062D 00                  344 	.db #0x00	; 0
   062E 00                  345 	.db #0x00	; 0
   062F 00                  346 	.db #0x00	; 0
   0630 10                  347 	.db #0x10	; 16
   0631 00                  348 	.db #0x00	; 0
   0632 AA                  349 	.db #0xaa	; 170
   0633 55                  350 	.db #0x55	; 85	'U'
   0634 00                  351 	.db #0x00	; 0
   0635 00                  352 	.db #0x00	; 0
   0636 00                  353 	.db #0x00	; 0
   0637 00                  354 	.db #0x00	; 0
   0638 00                  355 	.db #0x00	; 0
   0639 00                  356 	.db #0x00	; 0
   063A AA                  357 	.db #0xaa	; 170
   063B 55                  358 	.db #0x55	; 85	'U'
   063C 00                  359 	.db #0x00	; 0
   063D 00                  360 	.db #0x00	; 0
   063E 00                  361 	.db #0x00	; 0
   063F 00                  362 	.db #0x00	; 0
   0640 00                  363 	.db #0x00	; 0
   0641 00                  364 	.db #0x00	; 0
   0642 AA                  365 	.db #0xaa	; 170
   0643 04                  366 	.db #0x04	; 4
   0644 FF                  367 	.db #0xff	; 255
   0645 FF                  368 	.db #0xff	; 255
   0646 FF                  369 	.db #0xff	; 255
   0647 FF                  370 	.db #0xff	; 255
   0648 FF                  371 	.db #0xff	; 255
   0649 FF                  372 	.db #0xff	; 255
   064A 08                  373 	.db #0x08	; 8
   064B                     374 _s_cards_1:
   064B 14                  375 	.db #0x14	; 20
   064C F0                  376 	.db #0xf0	; 240
   064D A0                  377 	.db #0xa0	; 160
   064E 00                  378 	.db #0x00	; 0
   064F 00                  379 	.db #0x00	; 0
   0650 00                  380 	.db #0x00	; 0
   0651 00                  381 	.db #0x00	; 0
   0652 00                  382 	.db #0x00	; 0
   0653 78                  383 	.db #0x78	; 120	'x'
   0654 F0                  384 	.db #0xf0	; 240
   0655 F0                  385 	.db #0xf0	; 240
   0656 FF                  386 	.db #0xff	; 255
   0657 FF                  387 	.db #0xff	; 255
   0658 FF                  388 	.db #0xff	; 255
   0659 FF                  389 	.db #0xff	; 255
   065A 08                  390 	.db #0x08	; 8
   065B F0                  391 	.db #0xf0	; 240
   065C F0                  392 	.db #0xf0	; 240
   065D F0                  393 	.db #0xf0	; 240
   065E 08                  394 	.db #0x08	; 8
   065F 00                  395 	.db #0x00	; 0
   0660 00                  396 	.db #0x00	; 0
   0661 00                  397 	.db #0x00	; 0
   0662 AA                  398 	.db #0xaa	; 170
   0663 F0                  399 	.db #0xf0	; 240
   0664 F0                  400 	.db #0xf0	; 240
   0665 F0                  401 	.db #0xf0	; 240
   0666 08                  402 	.db #0x08	; 8
   0667 00                  403 	.db #0x00	; 0
   0668 00                  404 	.db #0x00	; 0
   0669 00                  405 	.db #0x00	; 0
   066A AA                  406 	.db #0xaa	; 170
   066B F0                  407 	.db #0xf0	; 240
   066C F0                  408 	.db #0xf0	; 240
   066D F0                  409 	.db #0xf0	; 240
   066E 08                  410 	.db #0x08	; 8
   066F 00                  411 	.db #0x00	; 0
   0670 00                  412 	.db #0x00	; 0
   0671 00                  413 	.db #0x00	; 0
   0672 AA                  414 	.db #0xaa	; 170
   0673 F0                  415 	.db #0xf0	; 240
   0674 F0                  416 	.db #0xf0	; 240
   0675 F0                  417 	.db #0xf0	; 240
   0676 08                  418 	.db #0x08	; 8
   0677 00                  419 	.db #0x00	; 0
   0678 00                  420 	.db #0x00	; 0
   0679 00                  421 	.db #0x00	; 0
   067A AA                  422 	.db #0xaa	; 170
   067B F0                  423 	.db #0xf0	; 240
   067C F0                  424 	.db #0xf0	; 240
   067D F0                  425 	.db #0xf0	; 240
   067E 08                  426 	.db #0x08	; 8
   067F 00                  427 	.db #0x00	; 0
   0680 00                  428 	.db #0x00	; 0
   0681 00                  429 	.db #0x00	; 0
   0682 AA                  430 	.db #0xaa	; 170
   0683 50                  431 	.db #0x50	; 80	'P'
   0684 F0                  432 	.db #0xf0	; 240
   0685 A4                  433 	.db #0xa4	; 164
   0686 00                  434 	.db #0x00	; 0
   0687 00                  435 	.db #0x00	; 0
   0688 00                  436 	.db #0x00	; 0
   0689 00                  437 	.db #0x00	; 0
   068A AA                  438 	.db #0xaa	; 170
   068B 55                  439 	.db #0x55	; 85	'U'
   068C 0C                  440 	.db #0x0c	; 12
   068D 08                  441 	.db #0x08	; 8
   068E 00                  442 	.db #0x00	; 0
   068F 00                  443 	.db #0x00	; 0
   0690 00                  444 	.db #0x00	; 0
   0691 00                  445 	.db #0x00	; 0
   0692 AA                  446 	.db #0xaa	; 170
   0693 55                  447 	.db #0x55	; 85	'U'
   0694 00                  448 	.db #0x00	; 0
   0695 00                  449 	.db #0x00	; 0
   0696 00                  450 	.db #0x00	; 0
   0697 00                  451 	.db #0x00	; 0
   0698 00                  452 	.db #0x00	; 0
   0699 00                  453 	.db #0x00	; 0
   069A AA                  454 	.db #0xaa	; 170
   069B 55                  455 	.db #0x55	; 85	'U'
   069C 00                  456 	.db #0x00	; 0
   069D 00                  457 	.db #0x00	; 0
   069E 00                  458 	.db #0x00	; 0
   069F 00                  459 	.db #0x00	; 0
   06A0 00                  460 	.db #0x00	; 0
   06A1 00                  461 	.db #0x00	; 0
   06A2 AA                  462 	.db #0xaa	; 170
   06A3 55                  463 	.db #0x55	; 85	'U'
   06A4 00                  464 	.db #0x00	; 0
   06A5 00                  465 	.db #0x00	; 0
   06A6 00                  466 	.db #0x00	; 0
   06A7 00                  467 	.db #0x00	; 0
   06A8 00                  468 	.db #0x00	; 0
   06A9 00                  469 	.db #0x00	; 0
   06AA AA                  470 	.db #0xaa	; 170
   06AB 55                  471 	.db #0x55	; 85	'U'
   06AC 00                  472 	.db #0x00	; 0
   06AD 00                  473 	.db #0x00	; 0
   06AE 00                  474 	.db #0x00	; 0
   06AF 00                  475 	.db #0x00	; 0
   06B0 00                  476 	.db #0x00	; 0
   06B1 00                  477 	.db #0x00	; 0
   06B2 AA                  478 	.db #0xaa	; 170
   06B3 55                  479 	.db #0x55	; 85	'U'
   06B4 00                  480 	.db #0x00	; 0
   06B5 00                  481 	.db #0x00	; 0
   06B6 04                  482 	.db #0x04	; 4
   06B7 08                  483 	.db #0x08	; 8
   06B8 00                  484 	.db #0x00	; 0
   06B9 00                  485 	.db #0x00	; 0
   06BA AA                  486 	.db #0xaa	; 170
   06BB 55                  487 	.db #0x55	; 85	'U'
   06BC 00                  488 	.db #0x00	; 0
   06BD 00                  489 	.db #0x00	; 0
   06BE 0C                  490 	.db #0x0c	; 12
   06BF 0C                  491 	.db #0x0c	; 12
   06C0 00                  492 	.db #0x00	; 0
   06C1 00                  493 	.db #0x00	; 0
   06C2 AA                  494 	.db #0xaa	; 170
   06C3 55                  495 	.db #0x55	; 85	'U'
   06C4 00                  496 	.db #0x00	; 0
   06C5 04                  497 	.db #0x04	; 4
   06C6 5D                  498 	.db #0x5d	; 93
   06C7 04                  499 	.db #0x04	; 4
   06C8 08                  500 	.db #0x08	; 8
   06C9 00                  501 	.db #0x00	; 0
   06CA AA                  502 	.db #0xaa	; 170
   06CB 55                  503 	.db #0x55	; 85	'U'
   06CC 00                  504 	.db #0x00	; 0
   06CD 0C                  505 	.db #0x0c	; 12
   06CE AE                  506 	.db #0xae	; 174
   06CF 08                  507 	.db #0x08	; 8
   06D0 0C                  508 	.db #0x0c	; 12
   06D1 00                  509 	.db #0x00	; 0
   06D2 AA                  510 	.db #0xaa	; 170
   06D3 55                  511 	.db #0x55	; 85	'U'
   06D4 00                  512 	.db #0x00	; 0
   06D5 08                  513 	.db #0x08	; 8
   06D6 0C                  514 	.db #0x0c	; 12
   06D7 0C                  515 	.db #0x0c	; 12
   06D8 04                  516 	.db #0x04	; 4
   06D9 00                  517 	.db #0x00	; 0
   06DA AA                  518 	.db #0xaa	; 170
   06DB 55                  519 	.db #0x55	; 85	'U'
   06DC 00                  520 	.db #0x00	; 0
   06DD 08                  521 	.db #0x08	; 8
   06DE 0C                  522 	.db #0x0c	; 12
   06DF 0C                  523 	.db #0x0c	; 12
   06E0 04                  524 	.db #0x04	; 4
   06E1 00                  525 	.db #0x00	; 0
   06E2 AA                  526 	.db #0xaa	; 170
   06E3 55                  527 	.db #0x55	; 85	'U'
   06E4 04                  528 	.db #0x04	; 4
   06E5 5D                  529 	.db #0x5d	; 93
   06E6 0C                  530 	.db #0x0c	; 12
   06E7 0C                  531 	.db #0x0c	; 12
   06E8 04                  532 	.db #0x04	; 4
   06E9 08                  533 	.db #0x08	; 8
   06EA AA                  534 	.db #0xaa	; 170
   06EB 55                  535 	.db #0x55	; 85	'U'
   06EC 04                  536 	.db #0x04	; 4
   06ED AE                  537 	.db #0xae	; 174
   06EE 0C                  538 	.db #0x0c	; 12
   06EF 0C                  539 	.db #0x0c	; 12
   06F0 08                  540 	.db #0x08	; 8
   06F1 08                  541 	.db #0x08	; 8
   06F2 AA                  542 	.db #0xaa	; 170
   06F3 55                  543 	.db #0x55	; 85	'U'
   06F4 04                  544 	.db #0x04	; 4
   06F5 AE                  545 	.db #0xae	; 174
   06F6 0C                  546 	.db #0x0c	; 12
   06F7 0C                  547 	.db #0x0c	; 12
   06F8 08                  548 	.db #0x08	; 8
   06F9 08                  549 	.db #0x08	; 8
   06FA AA                  550 	.db #0xaa	; 170
   06FB 55                  551 	.db #0x55	; 85	'U'
   06FC 04                  552 	.db #0x04	; 4
   06FD 04                  553 	.db #0x04	; 4
   06FE 0C                  554 	.db #0x0c	; 12
   06FF 0C                  555 	.db #0x0c	; 12
   0700 08                  556 	.db #0x08	; 8
   0701 08                  557 	.db #0x08	; 8
   0702 AA                  558 	.db #0xaa	; 170
   0703 55                  559 	.db #0x55	; 85	'U'
   0704 04                  560 	.db #0x04	; 4
   0705 04                  561 	.db #0x04	; 4
   0706 5D                  562 	.db #0x5d	; 93
   0707 04                  563 	.db #0x04	; 4
   0708 08                  564 	.db #0x08	; 8
   0709 08                  565 	.db #0x08	; 8
   070A AA                  566 	.db #0xaa	; 170
   070B 55                  567 	.db #0x55	; 85	'U'
   070C 04                  568 	.db #0x04	; 4
   070D 04                  569 	.db #0x04	; 4
   070E 08                  570 	.db #0x08	; 8
   070F 04                  571 	.db #0x04	; 4
   0710 08                  572 	.db #0x08	; 8
   0711 08                  573 	.db #0x08	; 8
   0712 AA                  574 	.db #0xaa	; 170
   0713 55                  575 	.db #0x55	; 85	'U'
   0714 04                  576 	.db #0x04	; 4
   0715 04                  577 	.db #0x04	; 4
   0716 08                  578 	.db #0x08	; 8
   0717 04                  579 	.db #0x04	; 4
   0718 08                  580 	.db #0x08	; 8
   0719 08                  581 	.db #0x08	; 8
   071A AA                  582 	.db #0xaa	; 170
   071B 55                  583 	.db #0x55	; 85	'U'
   071C 04                  584 	.db #0x04	; 4
   071D 04                  585 	.db #0x04	; 4
   071E 0C                  586 	.db #0x0c	; 12
   071F 0C                  587 	.db #0x0c	; 12
   0720 08                  588 	.db #0x08	; 8
   0721 08                  589 	.db #0x08	; 8
   0722 AA                  590 	.db #0xaa	; 170
   0723 55                  591 	.db #0x55	; 85	'U'
   0724 04                  592 	.db #0x04	; 4
   0725 04                  593 	.db #0x04	; 4
   0726 0C                  594 	.db #0x0c	; 12
   0727 0C                  595 	.db #0x0c	; 12
   0728 08                  596 	.db #0x08	; 8
   0729 08                  597 	.db #0x08	; 8
   072A AA                  598 	.db #0xaa	; 170
   072B 55                  599 	.db #0x55	; 85	'U'
   072C 04                  600 	.db #0x04	; 4
   072D 04                  601 	.db #0x04	; 4
   072E 0C                  602 	.db #0x0c	; 12
   072F 0C                  603 	.db #0x0c	; 12
   0730 08                  604 	.db #0x08	; 8
   0731 08                  605 	.db #0x08	; 8
   0732 AA                  606 	.db #0xaa	; 170
   0733 55                  607 	.db #0x55	; 85	'U'
   0734 04                  608 	.db #0x04	; 4
   0735 08                  609 	.db #0x08	; 8
   0736 0C                  610 	.db #0x0c	; 12
   0737 0C                  611 	.db #0x0c	; 12
   0738 04                  612 	.db #0x04	; 4
   0739 08                  613 	.db #0x08	; 8
   073A AA                  614 	.db #0xaa	; 170
   073B 55                  615 	.db #0x55	; 85	'U'
   073C 00                  616 	.db #0x00	; 0
   073D 08                  617 	.db #0x08	; 8
   073E 0C                  618 	.db #0x0c	; 12
   073F 0C                  619 	.db #0x0c	; 12
   0740 04                  620 	.db #0x04	; 4
   0741 00                  621 	.db #0x00	; 0
   0742 AA                  622 	.db #0xaa	; 170
   0743 55                  623 	.db #0x55	; 85	'U'
   0744 00                  624 	.db #0x00	; 0
   0745 08                  625 	.db #0x08	; 8
   0746 0C                  626 	.db #0x0c	; 12
   0747 0C                  627 	.db #0x0c	; 12
   0748 04                  628 	.db #0x04	; 4
   0749 00                  629 	.db #0x00	; 0
   074A AA                  630 	.db #0xaa	; 170
   074B 55                  631 	.db #0x55	; 85	'U'
   074C 00                  632 	.db #0x00	; 0
   074D 0C                  633 	.db #0x0c	; 12
   074E 04                  634 	.db #0x04	; 4
   074F 08                  635 	.db #0x08	; 8
   0750 0C                  636 	.db #0x0c	; 12
   0751 00                  637 	.db #0x00	; 0
   0752 AA                  638 	.db #0xaa	; 170
   0753 55                  639 	.db #0x55	; 85	'U'
   0754 00                  640 	.db #0x00	; 0
   0755 04                  641 	.db #0x04	; 4
   0756 08                  642 	.db #0x08	; 8
   0757 04                  643 	.db #0x04	; 4
   0758 08                  644 	.db #0x08	; 8
   0759 00                  645 	.db #0x00	; 0
   075A AA                  646 	.db #0xaa	; 170
   075B 55                  647 	.db #0x55	; 85	'U'
   075C 00                  648 	.db #0x00	; 0
   075D 00                  649 	.db #0x00	; 0
   075E 0C                  650 	.db #0x0c	; 12
   075F 0C                  651 	.db #0x0c	; 12
   0760 00                  652 	.db #0x00	; 0
   0761 00                  653 	.db #0x00	; 0
   0762 AA                  654 	.db #0xaa	; 170
   0763 55                  655 	.db #0x55	; 85	'U'
   0764 00                  656 	.db #0x00	; 0
   0765 00                  657 	.db #0x00	; 0
   0766 04                  658 	.db #0x04	; 4
   0767 08                  659 	.db #0x08	; 8
   0768 00                  660 	.db #0x00	; 0
   0769 00                  661 	.db #0x00	; 0
   076A AA                  662 	.db #0xaa	; 170
   076B 55                  663 	.db #0x55	; 85	'U'
   076C 00                  664 	.db #0x00	; 0
   076D 00                  665 	.db #0x00	; 0
   076E 00                  666 	.db #0x00	; 0
   076F 00                  667 	.db #0x00	; 0
   0770 00                  668 	.db #0x00	; 0
   0771 00                  669 	.db #0x00	; 0
   0772 AA                  670 	.db #0xaa	; 170
   0773 55                  671 	.db #0x55	; 85	'U'
   0774 00                  672 	.db #0x00	; 0
   0775 00                  673 	.db #0x00	; 0
   0776 00                  674 	.db #0x00	; 0
   0777 00                  675 	.db #0x00	; 0
   0778 00                  676 	.db #0x00	; 0
   0779 00                  677 	.db #0x00	; 0
   077A AA                  678 	.db #0xaa	; 170
   077B 55                  679 	.db #0x55	; 85	'U'
   077C 00                  680 	.db #0x00	; 0
   077D 00                  681 	.db #0x00	; 0
   077E 00                  682 	.db #0x00	; 0
   077F 00                  683 	.db #0x00	; 0
   0780 00                  684 	.db #0x00	; 0
   0781 00                  685 	.db #0x00	; 0
   0782 AA                  686 	.db #0xaa	; 170
   0783 55                  687 	.db #0x55	; 85	'U'
   0784 00                  688 	.db #0x00	; 0
   0785 00                  689 	.db #0x00	; 0
   0786 00                  690 	.db #0x00	; 0
   0787 00                  691 	.db #0x00	; 0
   0788 00                  692 	.db #0x00	; 0
   0789 00                  693 	.db #0x00	; 0
   078A AA                  694 	.db #0xaa	; 170
   078B 04                  695 	.db #0x04	; 4
   078C FF                  696 	.db #0xff	; 255
   078D FF                  697 	.db #0xff	; 255
   078E FF                  698 	.db #0xff	; 255
   078F FF                  699 	.db #0xff	; 255
   0790 FF                  700 	.db #0xff	; 255
   0791 FF                  701 	.db #0xff	; 255
   0792 08                  702 	.db #0x08	; 8
                            703 	.area _INITIALIZER
                            704 	.area _CABS (ABS)
