	object_const_def
	const PEWTERMUSEUMB1F_GUARD
	const PEWTERMUSEUMB1F_SCIENTIST1
	const PEWTERMUSEUMB1F_SCIENTIST2
	const PEWTERMUSEUMB1F_SCIENTIST3
	const PEWTERMUSEUMB1F_SCIENTIST4
	const PEWTERMUSEUMB1F_GRAMPS

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
	faceplayer
	opentext
	checkitem DARK_SHELL
	iftrue .GotDarkShell
	checkevent EVENT_GAVE_DARK_SHELL
	iftrue .ScientistPostStep
	writetext PewterMuseumB1FScientist1_NoItem
	waitbutton
	closetext
	end

.GotDarkShell:
	writetext PewterMuseumB1FScientist1_HasItem1
	waitbutton
	closetext
	readvar VAR_XCOORD
	ifequal 18, .ScientistScriptLeft
	ifequal 20, .ScientistScriptRight
.ScientistScriptMiddle
	turnobject PEWTERMUSEUMB1F_SCIENTIST1, UP
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoLeft
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	pause 15
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoRight
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	pause 15
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoTable
	wait 5
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoTable2
	wait 5
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoTable3
	wait 5
	applymovement PEWTERMUSEUMB1F_SCIENTIST1, PewterMuseumB1FMovementGoTable4
	wait 5
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	pause 15
	playsound SFX_GLASS_TING
	waitsfx
	pause 20
	showemote EMOTE_SHOCK, PEWTERMUSEUMB1F_SCIENTIST1, 10
	turnobject PEWTERMUSEUMB1F_SCIENTIST1, DOWN
	opentext
	writetext PewterMuseumB1FScientist1_HasItem2
	promptbutton
	takeitem DARK_SHELL
	giveitem CLIPBOARD
	writetext PewterMuseumB1FScientist1_GetItem
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	setevent EVENT_GAVE_DARK_SHELL
	end

.ScientistScriptLeft:
	applymovement PLAYER, PewterMuseumB1FPlayerMovementLeft
	pause 15
	sjump .ScientistScriptMiddle

.ScientistScriptRight:
	applymovement PLAYER, PewterMuseumB1FPlayerMovementRight
	pause 15
	sjump .ScientistScriptMiddle

.ScientistPostStep:
	writetext PewterMuseumB1FScientist1_After
	waitbutton
	closetext
	end

PewterMuseumB1FPlayerMovementLeft:
	step DOWN
PewterMuseumB1FMovementGoRight:
	step RIGHT
	turn_head UP
	step_end

PewterMuseumB1FPlayerMovementRight:
	step DOWN
PewterMuseumB1FMovementGoTable2:
	step LEFT
	turn_head UP
	step_end

PewterMuseumB1FMovementGoTable:
	step RIGHT
PewterMuseumB1FMovementGoTable3:
	step RIGHT
	turn_head UP
	step_end

PewterMuseumB1FMovementGoTable4:
	step LEFT
PewterMuseumB1FMovementGoLeft:
	step LEFT
	turn_head UP
	step_end

PewterMuseumB1FScientist2Script:
	jumptextfaceplayer PewterMuseumB1FScientist2Text

PewterMuseumB1FScientist3Script:
	jumptextfaceplayer PewterMuseumB1FScientist3Text

PewterMuseumB1FGrampsScript:
	jumptextfaceplayer PewterMuseumB1FGrampsText

PewterMuseumB1FScientist4Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_OMANYTE
	iftrue .GotOmanyte
	writetext PewterMuseumB1FScientist4TakeThisOmanyteText
	yesorno
	iffalse .Refused
	writetext PewterMuseumB1FScientist4CareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 30
	setevent EVENT_GOT_OMANYTE
	writetext PewterMuseumB1FScientist4OmanyteText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PewterMuseumB1FScientist4PartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext PewterMuseumB1FScientist4NoOmanyteText
	waitbutton
	closetext
	end

.GotOmanyte:
	writetext PewterMuseumB1FScientist4AfterText
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

PewterMuseumB1FScientist1_NoItem:
	text "We study #MON"
	line "from the distant"
	cont "past here!"

	para "Though FOSSILS are"
	line "a rare sight, so"
	cont "we can't just hand"

	para "them out like we"
	line "used to…"
	done

PewterMuseumB1FScientist1_HasItem1:
	text "Hold on, this rock"
	line "of yours… May I"
	cont "give it a look?"
	done

PewterMuseumB1FScientist1_HasItem2:
	text "Incredible! This"
	line "is a fossilized"
	cont "PUPITAR molt!"

	para "And where did you"
	line "say you found it?"
	cont "Interesting!"

	para "This could tell us"
	line "a lot about the"
	cont "migration of the"
	cont "species!"

	para "I printed a quick"
	line "report on this"
	cont "subject. Could you"

	para "deliver it to the"
	line "SILPH CO. office,"
	cont "pretty please?"
	done

PewterMuseumB1FScientist1_GetItem:
	text "<PLAYER> obtained a"
	line "CLIPBOARD."
	done

PewterMuseumB1FScientist1_After:
	text "Millennia ago some"
	line "#MON not only"
	cont "lived in different"

	para "habitats, but some"
	line "also had different"
	cont "appearances!"

	para "Can you imagine?"

	para "Maybe GYARADOS had"
	line "feathers, or maybe"
	cont "JYNX was brunette!"
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

PewterMuseumB1FGrampsText:
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

PewterMuseumB1FScientist4TakeThisOmanyteText:
	text "If you go against"
	line "PEWTER's BROCK, you"
	cont "may notice he uses"
	cont "fossil #MON."

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
	line "of such #MON."

	para "We have an extra"
	line "OMANYTE on hand,"
	cont "do you want it?"
	done

PewterMuseumB1FScientist4CareForItText:
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

PewterMuseumB1FScientist4OmanyteText:
	text "OMANYTE is such a"
	line "fascinating POKé-"
	cont "MON. Treat it with"
	cont "utmost respect!"
	done

PewterMuseumB1FScientist4PartyFullText:
	text "Oh… It looks like"
	line "your party's full."
	cont "How inconvenient."
	done

PewterMuseumB1FScientist4NoOmanyteText:
	text "I understand. I"
	line "guess I will study"
	cont "OMANYTE some more."
	done

PewterMuseumB1FScientist4AfterText:
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
	object_event 19,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist1Script, -1
	object_event  9,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist2Script, -1
	object_event 11,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist3Script, -1
	object_event  5,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FScientist4Script, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseumB1FGrampsScript, -1