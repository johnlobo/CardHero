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
#include "sprites/g_palette0.h"
#include "sprites/g_palette1.h"
#include "sprites/cards.h"
#include "sprites/costs.h"
#include "entities/card.h"

//Global Variables

u32 i_time;
u8 *pvmem;           // Pointer to video memory
u8 aux_txt[50];      // String
u8 selected_card, previous_card;

const TCardType card_types[2] = {
   {2, s_cards_0,{"SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY\0"}},
   {1, s_cards_1,{"SHIELD:PROTECTS SOME DAMAGE\0"}},
   };

TCard cards[MAX_CARDS_IN_HAND];

u8 num_cards;
u8 moved;
u8 *const card_sprite[2] = {s_cards_0, s_cards_1}; // Cards sprites
u8 const card_description[2][50] = {
   {"SWORD:PRODUCES DIRECT DAMAGE TO THE ENEMY\0"},
   {"SHIELD:PROTECTS SOME DAMAGE\0"}
   };
u8 *const cost_sprite[6] = {s_costs_0, s_costs_1, s_costs_2, s_costs_3, s_costs_4, s_costs_5};  // Cost sprite

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
   u16 i;

   i_time++;
   g_nInterrupt++;
   switch (g_nInterrupt){
      case 1:
         cpct_setBorder(HW_LIME);
         break;
      case 2:
         cpct_setBorder(HW_BRIGHT_MAGENTA);
         i=270;
         while (i>0){
            i--;
         }
         cpct_setBorder(HW_CYAN);
         cpct_setVideoMode(0);
         cpct_setPalette(g_palette0, 16);
         break;
      case 3:
         cpct_setBorder(HW_RED);
         break;
      case 4:
         cpct_setBorder(HW_YELLOW);
         break;
      case 5:
         cpct_setBorder(HW_MAGENTA);
         i=330;
         while (i>0){
            i--;
         }
         cpct_setBorder(HW_BRIGHT_CYAN);
         cpct_setVideoMode(1);
         cpct_setPalette(g_palette1, 4);
         break;
      default:
         cpct_setBorder(HW_BRIGHT_BLUE);
         cpct_scanKeyboard();
         g_nInterrupt = 0;
         break;
   }
}

void initCPC() {
   

   //cpct_clearScreen_f64(0x0000);      // with black.

   cpct_setPalette(g_palette0, 16);
   cpct_setVideoMode(0);
   cpct_memset((u8*)0x8000,0,0x8000);
   
   //Vertical overscan
   //cpct_setCRTCReg(6, 34);
   //cpct_setCRTCReg(7, 35);
   cpct_setCRTCReg(12, 0x2c);


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
   } else if (cpct_isKeyPressed(Key_CursorRight) && (selected_card<num_cards-1)){
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
   pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W-3))-2, 136);
   cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W+4, S_CARDS_0_H+4);  

   // Draw first part of cards
   for (i=0;i<selected_card;i++){
      pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(i*(S_CARDS_0_W-3)), 140);
      cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
      pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(i*(S_CARDS_0_W-3)), 141);
      cpct_drawSprite(cost_sprite[card_types[cards[i].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);
   }
   
   // Draw second part of cards
   for (i=selected_card+1;i<num_cards;i++){
      pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(i*(S_CARDS_0_W-3)), 140);
      cpct_drawSprite(card_types[cards[i].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
      pvmem = cpct_getScreenPtr((u8*) VM_START, 5+(i*(S_CARDS_0_W-3)), 141);
      cpct_drawSprite(cost_sprite[card_types[cards[i].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);
   }

   // Draw selected card
   pvmem = cpct_getScreenPtr((u8*) VM_START, 3+(selected_card*(S_CARDS_0_W-3)), 136);
   cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
   pvmem = cpct_getScreenPtr((u8*) VM_START, 4+(selected_card*(S_CARDS_0_W-3)), 137);
   cpct_drawSprite(cost_sprite[card_types[cards[selected_card].type].cost - 1], pvmem, S_COSTS_0_W, S_COSTS_0_H);

   //MESSAGES
   // Erase previous message
   pvmem = cpct_getScreenPtr((u8*) VM_START, 10, 190);
   cpct_drawSolidBox(pvmem, 0x00, 50, 9);
   // Print Message
   drawTextM1(card_types[cards[selected_card].type].description,2,190,NORMALHEIGHT);
   
   //cpct_waitHalts(20);
   sprintf(aux_txt, "PREVIOUS:%1d", previous_card);
   drawTextM1(aux_txt,40,190,NORMALHEIGHT);
   sprintf(aux_txt, "SELECTED:%1d", selected_card);
   drawTextM1(aux_txt,60,190,NORMALHEIGHT);

}

void update_selected_card(){
   // Erase previous card
   if (selected_card>0){
      pvmem = cpct_getScreenPtr((u8*) VM_START, (previous_card*(S_CARDS_0_W))-2, 140);
      cpct_drawSolidBox(pvmem, 0x33, S_CARDS_0_W, 5);
   }

   pvmem = cpct_getScreenPtr((u8*) VM_START, 2+(selected_card*(S_CARDS_0_W-3)), 144);
   cpct_drawSprite(card_types[cards[selected_card].type].sprite, pvmem, S_CARDS_0_W, S_CARDS_0_H);
}

void init_cards(){
   u8 i;

   num_cards = (cpct_rand() % 9) + 1;
   for (i=0;i<num_cards;i++){
      cards[i].type = cpct_rand() % 2;
   } 

   draw_cards();
}

void main(void) {
   cpct_disableFirmware();
   cpct_setStackLocation((u8*) 0x7fff);
   
   initCPC();

   selected_card = 4;
   previous_card = 4;
   moved = NO;

   drawTextM1("CARD HERO - DECK BUILDING GAME",10,0,NORMALHEIGHT);
   drawTextM1("SECOND LINE, JUST IN CASE",10,10,NORMALHEIGHT);

   init_cards();

   draw_cards();

   // Loop forever
   while (1){
      check_keyboard();
      if (moved){
         draw_cards();
         moved = NO;
      }
   };
}
