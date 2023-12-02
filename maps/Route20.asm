	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GIRL3
	const ROUTE20_SWIMMER_GIRL4
	const ROUTE20_SWIMMER_GIRL5
	const ROUTE20_SWIMMER_GUY1
	const ROUTE20_SWIMMER_GUY2
	const ROUTE20_SWIMMER_GUY3

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRocks

.ClearRocks:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHal:
	trainer SWIMMERM, HAL, EVENT_BEAT_SWIMMERM_HAL, SwimmermHalSeenText, SwimmermHalBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHalAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermPaton:
	trainer SWIMMERM, PATON, EVENT_BEAT_SWIMMERM_PATON, SwimmermPatonSeenText, SwimmermPatonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermPatonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SeafoamIslandsSign:
	jumptext SeafoamIslandsSignText

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done

SwimmermHalSeenText:
	text "I tried swimming"
	line "in SEAFOAM. Now my"
	cont "body is freezing…"
	done

SwimmermHalBeatenText:
	text "So c-cold…"
	done

SwimmermHalAfterBattleText:
	text "Look… My lips"
	line "are all blue."
	done

SwimmermPatonSeenText:
	text "I'd like to try"
	line "swimming in JOHTO."

	para "I heard the seas"
	line "are warmer there."
	done

SwimmermPatonBeatenText:
	text "I want to see some"
	line "new sights!"
	done

SwimmermPatonAfterBattleText:
	text "Ever heard of the"
	line "WHIRL ISLANDS?"

	para "There are CLOYSTER"
	line "and STARMIE living"
	cont "there."

	para "No need for a"
	line "WATER STONE!"
	done

SwimmerfKatieSeenText:
	text "My MARILL is like"
	line "a beach-ball."
	para "There, catch!"
	done

SwimmerfKatieBeatenText:
	text "How funny, teehee!"
	done

SwimmerfKatieAfterBattleText:
	text "I wish I was a"
	line "buoy too. Swimming"
	cont "is fun, but it"
	cont "wears you out."
	done

SwimmerfMarySeenText:
	text "My BFF taught me"
	line "all about how hard"
	cont "#MON battles"
	cont "can get!"
	done

SwimmerfMaryBeatenText:
	text "Oh my, how strong"
	line "you are!"
	done

SwimmerfMaryAfterBattleText:
	text "So you understand"
	line "the hardships of"
	cont "battles, right?"

	para "In that case, I've"
	line "got nothing else"
	cont "to tell you."
	done

SwimmerfJillSeenText:
	text "My DEWGONG loves"
	line "the cold!"
	done

SwimmerfJillBeatenText:
	text "Glug glug…"
	done

SwimmerfJillAfterBattleText:
	text "I'll have to treat"
	line "my DEWGONG well to"
	cont "console it!"
	done

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

SeafoamIslandsSignText:
	text "SEAFOAM ISLANDS"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 58,  9, SEAFOAM_GYM, 1
	warp_event 48,  5, SEAFOAM_GYM, 2

	def_coord_events

	def_bg_events
	bg_event 57, 11, BGEVENT_READ, CinnabarGymSign
	bg_event 51,  7, BGEVENT_READ, SeafoamIslandsSign

	def_object_events
	object_event 86, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfNicole, -1
	object_event 92,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfLori, -1
	object_event 25, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
	object_event 34, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermHal, -1
	object_event 10,  8, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermPaton, -1
	object_event 67,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
	object_event 49, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfMary, -1
	object_event 50, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfJill, -1
