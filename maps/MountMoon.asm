	object_const_def
	const MOUNTMOON_SILVER
	const MOUNTMOON_FISHER

MountMoon_MapScripts:
	def_scene_scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.RivalEncounter:
	sdefer .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	pause 15
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverMovementAfter:
	step UP
	step UP
	step UP
	step UP
	step_end

TrainerDollManiacMorgan:
	trainer DOLL_MANIAC, MORGAN, EVENT_BEAT_DOLL_MANIAC_MORGAN, DollManiacMorganSeenText, DollManiacMorganBeatenText, 0, .Script

.Script:
	opentext
	writetext DollManiacMorganAfterBattleText
	promptbutton
	setevent EVENT_DECO_CLEFAIRY_DOLL
	writetext GetClefairyDollText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	special FadeBlackQuickly
	disappear MOUNTMOON_FISHER
	pause 15
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 15
	special FadeInQuickly
	end

DollManiacMorganSeenText:
	text_far _DollManiacSeenText
	text_end

DollManiacMorganBeatenText:
	text_far _DollManiacBeatenText
	text_end

DollManiacMorganAfterBattleText:
	text_far _DollManiacAfterText
	text_end

GetClefairyDollText:
	text "<PLAYER> obtained"
	line "CLEFAIRY DOLL!"
	done

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

MtMoonZubatSign:
	jumptext MtMoonZubatSignText

MountMoonSilverTextBefore:
	text "<……> <……> <……>"

	para "It's been a while,"
	line "<PLAYER>."

	para "…Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#MON…"

	para "And we came up"
	line "with an answer."

	para "<PLAYER>, now we'll"
	line "show you!"
	done

MountMoonSilverTextWin:
	text "<……> <……> <……>"

	para "I thought I raised"
	line "my #MON to be"

	para "the best they"
	line "could be…"

	para "…But it still "
	line "wasn't enough…"
	done

MountMoonSilverTextAfter:
	text "<……> <……> <……>"

	para "…You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "MON trainer ever."

	para "Because these guys"
	line "are behind me."

	para "…Listen, <PLAYER>."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done

MountMoonSilverTextLoss:
	text "<……> <……> <……>"

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done

MtMoonSquareSignText:
	text "MT.MOON SQUARE"

	para "One step closer"
	line "to the moon."
	done

MtMoonZubatSignText:
	text "Beware! ZUBAT is"
	line "a blood sucker!"
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 28, ROUTE_4, 1
	warp_event 28,  8, ROUTE_4_EAST, 1
	warp_event  5,  5, MOUNT_MOON, 7
	warp_event 27,  3, MOUNT_MOON, 8
	warp_event 41,  6, MOUNT_MOON_SQUARE, 1
	warp_event 41, 20, MOUNT_MOON_SQUARE, 2
	warp_event 41,  3, MOUNT_MOON, 3
	warp_event 41, 17, MOUNT_MOON, 4

	def_coord_events

	def_bg_events
	bg_event  7,  6, BGEVENT_READ, MtMoonSquareSign
	bg_event 13, 20, BGEVENT_READ, MtMoonZubatSign

	def_object_events
	object_event 12, 23, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event 28, 27, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerDollManiacMorgan, EVENT_DECO_CLEFAIRY_DOLL
