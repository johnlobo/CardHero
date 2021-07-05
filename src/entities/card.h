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
#ifndef _CARD_H_
#define _CARD_H_

#include <cpctelera.h>
#include "../defines.h"

#define MAX_CARDS_IN_HAND 10

typedef struct{
    u8 cost;
    u8 *sprite;
    u8 description[50];
} TCardType;

typedef struct{
    u8 type;
    u8 improved;
} TCard;

extern const TCardType card_types[2];
extern TCard cards[MAX_CARDS_IN_HAND];

#endif

