	object_const_def
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS
	const ROUTE36RUINSOFALPHGATE_TEACHER

Route36RuinsOfAlphGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route36RuinsOfAlphGateOfficerScript:
	jumptextfaceplayer Route36RuinsOfAlphGateOfficerText

Route36RuinsOfAlphGateGrampsScript:
	jumptextfaceplayer Route36RuinsOfAlphGateGrampsText

Route36RuinsOfAlphGateTeacherScript:
	jumptextfaceplayer Route36RuinsOfAlphGateTeacherText

Route36RuinsOfAlphGateOfficerText:
	text "Don't you wonder"
	line "who'd build some-"
	cont "thing like this?"
	cont "And why?"
	done

Route36RuinsOfAlphGateGrampsText:
	text "Did you see that"
	line "strange tree in"
	cont "the road?"

	para "That may explain"
	line "why fewer people"

	para "are visiting the"
	line "RUINS OF ALPH."
	done

Route36RuinsOfAlphGateTeacherText:
	text "I was out visiting"
	line "the RUINS when my"
	cont "POKéMON suddenly"
	cont "became restless."

	para "It kept barking at"
	line "the walls."

	para "To be honest… It"
	line "was like we weren't"
	cont "alone in there."
	done

Route36RuinsOfAlphGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  0, ROUTE_36, 3
	warp_event  7,  0, ROUTE_36, 4
	warp_event  6,  7, RUINS_OF_ALPH_OUTSIDE, 9
	warp_event  7,  7, RUINS_OF_ALPH_OUTSIDE, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateOfficerScript, -1
	object_event  9,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateGrampsScript, -1
	object_event  8,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36RuinsOfAlphGateTeacherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
