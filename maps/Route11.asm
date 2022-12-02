	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_GENTLEMAN
	const ROUTE11_FRUIT_TREE
	const VERMILIONCITY_BIG_SNORLAX

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext VermilionCitySnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext VermilionCityRadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	reloadmapafterbattle
	end

VermilionCitySnorlaxSleepingText:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

VermilionCityRadioNearSnorlaxText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

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
	line "large POKéMON as"
	cont "this SNORLAX where"
	cont "I come from."
	done

VermilionCityDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  5, DIGLETTS_CAVE, 1
	warp_event 49,  8, ROUTE_11_GATE, 1
	warp_event 49,  9, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, VermilionCityDiglettsCaveSign

	def_object_events
	object_event 36, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 27,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterJason, -1
	object_event 44,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicHerman, -1
	object_event 16,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 23, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanVirgil, -1
	object_event 48,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
	object_event  4,  6, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
