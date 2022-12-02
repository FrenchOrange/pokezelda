	object_const_def
	const SEAFOAMISLANDSB2F_ROCKER
	const SEAFOAMISLANDSB2F_BOULDER1
	const SEAFOAMISLANDSB2F_BOULDER2

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 10, SEAFOAMISLANDSB2F_BOULDER1, .Boulder1
	stonetable 11, SEAFOAMISLANDSB2F_BOULDER2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLANDSB2F_BOULDER1
	clearevent EVENT_BOULDER_IN_SEAFOAM_B3F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLANDSB2F_BOULDER2
	clearevent EVENT_BOULDER_IN_SEAFOAM_B3F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIslandsB2FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end

SeafoamIslandsB2FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslandsB2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

SeafoamIslandsB2FHiddenNugget:
	hiddenitem NUGGET, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_NUGGET

TrainerBoarderJacques:
	trainer BOARDER, JACQUES, EVENT_BEAT_BOARDER_JACQUES, BoarderJacquesSeenText, BoarderJacquesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderJacquesAfterBattleText
	waitbutton
	closetext
	end

BoarderJacquesSeenText:
	text "Rushing water is"
	line "such a soothing"
	cont "sound… Hey! "

	para "Don't ruin my mood!"
	done

BoarderJacquesBeatenText:
	text "Maybe swimming is"
	line "more my thing?"
	done

BoarderJacquesAfterBattleText:
	text "This cave has a"
	line "river flowing"
	cont "through it."

	para "I wonder where it"
	line "leads to."
	done

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 4
	warp_event 13,  7, SEAFOAM_ISLANDS_B1F, 5
	warp_event 25, 11, SEAFOAM_ISLANDS_B1F, 6
	warp_event 19, 15, SEAFOAM_ISLANDS_B1F, 7
	warp_event 25,  3, SEAFOAM_ISLANDS_B3F, 1
	warp_event  5, 13, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25, 13, SEAFOAM_ISLANDS_B3F, 3
	warp_event 19,  7, SEAFOAM_ISLANDS_B2F, 10 ; hole (from)
	warp_event 22,  7, SEAFOAM_ISLANDS_B2F, 11 ; hole (from)
	warp_event 19,  6, SEAFOAM_ISLANDS_B3F, 6 ; hole
	warp_event 22,  6, SEAFOAM_ISLANDS_B3F, 7 ; hole

	def_coord_events

	def_bg_events
	bg_event 15, 15, BGEVENT_ITEM, SeafoamIslandsB2FHiddenNugget

	def_object_events
	object_event 11,  9, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBoarderJacques, -1
	object_event 18,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B2F_1
	object_event 23,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B2F_2
