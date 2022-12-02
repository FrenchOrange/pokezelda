Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	readvar VAR_YCOORD
	ifless 11, .CanWalk
	readvar VAR_XCOORD
	ifgreater 27, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback

CyclingRoadSign:
	jumptext CyclingRoadSignText

Route16Sign:
	jumptext Route16SignText

CyclingRoadSignText:
	text "Enjoy the slope!"
	para "CYCLING ROAD"
	done

Route16SignText:
	text "ROUTE 16"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 28, 12, ROUTE_16_GATE, 3
	warp_event 28, 13, ROUTE_16_GATE, 4
	warp_event 21, 12, ROUTE_16_GATE, 1
	warp_event 21, 13, ROUTE_16_GATE, 2
	warp_event 28,  6, ROUTE_16_GATE_2, 3
	warp_event 28,  7, ROUTE_16_GATE_2, 4
	warp_event 21,  6, ROUTE_16_GATE_2, 1
	warp_event 21,  7, ROUTE_16_GATE_2, 2
	def_coord_events

	def_bg_events
	bg_event 31, 13, BGEVENT_READ, CyclingRoadSign
	bg_event  9, 19, BGEVENT_READ, Route16Sign

	def_object_events
