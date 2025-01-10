	object_const_def
	const ROUTE5UNDERGROUNDPATHENTRANCE_FISHER

Route5UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route5UndergroundPathEntranceFisherScript:
	jumptextfaceplayer Route5UndergroundPathEntranceFisherText

Route5UndergroundPathEntranceFisherText:
	text "Many cities in"
	line "JOHTO have long"

	para "histories. I'd"
	line "love to visit!"
	done

Route5UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 22, ROUTE_5, 1
	warp_event  6, 22, ROUTE_5, 1
	warp_event  6, 17, UNDERGROUND_PATH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5UndergroundPathEntranceFisherScript, -1
