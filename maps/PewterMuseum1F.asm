PEWTERMUSEUM1F_ENTRANCE_FEE EQU 50

	object_const_def
	const PEWTERMUSEUM1F_RECEPTIONIST
	const PEWTERMUSEUM1F_TEACHER
	const PEWTERMUSEUM1F_POKEFAN_M
	const PEWTERMUSEUM1F_SCIENTIST1
	const PEWTERMUSEUM1F_SCIENTIST2
	const PEWTERMUSEUM1F_CLERK

PewterMuseum1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	
	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PewterMuseum1FReceptionistScript:
	jumptextfaceplayer PewterMuseum1FReceptionistText

PewterMuseum1FTeacherScript:
	jumptextfaceplayer PewterMuseum1FTeacherText

PewterMuseum1FHikerScript:
	faceplayer
	opentext
	writetext PewterMuseum1FHikerText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM1F_POKEFAN_M, UP
	end

PewterMuseum1FAmberScientistScript:
	jumptextfaceplayer PewterMuseum1FAmberScientistText

PewterMuseum1FLoreScientistScript:
	jumptextfaceplayer PewterMuseum1FLoreScientistText

PewterMuseum1FClerkScript:
	faceplayer
	opentext
	writetext PewterMuseum1FClerkText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM1F_CLERK, LEFT
	end

PewterMuseum1FBookshelf:
	jumpstd DifficultBookshelfScript

PewterMuseum1FDisplay:
	jumptext PewterMuseum1FDisplayText

PewterMuseum1FPoster:
	jumptext PewterMuseum1FPosterText

PewterMuseum1FEntranceSideScript:
	turnobject PEWTERMUSEUM1F_CLERK, LEFT
	opentext
	writetext PewterMuseum1FEntranceEnjoyText
	waitbutton
	closetext
	end
	
PewterMuseum1FEntranceDownScript:
	turnobject PEWTERMUSEUM1F_CLERK, DOWN
	opentext
	checkevent EVENT_PEWTER_MUSEUM_BOUGHT_TICKET
	iftrue .AlreadyPaid
	writetext PewterMuseum1FEntranceOtherSideText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM1F_CLERK, LEFT
	end
.AlreadyPaid
	writetext PewterMuseum1FEntranceEnjoyText
	waitbutton
	closetext
	turnobject PEWTERMUSEUM1F_CLERK, LEFT
	end
	
PewterMuseum1FEntranceCoordScript1:
	applymovement PLAYER, PewterMuseum1F_MoveData2
PewterMuseum1FEntranceCoordScript2:
	turnobject PLAYER, RIGHT
	opentext
	special PlaceMoneyTopRight
	writetext PewterMuseum1FEntranceCoordScript1Text1
	yesorno
	iffalse .ComeAgain
	checkmoney YOUR_MONEY, PEWTERMUSEUM1F_ENTRANCE_FEE
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, PEWTERMUSEUM1F_ENTRANCE_FEE
	pause 10
	special PlaceMoneyTopRight
	playsound SFX_TRANSACTION
	waitsfx
	writetext PewterMuseum1FEntranceCoordScript1Text2
	waitbutton
	closetext
	setevent EVENT_PEWTER_MUSEUM_BOUGHT_TICKET
	setscene SCENE_FINISHED
	end
.NotEnoughMoney
	writetext PewterMuseum1FEntranceCoordScript1Text3
	waitbutton
.ComeAgain
	writetext PewterMuseum1FEntranceCoordScript1Text4
	waitbutton
	closetext
	applymovement PLAYER, PewterMuseum1F_MoveData1
	end
	
PewterMuseum1F_MoveData1:
	step DOWN
	step_end

PewterMuseum1F_MoveData2:
	step RIGHT
	step_end

PewterMuseum1FEntranceCoordScript1Text1:
	text "Hello and welcome"
	line "to PEWTER MUSEUM"
	cont "OF SCIENCE!"
	
	para "It's only ¥50 for"
	line "a child's ticket."

	para "Would you like to"
	line "come in?"
	done

PewterMuseum1FEntranceCoordScript1Text2:
	text "Right, ¥50!"
	line "Thank you!"
	done

PewterMuseum1FEntranceCoordScript1Text3:
	text "Oh… It seems you"
	line "don't have enough"
	cont "money."
	done

PewterMuseum1FEntranceCoordScript1Text4:
	text "Come again!"
	done

PewterMuseum1FEntranceOtherSideText:
	text "Please go to the"
	line "other side!"
	done

PewterMuseum1FEntranceEnjoyText:
	text "Take plenty of"
	line "time to look!"
	done

PewterMuseum1FReceptionistText:
	text "A trip in the"
	line "distant past."

	para "Enjoy the ancient"
	line "history exhibit!"
	done

PewterMuseum1FTeacherText:
	text "This museum was"
	line "closed for some"
	cont "time, and recently"
	cont "re-opened."

	para "To celebrate, they"
	line "brought back two"
	cont "of their most"
	cont "popular exhibits!"
	done

PewterMuseum1FHikerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "I see… That region"
	line "doesn't seem to"
	cont "have any fossils."
	done

PewterMuseum1FAmberScientistText:
	text "OLD AMBER? Sorry!"
	line "We don't have any."
	done

PewterMuseum1FLoreScientistText:
	text "The #MON LAB on"
	line "CINNABAR was lost"
	cont "when the volcano"
	cont "erupted."

	para "SCIENTISTS are one"
	line "big family, so now"
	cont "its staff works at"
	cont "the museum!"
	done

PewterMuseum1FClerkText:
	text "Don't just sneak"
	line "in the back way!"

	para "The entrance is on"
	line "the other side!"
	done

PewterMuseum1FDisplayText:
	text "A spiral-shaped"
	line "fossil! And one"
	cont "that looks like a"
	cont "horseshoe crab!"
	done

PewterMuseum1FPosterText:
	text "A poster for the"
	line "fossils exhibit."

	para "On it is a PIKACHU"
	line "dressed like an"
	cont "archaeologist,"

	para "surrounded by"
	line "giant dinosaurs!"
	done

PewterMuseum1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12,  7, PEWTER_CITY, 6
	warp_event 13,  7, PEWTER_CITY, 6
	warp_event 18,  7, PEWTER_CITY, 7
	warp_event 19,  7, PEWTER_CITY, 7
	warp_event  9,  7, PEWTER_MUSEUM_2F, 1
	warp_event 21,  3, PEWTER_MUSEUM_B1F, 1

	def_coord_events
	coord_event 11,  4, SCENE_DEFAULT, PewterMuseum1FEntranceCoordScript1
	coord_event 12,  4, SCENE_DEFAULT, PewterMuseum1FEntranceCoordScript2

	def_bg_events
	bg_event 14,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event 15,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event 16,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event 19,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event 20,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event 21,  1, BGEVENT_READ, PewterMuseum1FBookshelf
	bg_event  4,  3, BGEVENT_READ, PewterMuseum1FDisplay
	bg_event  5,  0, BGEVENT_READ, PewterMuseum1FPoster
	bg_event 13,  4, BGEVENT_READ, PewterMuseum1FEntranceSideScript
	bg_event 14,  5, BGEVENT_READ, PewterMuseum1FEntranceDownScript

	def_object_events
	object_event  8,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FReceptionistScript, -1
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FTeacherScript, -1
	object_event  4,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FHikerScript, -1
	object_event 17,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FAmberScientistScript, -1
	object_event 19,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FLoreScientistScript, -1
	object_event 14,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMuseum1FClerkScript, -1
