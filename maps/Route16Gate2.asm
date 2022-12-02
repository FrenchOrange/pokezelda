	object_const_def
	const ROUTE16GATE2_GRAMPS

Route16Gate2_MapScripts:
	def_scene_scripts

	def_callbacks

Route16Gate2GrampsScript:
	jumptextfaceplayer Route16Gate2GrampsText

Route16Gate2GrampsText:
	text "I really need to"
	line "cut down that"
	cont "annoying shrub."

	para "But gardening is"
	line "no easy job."
	done

Route16Gate2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_16, 8
	warp_event  2,  5, ROUTE_16, 9
	warp_event 11,  4, ROUTE_16, 6
	warp_event 11,  5, ROUTE_16, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route16Gate2GrampsScript, -1
