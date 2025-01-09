TitleScreen:
	call ClearBGPalettes
	xor a
	ld [wTimeOfDayPal], a
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearTilemap
	call DisableLCD
	call ClearSprites

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

	ldh [hMapAnims], a
	ldh [hSCY], a
	ldh [hSCX], a

	ld hl, vTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	farcall ClearSpriteAnims

; Decompress lower part of title screen
	ld hl, TitleScreenGFX1
	ld de, vTiles2
	ld a, BANK(TitleScreenGFX1)
	call FarDecompress

; Decompress upper part of title screen
	ld hl, TitleScreenGFX2
	ld de, vTiles1
	ld a, BANK(TitleScreenGFX2)
	call FarDecompress

; Decompress Suicune sprite
	ld hl, TitleScreenGFX4
	ld de, vTiles0
	ld a, BANK(TitleScreenGFX4)
	call FarDecompress

; Load map
	call FarCopyBytes
	call FillTitleScreenPals
	call LoadTitleScreenTilemap
	ld hl, wSpriteAnimDict
	xor a ; SPRITE_ANIM_DICT_DEFAULT and tile offset $00
	ld [hli], a
	ld [hl], a
	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl]
	call EnableLCD

; Reset timing variables
	xor a
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTitleScreenSelectedOption
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	depixel 14, 11
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_HO_OH_LUGIA
	call InitSpriteAnimStruct
	ld hl, wSpriteAnim1
	ld de, wSpriteAnim10
	ld bc, NUM_SPRITE_ANIM_STRUCTS
	call CopyBytes
	ld hl, wSpriteAnim1
	ld [hl], 0

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	xor a
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ld b, SCGB_GS_TITLE_SCREEN
	call GetSGBLayout
	call LoadTitleScreenPals
	ld de, MUSIC_TITLE
	call PlayMusic
	ret

LoadTitleScreenPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	jr nz, .sgb
	ld a, %11011000
	ldh [rBGP], a
	ld a, %11111111
	ldh [rOBP0], a
	ld a, %11111000
	ldh [rOBP1], a
	ret

.sgb
	ld a, %11100100
	ldh [rBGP], a
	ld a, %11111111
	ldh [rOBP0], a
	ld a, %11100100
	ldh [rOBP1], a
	ret

.cgb
	ld a, %11100100
	call DmgToCgbBGPals
	call DmgToCgbObjPal0
	ret

FillTitleScreenPals:
	ldh a, [hCGB]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	hlbgcoord 0, 0
	ld bc, 18 * BG_MAP_WIDTH
	xor a
	call ByteFill
; upper sky + logo
	hlbgcoord 0, 0, vBGMap2
	lb bc, 7, SCREEN_WIDTH
	ld a, 1
	call DrawTitleGraphic
; copyright
	hlbgcoord 0, 17, vBGMap2
	lb bc, 1, SCREEN_WIDTH
	ld a, 2
	call DrawTitleGraphic
; scrolling waves
	hlbgcoord 0, 12, vBGMap2
	ld bc, 5 * BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; lower sky + sun
	ld a, 0
	ldh [rVBK], a
	ret

DrawTitleGraphic:
.bgrows
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .bgrows
	ret

LoadTitleScreenTilemap:
	ld hl, TitleScreenTilemap
	debgcoord 0, 0
.loop
	ld a, BANK(TitleScreenTilemap)
	call GetFarByte
	cp -1
	jr z, .done
	inc hl
	ld [de], a
	inc de
	jr .loop

.done
	ldh a, [hCGB]
	and a
	ret nz
	hlbgcoord 0, 11
	ld bc, BG_MAP_WIDTH
	ld a, "@"
	call ByteFill
	ret
