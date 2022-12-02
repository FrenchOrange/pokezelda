	object_const_def
	const ROUTE12FUCHSIAGATE_OFFICER
	const ROUTE12FUCHSIAGATE_CAMPER

Route12Gate_MapScripts:
	def_scene_scripts

	def_callbacks


Route12GateOfficerScript:
	jumptextfaceplayer Route12GateOfficerText

Route12GateCamperScript:
	jumptextfaceplayer Route12GateCamperText


Route12GateOfficerText:
	text "The route to"
	line "FUCHSIA CITY is"
	cont "full of trainers."

	para "Be sure to have a"
	line "MAX POTION or two"
	cont "on hand!"
	done

Route12GateCamperText:
	text "The fishermen"
	line "yelled at me for"
	cont "bugging them…"
	done

Route12Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, ROUTE_12, 4
	warp_event  7,  0, ROUTE_12, 5
	warp_event  6,  7, ROUTE_12, 6
	warp_event  7,  7, ROUTE_12, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route12GateOfficerScript, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12GateCamperScript, -1

