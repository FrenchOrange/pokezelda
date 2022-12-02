	object_const_def

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerTeacherSandra:
	trainer TEACHER, SANDRA, EVENT_BEAT_TEACHER_SANDRA, TeacherSandraSeenText, TeacherSandraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherSandraAfterBattleText
	waitbutton
	closetext
	end

TeacherSandraSeenText:
	text "A field trip in"
	line "MT.MOON would be"
	cont "wonderful, don't"
	cont "you think?"
	done

TeacherSandraBeatenText:
	text "Battles are not my"
	line "specialty."
	done

TeacherSandraAfterBattleText:
	text "In the far past,"
	line "this mountain was"
	cont "deep underwater."

	para "This because of"
	line "tectonic plates"
	cont "and bla bla…"

	para "Are you taking"
	line "notes already?"
	done

MtMoonSign:
	jumptext MtMoonSignText

Route4PokecenterSign:
	jumpstd PokecenterSignScript

MtMoonSignText:
	text "MT.MOON"
	line "Tunnel Entrance"
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  5, MOUNT_MOON, 1
	warp_event 11,  5, ROUTE_4_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 17,  7, BGEVENT_READ, MtMoonSign
	bg_event 12,  5, BGEVENT_READ, Route4PokecenterSign

	def_object_events
	object_event 16, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerTeacherSandra, -1
