	object_const_def
	const SUMMERBEACHHOUSE_ROCKER
	const SUMMERBEACHHOUSE_PIKACHU

SummerBeachHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SummerBeachHouseSign1:
	jumptext SummerBeachHouseSign1Text

SummerBeachHouseSign2:
	jumptext SummerBeachHouseSign2Text

SummerBeachHouseSign3:
	jumptext SummerBeachHouseSign3Text

SummerBeachHouseRockerScript:
	faceplayer
	opentext
	writetext SummerBeachHouseRockerSurfText
	yesorno
	iffalse .TutorRefused
	setval MT04_MOVE
	writetext SummerBeachHouseRockerSurfClear
	special MoveTutor
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext SummerBeachHouseRockerSurfRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext SummerBeachHouseRockerSurfTaught
	waitbutton
	closetext
	end

SummerBeachHousePikachuScript:
	faceplayer
	opentext
	writetext SummerBeachHousePikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

SummerBeachHouseRockerSurfText:
	text "Yo, my friend!"

	para "The name's VICTOR,"
	line "but everyone calls"
	cont "me the DUDE."

	para "I'm a pro surfer,"
	line "I ride waves with"
	cont "my PIKACHU."

	para "Say, I could teach"
	line "your PIKACHU how"
	cont "to SURF!"

	para "Give it a go?"
	done

SummerBeachHouseRockerSurfRefused:
	text "Come again if you"
	line "wanna go SURF!"
	done

SummerBeachHouseRockerSurfClear:
	text_start
	done

SummerBeachHouseRockerSurfTaught:
	text "Great! You earned"
	line "the right to SURF"
	cont "with the DUDE!"
	done

SummerBeachHousePikachuText:
	text "PIKACHU: PIKAA!"
	done

SummerBeachHouseSign1Text:
	text "30 years of waves!"
	line "SURFIN' DUDE"
	done

SummerBeachHouseSign2Text:
	text "SUMMER BEACH HOUSE"
	line "#MON welcome!"
	done

SummerBeachHouseSign3Text:
	text "The sea unites"
	line "all in surfdom!"
	done

SummerBeachHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events
	bg_event  5,  0, BGEVENT_READ, SummerBeachHouseSign1
	bg_event  9,  0, BGEVENT_READ, SummerBeachHouseSign2
	bg_event 13,  0, BGEVENT_READ, SummerBeachHouseSign3

	def_object_events
	object_event  4,  3, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SummerBeachHouseRockerScript, -1
	object_event  6,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SummerBeachHousePikachuScript, -1
