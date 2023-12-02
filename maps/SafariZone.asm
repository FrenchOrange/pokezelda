	object_const_def
	const SAFARIZONE_DOG_GUY

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneCameoScript:
	faceplayer
	opentext
	countseencaught
	readvar VAR_DEXCAUGHT
	ifgreater 249, .MewScript
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
	playsound SFX_DEX_FANFARE_230_PLUS
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
	line "catch 250 #MON!"
	done

SafariZoneCameoTakeThisMewText:
	text "Howdy! The name's"
	line "FRENCHORANGE."

	para "I made the hack"
	line "you're playing"
	cont "right now!"

	para "I'm so happy you"
	line "checked out this"
	cont "dumb project that"

	para "began as a mere"
	line "tileset overhaul."

	para "But enough with"
	line "the chit-chat!"

	para "For coming such a"
	line "long way, you"
	cont "deserve a gift."

	para "Don't you agree?"
	done

SafariZoneCameoCareForItText:
	text "As a gift from me"
	line "to you. Congrats!"

	para "<PLAYER>, you are"
	line "SUPER PLAYER!!"
	done

ReceivedMewText:
	text "<PLAYER> received"
	line "MEW!"
	done

SafariZoneCameoPartyFullText:
	text "Oh err… Looks like"
	line "your team is full."

	para "That's okay! Just"
	line "go to the nearest"
	cont "#MON CENTER."
	done

SafariZoneCameoNoMewText:
	text "Sure! I'm not going"
	line "anywhere anyway."

	para "Like, literally."
	line "I don't have any"
	cont "walking frames."
	done

SafariZoneCameoAfterText:
	text "Your #DEX is"
	line "now complete!"

	para "What's left to do?"
	line "Well you tell me!"

	para "Level up your team"
	line "some more, fill"
	cont "out the UNOWN DEX,"

	para "or maybe even do a"
	line "living #DEX!"

	para "Regardless of what"
	line "you do now, thanks"
	cont "again for playing!"
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
