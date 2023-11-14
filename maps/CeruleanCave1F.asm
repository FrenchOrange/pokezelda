	object_const_def

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CERULEAN_CAVE_1F_HIDDEN_RARE_CANDY

CeruleanCave1FHiddenBrightpowder:
	hiddenitem BRIGHTPOWDER, EVENT_CERULEAN_CAVE_1F_HIDDEN_BRIGHTPOWDER

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26, 20, CERULEAN_CITY, 8
	warp_event  3,  9, CERULEAN_CAVE_B1F, 1
	warp_event  3,  5, CERULEAN_CAVE_2F, 1
	warp_event  9,  3, CERULEAN_CAVE_2F, 2
	warp_event 29,  3, CERULEAN_CAVE_2F, 3
	warp_event 25,  9, CERULEAN_CAVE_2F, 4
	warp_event 19, 11, CERULEAN_CAVE_2F, 5
	warp_event  5, 13, CERULEAN_CAVE_2F, 6

	def_coord_events

	def_bg_events
	bg_event 16, 15, BGEVENT_ITEM, CeruleanCave1FHiddenRareCandy
	bg_event  8,  5, BGEVENT_ITEM, CeruleanCave1FHiddenBrightpowder

	def_object_events
