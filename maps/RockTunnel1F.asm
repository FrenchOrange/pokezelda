	object_const_def
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2
	const ROCKTUNNEL1F_POKEFAN_M1
	const ROCKTUNNEL1F_POKEFAN_M2

RockTunnel1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerHikerAntoine:
	trainer HIKER, ANTOINE, EVENT_BEAT_HIKER_ANTOINE, HikerAntoineSeenText, HikerAntoineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerAntoineAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerFrederick:
	trainer HIKER, FREDERICK, EVENT_BEAT_HIKER_FREDERICK, HikerFrederickSeenText, HikerFrederickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerFrederickAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDiane:
	trainer PICNICKER, DIANE, EVENT_BEAT_PICNICKER_DIANE, PicnickerDianeSeenText, PicnickerDianeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDianeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerPlum:
	trainer PICNICKER, PLUM, EVENT_BEAT_PICNICKER_PLUM, PicnickerPlumSeenText, PicnickerPlumBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerPlumAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerCathy:
	trainer PICNICKER, CATHY, EVENT_BEAT_PICNICKER_CATHY, PicnickerCathySeenText, PicnickerCathyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerCathyAfterBattleText
	waitbutton
	closetext
	end

RockTunnel1FElixir:
	itemball ELIXIR

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	hiddenitem X_ACCURACY, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem X_DEFEND, EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND

HikerAntoineSeenText:
	text "This cave used to"
	line "be more lively a"
	cont "few years ago."

	para "But recent ghost"
	line "rumors dampened"
	cont "its reputation."
	done

HikerAntoineBeatenText:
	text "You're a tough one,"
	line "kiddo!"
	done

HikerAntoineAfterBattleText:
	text "Now, most trainers"
	line "here are MEDIUMS,"
	cont "stray HIKERS, or"

	para "kids trying to"
	line "prove themselves."
	done

HikerFrederickSeenText:
	text "This place gives"
	line "me the creeps."
	para "I need a battle to"
	line "lift my spirits."
	done

HikerFrederickBeatenText:
	text "Ah! What was that"
	line "noise?!"
	done

HikerFrederickAfterBattleText:
	text "Sometimes, when I"
	line "stop walking, I"
	cont "still hear foot-"
	cont "steps behind me."

	para "But that's just"
	line "an echo… Right?"
	done

PicnickerDianeSeenText:
	text "I came here with"
	line "my friends, but we"
	cont "got separated…"
	done

PicnickerDianeBeatenText:
	text "Guys! Were did you"
	line "all go?"
	done

PicnickerDianeAfterBattleText:
	text "I'm more used to"
	line "the outdoors, not"
	cont "musty caves!"
	done

PicnickerPlumSeenText:
	text "Eek! Are you"
	line "following me?"
	done

PicnickerPlumBeatenText:
	text "That's not funny."
	line "Quit it!"
	done

PicnickerPlumAfterBattleText:
	text "My friends dared"
	line "me to go through"
	cont "this cave."

	para "They always pull"
	line "pranks on me…"
	done

PicnickerCathySeenText:
	text "I got lost, and I"
	line "think I'm walking"
	cont "in circles."
	done

PicnickerCathyBeatenText:
	text "Did I walk past"
	line "this rock already?"
	done

PicnickerCathyAfterBattleText:
	text "I should have"
	line "brought a #MON"
	cont "that knows FLASH."
	done

RockTunnel1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  4, ROUTE_10, 3
	warp_event 11, 26, ROUTE_10_SOUTH, 1
	warp_event  5,  3, ROCK_TUNNEL_B1F, 3
	warp_event 15,  9, ROCK_TUNNEL_B1F, 2
	warp_event 27,  3, ROCK_TUNNEL_B1F, 4
	warp_event 27, 13, ROCK_TUNNEL_B1F, 1

	def_coord_events

	def_bg_events
	bg_event 24,  4, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 21, 15, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

	def_object_events
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixir, EVENT_ROCK_TUNNEL_1F_ELIXIR
	object_event 13, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
	object_event 23,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerAntoine, -1
	object_event  3, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerFrederick, -1
	object_event 11, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDiane, -1
	object_event  9, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerPlum, -1
	object_event 27, 19, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerCathy, -1
