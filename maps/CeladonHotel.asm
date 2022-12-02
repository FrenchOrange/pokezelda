	object_const_def
	const CELADONHOTEL_RECEPTIONIST
	const CELADONHOTEL_POKEFAN_F
	const CELADONHOTEL_POKEFAN_M
	const CELADONHOTEL_COOLTRAINER_F

CeladonHotel_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .SetUpHotel

.SetUpHotel:
	changeblock  2, 0, $13 ; wall
	changeblock  4, 0, $13 ; wall
	changeblock 10, 0, $2D ; stairs
	changeblock  2, 6, $2C ; pots
	endcallback


CeladonHotelReceptionistScript:
	jumptextfaceplayer CeladonHotelReceptionistText

CeladonHotelGuest1Script:
	jumptext CeladonHotelGuest1Text

CeladonHotelGuest2Script:
	jumptext CeladonHotelGuest2Text

CeladonHotelGuest3Script:
	jumptextfaceplayer CeladonHotelGuest3Text


CeladonHotelReceptionistText:
	text "Welcome to the"
	line "CELADON HOTEL."

	para "We don't have any"
	line "rooms left. Sorry."
	done

CeladonHotelGuest1Text:
	text "Honey? Do you need"
	line "help with carrying"
	cont "our luggage?"
	done

CeladonHotelGuest2Text:
	text "Huff… Huff…"
	line "One second dear!"

	para "Just… Let me catch"
	line "my breath first."
	done

CeladonHotelGuest3Text:
	text "It's peak season."
	line "The hotel's packed"
	cont "full of people!"
	done

CeladonHotel_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CELADON_CITY, 12
	warp_event  6,  7, CELADON_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHotelReceptionistScript, -1
	object_event 10,  1, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHotelGuest1Script, -1
	object_event 11,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonHotelGuest2Script, -1
	object_event  3,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHotelGuest3Script, -1
