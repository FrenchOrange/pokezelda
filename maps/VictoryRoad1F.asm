	object_const_def
	const VICTORYROAD1F_POKE_BALL1
	const VICTORYROAD1F_POKE_BALL2
	const VICTORYROAD1F_COOLTRAINER_M
	const VICTORYROAD1F_COOLTRAINER_F
	const VICTORYROAD1F_BOULDER1
	const VICTORYROAD1F_BOULDER2
	const VICTORYROAD1F_BOULDER3

VictoryRoad1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_TILES, VictoryRoad1FSwitchCallback

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 3, VICTORYROAD1F_BOULDER3, .Boulder1
	db -1 ; end

.Boulder1:
	setevent EVENT_SWITCH_IN_VICTORY_ROAD_1F
	pause 30
	scall .FX
	refreshscreen
	changeblock 18, 14, $4E ; switch
	changeblock 10, 14, $03 ; wall
	reloadmappart
	disappear VICTORYROAD1F_BOULDER3
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

VictoryRoad1FBoulder:
	jumpstd StrengthBoulderScript


VictoryRoad1FSwitchCallback:
	checkevent EVENT_SWITCH_IN_VICTORY_ROAD_1F
	iffalse .SwitchNotTriggered
	changeblock 18, 14, $4E ; switch
	changeblock 10, 14, $03 ; wall
.SwitchNotTriggered:
	endcallback

TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfGemma:
	trainer COOLTRAINERF, GEMMA, EVENT_BEAT_COOLTRAINERF_GEMMA, CooltrainerfGemmaSeenText, CooltrainerfGemmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfGemmaAfterBattleText
	waitbutton
	closetext
	end

CooltrainermTylerSeenText:
	text "I see you have all"
	line "8 JOHTO BADGES."

	para "You must be tough…"
	line "I won't hold back!"
	done

CooltrainermTylerBeatenText:
	text "Not bad for"
	line "someone your age!"
	done

CooltrainermTylerAfterBattleText:
	text "There are lots of"
	line "trainers on the"
	cont "way to the LEAGUE."

	para "I won't be an easy"
	line "thing to reach it."
	done

CooltrainerfGemmaSeenText:
	text "You just entered"
	line "VICTORY ROAD. Do"
	cont "you know what that"
	cont "means?"
	done

CooltrainerfGemmaBeatenText:
	text "Stay strong! You're"
	line "doing great!"
	done

CooltrainerfGemmaAfterBattleText:
	text "You're heading to"
	line "INDIGO PLATEAU."

	para "The #MON LEAGUE"
	line "is right around"
	cont "the corner!"
	done

VictoryRoad1FMaxRevive:
	itemball MAX_REVIVE

VictoryRoad1FFullHeal:
	itemball FULL_HEAL

VictoryRoad1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 19, VICTORY_ROAD_GATE, 5
	warp_event  3,  3, VICTORY_ROAD_2F, 1
	warp_event 19, 15, VICTORY_ROAD_2F, 1 ; switch


	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad1FMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 11,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad1FFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  5,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermTyler, -1
	object_event 14,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfGemma, -1
	object_event  4, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FBoulder, -1
	object_event 16,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FBoulder, -1
	object_event  7, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad1FBoulder, -1
