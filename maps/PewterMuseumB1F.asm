	object_const_def
	const PEWTERMUSEUMB1F_GUARD
	const PEWTERMUSEUMB1F_SCIENTIST1
	const PEWTERMUSEUMB1F_SCIENTIST2
	const PEWTERMUSEUMB1F_SCIENTIST3
	const PEWTERMUSEUMB1F_SCIENTIST4
	const PEWTERMUSEUMB1F_SCIENTIST5

PewterMuseumB1F_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMuseumB1FGuardScript:
	faceplayer
	opentext
	writetext PewterMuseumB1FGuardText
	waitbutton
	closetext
	turnobject PEWTERMUSEUMB1F_GUARD, DOWN
	end

PewterMuseumB1FScientist1Script:
	jumptextfaceplayer PewterMuseumB1FScientist1Text

PewterMuseumB1FScientist2Script:
	jumptextfaceplayer PewterMuseumB1FScientist2Text

PewterMuseumB1FScientist3Script:
	jumptextfaceplayer PewterMuseumB1FScientist3Text

PewterMuseumB1FScientist4Script:
	jumptextfaceplayer PewterMuseumB1FScientist4Text

PewterMuseumB1FScientist5Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_OMANYTE
	iftrue .GotOmanyte
	writetext PewterMuseumB1FScientist5TakeThisOmanyteText
	yesorno
	iffalse .Refused
	writetext PewterMuseumB1FScientist5CareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 30
	setevent EVENT_GOT_OMANYTE
	writetext PewterMuseumB1FScientist5OmanyteText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PewterMuseumB1FScientist5PartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext PewterMuseumB1FScientist5NoOmanyteText
	waitbutton
	closetext
	end

.GotOmanyte:
	writetext PewterMuseumB1FScientist5AfterText
	waitbutton
	closetext
	end

PewterMuseumB1FBookshelf:
	jumpstd DifficultBookshelfScript

PewterMuseumB1FRoomSign:
	jumptext PewterMuseumB1FRoomSignText

PewterMuseumB1FGuardText:
	text "I'm sorry, kid."
	line "But you can't step"
	cont "foot in there."

	para "The machine has to"
	line "be kept sterile,"
	cont "and your #MON"
	cont "look dirty."
	done

PewterMuseumB1FScientist1Text:
	text "We study #MON"
	line "from the distant"
	cont "past here!"

	para "Though FOSSILS are"
	line "a rare sight, so"
	cont "we can't just hand"

	para "them out like we"
	line "used to…"
	done

PewterMuseumB1FScientist2Text:
	text "Our old lab on"
	line "CINNABAR ISLAND"
	cont "crumbled during"
	cont "the eruption."

	para "Luckily, we all"
	line "made it out in one"
	cont "piece!"
	done

PewterMuseumB1FScientist3Text:
	text "Our security guard"
	line "takes his job way"
	cont "too seriously."

	para "He's a good guy,"
	line "but he's really no"
	cont "word-smith!"
	done

PewterMuseumB1FScientist4Text:
	text "We plan to release"
	line "controlled groups"
	cont "of resurrected"

	para "FOSSIL #MON on"
	line "a faraway island."

	para "It's a test to see"
	line "how they adapt to"
	cont "today's ecosystem."

	para "Wish us luck!"
	done

PewterMuseumB1FScientist5TakeThisOmanyteText:
	text "If you go against"
	line "PEWTER's BROCK, you"
	cont "may notice he uses"
	cont "fossil POKéMON."

	para "Both OMASTAR and"
	line "KABUTOPS were"
	cont "resurrected by our"
	cont "advanced machines."

	para "Both are extinct,"
	line "so don't look for"
	cont "them in the wild."

	para "But those badges"
	line "you have. Hmm…"

	para "You do seem worthy"
	line "of such POKéMON."

	para "We have an extra"
	line "OMANYTE on hand,"
	cont "do you want it?"
	done

PewterMuseumB1FScientist5CareForItText:
	text "My intuition was"
	line "thus correct!"

	para "The past meeting"
	line "the future… Sniff."

	para "This is making me"
	line "so emotional!"
	done

ReceivedOmanyteText:
	text "<PLAYER> received"
	line "OMANYTE!"
	done

PewterMuseumB1FScientist5OmanyteText:
	text "OMANYTE is such a"
	line "fascinating POKé-"
	cont "MON. Treat it with"
	cont "utmost respect!"
	done

PewterMuseumB1FScientist5PartyFullText:
	text "Oh… It looks like"
	line "your party's full."
	cont "How inconvenient."
	done

PewterMuseumB1FScientist5NoOmanyteText:
	text "I understand. I"
	line "guess I will study"
	cont "OMANYTE some more."
	done

PewterMuseumB1FScientist5AfterText:
	text "Take good care of"
	line "OMANYTE, <PLAY_G>."
	done

PewterMuseumB1FRoomSignText:
	text "FOSSIL #MON"
	line "Resurrection Room"

	para "Non-authorized"
	line "personnel begone."
	done

PewterMuseumB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21,  7, PEWTER_MUSEUM_1F, 6

	def_coord_events

	def_bg_events
	bg_event 14,  1, BGEVENT_READ, PewterMuseumB1FBookshelf
	bg_event 15,  1, BGEVENT_READ, PewterMuseumB1FBookshelf
	bg_event 14,  7, BGEVENT_READ, PewterMuseumB1FBookshelf
	bg_event 11,  0, BGEVENT_READ, PewterMuseumB1FRoomSign

	def_object_events
	object_event 10,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FGuardScript, -1
	object_event 19,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist1Script, -1
	object_event  9,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist2Script, -1
	object_event 11,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist3Script, -1
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist4Script, -1
	object_event  5,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist5Script, -1
