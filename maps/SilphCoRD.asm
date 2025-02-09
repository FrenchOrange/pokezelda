	object_const_def
	const SILPHCORD_SCIENTIST1
	const SILPHCORD_SCIENTIST2
	const SILPHCORD_CLERK
	const SILPHCORD_RECEPTIONIST1
	const SILPHCORD_RECEPTIONIST2
	const SILPHCORD_FISHER
	const SILPHCORD_REPORT1
	const SILPHCORD_REPORT2
	const SILPHCORD_REPORT3
	const SILPHCORD_PORYGON2
	const SILPHCORD_OFFICER
	const SILPHCORD_SCIENTIST3

SilphCoRD_MapScripts:
	def_scene_scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	def_callbacks

.Scene0:
	sdefer .ScientistLeadsPlayer
	setscene SCENE_FINISHED
	end

.Scene1:
	end

.ScientistLeadsPlayer:
	follow SILPHCORD_SCIENTIST1, PLAYER
	applymovement SILPHCORD_SCIENTIST1, ScientistGetsIntoPlace_MovementData
	applymovement PLAYER, PlayerGetsIntoPlace_MovementData
	stopfollow
	checkevent EVENT_WENT_TO_SILPH_CO_RD_ONCE
	iftrue .AbridgedScene
	turnobject SILPHCORD_SCIENTIST1, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext SilphCoRDScientistExplainText
	waitbutton
	closetext
.AbridgedScene:
	applymovement PLAYER, PlayerStepsDown_MovementData
	turnobject SILPHCORD_SCIENTIST1, DOWN
	setevent EVENT_SILPH_CO_RD_SCIENTIST_1
	clearevent EVENT_SILPH_CO_RD_SCIENTIST_3
	setevent EVENT_WENT_TO_SILPH_CO_RD_ONCE
	disappear SILPHCORD_SCIENTIST1
	appear SILPHCORD_SCIENTIST3
	end

ScientistGetsIntoPlace_MovementData:
	step DOWN
	step DOWN
	step RIGHT
PlayerGetsIntoPlace_MovementData:
	step RIGHT
PlayerStepsDown_MovementData:
	step DOWN
	step_end

SilphCoRDBookshelf:
	jumpstd DifficultBookshelfScript

SilphCoRDScientist1Script:
	faceplayer
	opentext
	writetext SilphCoRDScientistAreYouDoneText
	yesorno
	iftrue .WarpToSaffron1
	writetext SilphCoRDScientistTakeYourTimeText
	waitbutton
	closetext
	end

.WarpToSaffron1:
	sjump WarpToSaffronScript
	end

SilphCoRDCoordScript:
	turnobject SILPHCORD_SCIENTIST1, RIGHT
	turnobject SILPHCORD_SCIENTIST3, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext SilphCoRDScientistAreYouDoneText
	yesorno
	iftrue .WarpToSaffron2
	writetext SilphCoRDScientistTakeYourTimeText
	waitbutton
	closetext
	turnobject SILPHCORD_SCIENTIST1, DOWN
	turnobject SILPHCORD_SCIENTIST3, DOWN
	applymovement PLAYER, PlayerStepsDown_MovementData
	end

.WarpToSaffron2:
	sjump WarpToSaffronScript
	end

WarpToSaffronScript:
	writetext SilphCoRDScientistThanksAgainText
	waitbutton
	closetext
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	pause 15
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	pause 15
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp SAFFRON_CITY, 20, 30
	end

SilphCoRDScientist2Script:
	faceplayer
	opentext
	special TradebackNPC
	waitbutton
	closetext
	end

SilphCoRDClerkScript:
	faceplayer
	opentext
	writetext SilphCoRDClerkText
	waitbutton
	closetext
	turnobject SILPHCORD_CLERK, RIGHT
	end

SilphCoRDReceptionist1Script:
	faceplayer
	opentext
	writetext SilphCoRDReceptionist1Text
	waitbutton
	closetext
	turnobject SILPHCORD_RECEPTIONIST1, UP
	end

SilphCoRDReceptionist2Script:
	jumptextfaceplayer SilphCoRDReceptionist2Text

SilphCoRDFisherScript:
	jumptextfaceplayer SilphCoRDFisherText

SilphCoRDReport1Script:
	jumptextfaceplayer SilphCoRDReport1Text

SilphCoRDReport2Script:
	jumptextfaceplayer SilphCoRDReport2Text

SilphCoRDReport3Script:
	jumptextfaceplayer SilphCoRDReport3Text

SilphCoRDPorygon2Script:
	opentext
	writetext SilphCoRDPorygon2Text
	cry PORYGON2
	waitbutton
	closetext
	end

SilphCoRDDebugOfficer:
	opentext
	writetext SilphCoRDOfficerText
	yesorno
	iffalse .TradeItemSetup
	givepoke MACHOKE, 100
	givepoke HAUNTER, 100
	givepoke GRAVELER, 100
	givepoke KADABRA, 100
	closetext
	end

.TradeItemSetup:
	giveitem METAL_COAT, 99
	giveitem KINGS_ROCK, 99
	giveitem DRAGON_SCALE, 99
	giveitem UP_GRADE, 99
	givepoke PORYGON, 100
	givepoke POLIWHIRL, 100
	givepoke SLOWPOKE, 100
	givepoke ONIX, 100
	givepoke SCYTHER, 100
	givepoke SEADRA, 100
	closetext
	end

SilphCoRDScientistExplainText:
	text "Here is the fabled"
	line "R&D floor."

	para "Currently, we're"
	line "studying the ways"
	cont "trading can affect"
	cont "certain #MON."

	para "Don't worry, we"
	line "won't ask for any"
	cont "of your #MON."

	para "We're merely asking"
	line "if we can subject"
	para "them to our"
	line "TRADEBACK DEVICE"
	cont "(patent pending)."

	para "My colleague is"
	line "in the back, but"
	cont "go ahead and look"
	cont "around."

	para "Talk to me if you"
	line "feel like leaving."
	done

SilphCoRDScientistAreYouDoneText:
	text "Are you done? Got"
	line "all you needed?"
	done

SilphCoRDScientistTakeYourTimeText:
	text "Got it!"
	para "Take your time."
	done

SilphCoRDScientistThanksAgainText:
	text "Thanks again for"
	line "your cooperation!"

	para "I don't feel like"
	line "going back down to"
	cont "the lobby so…"

	para "Let me use this"
	line "experimental warp"
	cont "device, and you'll"
	cont "be on your way."

	para "Bye bye!"
	done

SilphCoRDClerkText:
	text "We're planning to"
	line "roll out an update"
	cont "to give PORYGON an"
	cont "evolution."

	para "Though we're having"
	line "a hard time coming"
	cont "up with a catchy"
	cont "name for it…"
	done

SilphCoRDReceptionist1Text:
	text "SCIENTISTS can be"
	line "hard to work with."

	para "It's like they're"
	line "always out looking"
	cont "for new ways to be"
	cont "disorganized."
	done

SilphCoRDReceptionist2Text:
	text "More samples means"
	line "more material for"
	cont "research."

	para "And more research"
	line "means more files"
	cont "for me to sort…"
	done

SilphCoRDFisherText:
	text "We suspect trading"
	line "triggers a hidden"
	cont "potential of sorts"
	cont "in some #MON."

	para "This could be why"
	line "some only evolve"
	cont "while holding a"
	cont "given item!"
	done

SilphCoRDReport1Text:
	text "Only 4 #MON"
	line "were thought to"
	cont "evolve via trade,"

	para "but 6 more have"
	line "been discovered."

	para "More research is"
	line "underway."
	done

SilphCoRDReport2Text:
	text "KING'S ROCK."
	para "METAL COAT."
	para "DRAGON SCALE."

	para "Those items react"
	line "especially well to"
	cont "the energy that is"

	para "generated by the"
	line "trading process."
	done

SilphCoRDReport3Text:
	text "The UP-GRADE was"
	line "developped by the"
	cont "SILPH CO. R&D TEAM"

	para "to replicate the"
	line "effects of trade"
	cont "item evolution."

	para "PORYGON was chosen"
	line "to test out the"
	cont "device."
	done

SilphCoRDPorygon2Text:
	text "PORYGON2: PORY-PO!"
	done

SilphCoRDOfficerText:
	text "YES for reg. trade"
	line "NO  for item trade"
	done

SilphCoRD_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1

	def_coord_events
	coord_event 23,  4, SCENE_FINISHED, SilphCoRDCoordScript

	def_bg_events
	bg_event 16,  5, BGEVENT_READ, SilphCoRDBookshelf
	bg_event 17,  5, BGEVENT_READ, SilphCoRDBookshelf

	def_object_events
	object_event 20,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoRDScientist1Script, EVENT_SILPH_CO_RD_SCIENTIST_1
	object_event 13,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoRDScientist2Script, -1
	object_event 19, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoRDClerkScript, -1
	object_event 17,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCoRDReceptionist1Script, -1
	object_event 12, 13, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCoRDReceptionist2Script, -1
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoRDFisherScript, -1
	object_event 22,  7, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilphCoRDReport1Script, -1
	object_event 25,  8, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilphCoRDReport2Script, -1
	object_event 21, 12, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SilphCoRDReport3Script, -1
	object_event 20, 10, SPRITE_PORYGON2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SilphCoRDPorygon2Script, -1
	object_event 23,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoRDDebugOfficer, -1
	object_event 22,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoRDScientist1Script, EVENT_SILPH_CO_RD_SCIENTIST_3
