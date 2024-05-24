	object_const_def
	const DIGLETTSCAVE_POKEFAN_M
	const DIGLETTSCAVE_FISHER

DiglettsCave_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out from"
	cont "under the ground."

	para "I was so startled"
	line "I almost fell in"
	cont "the hole they'd"
	cont "just made."
	done

TrainerDollManiacLuke:
	trainer DOLL_MANIAC, LUKE, EVENT_BEAT_DOLL_MANIAC_LUKE, DollManiacLukeSeenText, DollManiacLukeBeatenText, 0, .Script

.Script:
	opentext
	writetext DollManiacLukeAfterBattleText
	promptbutton
	setevent EVENT_DECO_DIGLETT_DOLL
	writetext GetDiglettDollText
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	special FadeBlackQuickly
	disappear DIGLETTSCAVE_FISHER
	pause 15
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 15
	special FadeInQuickly
	end

DollManiacLukeSeenText:
	text_far _DollManiacSeenText
	text_end

DollManiacLukeBeatenText:
	text_far _DollManiacBeatenText
	text_end

DollManiacLukeAfterBattleText:
	text_far _DollManiacAfterText
	text_end

GetDiglettDollText:
	text "<PLAYER> obtained"
	line "DIGLETT DOLL!"
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 34, ROUTE_11, 1
	warp_event  5, 31, DIGLETTS_CAVE, 5
	warp_event 15,  6, ROUTE_2, 5
	warp_event 17,  3, DIGLETTS_CAVE, 6
	warp_event 37, 31, DIGLETTS_CAVE, 2
	warp_event  5,  5, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	def_object_events
	object_event  3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
	object_event 21, 27, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerDollManiacLuke, EVENT_DECO_DIGLETT_DOLL
