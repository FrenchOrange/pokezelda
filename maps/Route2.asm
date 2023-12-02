	object_const_def
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_BEAUTY
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_FRUIT_TREE

Route2_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .TopTreeBlocks

.TopTreeBlocks:
	changeblock -2,  0, $a4 ; tree
	changeblock 24,  0, $a4 ; tree
	changeblock 26,  0, $a4 ; tree
	endcallback

Route2Carbos:
	itemball CARBOS

Route2Elixir:
	itemball ELIXIR

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyKendra:
	trainer BEAUTY, KENDRA, EVENT_BEAT_BEAUTY_KENDRA, BeautyKendraSeenText, BeautyKendraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyKendraAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

BugCatcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

BeautyKendraSeenText:
	text "I don't like going"
	line "to VIRIDIAN FOREST"
	cont "much. Too many of"
	cont "those yucky bugs."
	done

BeautyKendraBeatenText:
	text "My pretties! No!"
	done

BeautyKendraAfterBattleText:
	text "What do you mean?"

	para "My #MON aren't"
	line "bugs, they're too"
	cont "cute for that!"
	done

Route2SignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

Route2DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 19, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 17, 39, ROUTE_2_GATE, 3
	warp_event 18, 35, ROUTE_2_GATE, 1
	warp_event 19, 35, ROUTE_2_GATE, 2
	warp_event 14,  9, DIGLETTS_CAVE, 3
	warp_event  5, 11, VIRIDIAN_NORTH_GATE, 3
	warp_event  6, 43, VIRIDIAN_SOUTH_GATE, 1

	def_coord_events

	def_bg_events
	bg_event  7, 65, BGEVENT_READ, Route2Sign
	bg_event 13, 11, BGEVENT_READ, Route2DiglettsCaveSign

	def_object_events
	object_event 12, 58, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event  2, 50, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherDoug, -1
	object_event 18, 54, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyKendra, -1
	object_event 21,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 16, 65, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixir, EVENT_ROUTE_2_ELIXIR
