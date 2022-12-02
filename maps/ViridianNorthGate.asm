	object_const_def
	const VIRIDIANNORTHGATE_YOUNGSTER
	const VIRIDIANNORTHGATE_COOLTRAINER_F

ViridianNorthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianNorthGateYoungsterScript:
	jumptextfaceplayer ViridianNorthGateYoungsterText

ViridianNorthGateCooltrainerFScript:
	jumptextfaceplayer ViridianNorthGateCooltrainerFText


ViridianNorthGateYoungsterText:
	text "CAMPERS are out on"
	line "a field trip in"
	cont "VIRIDIAN FOREST."

	para "They may be young,"
	line "but their #MON"
	cont "pack a punch!"
	para "The outdoors sure"
	line "toughens you up."
	done

ViridianNorthGateCooltrainerFText:
	text "People train in"
	line "this forest all"
	cont "the time."

	para "But I'm not one for"
	line "battles, so I"
	cont "prefer taking the"
	para "side path over on"
	line "ROUTE 2."
	done

ViridianNorthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, VIRIDIAN_FOREST, 1
	warp_event  7,  7, VIRIDIAN_FOREST, 1
	warp_event  6,  0, ROUTE_2, 6
	warp_event  7,  0, ROUTE_2, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianNorthGateYoungsterScript, -1
	object_event  9,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNorthGateCooltrainerFScript, -1
