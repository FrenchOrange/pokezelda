	object_const_def
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route29Route46Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route29Route46GateOfficerScript:
	jumptextfaceplayer Route29Route46GateOfficerText

Route29Route46GateYoungsterScript:
	jumptextfaceplayer Route29Route46GateYoungsterText

Route29Route46GateOfficerText:
	text "You can't climb"
	line "ledges."

	para "But you can jump"
	line "down from them to"
	cont "take a shortcut."
	done

Route29Route46GateYoungsterText:
	text "Different kinds of"
	line "#MON appear"
	cont "past here."

	para "If you want to"
	line "catch them all,"

	para "you have to look"
	line "everywhere."
	done

Route29Route46Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, ROUTE_46, 1
	warp_event  7,  0, ROUTE_46, 2
	warp_event  6,  7, ROUTE_29, 1
	warp_event  7,  7, ROUTE_29, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Route46GateOfficerScript, -1
	object_event  8,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29Route46GateYoungsterScript, -1
