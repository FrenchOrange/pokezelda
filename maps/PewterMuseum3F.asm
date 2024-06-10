	object_const_def
	const PEWTERMUSEUM3F_RECEPTIONIST
	const PEWTERMUSEUM3F_ELDER
	const PEWTERMUSEUM3F_YOUNGSTER
	const PEWTERMUSEUM3F_TEACHER
	const PEWTERMUSEUM3F_GRANNY
	const PEWTERMUSEUM3F_KIMONO_GIRL
	const PEWTERMUSEUM3F_POKE_BALL1
	const PEWTERMUSEUM3F_POKE_BALL2
	const PEWTERMUSEUM3F_POKE_BALL3

PewterMuseum3F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseum3FReceptionistScript:
	jumptextfaceplayer PewterMuseum3FReceptionistText

PewterMuseum3FElderScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterMuseum3FElderText
	promptbutton
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterMuseum3FElderText_GotSilverWing
	waitbutton
	closetext
	end

PewterMuseum3FYoungsterScript:
	jumptextfaceplayer PewterMuseum3FYoungsterText

PewterMuseum3FTeacherScript:
	jumptextfaceplayer PewterMuseum3FTeacherText

PewterMuseum3FGrannyScript:
	jumptextfaceplayer PewterMuseum3FGrannyText

PewterMuseum3FKimonoScript:
	jumptext PewterMuseum3FKimonoText

PewterMuseum3FPokeBallScript:
	jumptext PewterMuseum3FPokeBallText

PewterMuseum3FKimonoExhibitSign:
	jumptext PewterMuseum3FKimonoExhibitText

PewterMuseum3FPokeBallExhibitSign:
	jumptext PewterMuseum3FPokeBallExhibitText

PewterMuseum3FRuinsExhibitSign:
	jumptext PewterMuseum3FRuinsExhibitText

PewterMuseum3FFirstPainting:
	jumptext PewterMuseum3FFirstPaintingText

PewterMuseum3FSecondPainting:
	jumptext PewterMuseum3FSecondPaintingText

PewterMuseum3FReceptionistText:
	text "A walk through"
	line "quaint JOHTO."

	para "Enjoy the modern"
	line "history exhibit!"
	done

PewterMuseum3FElderText:
	text "I'm the curator of"
	line "this museum wing."

	para "Ah, you came all"
	line "the way out here"
	cont "from JOHTO?"

	para "That brings back"
	line "memories. When I"
	cont "was young, I went"
	cont "to JOHTO to train."

	para "You remind me so"
	line "much of what I was"
	cont "like as a young"
	cont "adventurer."

	para "I truly think you"
	line "are deserving of"
	cont "this item I found"
	cont "in JOHTO."
	done

PewterMuseum3FElderText_GotSilverWing:
	text "Going to new, un-"
	line "known places and"
	cont "seeing new people…"

	para "Those are the joys"
	line "of travel."
	done

PewterMuseum3FYoungsterText:
	text "We don't have such"
	line "cool ruins here in"
	cont "KANTO."

	para "This new museum"
	line "aisle is great!"

	para "Now if only they"
	line "didn't have this"
	cont "creepy mannequin…"
	done

PewterMuseum3FTeacherText:
	text "You're from JOHTO?"
	line "Incredible!"

	para "It is renowned for"
	line "its historical"
	cont "landmarks."

	para "It's like stepping"
	line "back a couple"
	cont "centuries."
	done

PewterMuseum3FGrannyText:
	text "I remember when I"
	line "was a little girl."

	para "I would pick fresh"
	line "APRICORNS and mama"
	cont "would carve them"

	para "into makeshift"
	line "# BALLS."

	para "Feels odd how time"
	line "flies by so fast."
	done

PewterMuseum3FKimonoText:
	text "Even back here it's"
	line "like she is still"
	cont "watching…"
	done

PewterMuseum3FPokeBallText:
	text "Did an ancestor of"
	line "KURT craft these?"
	done

PewterMuseum3FKimonoExhibitText:
	text "Authentic outfit"
	line "worn traditionally"
	cont "by KIMONO GIRLS."
	done

PewterMuseum3FPokeBallExhibitText:
	text "Pre-industrial"
	line "# BALLS carved"
	cont "out of APRICORNS."
	done

PewterMuseum3FRuinsExhibitText:
	text "Shards of tools"
	line "and pottery from"
	cont "the RUINS OF ALPH."
	done

PewterMuseum3FFirstPaintingText:
	text "A painting of a"
	line "five-story pagoda!"

	para "Looks to be what"
	line "later became the"
	cont "RADIO TOWER?"
	done

PewterMuseum3FSecondPaintingText:
	text "A woodblock print"
	line "of a group of"
	cont "SNEASEL attacking"

	para "a poor traveler on"
	line "a snowy mountain."
	done

PewterMuseum3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  7, PEWTER_MUSEUM_2F, 2

	def_coord_events

	def_bg_events
	bg_event 14,  3, BGEVENT_READ, PewterMuseum3FKimonoExhibitSign
	bg_event  7,  6, BGEVENT_READ, PewterMuseum3FPokeBallExhibitSign
	bg_event  3,  3, BGEVENT_READ, PewterMuseum3FRuinsExhibitSign
	bg_event  4,  3, BGEVENT_READ, PewterMuseum3FRuinsExhibitSign
	bg_event  6,  3, BGEVENT_READ, PewterMuseum3FRuinsExhibitSign
	bg_event  7,  3, BGEVENT_READ, PewterMuseum3FRuinsExhibitSign
	bg_event  9,  0, BGEVENT_READ, PewterMuseum3FFirstPainting
	bg_event 13,  0, BGEVENT_READ, PewterMuseum3FSecondPainting

	def_object_events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FReceptionistScript, -1
	object_event  5,  2, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FElderScript, -1
	object_event 10,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FYoungsterScript, -1
	object_event 12,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FTeacherScript, -1
	object_event  3,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FGrannyScript, -1
	object_event 13,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FKimonoScript, -1
	object_event  4,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FPokeBallScript, -1
	object_event  5,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FPokeBallScript, -1
	object_event  6,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMuseum3FPokeBallScript, -1
