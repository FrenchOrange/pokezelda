	object_const_def
	const CERULEANGYMBADGESPEECHHOUSE_POKEFAN_M
	const CERULEANGYMBADGESPEECHHOUSE_TWIN

CeruleanGymBadgeSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanGymBadgeSpeechHousePokefanMScript:
	jumptextfaceplayer CeruleanGymBadgeSpeechHousePokefanMText

CeruleanGymBadgeSpeechHouseTwinScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal NUM_BADGES, .CaveOpenScript
	writetext CeruleanGymBadgeSpeechHouseTwinText
	waitbutton
	closetext
	end

.CaveOpenScript:
	writetext CeruleanGymBadgeSpeechHouseTwin2Text
	waitbutton
	closetext
	end

CeruleanGymBadgeSpeechHousePokefanMText:
	text "Are you collecting"
	line "KANTO GYM BADGES?"

	para "BADGES are a sign"
	line "of your status as"
	cont "a #MON TRAINER."

	para "Even #MON seem"
	line "to recognize and"
	cont "respect a trainer"
	cont "with many BADGES."
	done

CeruleanGymBadgeSpeechHouseTwinText:
	text "There's a scary"
	line "cave right by our"
	cont "house."

	para "But when CINNABAR's"
	line "volcano went BOOM"
	cont "the cave went"
	cont "RUMBLE RUMBLE!"

	para "And the entrance"
	line "collapsed!"
	done

CeruleanGymBadgeSpeechHouseTwin2Text:
	text "I heard they"
	line "cleared the cave"
	cont "entrance!"

	para "But Daddy said"
	line "dangerous #MON"
	cont "live there…"
	done

CeruleanGymBadgeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CERULEAN_CITY, 1
	warp_event  5,  7, CERULEAN_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHousePokefanMScript, -1
	object_event  8,  3, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHouseTwinScript, -1
