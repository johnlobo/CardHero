//-----------------------------LICENSE NOTICE------------------------------------
//
//  /$$$$$$$                /$$$$$$$            /$$                           /$$
// | $$__  $$              | $$__  $$          | $$                          | $$
// | $$  \ $$  /$$$$$$     | $$  \ $$  /$$$$$$ | $$  /$$$$$$  /$$$$$$$   /$$$$$$$
// | $$  | $$ /$$__  $$    | $$$$$$$/ /$$__  $$| $$ |____  $$| $$__  $$ /$$__  $$
// | $$  | $$| $$  \__/    | $$__  $$| $$  \ $$| $$  /$$$$$$$| $$  \ $$| $$  | $$
// | $$  | $$| $$          | $$  \ $$| $$  | $$| $$ /$$__  $$| $$  | $$| $$  | $$
// | $$$$$$$/| $$       /$$| $$  | $$|  $$$$$$/| $$|  $$$$$$$| $$  | $$|  $$$$$$$
// |_______/ |__/      |__/|__/  |__/ \______/ |__/ \_______/|__/  |__/ \_______/
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
#ifndef _DEFINES_H_
#define _DEFINES_H_

#include <cpctelera.h>

#define SCR_VMEM (u8 *)0xC000

#define YES 1
#define NO 0

#define TRUE 1
#define FALSE 0

#define HORIZONTAL 0
#define VERTICAL 1

#define PREVIOUS 0
#define CURRENT 1
#define NEXT 2

#define min(X, Y) ((X) < (Y) ? (X) : (Y))
#define max(X, Y) (X > Y ? X : Y)

// FOR TEXT
#define COLORTXT_WHITE 0
#define COLORTXT_YELLOW 1
#define COLORTXT_ORANGE 2
#define COLORTXT_BLUE 3
#define COLORTXT_RED 4
#define COLORTXT_MAUVE 5

#define TRANSPARENT 1
#define OPAQUE 0

#define NORMALHEIGHT 1
#define DOUBLEHEIGHT 2

#define VIEW_X 14
#define VIEW_Y 17

// showMessage types
#define MESSAGE 0
#define YESNO 1
#define NUMBER 2
#define TEMPORAL 3

#define MAX_CARDS_IN_HAND 10

#endif