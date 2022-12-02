Route7_MapScripts:
	def_scene_scripts
	const ROUTE7_OFFICER

	def_callbacks

Route7OfficerScript:
	jumptextfaceplayer Route7OfficerText

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7UndergroundPathSignText:
	text "UNDERGROUND PATH"
	line "CELADON CITY -"
	cont "LAVENDER TOWN"
	done

Route7OfficerText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route7_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, ROUTE_7_SAFFRON_GATE, 1
	warp_event 11, 10, ROUTE_7_SAFFRON_GATE, 2
	warp_event  6, 13, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, Route7UndergroundPathSign

	def_object_events
	object_event  6, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route7OfficerScript, EVENT_OFFICER_BLOCKS_UNDERGROUND_PATH
