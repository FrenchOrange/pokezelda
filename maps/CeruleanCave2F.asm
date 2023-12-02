	object_const_def

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FTwistedSpoon:
	itemball TWISTEDSPOON

CeruleanCave2FSunStone:
	itemball SUN_STONE

CeruleanCave2FBigMushroom:
	itemball BIG_MUSHROOM

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  5, CERULEAN_CAVE_1F, 3
	warp_event 11,  3, CERULEAN_CAVE_1F, 4
	warp_event 31,  3, CERULEAN_CAVE_1F, 5
	warp_event 24,  8, CERULEAN_CAVE_1F, 6
	warp_event 21,  9, CERULEAN_CAVE_1F, 7
	warp_event  5, 13, CERULEAN_CAVE_1F, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event 31, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FTwistedSpoon, EVENT_CERULEAN_CAVE_2F_TWISTEDSPOON
	object_event 18,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FSunStone, EVENT_CERULEAN_CAVE_2F_SUN_STONE
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FBigMushroom, EVENT_CERULEAN_CAVE_2F_BIG_MUSHROOM
