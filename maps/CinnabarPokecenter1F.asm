	object_const_def
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_COOLTRAINER_F
	const CINNABARPOKECENTER1F_FISHER
	const CINNABARPOKECENTER1F_GENTLEMAN
	const CINNABARPOKECENTER1F_NOCTOWL

CinnabarPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CinnabarPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CinnabarPokecenter1FCooltrainerFText

CinnabarPokecenter1FFisherScript:
	jumptextfaceplayer CinnabarPokecenter1FFisherText

CinnabarPokecenter1FGentlemanScript:
	faceplayer
	opentext
	readvar VAR_PARTYCOUNT
	ifequal 1, .CinnabarSoftlock
	writetext CinnabarPokecenter1FGentlemanNormalText
	waitbutton
	closetext
	end

.CinnabarSoftlock:
	writetext CinnabarPokecenter1FGentlemanSoftlockText
	waitbutton
	closetext
	turnobject CINNABARPOKECENTER1F_GENTLEMAN, RIGHT
	opentext
	writetext CinnabarPokecenter1FGentlemanGoodBirdieText
	waitbutton
	closetext
	cry NOCTOWL
	pause 15
	playsound SFX_FLY
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	waitsfx
	pause 15
	warp VIRIDIAN_CITY, 23, 26
	end


CinnabarPokecenter1FNoctowlScript:
	opentext
	writetext CinnabarPokecenter1FNoctowlText
	cry NOCTOWL
	waitbutton
	closetext
	end

CinnabarPokecenter1FCooltrainerFText:
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave…"
	done

CinnabarPokecenter1FFisherText:
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done

CinnabarPokecenter1FGentlemanNormalText:
	text "We always wanted"
	line "to visit CINNABAR,"
	cont "but by the time me"

	para "and NOCTOWL booked"
	line "a trip there, the"
	cont "island was but a"

	para "singed pebble in"
	line "the middle of the"
	cont "ocean."

	para "What are we still"
	line "doing here? Well"
	cont "we still paid for"
	cont "this trip!"

	para "May as well enjoy"
	line "it as best we can."
	done

CinnabarPokecenter1FGentlemanSoftlockText:
	text "Oh dear, you look"
	line "like you're lost."

	para "Did you swim here"
	line "by yourself? And…"

	para "You only have one"
	line "#MON with you!"
	cont "How careless!"

	para "Why worry not, I"
	line "know how to get"
	cont "you to safety."
	done

CinnabarPokecenter1FGentlemanGoodBirdieText:
	text "NOCTOWL! Be a good"
	line "birdie, and carry"
	cont "this child to the"
	cont "mainland."
	done

CinnabarPokecenter1FNoctowlText:
	text "NOCTOWL: Hoo… Hoo?"
	done

CinnabarPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CINNABAR_ISLAND, 1
	warp_event  6,  7, CINNABAR_ISLAND, 1
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FCooltrainerFScript, -1
	object_event  4,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FFisherScript, -1
	object_event  8,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FGentlemanScript, -1
	object_event  9,  1, SPRITE_NOCTOWL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNoctowlScript, -1
