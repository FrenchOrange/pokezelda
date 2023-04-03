	object_const_def
	const ROUTE4POKECENTER1F_NURSE
	const ROUTE4POKECENTER1F_POKEFAN_F
	const ROUTE4POKECENTER1F_GENTLEMAN
	const ROUTE4POKECENTER1F_TWIN

Route4Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route4Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route4PokecenterPokefanFScript:
	jumptextfaceplayer Route4PokecenterPokefanFText

Route4PokecenterGentlemanScript:
	jumptextfaceplayer Route4PokecenterGentlemanText

Route4PokecenterTwinScript:
	jumptextfaceplayer Route4PokecenterTwinText

Route4PokecenterPokefanFText:
	text "CINNABAR ISLAND's"
	line "volcano erupted a"
	cont "year ago."

	para "The island was"
	line "totally wrecked,"
	cont "and the subsequent"

	para "seismic shock made"
	line "the bottom floors"
	cont "of MT.MOON too"

	para "unsafe for humans"
	line "to traverse."
	done

Route4PokecenterGentlemanText:
	text "I heard there were"
	line "troubles down at"
	cont "the POWER PLANT."

	para "We really can't"
	line "rest easy for too"
	cont "long around here…"
	done

Route4PokecenterTwinText:
	text "On MT.MOON SQUARE,"
	line "the moon feels so"
	cont "close to earth!"

	para "When I get on my"
	line "tippy toes, I can"
	cont "almost spot the"

	para "CLEFAIRY living"
	line "on its surface."
	done

Route4Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_4, 2
	warp_event  6,  7, ROUTE_4, 2
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route4Pokecenter1FNurseScript, -1
	object_event  3,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route4PokecenterPokefanFScript, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route4PokecenterGentlemanScript, -1
	object_event  4,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route4PokecenterTwinScript, -1
