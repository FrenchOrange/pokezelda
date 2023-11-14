	object_const_def
	const VIRIDIANNORTHGATE_TWIN
	const VIRIDIANNORTHGATE_BUG_CATCHER
	const VIRIDIANNORTHGATE_LASS

ViridianSouthGate_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianSouthGateTwinScript:
	jumptextfaceplayer ViridianSouthGateTwinText

ViridianSouthGateBugCatcherScript:
	jumptextfaceplayer ViridianSouthGateBugCatcherText

ViridianSouthGateLassScript:
	jumptextfaceplayer ViridianSouthGateLassText


ViridianSouthGateTwinText:
	text "Eeek!! This giant"
	line "WEEDLE just tried"
	cont "to eat me!"

	para "And what did my"
	line "boy-friend do?"

	para "The idiot tried"
	line "to catch it!"

	para "I could have died!"
	done

ViridianSouthGateBugCatcherText:
	text "Well… It was quite"
	line "a big WEEDLE, yes."

	para "With it, I would"
	line "have won the BUG-"
	cont "CATCHING CONTEST"
	cont "in a heartbeat…"
	done

ViridianSouthGateLassText:
	text "It looks like the"
	line "BUG-CATCHERS were"
	cont "shooed away by"
	cont "this CAMPER group."
	done

ViridianSouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, ROUTE_2, 7
	warp_event  7,  7, ROUTE_2, 7
	warp_event  6,  0, VIRIDIAN_FOREST, 2
	warp_event  7,  0, VIRIDIAN_FOREST, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ViridianSouthGateTwinScript, -1
	object_event  4,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianSouthGateBugCatcherScript, -1
	object_event 10,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianSouthGateLassScript, -1
