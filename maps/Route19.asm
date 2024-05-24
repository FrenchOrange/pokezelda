	object_const_def
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_SWIMMER_GUY4
	const ROUTE19_SWIMMER_GUY5
	const ROUTE19_SWIMMER_GUY6
	const ROUTE19_SWIMMER_GUY7

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  0, $7a ; rock
	changeblock  8,  0, $7a ; rock
	changeblock 10,  0, $7a ; rock
	changeblock 12,  2, $7a ; rock
	changeblock  8,  4, $7a ; rock
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermWalter:
	trainer SWIMMERM, WALTER, EVENT_BEAT_SWIMMERM_WALTER, SwimmermWalterSeenText, SwimmermWalterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermWalterAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmermTony:
	trainer SWIMMERM, TONY, EVENT_BEAT_SWIMMERM_TONY, SwimmermTonySeenText, SwimmermTonyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTonyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRick:
	trainer SWIMMERM, RICK, EVENT_BEAT_SWIMMERM_RICK, SwimmermRickSeenText, SwimmermRickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRickAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJames:
	trainer SWIMMERM, JAMES, EVENT_BEAT_SWIMMERM_JAMES, SwimmermJamesSeenText, SwimmermJamesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJamesAfterBattleText
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

SwimmermHaroldSeenText:
	text "Have you ever gone"
	line "swimming in the"
	cont "sea at night?"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "At night, the sea"
	line "turns black. It"

	para "feels like it will"
	line "swallow you up."
	done

SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Just… a little…"

	para "farther… to…"
	line "FUCHSIA…"
	done

SwimmermTuckerBeatenText:
	text "I'm drowning!"
	done

SwimmermTuckerAfterBattleText:
	text "I… asked my girl-"
	line "friend to swim to"
	cont "FUCHSIA… Gasp…"
	done

SwimmerfDawnSeenText:
	text "I'm disgusted by"
	line "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "I could beat you"
	line "at swimming…"
	done

SwimmerfDawnAfterBattleText:
	text "It's a quick swim"
	line "between FUCHSIA"

	para "and the SEAFOAM"
	line "ISLANDS…"

	para "Sheesh, some big"
	line "man my boyfriend"
	cont "is! What a wimp!"
	done

SwimmermJeromeSeenText:
	text "Swimming?"
	line "I'm lousy at it."

	para "I'm just splashing"
	line "around in these"
	cont "shallow waters."
	done

SwimmermJeromeBeatenText:
	text "I thought I could"
	line "win."
	done

SwimmermJeromeAfterBattleText:
	text "I might be bad at"
	line "swimming, but I"
	cont "love the sea."
	done

SwimmermWalterSeenText:
	text "Right across the"
	line "SEAFOAM GYM is the"
	cont "SEAFOAM ISLANDS"
	cont "cave entrance."
	done

SwimmermWalterBeatenText:
	text "I wonder what it's"
	line "like deep down."
	done

SwimmermWalterAfterBattleText:
	text "It's crazy cold in"
	line "that place! You"
	cont "have to be insane"
	cont "to swim there."
	done

SwimmermTonySeenText:
	text "A FISHER tried to"
	line "hook me! I'm no"
	cont "fish #MON!"
	done

SwimmermTonyBeatenText:
	text "I do know some"
	line "about fishing."
	done

SwimmermTonyAfterBattleText:
	text "Different #MON"
	line "can be reeled in"
	cont "at different times"
	cont "of the day."

	para "Take STARYU! At"
	line "night, they gather"
	cont "near the surface."
	done

SwimmermRickSeenText:
	text "Swimming does a"
	line "body good. Just"
	cont "look at me!"
	done

SwimmermRickBeatenText:
	text "Ouch! I think I"
	line "got a cramp…"
	done

SwimmermRickAfterBattleText:
	text "I have a killer"
	line "body, but my girl-"
	cont "friend says I reek"
	cont "of fish…"
	done

SwimmermJamesSeenText:
	text "I need to train"
	line "some more!"
	done

SwimmermJamesBeatenText:
	text "I'm falling behind!"
	done

SwimmermJamesAfterBattleText:
	text "Swimming is my"
	line "hobby. I like"
	cont "trying to outspeed"
	cont "my #MON."
	done

Route19SignText:
	text "SEA ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  9, SUMMER_BEACH_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 11, 11, BGEVENT_READ, Route19Sign

	def_object_events
	object_event  9, 22, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 16, 34, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermHarold, -1
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 22, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event 11, -1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, FuchsiaCityFisher1Script, -1
	object_event  9, -1, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, FuchsiaCityFisher2Script, -1
	object_event 11, 44, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermWalter, -1
	object_event 10, 45, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTony, -1
	object_event 13, 45, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermRick, -1
	object_event 12, 46, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJames, -1
