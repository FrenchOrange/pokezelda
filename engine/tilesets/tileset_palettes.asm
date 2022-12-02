LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_POKECENTER
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	cp TILESET_RUINS_OF_ALPH
	jr z, .ruins
	cp TILESET_RUINS_WORD_ROOM
	jr z, .ruins
	cp TILESET_ELITE_FOUR_ROOM
	jr z, .elite
	cp TILESET_PLAYERS_HOUSE
	jr z, .house
	cp TILESET_PLAYERS_ROOM
	jr z, .house
	jr .do_nothing

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.ruins
	call LoadRuinsPalette
	scf
	ret

.elite
	call LoadElitePalette
	scf
	ret

.do_nothing
	and a
	ret

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadRuinsPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RuinsPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

RuinsPalette:
INCLUDE "gfx/tilesets/ruins_of_alph.pal"

LoadElitePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, ElitePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret

ElitePalette:
INCLUDE "gfx/tilesets/elite_four_room.pal"
