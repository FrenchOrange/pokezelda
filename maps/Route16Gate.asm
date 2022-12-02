	object_const_def
	const ROUTE16GATE_OFFICER
	const ROUTE16GATE_SUPER_NERD

Route16Gate_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	def_callbacks

.DummyScene:
	end

Route16GateOfficerScript:
	jumptextfaceplayer Route16GateOfficerText

Route16GateSuperNerdScript:
	jumptextfaceplayer Route16GateSuperNerdText

Route16GateBicycleCheck:
	checkitem BICYCLE
	iffalse .NoBicycle
	end

.NoBicycle:
	showemote EMOTE_SHOCK, ROUTE16GATE_OFFICER, 15
	turnobject PLAYER, UP
	opentext
	writetext Route16GateCannotPassText
	waitbutton
	closetext
	applymovement PLAYER, Route16GateCannotPassMovement
	end

Route16GateCannotPassMovement:
	step RIGHT
	turn_head LEFT
	step_end

Route16GateOfficerText:
	text "CYCLING ROAD"
	line "starts here."

	para "It's all downhill,"
	line "so it's totally"
	cont "exhilarating."

	para "It's a great sort"
	line "of feeling that"

	para "you can't get from"
	line "a ship or train."
	done

Route16GateCannotPassText:
	text "Hey! Whoa! Stop!"

	para "You can't go out"
	line "on the CYCLING"

	para "ROAD without a"
	line "BICYCLE."
	done

Route16GateSuperNerdText:
	text "If you cruise down"
	line "CYCLING ROAD, you"

	para "will end up in"
	line "FUCHSIA CITY."
	done

Route16Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_16, 4
	warp_event  2,  5, ROUTE_16, 5
	warp_event 11,  4, ROUTE_16, 2
	warp_event 11,  5, ROUTE_16, 3

	def_coord_events
	coord_event  7,  4, SCENE_DEFAULT, Route16GateBicycleCheck
	coord_event  7,  5, SCENE_DEFAULT, Route16GateBicycleCheck

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route16GateOfficerScript, -1
	object_event 11,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16GateSuperNerdScript, -1
