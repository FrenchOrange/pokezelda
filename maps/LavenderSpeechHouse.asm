	object_const_def
	const LAVENDERSPEECHHOUSE_POKEFAN_F
	const LAVENDERSPEECHHOUSE_POKEFAN_M

LavenderSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderSpeechHousePokefanFScript:
	jumptextfaceplayer LavenderSpeechHousePokefanFText

LavenderSpeechHousePokefanMScript:
	jumptextfaceplayer LavenderSpeechHousePokefanMText

LavenderSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

LavenderSpeechHousePokefanFText:
	text "LAVENDER is a"
	line "tiny, quiet town"

	para "at the foot of the"
	line "mountains."

	para "It's gotten a bit"
	line "busier since the"

	para "RADIO TOWER was"
	line "built."
	done

LavenderSpeechHousePokefanMText:
	text "Up north is the"
	line "old POWER PLANT."

	para "It was abandoned"
	line "for a good while,"

	para "but now it's back"
	line "up and running!"
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 3
	warp_event  5,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
	object_event  8,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanMScript, -1
