	object_const_def
	const ROUTE7UNDERGROUNDPATHENTRANCE_YOUNGSTER

Route7UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathEntranceYoungsterScript:
	jumptextfaceplayer Route7UndergroundPathEntranceYoungsterText

Route7UndergroundPathEntranceYoungsterText:
	text "I went to shop at"
	line "the dept. store"
	cont "in CELADON but…"

	para "There are shady"
	line "looking people"
	cont "hanging around the"
	cont "UNDERGROUND PATH."

	para "I'm scared to go"
	line "back to LAVENDER!"
	done

Route7UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, ROUTE_7, 3
	warp_event  6,  8, ROUTE_7, 3
	warp_event  6,  3, UNDERGROUND_PATH_WEST_EAST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route7UndergroundPathEntranceYoungsterScript, -1
