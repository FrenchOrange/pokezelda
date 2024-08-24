	object_const_def
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY
	const SILVERCAVEPOKECENTER1F_GRAMPS

SilverCavePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SilverCavePokecenter1FGrannyScript:
	jumptextfaceplayer SilverCavePokecenter1FGrannyText

SilverCavePokecenter1FGrannyText:
	text "Trainers who seek"
	line "power climb MT."

	para "SILVER despite its"
	line "many dangers…"

	para "With their trusted"
	line "#MON, they must"

	para "feel they can go"
	line "anywhere…"
	done

SilverCavePokecenter1FGrampsScript:
	faceplayer
	opentext
	checkitem COMPASS
	iftrue .GotCompass
	writetext SilverCavePokecenter1FGramps_NoItem
	waitbutton
	closetext
	end

.GotCompass:
	writetext SilverCavePokecenter1FGramps_HasItem
	promptbutton
	takeitem COMPASS
	giveitem HARDTACK
	writetext SilverCavePokecenter1FGramps_GetItem
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	readvar VAR_XCOORD
	ifequal 8, .GrampsScriptLeft
.GrampsLeavesScript
	applymovement SILVERCAVEPOKECENTER1F_GRAMPS, SilverCavePokecenter1FGrampsMovement
	playsound SFX_EXIT_BUILDING
	disappear SILVERCAVEPOKECENTER1F_GRAMPS
	waitsfx
	setevent EVENT_GAVE_COMPASS
	clearevent EVENT_GRAMPS_OUTSIDE_MT_SILVER
	end

.GrampsScriptLeft:
	applymovement PLAYER, SilverCavePokecenter1FPlayerMovement
	pause 15
	sjump .GrampsLeavesScript

SilverCavePokecenter1FPlayerMovement:
	step DOWN
	turn_head UP
	step_end

SilverCavePokecenter1FGrampsMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

SilverCavePokecenter1FGramps_NoItem:
	text "The forest at the"
	line "foot of MT.SILVER"
	cont "is so winding and"

	para "treacherous, don't"
	line "you agree?"

	para "It took me ages to"
	line "traverse it fully."
	cont "And now I couldn't"

	para "find my way back"
	line "home even if I"
	cont "wanted to…"
	done

SilverCavePokecenter1FGramps_HasItem:
	text "Aah! A COMPASS!!"

	para "I can finally head"
	line "back home!"

	para "I'll miss this"
	line "#MON CENTER, it"
	cont "became my refuge,"
	cont "my new home."

	para "Sniff…"

	para "To celebrate, you"
	line "can keep my old"
	cont "rations, kid!"
	done

SilverCavePokecenter1FGramps_GetItem:
	text "<PLAYER> obtained"
	line "HARDTACK."
	done

SilverCavePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  6,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FNurseScript, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGrannyScript, -1
	object_event  9,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGrampsScript, EVENT_GAVE_COMPASS
