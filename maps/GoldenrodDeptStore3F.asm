	object_const_def
	const GOLDENRODDEPTSTORE3F_CLERK1
	const GOLDENRODDEPTSTORE3F_CLERK2
	const GOLDENRODDEPTSTORE3F_TWIN
	const GOLDENRODDEPTSTORE3F_POKEFAN_M
	const GOLDENRODDEPTSTORE3F_POKEFAN_F
	const GOLDENRODDEPTSTORE3F_YOUNGSTER
	const GOLDENRODDEPTSTORE3F_RECEPTIONIST

GoldenrodDeptStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodDeptStore3FClerk1Script:
	faceplayer
	opentext
	writetext GoldenrodDeptStore3FDecorClerkHiThereText
	waitbutton
GoldenrodDeptStore3FDecorClerk1_LoopScript:
	writetext GoldenrodDeptStore3FDecorClerk_AskWhichDecorText
	special PlaceMoneyTopRight
	loadmenu GoldenrodDeptStore3FDecorClerk1Menu
	verticalmenu
	closewindow
	ifequal 1, .Carpet1
	ifequal 2, .Carpet2
	ifequal 3, .Carpet3
	ifequal 4, .Carpet4
	jump GoldenrodDeptStore3FDecorClerk_Cancel
	
.Carpet1
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_CARPET_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_1
	takemoney YOUR_MONEY, 500
	jump GoldenrodDeptStore3FDecorClerk1_FinishScript
	end
	
.Carpet2
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_CARPET_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_2
	takemoney YOUR_MONEY, 500
	jump GoldenrodDeptStore3FDecorClerk1_FinishScript
	end
	
.Carpet3
	checkmoney YOUR_MONEY, 600
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_CARPET_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_3
	takemoney YOUR_MONEY, 600
	jump GoldenrodDeptStore3FDecorClerk1_FinishScript
	end

.Carpet4
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_CARPET_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CARPET_4
	takemoney YOUR_MONEY, 300
	jump GoldenrodDeptStore3FDecorClerk1_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext GoldenrodDeptStore3FDecorClerk_AlreadyHaveDecoText
	waitbutton
	jump GoldenrodDeptStore3FDecorClerk1_LoopScript

GoldenrodDeptStore3FDecorClerk1Menu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "RED CARPET   ¥500@"
	db "BLU CARPET   ¥500@"
	db "YLW CARPET   ¥600@"
	db "GRN CARPET   ¥300@"


GoldenrodDeptStore3FClerk2Script:
	faceplayer
	opentext
	writetext GoldenrodDeptStore3FDecorClerkHiThereText
	waitbutton
GoldenrodDeptStore3FDecorClerk2_LoopScript:
	writetext GoldenrodDeptStore3FDecorClerk_AskWhichDecorText
	special PlaceMoneyTopRight
	loadmenu GoldenrodDeptStore3FDecorClerk2Menu
	verticalmenu
	closewindow
	ifequal 1, .Bed1
	ifequal 2, .Bed2
	ifequal 3, .Bed3
	jump GoldenrodDeptStore3FDecorClerk_Cancel
	
.Bed1
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_BED_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_2
	takemoney YOUR_MONEY, 300
	jump GoldenrodDeptStore3FDecorClerk2_FinishScript
	end
	
.Bed2
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_BED_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_3
	takemoney YOUR_MONEY, 500
	jump GoldenrodDeptStore3FDecorClerk2_FinishScript
	end
	
.Bed3
	checkmoney YOUR_MONEY, 900
	ifequal HAVE_LESS, GoldenrodDeptStore3FDecorClerkNotEnoughMoney
	writetext GoldenrodDeptStore3FDecorClerk_AreYouSureText
	yesorno
	iffalse GoldenrodDeptStore3FDecorClerk_Cancel
	checkevent EVENT_DECO_BED_4
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BED_4
	takemoney YOUR_MONEY, 900
	jump GoldenrodDeptStore3FDecorClerk2_FinishScript
	end

.AlreadyHaveDecorItem
	writetext GoldenrodDeptStore3FDecorClerk_AlreadyHaveDecoText
	waitbutton
	jump GoldenrodDeptStore3FDecorClerk2_LoopScript

GoldenrodDeptStore3FDecorClerk2Menu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "PINK BED     ¥300@"
	db "MARILL BED   ¥500@"
	db "PIKACHU BED  ¥900@"

GoldenrodDeptStore3FDecorClerk1_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodDeptStore3FDecorClerk_HereYouGoText
	waitbutton
	jump GoldenrodDeptStore3FDecorClerk1_LoopScript

GoldenrodDeptStore3FDecorClerk2_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodDeptStore3FDecorClerk_HereYouGoText
	waitbutton
	jump GoldenrodDeptStore3FDecorClerk2_LoopScript

GoldenrodDeptStore3FDecorClerk_Cancel:
	writetext GoldenrodDeptStore3FDecorClerkTakeCare
	waitbutton
	closetext
	end
	
GoldenrodDeptStore3FDecorClerkNotEnoughMoney:
	writetext GoldenrodDeptStore3FDecorClerkNotEnoughMoneyText
	waitbutton
	closetext
	end

GoldenrodDeptStore3FTwinScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStore3FTwinText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTORE3F_TWIN, LEFT
	end

GoldenrodDeptStore3FPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStore3FPokefanMText

GoldenrodDeptStore3FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore3FPokefanFText

GoldenrodDeptStore3FYoungsterScript:
	jumptextfaceplayer GoldenrodDeptStore3FYoungsterText

GoldenrodDeptStore3FDirectory:
	jumptext GoldenrodDeptStore3FDirectoryText

GoldenrodDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

GoldenrodDeptStore3FReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .GotOnixDoll
	writetext GoldenrodDeptStore3FReceptionistPhewText
	special PlaceMoneyTopRight
	yesorno
	iffalse ReceptionistScript_NoSale
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, ReceptionistScript_NoMoney
	setevent EVENT_DECO_BIG_ONIX_DOLL
	takemoney YOUR_MONEY, 2500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodDeptStore3FDecorClerk_HereYouGoText
	promptbutton
	closetext
	end

.GotOnixDoll:
	writetext GoldenrodDeptStore3FReceptionistYetAgainText
	waitbutton
	closetext
	end

ReceptionistScript_NoMoney:
	writetext GoldenrodDeptStore3FDecorClerkNotEnoughMoneyText
	waitbutton
	closetext
	end

ReceptionistScript_NoSale:
	writetext ReceptionistText_NoSale
	waitbutton
	closetext
	end

GoldenrodDeptStore3FDecorClerkHiThereText:
	text "Hi there! Looking"
	line "to give your room"
	cont "a new look?"
	done

GoldenrodDeptStore3FDecorClerk_AskWhichDecorText:
	text "See anything that"
	line "interests you?"
	done

GoldenrodDeptStore3FDecorClerk_AreYouSureText:
	text "Are you sure?"
	done

GoldenrodDeptStore3FDecorClerk_AlreadyHaveDecoText:
	text "Don't you already"
	line "own this DECOR?"
	done

GoldenrodDeptStore3FDecorClerk_HereYouGoText:
	text "Here you go! We"
	line "will deliver this"
	cont "item to your home"
	cont "without delay!"
	done

GoldenrodDeptStore3FDecorClerkNotEnoughMoneyText:
	text "Sorry. You don't"
	line "have enough money."
	done
	
GoldenrodDeptStore3FDecorClerkTakeCare:
	text "Please come again!"
	done

GoldenrodDeptStore3FReceptionistPhewText:
	text "Pheeew."

	para "I'm barely done"
	line "restocking the"
	cont "aisles that they"
	cont "get picked clean."

	para "All that is left"
	line "is this ONIX DOLL."

	para "Hmm? Do you want"
	line "to buy it perhaps?"
	cont "It's worth ¥2500."
	done

ReceptionistText_NoSale:
	text "Come again!"
	done

GoldenrodDeptStore3FReceptionistYetAgainText:
	text "Time to pack the"
	line "shelves yet again."
	done

GoldenrodDeptStore3FTwinText:
	text "They have #MON"
	line "DOLLS for days!"

	para "I want them! All"
	line "whatever how many"
	cont "#MON there are!"
	done

GoldenrodDeptStore3FPokefanMText:
	text "A new bed-sheet"
	line "pattern! The"

	para "polkadots remind"
	line "me of MARILL."

	para "My wife is going"
	line "to adore it!"
	done

GoldenrodDeptStore3FPokefanFText:
	text "My husband is such"
	line "a sweet-heart."

	para "We bonded over our"
	line "love of everything"
	cont "#MON."

	para "We're #FANS!"
	done

GoldenrodDeptStore3FYoungsterText:
	text "Is your room all"
	line "decked-out?"

	para "If not, then this"
	line "place is just what"
	cont "you need!"
	done

GoldenrodDeptStore3FDirectoryText:
	text "Make your home a"
	line "cosy place."

	para "3F DECOR SHOP"
	done

GoldenrodDeptStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14,  0, GOLDENROD_DEPT_STORE_2F, 1
	warp_event 17,  0, GOLDENROD_DEPT_STORE_4F, 2
	warp_event  4,  0, GOLDENROD_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 16,  0, BGEVENT_READ, GoldenrodDeptStore3FDirectory
	bg_event  5,  0, BGEVENT_READ, GoldenrodDeptStore3FElevatorButton

	def_object_events
	object_event  8,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FClerk1Script, -1
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FClerk2Script, -1
	object_event  4,  6, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FTwinScript, -1
	object_event 10,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FPokefanMScript, -1
	object_event 16,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FPokefanFScript, -1
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FYoungsterScript, -1
	object_event  8,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore3FReceptionistScript, EVENT_ONIX_DOLL_RECEPTIONIST
