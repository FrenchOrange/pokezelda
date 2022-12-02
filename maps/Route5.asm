	object_const_def
	const ROUTE5_OFFICER

Route5_MapScripts:
	def_scene_scripts

	def_callbacks

Route5OfficerScript:
	jumptextfaceplayer Route5OfficerText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

Route5OfficerText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 27, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  9, 29, ROUTE_5_SAFFRON_GATE, 1
	warp_event 10, 29, ROUTE_5_SAFFRON_GATE, 2
	warp_event 10, 21, ROUTE_5_CLEANSE_TAG_HOUSE, 1
	warp_event 10, 33, ROUTE_5_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 17, 29, BGEVENT_READ, Route5UndergroundPathSign
	bg_event 13, 21, BGEVENT_READ, HouseForSaleSign

	def_object_events
	object_event 17, 28, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5OfficerScript, EVENT_OFFICER_BLOCKS_UNDERGROUND_PATH
