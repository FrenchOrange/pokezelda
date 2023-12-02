RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FSNESScript:
	jumptext RedsHouse2FSNESText

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FSNESText:
	text "<PLAYER> played the"
	line "SNES."

	para "Better get going--"
	line "no time to lose!"
	done

RedsHouse2FPCText:
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time…"
	done

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_READ, RedsHouse2FSNESScript
	bg_event  2,  1, BGEVENT_READ, RedsHouse2FPCScript

	def_object_events
