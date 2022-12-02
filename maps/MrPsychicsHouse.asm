	object_const_def
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	promptbutton
	verbosegiveitem TM_PSYCHIC_M
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
	end

MrPsychicsHouseBookshelf:
	jumpstd DifficultBookshelfScript

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is PSYCHIC."

	para "It may lower the"
	line "target's SPCL.DEF."
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, SAFFRON_CITY, 5
	warp_event  5,  7, SAFFRON_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	def_object_events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
