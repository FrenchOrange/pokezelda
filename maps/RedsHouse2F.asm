	object_const_def
	const REDS_HOUSE_POKE_BALL

RedsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

RedsHouse2FSNESScript:
	jumptext RedsHouse2FSNESText

RedsHouse2FPCScript:
	jumptext RedsHouse2FPCText

RedsHouse2FBedScript:
	jumptext RedsHouse2FBedText

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

RedsHouse2FBedText:
	text "The sheets are"
	line "folded neatly."
	done

RedsHouse2FMasterBall:
	itemball MASTER_BALL

RedsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, REDS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  5,  5, BGEVENT_READ, RedsHouse2FSNESScript
	bg_event  2,  1, BGEVENT_READ, RedsHouse2FPCScript
	bg_event  2,  6, BGEVENT_READ, RedsHouse2FBedScript
	bg_event  2,  7, BGEVENT_READ, RedsHouse2FBedScript

	def_object_events
	object_event  7,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RedsHouse2FMasterBall, EVENT_REDS_HOUSE_MASTER_BALL
