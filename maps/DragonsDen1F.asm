DragonsDen1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .UnsetClairScene

.UnsetClairScene:
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_NOTHING
	endcallback

DragonsDen1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  6, BLACKTHORN_CITY, 8
	warp_event  3,  3, DRAGONS_DEN_1F, 4
	warp_event  5, 18, DRAGONS_DEN_B1F, 1
	warp_event  5, 15, DRAGONS_DEN_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
