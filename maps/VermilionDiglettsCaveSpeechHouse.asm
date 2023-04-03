	object_const_def
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_BUG_CATCHER
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_DIGLETT

VermilionDiglettsCaveSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglett:
	opentext
	writetext VermilionDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "Over many years,"
	line "DIGLETT dug a"
	cont "large tunnel."

	para "That tunnel goes"
	line "to a distant town."
	done

VermilionDiglettsCaveSpeechHouseBugCatcherScript:
	faceplayer
	opentext
	writetext BugCatcherIntroText
	yesorno
	iftrue .BugCatcherSaidYes
	writetext BugCatcherSaidNoText
	waitbutton
	closetext
	turnobject VERMILIONDIGLETTSCAVESPEECHHOUSE_BUG_CATCHER, UP
	end

.BugCatcherSaidYes
	writetext BugCatcherSaidYesText
	waitbutton
	closetext
	turnobject VERMILIONDIGLETTSCAVESPEECHHOUSE_BUG_CATCHER, UP
	end

BugCatcherIntroText:
	text "Tell me, what do"
	line "you think DIGLETT's"
	cont "body is like?"
	done

BugCatcherSaidYesText:
	text "…Yes? So do you"
	line "think it's nice?"

	para "Or… Good-looking?"

	para "… … …"

	para "You know, maybe"
	line "some things are"
	cont "best left alone."
	done

BugCatcherSaidNoText:
	text "…No? What do you"
	line "mean by that?"

	para "It has to have a"
	line "body under all"
	cont "that dirt!"

	para "Its neck can't just"
	line "keep going, and"
	cont "going… R-right?"
	done

VermilionDiglettText:
	text "DIGLETT: Dig! Dig!"
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VERMILION_CITY, 6
	warp_event  5,  7, VERMILION_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseBugCatcherScript, -1
	object_event  8,  4, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionDiglett, -1
