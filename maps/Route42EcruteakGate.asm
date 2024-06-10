	object_const_def
	const ROUTE42ECRUTEAKGATE_OFFICER
	const ROUTE42ECRUTEAKGATE_SKIER

Route42EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route42EcruteakGateOfficerScript:
	jumptextfaceplayer Route42EcruteakGateOfficerText

Route42EcruteakGateSkierScript:
	jumptextfaceplayer Route42EcruteakGateSkierText

Route42EcruteakGateOfficerText:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakGateSkierText:
	text "Further west, past"
	line "MAHOGANY, is the"
	cont "ICE PATH tunnel."

	para "My POKéMON loves"
	line "sliding around on"
	cont "the ice tiles."

	para "Be sure to pack"
	line "a warm jacket,"
	cont "though. Brrr!"
	done

Route42EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ECRUTEAK_CITY, 1
	warp_event  2,  5, ECRUTEAK_CITY, 2
	warp_event 11,  4, ROUTE_42, 1
	warp_event 11,  5, ROUTE_42, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateOfficerScript, -1
	object_event  8,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateSkierScript, -1
