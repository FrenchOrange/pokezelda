	object_const_def
	const WHIRLISLANDB1F_POKE_BALL1
	const WHIRLISLANDB1F_POKE_BALL2
	const WHIRLISLANDB1F_POKE_BALL3
	const WHIRLISLANDB1F_POKE_BALL4
	const WHIRLISLANDB1F_POKE_BALL5
	const WHIRLISLANDB1F_BOULDER
	const WHIRLISLANDB1F_FISHER

WhirlIslandB1F_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandB1FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB1FCarbos:
	itemball CARBOS

WhirlIslandB1FCalcium:
	itemball CALCIUM

WhirlIslandB1FNugget:
	itemball NUGGET

WhirlIslandB1FEscapeRope:
	itemball ESCAPE_ROPE

WhirlIslandB1FBoulder:
	jumpstd StrengthBoulderScript

TrainerDollManiacAdrian:
	trainer DOLL_MANIAC, ADRIAN, EVENT_BEAT_DOLL_MANIAC_ADRIAN, DollManiacAdrianSeenText, DollManiacAdrianBeatenText, 0, .Script

.Script:
	opentext
	writetext DollManiacAdrianAfterBattleText
	promptbutton
	setevent EVENT_DECO_SHELLDER_DOLL
	writetext GetShellderDollText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	special FadeBlackQuickly
	disappear WHIRLISLANDB1F_FISHER
	pause 15
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 15
	special FadeInQuickly
	end

DollManiacAdrianSeenText:
	text_far _DollManiacSeenText
	text_end

DollManiacAdrianBeatenText:
	text_far _DollManiacBeatenText
	text_end

DollManiacAdrianAfterBattleText:
	text_far _DollManiacAfterText
	text_end

GetShellderDollText:
	text "<PLAYER> obtained"
	line "SHELLDER DOLL!"
	done

WhirlIslandB1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY

WhirlIslandB1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL

WhirlIslandB1FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE

WhirlIslandB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, WHIRL_ISLAND_NW, 2
	warp_event 35,  3, WHIRL_ISLAND_NE, 2
	warp_event 29,  9, WHIRL_ISLAND_NE, 3
	warp_event  9, 31, WHIRL_ISLAND_SW, 3
	warp_event 23, 31, WHIRL_ISLAND_SW, 2
	warp_event 31, 29, WHIRL_ISLAND_SE, 2
	warp_event 25, 21, WHIRL_ISLAND_B2F, 1
	warp_event 13, 27, WHIRL_ISLAND_B2F, 2
	warp_event 17, 21, WHIRL_ISLAND_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event 30,  4, BGEVENT_ITEM, WhirlIslandB1FHiddenRareCandy
	bg_event 36, 18, BGEVENT_ITEM, WhirlIslandB1FHiddenUltraBall
	bg_event  2, 23, BGEVENT_ITEM, WhirlIslandB1FHiddenFullRestore

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FFullRestore, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	object_event  2, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCarbos, EVENT_WHIRL_ISLAND_B1F_CARBOS
	object_event 33, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCalcium, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	object_event 17,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FNugget, EVENT_WHIRL_ISLAND_B1F_NUGGET
	object_event 19, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FEscapeRope, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
	object_event 23, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FBoulder, -1
	object_event 20, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerDollManiacAdrian, EVENT_DECO_SHELLDER_DOLL
