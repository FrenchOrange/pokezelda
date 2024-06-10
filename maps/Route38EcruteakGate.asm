	object_const_def
	const ROUTE38ECRUTEAKGATE_OFFICER
	const ROUTE38ECRUTEAKGATE_LASS
	const ROUTE38ECRUTEAKGATE_GROWLITHE

Route38EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route38EcruteakGateOfficerScript:
	jumptextfaceplayer Route38EcruteakGateOfficerText

Route38EcruteakGateLassScript:
	opentext 
	writetext Route38EcruteakGateLassText1
	waitbutton
	closetext
	turnobject ROUTE38ECRUTEAKGATE_LASS, RIGHT
	opentext 
	writetext Route38EcruteakGateLassText2
	waitbutton
	closetext
	cry GROWLITHE
	waitsfx
	opentext 
	writetext Route38EcruteakGateLassText3
	waitbutton
	closetext
	turnobject ROUTE38ECRUTEAKGATE_LASS, DOWN
	end

Route38EcruteakGateGrowlitheScript:
	cry GROWLITHE
	opentext
	writetext Route38EcruteakGateGrowlitheText
	waitbutton
	closetext
	end

Route38EcruteakGateOfficerText:
	text "Where did you say"
	line "you're from?"

	para "NEW BARK TOWN?"

	para "PROF.ELM lives"
	line "over there, right?"

	para "You've come a long"
	line "way to get here."
	done

Route38EcruteakGateLassText1:
	text "I want to become"
	line "an OFFICER when I"
	cont "grow up!"

	para "I'll fight against"
	line "crime with my"
	cont "trusted #MON."
	done

Route38EcruteakGateLassText2:
	text "Isn't that right,"
	line "GROWLITHE?"
	done

Route38EcruteakGateLassText3:
	text "Good boy!"
	done

Route38EcruteakGateGrowlitheText:
	text "GROWLITHE: Gaaar!"
	done

Route38EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_38, 1
	warp_event  2,  5, ROUTE_38, 2
	warp_event 11,  4, ECRUTEAK_CITY, 14
	warp_event 11,  5, ECRUTEAK_CITY, 15

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateOfficerScript, -1
	object_event  2,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateLassScript, -1
	object_event  3,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route38EcruteakGateGrowlitheScript, -1
