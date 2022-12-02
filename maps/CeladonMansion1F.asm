	object_const_def
	const CELADONMANSION1F_GRANNY
	const CELADONMANSION1F_GROWLITHE1
	const CELADONMANSION1F_CLEFAIRY
	const CELADONMANSION1F_GROWLITHE2

CeladonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionManager:
	jumptextfaceplayer CeladonMansionManagerText

CeladonMansion1FMeowth:
	opentext
	writetext CeladonMansion1FMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

CeladonMansion1FClefairy:
	opentext
	writetext CeladonMansion1FClefairyText
	cry CLEFAIRY
	waitbutton
	closetext
	end

CeladonMansion1FNidoranF:
	opentext
	writetext CeladonMansion1FNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end

CeladonMansionManagersSuiteSign:
	jumptext CeladonMansionManagersSuiteSignText

CeladonMansion1FBookshelf:
	jumpstd PictureBookshelfScript

CeladonMansionManagerText:
	text "My dear #MON"
	line "keep me company,"

	para "so I don't ever"
	line "feel lonely."

	para "MEOWTH even brings"
	line "money home."
	done

CeladonMansion1FMeowthText:
	text "MEOWTH: Meow!"
	done

CeladonMansion1FClefairyText:
	text "CLEFAIRY: Clef"
	line "cleff!"
	done

CeladonMansion1FNidoranFText:
	text "NIDORAN: Kya"
	line "kyaoo!"
	done

CeladonMansionManagersSuiteSignText:
	text "CELADON CONDO"
	line "MANAGER'S SUITE"
	done

CeladonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 13, CELADON_CITY, 2
	warp_event 11, 13, CELADON_CITY, 2
	warp_event  5,  0, CELADON_CITY, 3
	warp_event  2,  0, CELADON_MANSION_2F, 1
	warp_event 11,  0, CELADON_MANSION_2F, 4

	def_coord_events

	def_bg_events
	bg_event  8, 12, BGEVENT_UP, CeladonMansionManagersSuiteSign
	bg_event  2,  5, BGEVENT_READ, CeladonMansion1FBookshelf
	bg_event  4,  5, BGEVENT_READ, CeladonMansion1FBookshelf

	def_object_events
	object_event  3,  7, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonMansionManager, -1
	object_event  4,  8, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FMeowth, -1
	object_event  5,  6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FClefairy, -1
	object_event  6,  6, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansion1FNidoranF, -1
