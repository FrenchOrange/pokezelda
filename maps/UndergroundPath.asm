	object_const_def
	const UNDERGROUNDPATH_PHARMACIST
	const UNDERGROUNDPATH_ROCKER

UndergroundPath_MapScripts:
	def_scene_scripts

	def_callbacks

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_UNDERGROUND_PATH_HIDDEN_X_SPECIAL

TrainerBurglarWren:
	trainer BURGLAR, WREN, EVENT_BEAT_BURGLAR_WREN, BurglarWrenSeenText, BurglarWrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarWrenAfterBattleText
	waitbutton
	closetext
	end

BurglarWrenSeenText:
	text "Oops, looks like"
	line "you dropped your"
	cont "wallet!"
	done

BurglarWrenBeatenText:
	text "Me-OUCH!"
	done

BurglarWrenAfterBattleText:
	text "I'm a cat burglar."

	para "That means I rob"
	line "people with the"
	cont "help of my MEOWTH."
	done

TrainerGuitaristTrey:
	trainer GUITARIST, TREY, EVENT_BEAT_GUITARIST_TREY, GuitaristTreySeenText, GuitaristTreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristTreyAfterBattleText
	waitbutton
	closetext
	end

GuitaristTreySeenText:
	text "Hey. Spare a coin?"
	done

GuitaristTreyBeatenText:
	text "Life's tough."
	done

GuitaristTreyAfterBattleText:
	text "Guess my music"
	line "isn't worth it."

	para "Me? I like GOLBAT's"
	line "supersonic sound"
	cont "waves."

	para "They're soothing."
	done

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  2, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  1, 38, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event  3,  9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  1, 30, BGEVENT_ITEM, UndergroundPathHiddenXSpecial

	def_object_events
	object_event  2, 18, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBurglarWren, -1
	object_event  4, 35, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGuitaristTrey, -1
