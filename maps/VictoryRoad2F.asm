	object_const_def
	const VICTORYROAD2F_SILVER
	const VICTORYROAD2F_POKE_BALL1
	const VICTORYROAD2F_POKE_BALL2
	const VICTORYROAD2F_BLACK_BELT1
	const VICTORYROAD2F_BLACK_BELT2
	const VICTORYROAD2F_FIRE_BREATHER1
	const VICTORYROAD2F_FIRE_BREATHER2
	const VICTORYROAD2F_SUPER_NERD
	const VICTORYROAD2F_BOULDER1
	const VICTORYROAD2F_BOULDER2
	const VICTORYROAD2F_BOULDER3
	const VICTORYROAD2F_BOULDER2_SWITCH
	const VICTORYROAD2F_BOULDER3_SWITCH

VictoryRoad2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable
	callback MAPCALLBACK_TILES, VictoryRoad2FSwitchCallback
	
.SetUpStoneTable:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable  9, VICTORYROAD2F_BOULDER2, .Boulder1
	stonetable 10, VICTORYROAD2F_BOULDER3, .Boulder2
	db -1 ; end

.Boulder1:
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock  2, 18, $20 ; switch
	changeblock  8, 10, $01 ; wall
	changeblock  8, 12, $03 ; wall
	reloadmappart
	closetext
	appear VICTORYROAD2F_BOULDER2_SWITCH
	disappear VICTORYROAD2F_BOULDER2
	setevent EVENT_WEST_SWITCH_IN_VICTORY_ROAD_2F
	end	

.Boulder2:
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 10, 18, $20 ; switch
	changeblock 24, 16, $03 ; wall
	reloadmappart
	closetext
	appear VICTORYROAD2F_BOULDER3_SWITCH
	disappear VICTORYROAD2F_BOULDER3
	setevent EVENT_EAST_SWITCH_IN_VICTORY_ROAD_2F
	end		
	
VictoryRoad2FSwitchCallback:
	checkevent EVENT_WEST_SWITCH_IN_VICTORY_ROAD_2F
	iffalse .Switch1NotTriggered
	changeblock  2, 18, $20 ; switch
	changeblock  8, 10, $01 ; wall
	changeblock  8, 12, $03 ; wall
.Switch1NotTriggered:
	checkevent EVENT_EAST_SWITCH_IN_VICTORY_ROAD_2F
	iffalse .Switch2NotTriggered
	changeblock 10, 18, $20 ; switch
	changeblock 24, 16, $03 ; wall
.Switch2NotTriggered	
	endcallback	

VictoryRoadRivalUp:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear VICTORYROAD2F_SILVER
	applymovement VICTORYROAD2F_SILVER, VictoryRoadRivalBattleApproachMovement1
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD2F_SILVER, VictoryRoadRivalBattleExitMovement1
	playsound SFX_EXIT_BUILDING
	disappear VICTORYROAD2F_SILVER
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end

VictoryRoadRivalDown:
	turnobject PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear VICTORYROAD2F_SILVER
	applymovement VICTORYROAD2F_SILVER, VictoryRoadRivalBattleApproachMovement2
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD2F_SILVER, VictoryRoadRivalBattleExitMovement2
	playsound SFX_EXIT_BUILDING
	disappear VICTORYROAD2F_SILVER
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end

VictoryRoadRivalNext:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD2F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltHideki:
	trainer BLACKBELT_T, HIDEKI, EVENT_BEAT_BLACKBELT_HIDEKI, BlackbeltHidekiSeenText, BlackbeltHidekiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltHidekiAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltKoishi:
	trainer BLACKBELT_T, KOISHI, EVENT_BEAT_BLACKBELT_KOISHI, BlackbeltKoishiSeenText, BlackbeltKoishiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltKoishiAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherDick:
	trainer FIREBREATHER, DICK, EVENT_BEAT_FIREBREATHER_DICK, FirebreatherDickSeenText, FirebreatherDickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherDickAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherNed:
	trainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherNedAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHarle:
	trainer JUGGLER, HARLE, EVENT_BEAT_JUGGLER_HARLE, JugglerHarleSeenText, JugglerHarleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHarleAfterBattleText
	waitbutton
	closetext
	end

VictoryRoad2FBoulder:
	jumpstd StrengthBoulderScript

VictoryRoad2FFullRestore:
	itemball FULL_RESTORE

VictoryRoad2FHPUp:
	itemball HP_UP

VictoryRoad2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

VictoryRoadRivalBattleApproachMovement1:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VictoryRoadRivalBattleApproachMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VictoryRoadRivalBattleExitMovement1:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

VictoryRoadRivalBattleExitMovement2:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBeforeText:
	text "Hold it."

	para "…Are you going to"
	line "take the #MON"
	cont "LEAGUE challenge?"

	para "…Don't make me"
	line "laugh."

	para "You're so much"
	line "weaker than I am."

	para "I'm not like I was"
	line "before."

	para "I now have the"
	line "best and strongest"

	para "#MON with me."
	line "I'm invincible!"

	para "<PLAYER>!"
	line "I challenge you!"
	done

VictoryRoadRivalDefeatText:
	text "…I couldn't win…"

	para "I gave it every-"
	line "thing I had…"

	para "What you possess,"
	line "and what I lack…"

	para "I'm beginning to"
	line "understand what"

	para "that dragon master"
	line "said to me…"
	done

VictoryRoadRivalAfterText:
	text "…I haven't given up"
	line "on becoming the"
	cont "greatest trainer…"

	para "I'm going to find"
	line "out why I can't"

	para "win and become"
	line "stronger…"

	para "When I do, I will"
	line "challenge you."

	para "And I'll beat you"
	line "down with all my"
	cont "power."

	para "…Humph! You keep"
	line "at it until then."
	done

VictoryRoadRivalVictoryText:
	text "…Humph!"

	para "When it comes down"
	line "to it, nothing can"
	cont "beat power."

	para "I don't need any-"
	line "thing else."
	done

BlackbeltHidekiSeenText:
	text "Look out kid!"
	line "I'm pumped and"
	cont "ready to fight!"
	done

BlackbeltHidekiBeatenText:
	text "I'll have to train"
	line "twice as hard now!"
	done

BlackbeltHidekiAfterBattleText:
	text "STRENGTH? Ah!"
	line "I don't need it."

	para "I can bench-press"
	line "my GRAVELER as if"
	cont "it were a GEODUDE!"
	done

BlackbeltKoishiSeenText:
	text "Grumble… I never"
	line "got to train at"
	cont "the FIGHTING DOJO."
	done

BlackbeltKoishiBeatenText:
	text "Grumble… Grumble…"
	done

BlackbeltKoishiAfterBattleText:
	text "I can't believe we"
	line "lost to that brat"
	cont "SABRINA and her"
	cont "psychic posse."
	done

FirebreatherDickSeenText:
	text "It's not hot enough"
	line "this cave."

	para "How about a battle"
	line "to warm me up?"
	done

FirebreatherDickBeatenText:
	text "A tad too hot for"
	line "my liking."
	done

FirebreatherDickAfterBattleText:
	text "There's a lot of"
	line "heat radiating off"
	cont "that one chamber."

	para "I wonder what lies"
	line "inside."
	done

FirebreatherNedSeenText:
	text "Caves are usually"
	line "chilly, but this"
	cont "one is quite warm."
	done

FirebreatherNedBeatenText:
	text "Talk about"
	line "breaking a sweat!"
	done

FirebreatherNedAfterBattleText:
	text "FIREBREATHERS like"
	line "heat. Though our"
	cont "costume isn't"

	para "really made for"
	line "high temperatures…"
	done

JugglerHarleSeenText:
	text "Don't you make me"
	line "lose focus!"
	para "I have a record to"
	line "beat!"
	done

JugglerHarleBeatenText:
	text "My streak went"
	line "sunny side up…"
	done

JugglerHarleAfterBattleText:
	text "I can juggle my"
	line "EXEGGCUTE for a"
	cont "super long time."

	para "Two and a half"
	line "hours to be exact!"
	done

VictoryRoad2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 10, VICTORY_ROAD_1F, 2
	warp_event 35,  9, ROUTE_23, 3
	warp_event 25,  9, VICTORY_ROAD_3F, 1
	warp_event 29,  9, VICTORY_ROAD_3F, 2
	warp_event 28, 15, VICTORY_ROAD_3F, 3
	warp_event  3,  3, VICTORY_ROAD_3F, 4
	warp_event 13,  3, VICTORY_ROAD_CHAMBER, 1
	warp_event 24, 18, VICTORY_ROAD_3F, 5
	warp_event  3, 18, VICTORY_ROAD_2F, 1 ; switch 1
	warp_event 11, 18, VICTORY_ROAD_2F, 1 ; switch 2

	def_coord_events
	coord_event 33, 10, SCENE_DEFAULT, VictoryRoadRivalUp
	coord_event 33, 11, SCENE_DEFAULT, VictoryRoadRivalDown

	def_bg_events
	bg_event 14,  8, BGEVENT_ITEM, VictoryRoad2FHiddenFullHeal

	def_object_events
	object_event 29,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event 11, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 29,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoad2FHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event 21, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltHideki, -1
	object_event 20, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltKoishi, -1
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherDick, -1
	object_event 16, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherNed, -1
	object_event 28,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerHarle, -1
	object_event  7,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, -1
	object_event  6, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, EVENT_VICTORY_ROAD_2F_BOULDER_1
	object_event 25, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, EVENT_BOULDER_IN_VICTORY_ROAD_2F
	object_event  3, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, EVENT_VICTORY_ROAD_2F_BOULDER_1_SWITCH ; West Boulder in place
	object_event 11, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoad2FBoulder, EVENT_VICTORY_ROAD_2F_BOULDER_2_SWITCH ; East Boulder in place
