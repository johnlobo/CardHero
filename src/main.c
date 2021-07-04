//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include <stdio.h>
#include "defines.h"
#include "text/text.h"
#include "sprites/cards.h"
#include "sprites/g_palette0.h"
#include "sprites/g_palette1.h"

//Global Variables

u32 i_time;
u8 *pvmem;           // Pointer to video memory
u8 aux_txt[50];      // String
u8 selected_card, previous_card;
u8 cards[MAX_CARDS_IN_HAND];
u8 num_cards;
u8 moved;
u8 *const card_sprite[2] = {s_cards_0, s_cards_1}; // Cards sprites
u8 const card_description[2][50] = {
   {"SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY\0"},
   {"SHIELD:PROTECTS SOME DAMAGE\0"}
   };

// ********************************************************************************
/// <summary>
/// myInterruptHandler
/// Interruphandler that subsitutes the default one. Includes calls for reading the keyboard and playing music, if activated
/// Returns:
/// void
/// </summary>
/// <created>johnlobo,21/08/2019</created>
/// <changed>johnlobo,21/08/2019</changed>
// ********************************************************************************
void myInterruptHandler(){
   static u8 g_nInterrupt = 0; // Manage Interrupt

   i_time++;
   g_nInterrupt++;
   if (g_nInterrupt == 1){
      cpct_setVideoMode(0);
      cpct_setPalette(g_palette0, 16);
      cpct_setBorder(HW_BLACK);
   } else 
   if (g_nInterrupt == 2){
      cpct_setBorder(HW_BLUE);
   } else
   if (g_nInterrupt == 3){
      cpct_setBorder(HW_RED);
   } else
   if (g_nInterrupt == 4){
      cpct_setBorder(HW_YELLOW);
   }else
   if (g_nInterrupt == 5){
      cpct_setVideoMode(1);
      cpct_setPalette(g_palette1, 4);
      cpct_setBorder(HW_MAGENTA);
   }else if (g_nInterrupt == 6){
      cpct_scanKeyboard();
      g_nInterrupt = 0;
      cpct_setBorder(HW_BRIGHT_BLUE);
    }
}

void initCPC() {
   cpct_disableFirmware();
   cpct_clearScreen_f64(0x0000);      // with black.
   cpct_setPalette(g_palette0, 16);
   cpct_setVideoMode(0);
   cpct_setBorder(HW_WHITE);

   //Interrupts Syncronization
   cpct_waitVSYNC();
   cpct_waitHalts(2);
   cpct_waitVSYNC();
   cpct_setInterruptHandler(myInterruptHandler);

}

void check_keyboard(){
   if (cpct_isKeyPressed(Key_CursorLeft) && (selected_card>0)){
      previous_card = selected_card;
      selected_card--;
      moved = YES;
   } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<9)){
      previous_card = selected_card;
      selected_card++;
      moved = YES;
   }
}

void draw_cards(){
   u8 i;
   

   // Wait for raster to avoid flickering
   cpct_waitVSYNC();

   // Erase previous card
   pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W-3))-2, 95);
   cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);

   cpct_waitHalts(20);
   // Erase previous message
   pvmem = cpct_getScreenPtr((u8*) 0xC000, 10, 150);
   cpct_drawSolidBox(pvmem, 0x00, 50, 9);

   cpct_waitHalts(20);
   // Draw first part of cards
   for (i=0;i<selected_card;i++){
      pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
      cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   }
   
   cpct_waitHalts(20);
   // Draw second part of cards
   for (i=selected_card+1;i<10;i++){
      pvmem = cpct_getScreenPtr((u8*) 0xC000, 4+(i*(S_CARDS_0_W-3)), 99);
      cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
   }

   cpct_waitHalts(20);
   // Draw selected card
   pvmem = cpct_getScreenPtr((u8*) 0xC000, 3+(selected_card*(S_CARDS_0_W-3)), 95);
   cpct_drawSprite(card_sprite[cards[selected_card]], pvmem, S_CARDS_0_W, S_CARDS_0_H);

   cpct_waitHalts(20);
   drawTextM1(card_description[cards[selected_card]],10,150,NORMALHEIGHT);
   
   cpct_waitHalts(20);
   sprintf(aux_txt, "SELECTED:%1d", selected_card);
   drawTextM1(aux_txt,10,160,NORMALHEIGHT);

}

void update_selected_card(){
   u8 i;
   // Erase previous card
   if (selected_card>0){
      pvmem = cpct_getScreenPtr((u8*) 0xC000, (previous_card*(S_CARDS_0_W))-2, 95);
      cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
   }

   pvmem = cpct_getScreenPtr((u8*) 0xC000, 2+(i*(S_CARDS_0_W-3)), 99);
   cpct_drawSprite(card_sprite[cards[i]], pvmem, S_CARDS_0_W, S_CARDS_0_H);
}

void init_cards(){
   u8 i;

   num_cards = (cpct_rand() % 9) + 1;
   for (i=0;i<num_cards;i++){
      cards[i] = cpct_rand() % 2;
   } 

   draw_cards();
}

void main(void) {

   initCPC();

   selected_card = 4;
   previous_card = 4;
   moved = NO;

   draw_cards();

   drawTextM1("!,-.0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ",10,190,NORMALHEIGHT);

   // Loop forever
   while (1){
      check_keyboard();
      if (moved){
         draw_cards();
         moved = NO;
      }
   };
}
