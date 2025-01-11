	object_const_def
	const ROUTE21_SWIMMER_GIRL1
	const ROUTE21_SWIMMER_GIRL2
	const ROUTE21_SWIMMER_GIRL3
	const ROUTE21_SWIMMER_GIRL4
	const ROUTE21_SWIMMER_GUY1
	const ROUTE21_SWIMMER_GUY2
	const ROUTE21_SWIMMER_GUY3
	const ROUTE21_FISHER
	const ROUTE21_PHARMACIST

Route21_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .LandBlocks

.LandBlocks:
	changeblock -2, 10, $74 ; grass
	changeblock -4, 10, $0a ; grass
	changeblock -2, 12, $0a ; grass
	changeblock -4, 12, $0a ; grass
	changeblock -2, 14, $1f ; shore
	changeblock -4, 14, $1f ; shore
	endcallback

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermDaryl:
	trainer SWIMMERM, DARYL, EVENT_BEAT_SWIMMERM_DARYL, SwimmermDarylSeenText, SwimmermDarylBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermDarylAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermLewis:
	trainer SWIMMERM, LEWIS, EVENT_BEAT_SWIMMERM_LEWIS, SwimmermLewisSeenText, SwimmermLewisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermLewisAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfTara:
	trainer SWIMMERF, TARA, EVENT_BEAT_SWIMMERF_TARA, SwimmerfTaraSeenText, SwimmerfTaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfTaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfJody:
	trainer SWIMMERF, JODY, EVENT_BEAT_SWIMMERF_JODY, SwimmerfJodySeenText, SwimmerfJodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJodyAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarEvan:
	trainer BURGLAR, EVAN, EVENT_BEAT_BURGLAR_EVAN, BurglarEvanSeenText, BurglarEvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarEvanAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Land ho! Gotta"
	line "keep going!"
	done

SwimmermSethBeatenText:
	text "Glug…"
	done

SwimmermSethAfterBattleText:
	text "This arrogant guy"
	line "was at CINNABAR's"
	cont "volcano."
	done

SwimmerfNikkiSeenText:
	text "If I win, you have"
	line "to help me with my"
	cont "suntan lotion!"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "sunburn…"
	done

SwimmerfNikkiAfterBattleText:
	text "I have to watch"
	line "out for blemishes"
	cont "caused by the sun."
	done

FisherArnoldSeenText:
	text "I'm bored by fish-"
	line "ing. Let's battle!"
	done

FisherArnoldBeatenText:
	text "Utter failure…"
	done

FisherArnoldAfterBattleText:
	text "I'll just go back"
	line "to fishing…"
	done

SwimmermDarylSeenText:
	text "What's that I'm"
	line "chewing on? Well a"
	cont "RAGECANDYBAR!"
	done

SwimmermDarylBeatenText:
	text "My candybar! It"
	line "fell in the water…"
	done

SwimmermDarylAfterBattleText:
	text "RAGECANDYBAR is a"
	line "specialty from the"
	cont "LAKE OF RAGE."

	para "The one famous for"
	line "its big MAGIKARP!"
	done

SwimmermLewisSeenText:
	text "I swim between"
	line "PALLET TOWN and"
	cont "CINNABAR ISLAND"
	cont "as exercise!"
	done

SwimmermLewisBeatenText:
	text "One lap, two laps…"
	line "Hmm…"
	done

SwimmermLewisAfterBattleText:
	text "I'm not good with"
	line "numbers, so I"
	cont "tend to forget my"
	cont "current lap count."
	done

SwimmerfLisaSeenText:
	text "Hehe. You fell in"
	line "my trap!"
	done

SwimmerfLisaBeatenText:
	text "You broke free!"
	done

SwimmerfLisaAfterBattleText:
	text "TENTACOOL has a"
	line "strong poison that"
	cont "paralyzes foes."
	para "Cool, isn't it?"
	done

SwimmerfTaraSeenText:
	text "I can't wait for"
	line "my SHELLDER to"
	cont "evolve into"
	cont "stunning CLOYSTER!"
	done

SwimmerfTaraBeatenText:
	text "No necklaces for"
	line "me just yet."
	done

SwimmerfTaraAfterBattleText:
	text "CLOYSTER is famous"
	line "for its gorgeous"
	cont "dark pearl."

	para "They're also so" 
	line "big! Larger than"
	cont "my head even!"
	done

SwimmerfJodySeenText:
	text "Yes! My #MON"
	line "finally evolved!"
	done

SwimmerfJodyBeatenText:
	text "My #MON, isn't"
	line "it neat?"
	done

SwimmerfJodyAfterBattleText:
	text "GYARADOS is like a"
	line "sea serpent of"
	cont "legends."

	para "To think it starts"
	line "out as a lousy"
	cont "MAGIKARP."
	done

BurglarEvanSeenText:
	text "I wanted to look"
	line "for precious stuff"
	cont "to steal in the"

	para "#MON MANSION,"
	line "but it's gone now!"
	done

BurglarEvanBeatenText:
	text "I just can't do"
	line "anything right!"
	done

BurglarEvanAfterBattleText:
	text "Err… Mind lending"
	line "me a hand? I think"
	cont "I'm stranded here."
	done

Route21_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13, 18, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event 17, 79, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfLisa, -1
	object_event  8, 40, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfTara, -1
	object_event 10, 39, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJody, -1
	object_event 16, 32, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event  3, 71, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermDaryl, -1
	object_event  9, 52, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermLewis, -1
	object_event  6, 24, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event 16, 56, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerBurglarEvan, -1
