	object_const_def
	const CELADONCHIEFHOUSE_GRAMPS
	const CELADONCHIEFHOUSE_SAILOR

CeladonChiefHouse_MapScripts:
	def_scene_scripts

	def_callbacks


CeladonChiefHouseGramps:
	jumptextfaceplayer CeladonChiefHouseGrampsText

CeladonChiefHouseSailor:
	jumptextfaceplayer CeladonChiefHouseSailorText


CeladonChiefHouseGrampsText:
	text "The GAME CORNER"
	line "got a bad wrap for"
	cont "being associated"
	cont "with TEAM ROCKET."

	para "But now they are"
	line "pushing for a"
	cont "cleaner image."
	done

CeladonChiefHouseSailorText:
	text "The ROCKET HIDEOUT"
	line "used to be found"
	cont "in the basement of"
	cont "the GAME CORNER."

	para "It was sealed off"
	line "three years ago,"
	cont "but I wonder if"
	para "TEAM ROCKET built"
	line "another hideout"
	cont "somewhere else…"
	done

CeladonChiefHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CELADON_CITY, 11
	warp_event  5,  7, CELADON_CITY, 11

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonChiefHouseGramps, -1
	object_event  9,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonChiefHouseSailor, -1
