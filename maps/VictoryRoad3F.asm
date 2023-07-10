	object_const_def
	const VICTORYROAD3F_POKE_BALL1
	const VICTORYROAD3F_COOLTRAINER_M
	const VICTORYROAD3F_COOLTRAINER_F
	const VICTORYROAD3F_SUPER_NERD
	const VICTORYROAD3F_BOULDER1
	const VICTORYROAD3F_BOULDER2
	const VICTORYROAD3F_BOULDER3
	const VICTORYROAD3F_BOULDER4
	const VICTORYROAD3F_BOULDER3_SWITCH

VictoryRoad3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_TILES, VictoryRoad3FSwitchCallback

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, VICTORYROAD3F_BOULDER4, .Boulder1
	stonetable 6, VICTORYROAD3F_BOULDER3, .Boulder2
	db -1 ; end

.Boulder1:
	disappear VICTORYROAD3F_BOULDER4
	setevent EVENT_BOULDER_IN_VICTORY_ROAD_3F
	clearevent EVENT_BOULDER_IN_VICTORY_ROAD_2F
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext VictoryRoad3FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end
	
.Boulder2:
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock  4,  6, $24 ; switch
	changeblock  8, 12, $03 ; wall
	reloadmappart
	closetext
	appear VICTORYROAD3F_BOULDER3_SWITCH
	disappear VICTORYROAD3F_BOULDER3
	setevent EVENT_SWITCH_IN_VICTORY_ROAD_3F
	end
	
VictoryRoad3FSwitchCallback:
	checkevent EVENT_SWITCH_IN_VICTORY_ROAD_3F
	iffalse .SwitchNotTriggered
	changeblock  4,  6, $24 ; switch
	changeblock  8, 12, $03 ; wall
.SwitchNotTriggered:
	endcallback	

VictoryRoad3FBoulder:
	jumpstd StrengthBoulderScript

TrainerCooltrainermSteve:
	trainer COOLTRAINERM, STEVE, EVENT_BEAT_COOLTRAINERM_STEVE, CooltrainermSteveSeenText, CooltrainermSteveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSteveAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfAlexa:
	trainer COOLTRAINERF, ALEXA, EVENT_BEAT_COOLTRAINERF_ALEXA, CooltrainerfAlexaSeenText, CooltrainerfAlexaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfAlexaAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerCarlos:
	trainer JUGGLER, CARLOS, EVENT_BEAT_JUGGLER_CARLOS, JugglerCarlosSeenText, JugglerCarlosBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerCarlosAfterBattleText
	waitbutton
	closetext
	end

CooltrainermSteveSeenText:
	text "Hey! You must be"
	line "looking for the"
	cont "exit, right?"
	done

CooltrainermSteveBeatenText:
	text "Don't give up!"
	line "You're close."
	done

CooltrainermSteveAfterBattleText:
	text "Me? I like caves!"
	para "The air is cool,"
	line "and spending time"
	cont "in one is calming."
	done

CooltrainerfAlexaSeenText:
	text "A new challenger!"
	para "Get ready for this"
	line "next battle!"
	done

CooltrainerfAlexaBeatenText:
	text "That was a tough"
	line "fight, good job!!"
	done

CooltrainerfAlexaAfterBattleText:
	text "Some trainers here"
	line "work on behalf of"
	cont "the LEAGUE."

	para "But not all of"
	line "them do, so they"
	cont "won't hold back!"
	done

JugglerCarlosSeenText:
	text "Look how well I"
	line "can juggle my"
	cont "#MON!"
	done

JugglerCarlosBeatenText:
	text "No, don't fall!"
	done

JugglerCarlosAfterBattleText:
	text "VOLTORB juggling"
	line "is so old-school."
	para "Now us JUGGLERS do"
	line "it with ELECTRODE!"
	done

VictoryRoad3FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

VictoryRoad3FTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoad3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  9, VICTORY_ROAD_2F, 3
	warp_event 29, 11, VICTORY_ROAD_2F, 4
	warp_event 29, 17, VICTORY_ROAD_2F, 5
	warp_event  4,  2, VICTORY_ROAD_2F, 6
	warp_event 24, 17, VICTORY_ROAD_2F, 8 ; hole
	warp_event  5,  7, VICTORY_ROAD_3F, 1 ; switch

	def_coord_events

	def_bg_events

	def_object_events
	object_event 28,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad3FTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event  7, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSteve, -1
	object_event  9, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfAlexa, -1
	object_event 28,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerJugglerCarlos, -1
	object_event 26, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FBoulder, -1
	object_event 15, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FBoulder, -1
	object_event 24,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FBoulder, EVENT_VICTORY_ROAD_3F_BOULDER
	object_event 23, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FBoulder, EVENT_BOULDER_IN_VICTORY_ROAD_3F
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad3FBoulder, EVENT_VICTORY_ROAD_3F_BOULDER_SWITCH