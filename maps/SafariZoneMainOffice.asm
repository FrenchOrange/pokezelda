SafariZoneMainOffice_MapScripts:
	def_scene_scripts
	const SAFARIZONEMAINOFFICE_WORKER1
	const SAFARIZONEMAINOFFICE_WORKER2
	const SAFARIZONEMAINOFFICE_WORKER3

	def_callbacks

SafariZoneWorker1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_KABUTO
	iftrue .GotKabuto
	writetext SafariZoneWorker1TakeThisKabutoText
	yesorno
	iffalse .Refused
	writetext SafariZoneWorker1CareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 30
	setevent EVENT_GOT_KABUTO
	writetext SafariZoneWorker1KabutoText
	waitbutton
	closetext
	end

.NoRoom:
	writetext SafariZoneWorker1PartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext SafariZoneWorker1NoKabutoText
	waitbutton
	closetext
	end

.GotKabuto:
	writetext SafariZoneWorker1AfterText
	waitbutton
	closetext
	end


SafariZoneWorker1TakeThisKabutoText:
	text "The SAFARI ZONE"
	line "#MON were all"
	cont "set free."

	para "This goes for the"
	line "old exhibit #-"
	cont "MON too."

	para "Well… aside from"
	line "this little guy."

	para "Some weirdo sold"
	line "it to us three"
	cont "years ago, and I've"
	cont "grown fond of it."

	para "But I'm no trainer,"
	line "and it deserves to"
	cont "go see the world."

	para "Would you like to"
	line "take care of it?"
	done

SafariZoneWorker1CareForItText:
	text "I had a feeling I"
	line "could count on ya!"

	para "Sniff… sniff… I'll"
	line "miss you, KABUTO!"

	para "Give the fella all"
	line "your love!"
	done

ReceivedKabutoText:
	text "<PLAYER> received"
	line "KABUTO!"
	done

SafariZoneWorker1KabutoText:
	text "KABUTO is a rare"
	line "POKéMON. I heard"
	cont "only fossils of it"
	cont "remain today."
	done

SafariZoneWorker1PartyFullText:
	text "Ah! Your team is"
	line "full. You can't"
	cont "carry any more."
	done

SafariZoneWorker1NoKabutoText:
	text "Oh… Well you know"
	line "who to ask if you"
	cont "change your mind."
	done

SafariZoneWorker1AfterText:
	text "Hey <PLAY_G>! How's"
	line "KABUTO doing?"
	done

SafariZoneWorker2Script:
	jumptextfaceplayer SafariZoneWorker2Text

SafariZoneWorker3Script:
	jumptextfaceplayer SafariZoneWorker3Text

SafariZoneFlyer:
	jumptext SafariZoneFlyerText

SafariZoneWorker2Text:
	text "You wanted to take"
	line "the SAFARI GAME?"

	para "I'm sorry kid, but"
	line "it closed down."
	done

SafariZoneWorker3Text:
	text "Now that we have"
	line "been laid off, we"
	cont "just loaf around"
	cont "this office."

	para "There's not much"
	line "to do in FUCHSIA…"
	done

SafariZoneFlyerText:
	text "An old SAFARI ZONE"
	line "flyer."
	done

SafariZoneMainOffice_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 2
	warp_event  5,  7, FUCHSIA_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  9,  0, BGEVENT_READ, SafariZoneFlyer

	def_object_events
	object_event 10,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneWorker1Script, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneWorker2Script, -1
	object_event  8,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneWorker3Script, -1
