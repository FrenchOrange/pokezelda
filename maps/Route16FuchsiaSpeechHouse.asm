	object_const_def
	const ROUTE16FUCHSIASPEECHHOUSE_TEACHER
	const ROUTE16FUCHSIASPEECHHOUSE_LASS

Route16FuchsiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route16FuchsiaSpeechHouseTeacherScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseTeacherText

Route16FuchsiaSpeechHouseLassScript:
	faceplayer
	opentext
	writetext Route16FuchsiaSpeechHouseLassFlyText
	yesorno
	iffalse .TutorRefused
	setval MT05_MOVE
	writetext Route16FuchsiaSpeechHouseLassFlyClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext Route16FuchsiaSpeechHouseLassFlyRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Route16FuchsiaSpeechHouseLassFlyTaught
	waitbutton
	closetext
	end

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

Route16FuchsiaSpeechHouseTeacherText:
	text "Pssst."

	para "Don't tell anyone,"
	line "but a celebrity"
	cont "lives here!"

	para "We keep the house"
	line "tidy while she's"
	cont "away on vacation."

	para "Her FEAROW is so"
	line "majestic, I wish"
	cont "my POKéMON could"
	cont "FLY that well…"
	done

Route16FuchsiaSpeechHouseLassFlyText:
	text "The girl who lives"
	line "here is famous,"
	cont "but still very"
	cont "down to earth."

	para "That's funny, since"
	line "she is known for"
	cont "doing elaborate"

	para "aerial moves while"
	line "riding her FEAROW."

	para "Haha! Best I can"
	line "do is tie balloons"
	cont "to my PIKACHU to"
	cont "make it FLY."

	para "Say, I could teach"
	line "your PIKACHU how"
	cont "to FLY!"

	para "Give it a go?"
	done

Route16FuchsiaSpeechHouseLassFlyRefused:
	text "I will keep an"
	line "extra balloon or"
	cont "two just in case."
	done

Route16FuchsiaSpeechHouseLassFlyClear:
	text_start
	done

Route16FuchsiaSpeechHouseLassFlyTaught:
	text "Awesome! Have fun"
	line "soaring the skies!"
	done

Route16FuchsiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_16, 1
	warp_event  5,  7, ROUTE_16, 1

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseTeacherScript, -1
	object_event  8,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseLassScript, -1
