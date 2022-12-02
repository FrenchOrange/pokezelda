	object_const_def
	const ROUTE6_OFFICER
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_COOLTRAINER_M1
	const ROUTE6_COOLTRAINER_M2

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_COOLTRAINERM_ANDY, CooltrainermAndySeenText, CooltrainermAndyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAndyAfterBattleText
	waitbutton
	closetext
	end

Route6OfficerScript:
	jumptextfaceplayer Route6OfficerText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6OfficerText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "My PHANPY is the"
	line "cutest in the"
	cont "world."
	done

PokefanmRexBeatenText:
	text "My PHANPY!"
	done

PokefanmRexAfterBattleText:
	text "Look how adorable"
	line "my PHANPY acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

PokefanmAllanSeenText:
	text "My TEDDIURSA is"
	line "the cutest in the"
	cont "world."
	done

PokefanmAllanBeatenText:
	text "My TEDDIURSA!"
	done

PokefanmAllanAfterBattleText:
	text "Look how adorable"
	line "my TEDDIURSA acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

CooltrainermErickSeenText:
	text "I keep hearing"
	line "about some strong"
	cont "kid going around."
	para "Could it be you?"
	done

CooltrainermErickBeatenText:
	text "I shouldn't have"
	line "doubted you!"
	done

CooltrainermErickAfterBattleText:
	text "So you put a stop"
	line "to TEAM ROCKET's"
	cont "evil deeds?"

	para "I see. Now I truly"
	line "understand how"
	cont "strong you are!"
	done

CooltrainermAndySeenText:
	text "Hey, nice POKéMON!"
	line "You look like a"
	cont "good trainer!"
	para "Let's duke it out!"
	done

CooltrainermAndyBeatenText:
	text "With POKéMON, love"
	line "matters most."
	done

CooltrainermAndyAfterBattleText:
	text "I prefer POKéMON"
	line "that were raised"
	cont "with care. They"
	para "grow fond of you"
	line "faster, you know?"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 13, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event 10,  7, ROUTE_6_SAFFRON_GATE, 3
	warp_event 10,  3, ROUTE_6_SAFFRON_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 19, 15, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, Route6OfficerScript, EVENT_OFFICER_BLOCKS_UNDERGROUND_PATH
	object_event  9, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 10, 20, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
	object_event  1, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermErick, -1
	object_event 19, 28, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermAndy, -1
