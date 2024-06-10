	object_const_def
	const PEWTERMUSEUM2F_RECEPTIONIST
	const PEWTERMUSEUM2F_POKEFAN_M1
	const PEWTERMUSEUM2F_BUG_CATCHER
	const PEWTERMUSEUM2F_LASS1
	const PEWTERMUSEUM2F_POKEFAN_M2
	const PEWTERMUSEUM2F_LASS2
	const PEWTERMUSEUM2F_PIKACHU

PewterMuseum2F_MapScripts:
	def_scene_scripts

	def_callbacks


PewterMuseum2FReceptionistScript:
	jumptextfaceplayer PewterMuseum2FReceptionistText

PewterMuseum2FPokefanM1Script:
	jumptextfaceplayer PewterMuseum2FPokefanM1Text

PewterMuseum2FBugCatcherScript:
	jumptextfaceplayer PewterMuseum2FBugCatcherText

PewterMuseum2FLass1Script:
	faceplayer
	opentext
	writetext PewterMuseum2FLass1Text
	waitbutton
	closetext
	turnobject PEWTERMUSEUM2F_LASS1, UP
	end

PewterMuseum2FPokefanM2Script:
	jumptextfaceplayer PewterMuseum2FPokefanM2Text

PewterMuseum2FLass2Script:
	jumptextfaceplayer PewterMuseum2FLass2Text

PewterMuseum2FPikachuScript:
	faceplayer
	opentext
	writetext PewterMuseum2FPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

PewterMuseum2FDisplay:
	jumptext PewterMuseum2FDisplayText

PewterMuseum2FShuttle:
	jumptext PewterMuseum2FShuttleText

PewterMuseum2FPoster1:
	jumptext PewterMuseum2FPoster1Text

PewterMuseum2FPoster2:
	jumptext PewterMuseum2FPoster2Text

PewterMuseum2FReceptionistText:
	text "A journey into"
	line "outer-space."

	para "Enjoy the space"
	line "exhibit!"
	done

PewterMuseum2FPokefanM1Text:
	text "When my father was"
	line "a young man, space"
	cont "travel felt like"
	cont "fantasy."

	para "But now? It's like"
	line "our children will"
	cont "go to space like"
	para "one takes public"
	line "transports now."
	done

PewterMuseum2FBugCatcherText:
	text "I want to go on a"
	line "field trip to the"
	cont "moon! Yay!"
	done

PewterMuseum2FLass1Text:
	text "My friend used a"
	line "MOON STONE on her"
	cont "JIGGLYPUFF, and"
	cont "it evolved!"

	para "I heard in school"
	line "that lots of #-"
	cont "MON evolve via"
	cont "similar STONES."
	done

PewterMuseum2FPokefanM2Text:
	text "I guess that's what"
	line "happens when you"
	cont "spoil them rotten…"
	done

PewterMuseum2FLass2Text:
	text "Daddy! Daddy!"
	line "PIKACHU is cool"
	cont "and all, but now"

	para "MARILL is what"
	line "everyone is after!"
	done

PewterMuseum2FPikachuText:
	text "PIKACHU: PIKA-PI?"
	done

PewterMuseum2FDisplayText:
	text "Meteorites that"
	line "fell on MT.MOON."

	para "Theorized to be"
	line "MOON STONES."
	done

PewterMuseum2FShuttleText:
	text "SPACE SHUTTLE"
	line "(Replica)"
	done

PewterMuseum2FPoster1Text:
	text "A map of our solar"
	line "system! Hmm…"

	para "Do #MON exist"
	line "on other planets?"
	done

PewterMuseum2FPoster2Text:
	text "A chart explaining"
	line "the intricacies of"
	cont "space travel."

	para "It's very dense,"
	line "but at the bottom"
	cont "is a cute drawing"

	para "of an astronaut"
	line "shaking hands with"
	cont "a CLEFAIRY."
	done

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  7, PEWTER_MUSEUM_1F, 5
	warp_event 15,  7, PEWTER_MUSEUM_3F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  5, BGEVENT_READ, PewterMuseum2FDisplay
	bg_event 14,  2, BGEVENT_READ, PewterMuseum2FShuttle
	bg_event  9,  0, BGEVENT_READ, PewterMuseum2FPoster1
	bg_event  5,  0, BGEVENT_READ, PewterMuseum2FPoster2

	def_object_events
	object_event  9,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FReceptionistScript, -1
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FPokefanM1Script, -1
	object_event  7,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FBugCatcherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_RED, PewterMuseum2FLass1Script, -1
	object_event 14,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FPokefanM2Script, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FLass2Script, -1
	object_event 12,  4, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum2FPikachuScript, -1
