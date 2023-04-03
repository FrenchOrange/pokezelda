	object_const_def
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

Route16SignExtra:
	jumptext Route16SignExtraText

Route17Sign1:
	jumptext Route17Sign1Text

Route17Sign2:
	jumptext Route17Sign2Text

Route17Sign3:
	jumptext Route17Sign3Text

Route17Sign4:
	jumptext Route17Sign4Text

Route17Sign5:
	jumptext Route17Sign5Text

Route17Sign6:
	jumptext Route17Sign6Text

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerDarrell:
	trainer BIKER, DARRELL, EVENT_BEAT_BIKER_DARRELL, BikerDarrellSeenText, BikerDarrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDarrellAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerKazu:
	trainer BIKER, KAZU, EVENT_BEAT_BIKER_KAZU, BikerKazuSeenText, BikerKazuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerKazuAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

Route17HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_17_HIDDEN_FULL_RESTORE

Route17HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_17_HIDDEN_RARE_CANDY

BikerRileySeenText:
	text "Hey, you! You're"
	line "from JOHTO, huh?"
	done

BikerRileyBeatenText:
	text "Whoa, you kick!"
	done

BikerRileyAfterBattleText:
	text "Don't get cocky,"
	line "you JOHTO punk!"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "BICYCLE!"
	done

BikerJoelBeatenText:
	text "But you don't just"
	line "look cool…"
	done

BikerJoelAfterBattleText:
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	text "Yikes! You've got"
	line "awesome torque!"
	done

BikerGlennAfterBattleText:
	text "Hands-free riding"
	line "is considered cool"
	cont "on CYCLING ROAD."
	done

BikerCharlesSeenText:
	text "We're fearless"
	line "highway stars!"
	done

BikerCharlesBeatenText:
	text "Arrrgh! Crash and"
	line "burn!"
	done

BikerCharlesAfterBattleText:
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

BikerDarrellSeenText:
	text "Would you look at"
	line "that. Some baby"
	cont "trainer is biking"
	cont "down our turf."
	done

BikerDarrellBeatenText:
	text "I lost my balance!"
	line "That's all!"
	done

BikerDarrellAfterBattleText:
	text "Grumble… Now scram"
	line "before I call my"
	cont "pals for help."
	done

BikerKazuSeenText:
	text "Did you forget"
	line "your training"
	cont "wheels at home?"
	done

BikerKazuBeatenText:
	text "Outclassed by such"
	line "a wimp… Ouch."
	done

BikerKazuAfterBattleText:
	text "Maybe it's me who"
	line "needs training"
	cont "wheels after all…"
	done

Route16SignExtraText:
	text "ROUTE 16"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route17Sign1Text:
	text "It's a notice!"

	para "Watch out for"
	line "discarded items!"
	done

Route17Sign2Text:
	text "TRAINER TIPS"

	para "All #MON are"
	line "unique."

	para "Even #MON of"
	line "the same type and"
	cont "level grow at"
	cont "different rates."
	done

Route17Sign3Text:
	text "Watch your step!"
	para "The slope makes"
	line "it hard to steer!"
	done

Route17Sign4Text:
	text "ROUTE 17"
	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route17Sign5Text:
	text "It's a notice!"

	para "Don't throw the"
	line "game, throw #"
	cont "BALLs instead!"
	done

Route17Sign6Text:
	text "CYCLING ROAD"
	line "Slope ends here!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 16, 17, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  5, 103, BGEVENT_ITEM, Route17HiddenMaxElixer
	bg_event 17, 77, BGEVENT_ITEM, Route17HiddenFullRestore
	bg_event  8, 70, BGEVENT_ITEM, Route17HiddenRareCandy
	bg_event  5, -1, BGEVENT_READ, Route16SignExtra
	bg_event  9, 51, BGEVENT_READ, Route17Sign1
	bg_event  9, 63, BGEVENT_READ, Route17Sign2
	bg_event  9, 75, BGEVENT_READ, Route17Sign3
	bg_event  9, 87, BGEVENT_READ, Route17Sign4
	bg_event  9, 111, BGEVENT_READ, Route17Sign5
	bg_event  9, 141, BGEVENT_READ, Route17Sign6

	def_object_events
	object_event  5, 33, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  5, 86, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event 10, 120, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event 14, 98, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
	object_event 14, 29, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBikerDarrell, -1
	object_event 18, 57, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerKazu, -1
