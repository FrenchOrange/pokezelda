	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts
	scene_script .VermilionGymDoorsScript ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .VermilionGymDoorsCallback

.VermilionGymDoorsScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .done
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iffalse .resample
.resample
	callasm SampleVermilionGymTrashCans
.done
	endcallback


.DummyScene1:
	end


.VermilionGymDoorsCallback:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .NoDoors
	endcallback

.NoDoors:
	changeblock 6, 6, $01 ; floor
	endcallback


VermilionGymTrashCanScript:
	checkevent EVENT_VERMILION_GYM_SWITCH_2
	iftrue .trash_can
	callasm CheckVermilionGymTrashCan
	iftrue .open_lock
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .reset_switches
.trash_can
	jumpstd TrashCanScript

.open_lock
	opentext
	writetext VermilionGymFoundSwitchText
	playsound SFX_PUSH_BUTTON
	promptbutton
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	iftrue .second_switch
	writetext VermilionGymFoundFirstSwitchText
	playsound SFX_ENTER_DOOR
	setevent EVENT_VERMILION_GYM_SWITCH_1
	waitbutton
	closetext
	end

.second_switch
	writetext VermilionGymFoundSecondSwitchText
	playsound SFX_ENTER_DOOR
	setevent EVENT_VERMILION_GYM_SWITCH_2
	changeblock 6, 6, $01 ; floor
	reloadmappart
	setscene SCENE_FINISHED
	waitbutton
	closetext
	end

.reset_switches
	opentext
	writetext VermilionGymTrashCanText
	promptbutton
	writetext VermilionGymResetSwitchesText
	playsound SFX_WRONG
	waitbutton
	closetext
	callasm SampleVermilionGymTrashCans
	clearevent EVENT_VERMILION_GYM_SWITCH_1
	end

SampleVermilionGymTrashCans:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rSVBK], a
.loop
	call Random
	ld e, a
	swap e
	and $f
	jr z, .loop
	dec a
	ld [wVermilionGymTrashCan1], a
	call .GetSecondTrashCan
	ld [wVermilionGymTrashCan2], a
	pop af
	ldh [rSVBK], a
	ret

.GetSecondTrashCan:
	ld hl, .AdjacencyTable
	add a
	add a
	ld c, a
	ld a, e
	and %11
	add c
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

.AdjacencyTable:
	; left, right, up, down
	db  1,  1,  5,  5 ;  0 ( 1, 7)
	db  0,  2,  6,  6 ;  1 ( 3, 7)
	db  1,  3,  7,  7 ;  2 ( 5, 7)
	db  2,  4,  8,  8 ;  3 ( 7, 7)
	db  3,  3,  9,  9 ;  4 ( 9, 7)
	db  6,  6,  0, 10 ;  5 ( 1, 9)
	db  5,  7,  1, 11 ;  6 ( 3, 9)
	db  6,  8,  2, 12 ;  7 ( 5, 9)
	db  7,  9,  3, 13 ;  8 ( 7, 9)
	db  8,  8,  4, 14 ;  9 ( 9, 9)
	db 11, 11,  5,  5 ; 10 ( 1,11)
	db 10, 12,  6,  6 ; 11 ( 3,11)
	db 11, 13,  7,  7 ; 12 ( 5,11)
	db 12, 14,  8,  8 ; 13 ( 7,11)
	db 13, 13,  9,  9 ; 14 ( 9,11)

CheckVermilionGymTrashCan:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wVermilionGymTrashCan1)
	ldh [rSVBK], a
	checkevent EVENT_VERMILION_GYM_SWITCH_1
	jr z, .first
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, TRUE
	jr z, .done
	dec a ; FALSE
.done
	ld [wScriptVar], a
	pop af
	ldh [rSVBK], a
	ret

.first:
	ld a, [wVermilionGymTrashCan1]
	call .CheckTrashCan
	jr z, .yes
	ld a, [wVermilionGymTrashCan2]
	call .CheckTrashCan
	ld a, FALSE
	jr nz, .done
	ld a, [wVermilionGymTrashCan1]
	ld [wVermilionGymTrashCan2], a
.yes
	ld a, TRUE
	jr .done

.CheckTrashCan:
	ld c, a
	call GetFacingTileCoord
	call .ConvertCoordsToTrashCan
	cp c
	ret

.ConvertCoordsToTrashCan:
	ld a, d
	sub 5
	srl a
	ld d, a
	ld a, e
	sub 11
	srl a
	ld e, a
	add a
	add a
	add e
	add d
	ret


VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymGarbage:
	jumptext VermilionGymGarbageText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> received"
	line "THUNDERBADGE."
	done

LtSurgeThunderBadgeText:
	text "SURGE: THUNDER-"
	line "BADGE increases"
	cont "#MON's speed. "

	para "Consider it proof"
	line "that you defeated"

	para "me. You wear it"
	line "proudly, hear?"
	done

LtSurgeFightDoneText:
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done

GentlemanGregorySeenText:
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done

GentlemanGregoryAfterBattleText:
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done

GuitaristVincentSeenText:
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how shocking!"
	done

GuitaristVincentAfterBattleText:
	text "If the GYM's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done

JugglerHortonSeenText:
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "I was overpowered…"
	done

JugglerHortonAfterBattleText:
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "LT.SURGE is tough."
	done

VermilionGymGuideText:
	text "Yo! CHAMP in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "LT.SURGE is very"
	line "cautious. He has"
	cont "traps set all over"
	cont "the GYM."

	para "Why lucky, you may"
	line "ask? Because you"
	cont "can train yourself"
	cont "better that way!"

	para "Make up your mind"
	line "and head to SURGE!"
	done

VermilionGymGuideWinText:
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done

VermilionGymTrashCanText:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGymGarbageText:
	text "Yup! Just more"
	line "trash in there!"
	done

VermilionGymFoundSwitchText:
	text "A secret switch"
	line "beneath the trash?"

	para "Better press it."
	done

VermilionGymFoundFirstSwitchText:
	text "The first electric"
	line "fence unlocked!"
	done

VermilionGymFoundSecondSwitchText:
	text "The second"
	line "electric fence"

	para "unlocked! The"
	line "path is clear!"
	done

VermilionGymResetSwitchesText:
	text "Oh no, the elec-"
	line "tric fence locked"
	cont "again!"
	done

VermilionGymElectricFenceText:
	text "An electric fence!"
	line "Don't touch it!"
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 21, VERMILION_CITY, 7
	warp_event  7, 21, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event 11,  9, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event 11, 11, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  3, 13, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  5, 13, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  7, 13, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  9, 13, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event 11, 13, BGEVENT_READ, VermilionGymTrashCanScript
	bg_event  8,  3, BGEVENT_READ, VermilionGymGarbage
	bg_event  5, 17, BGEVENT_READ, VermilionGymStatue
	bg_event  8, 17, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  7,  4, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event 10, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  6,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  2, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  9, 17, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
