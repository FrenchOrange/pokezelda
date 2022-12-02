	object_const_def
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route8SaffronGateOfficerScript:
	jumptextfaceplayer Route8SaffronGateOfficerText

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  4, ROUTE_8, 1
	warp_event 11,  5, ROUTE_8, 2
	warp_event  2,  4, SAFFRON_CITY, 11
	warp_event  2,  5, SAFFRON_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
