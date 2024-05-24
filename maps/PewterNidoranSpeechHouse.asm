	object_const_def
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_NIDORAN_M

PewterNidoranSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PewterNidoranSpeechHouseSuperNerdScript:
	opentext 
	writetext PewterNidoranSpeechHouseSuperNerdText
	waitbutton
	closetext
	cry NIDORAN_M
	waitsfx
	showemote EMOTE_HAPPY, PEWTERNIDORANSPEECHHOUSE_NIDORAN_M, 15
	pause 20
	showemote EMOTE_HEART, PEWTERNIDORANSPEECHHOUSE_SUPER_NERD, 15
	pause 20
	faceplayer
	opentext
	writetext PewterNidoranSpeechHouseSuperNerdTricksText
	waitbutton
	closetext
	turnobject PEWTERNIDORANSPEECHHOUSE_SUPER_NERD, RIGHT
	end

PewterNidoran:
	opentext
	writetext PewterNidoranText
	cry NIDORAN_M
	waitbutton
	closetext
	end

PewterNidoranSpeechHouseSuperNerdText:
	text "NIDORAN, shake!"
	done

PewterNidoranSpeechHouseSuperNerdTricksText:
	text "I'm teaching my"
	line "POKéMON tricks!"
	done

PewterNidoranText:
	text "NIDORAN: Gau gau!"
	done

PewterNidoranSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, PEWTER_CITY, 1
	warp_event  5,  7, PEWTER_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterNidoranSpeechHouseSuperNerdScript, -1
	object_event  6,  5, SPRITE_NIDORAN_M, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterNidoran, -1
