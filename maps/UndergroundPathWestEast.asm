	object_const_def
	const UNDERGROUNDPATHWESTEAST_TEACHER
	const UNDERGROUNDPATHWESTEAST_OFFICER

UndergroundPathWestEast_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherNatalie:
	trainer TEACHER, NATALIE, EVENT_BEAT_TEACHER_NATALIE, TeacherNatalieSeenText, TeacherNatalieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherNatalieAfterBattleText
	waitbutton
	closetext
	end

TeacherNatalieSeenText:
	text "Don't move! Stay"
	line "where you are!!"
	done

TeacherNatalieBeatenText:
	text "Oh dear, are you"
	line "all right?"
	done

TeacherNatalieAfterBattleText:
	text "My sister gifted"
	line "me this KOFFING so"
	cont "I could stay safe"
	cont "on my way home."

	para "I've got to train"
	line "it some more, I"
	cont "suppose."
	done

TrainerOfficerClaude:
	trainer OFFICER, CLAUDE, EVENT_BEAT_OFFICER_CLAUDE, OfficerClaudeSeenText, OfficerClaudeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OfficerClaudeAfterBattleText
	waitbutton
	closetext
	end

OfficerClaudeSeenText:
	text "Stop right there!"
	line "Are you one of the"
	cont "hooligans who like"
	cont "going down here?"
	done

OfficerClaudeBeatenText:
	text "You stopped me."
	line "How dare you!"
	done

OfficerClaudeAfterBattleText:
	text "My apologies. The"
	line "KANTO POLICE FORCE"
	cont "has been on high"
	cont "alert recently."
	done

UndergroundPathWestEastHiddenNugget:
	hiddenitem NUGGET, EVENT_UNDERGROUND_PATH_WEST_EAST_HIDDEN_NUGGET

UndergroundPathWestEastHiddenXAttack:
	hiddenitem X_ATTACK, EVENT_UNDERGROUND_PATH_WEST_EAST_HIDDEN_X_ATTACK

UndergroundPathWestEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event 47,  2, ROUTE_8_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events

	def_bg_events
	bg_event 25,  5, BGEVENT_ITEM, UndergroundPathWestEastHiddenNugget
	bg_event 12,  1, BGEVENT_ITEM, UndergroundPathWestEastHiddenXAttack

	def_object_events
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherNatalie, -1
	object_event 36,  2, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerOfficerClaude, -1
