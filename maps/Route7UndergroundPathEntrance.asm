Route7UndergroundPathEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

Route7UndergroundPathEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_7, 3
	warp_event  6,  7, ROUTE_7, 3
	warp_event  6,  3, UNDERGROUND_PATH_WEST_EAST, 1

	def_coord_events

	def_bg_events

	def_object_events
