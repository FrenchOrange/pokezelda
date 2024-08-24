	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_GENTLEMAN
	const ROUTE11_FRUIT_TREE
	const ROUTE11_BIG_SNORLAX
	const ROUTE11_FISHER

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

Route11Snorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext Route11SnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext Route11RadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear ROUTE11_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	reloadmapafterbattle
	end

Route11SnorlaxSleepingText:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

Route11RadioNearSnorlaxText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

Route11DiglettsCaveSign:
	jumptext Route11DiglettsCaveSignText

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanVirgil:
	trainer GENTLEMAN, VIRGIL, EVENT_BEAT_GENTLEMAN_VIRGIL, GentlemanVirgilSeenText, GentlemanVirgilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanVirgilAfterBattleText
	waitbutton
	closetext
	end

TrainerDollManiacJackie:
	trainer DOLL_MANIAC, JACKIE, EVENT_BEAT_DOLL_MANIAC_JACKIE, DollManiacJackieSeenText, DollManiacJackieBeatenText, 0, .Script

.Script:
	opentext
	writetext DollManiacJackieAfterBattleText
	promptbutton
	setevent EVENT_DECO_MACHOP_DOLL
	writetext GetMachopDollText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	special FadeBlackQuickly
	disappear ROUTE11_FISHER
	pause 30
	special FadeInQuickly
	end

DollManiacJackieSeenText:
	text_far _DollManiacSeenText
	text_end

DollManiacJackieBeatenText:
	text_far _DollManiacBeatenText
	text_end

DollManiacJackieAfterBattleText:
	text_far _DollManiacAfterText
	text_end

GetMachopDollText:
	text "<PLAYER> obtained"
	line "MACHOP DOLL!"
	done

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

YoungsterOwenSeenText:
	text "There's no cheat-"
	line "ing in #MON."

	para "Let's keep it fair"
	line "and square!"
	done

YoungsterOwenBeatenText:
	text "Huh? How did this"
	line "happen?"
	done

YoungsterOwenAfterBattleText:
	text "I fought fair and"
	line "square with honor."

	para "I don't regret"
	line "this at all."
	done

YoungsterJasonSeenText:
	text "It itches and"
	line "tickles a bit when"

	para "I wear shorts in"
	line "the grass."
	done

YoungsterJasonBeatenText:
	text "Aiyaaah!"
	line "I got stomped!"
	done

YoungsterJasonAfterBattleText:
	text "I'm going to catch"
	line "more #MON in"
	cont "the grass."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "I lost while I had"
	line "my eyes closed…"
	done

PsychicFidelSeenText:
	text "I can see it…"

	para "Everything to see"
	line "about you…"
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "your power…"
	done

PsychicFidelAfterBattleText:
	text "Strength in con-"
	line "viction…"

	para "You're strong be-"
	line "cause you believe"
	cont "in your #MON."
	done

GentlemanVirgilSeenText:
	text "Did you see it?"
	line "I've never seen"
	cont "anything like it!"
	done

GentlemanVirgilBeatenText:
	text "Massive! Towering!"
	line "Imposing!"
	done

GentlemanVirgilAfterBattleText:
	text "We don't have such"
	line "large #MON as"
	cont "this SNORLAX where"
	cont "I come from."
	done

Route11DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, DIGLETTS_CAVE, 1
	warp_event 49, 10, ROUTE_11_GATE, 1
	warp_event 49, 11, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, Route11DiglettsCaveSign

	def_object_events
	object_event 36, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 27,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterJason, -1
	object_event 44,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicHerman, -1
	object_event 16,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 23, 19, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanVirgil, -1
	object_event 48,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
	object_event  4,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11Snorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 55,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerDollManiacJackie, EVENT_DECO_MACHOP_DOLL
