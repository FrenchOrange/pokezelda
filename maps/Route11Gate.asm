	object_const_def
	const ROUTE11FUCHSIAGATE_OFFICER

Route11Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route11GateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue .SnorlaxGone
	writetext Route11GateOfficerText
	waitbutton
	closetext
	end

.SnorlaxGone:
	writetext Route11GateOfficerText_SnorlaxGone
	waitbutton
	closetext
	end

Route11GateOfficerText:
	text "Has the sleeping"
	line "#MON woken up?"

	para "If only we had a"
	line "POKé FLUTE, or"
	cont "something like it…"
	done

Route11GateOfficerText_SnorlaxGone:
	text "SNORLAX and food"
	line "coma are like"
	cont "DODUO's two heads…"

	para "That's what it's"
	line "all about!"
	done

Route11Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  4, ROUTE_11, 2
	warp_event  2,  5, ROUTE_11, 3
	warp_event 11,  4, ROUTE_12, 2
	warp_event 11,  5, ROUTE_12, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11GateOfficerScript, -1
