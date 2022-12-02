SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneCameoScript:
	faceplayer
	opentext
	countseencaught
	readvar VAR_DEXCAUGHT
	ifgreater 149, .MewScript
	writetext SafariZoneCameoHello
	waitbutton
	closetext
	end

.MewScript:
	checkevent EVENT_GOT_MEW
	iftrue .GotMew
	writetext SafariZoneCameoTakeThisMewText
	yesorno
	iffalse .Refused
	writetext SafariZoneCameoCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedMewText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MEW, 10, NO_ITEM, GiftMewName, GiftMewOTName
	setevent EVENT_GOT_MEW
	closetext
	end

.NoRoom:
	writetext SafariZoneCameoPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext SafariZoneCameoNoMewText
	waitbutton
	closetext
	end

.GotMew:
	writetext SafariZoneCameoAfterText
	waitbutton
	closetext
	end

SafariZoneSign:
	jumptext SafariZoneSignText

RestHouseSign:
	jumptext RestHouseSignText

SafariZoneCameoHello:
	text "Hello!"

	para "Haha. You may be a"
	line "HACKER FUCKER, but"
	cont "if anything I'm"

	para "happy you cared"
	line "enough about this"
	cont "hack to try and"

	para "sneak inside the"
	line "SAFARI ZONE."

	para "Come back once you"
	line "catch 250 POKéMON!"
	done

SafariZoneCameoTakeThisMewText:
	text "Arf! Arf!"
	done

SafariZoneCameoCareForItText:
	text "CARE."
	done

ReceivedMewText:
	text "<PLAYER> received"
	line "MEW!"
	done

SafariZoneCameoPartyFullText:
	text "FULL!"
	done

SafariZoneCameoNoMewText:
	text "SAY NO."
	done

SafariZoneCameoAfterText:
	text "AFTER."
	done

SafariZoneSignText:
	text "Wel… to the"
	line "…AFARI ZO…"

	para "The letters are"
	line "all faded away!"
	done

RestHouseSignText:
	text "REST HOUSE"
	done

GiftMewName:
	db "MEW@"

GiftMewOTName:
	db "ZERO@"

	db 0 ; unused

SafariZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18, 29, SAFARI_ZONE_FUCHSIA_GATE, 1
	warp_event 19, 29, SAFARI_ZONE_FUCHSIA_GATE, 2
	warp_event 21, 23, SAFARI_ZONE_REST_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 18, 26, BGEVENT_READ, SafariZoneSign
	bg_event 22, 24, BGEVENT_READ, RestHouseSign

	def_object_events
	object_event 18, 14, SPRITE_DOG_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneCameoScript, -1
