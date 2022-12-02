	object_const_def
	const CELADONDEPTSTORE3F_CLERK1
	const CELADONDEPTSTORE3F_YOUNGSTER
	const CELADONDEPTSTORE3F_GAMEBOY_KID1
	const CELADONDEPTSTORE3F_GAMEBOY_KID2
	const CELADONDEPTSTORE3F_SUPER_NERD
	const CELADONDEPTSTORE3F_CLERK2

CeladonDeptStore3F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore3FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_CELADON_3F
	closetext
	end

CeladonDeptStore3FConsoleClerkScript:
	faceplayer
	opentext
	writetext CeladonDeptStore3FConsoleClerkHeyKidText
	waitbutton
CeladonDeptStore3FConsoleClerk_LoopScript:
	writetext CeladonDeptStore3FConsoleClerk_AskWhichConsoleText
	special PlaceMoneyTopRight
	loadmenu CeladonDeptStore3FConsoleClerkMenu
	verticalmenu
	closewindow
	ifequal 1, .Console1
	ifequal 2, .Console2
	ifequal 3, .Console3
	ifequal 4, .Console4
	jump CeladonDeptStore3FConsoleClerk_Cancel
	
.Console1
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, CeladonDeptStore3FConsoleClerkNotEnoughMoney
	writetext CeladonDeptStore3FConsoleClerk_AreYouSureText
	yesorno
	iffalse CeladonDeptStore3FConsoleClerk_Cancel
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_FAMICOM
	takemoney YOUR_MONEY, 2000
	jump CeladonDeptStore3FConsoleClerk_FinishScript
	end
	
.Console2
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, CeladonDeptStore3FConsoleClerkNotEnoughMoney
	writetext CeladonDeptStore3FConsoleClerk_AreYouSureText
	yesorno
	iffalse CeladonDeptStore3FConsoleClerk_Cancel
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SNES
	takemoney YOUR_MONEY, 3000
	jump CeladonDeptStore3FConsoleClerk_FinishScript
	end
	
.Console3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, CeladonDeptStore3FConsoleClerkNotEnoughMoney
	writetext CeladonDeptStore3FConsoleClerk_AreYouSureText
	yesorno
	iffalse CeladonDeptStore3FConsoleClerk_Cancel
	checkevent EVENT_DECO_N64
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_N64
	takemoney YOUR_MONEY, 5000
	jump CeladonDeptStore3FConsoleClerk_FinishScript
	end

.Console4
	checkmoney YOUR_MONEY, 1500
	ifequal HAVE_LESS, CeladonDeptStore3FConsoleClerkNotEnoughMoney
	writetext CeladonDeptStore3FConsoleClerk_AreYouSureText
	yesorno
	iffalse CeladonDeptStore3FConsoleClerk_Cancel
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VIRTUAL_BOY
	takemoney YOUR_MONEY, 1500
	jump CeladonDeptStore3FConsoleClerk_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext CeladonDeptStore3FConsoleClerk_AlreadyHaveDecoText
	waitbutton
	jump CeladonDeptStore3FConsoleClerk_LoopScript

CeladonDeptStore3FConsoleClerkMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 13, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "NES   ¥2000@"
	db "SNES  ¥3000@"
	db "N64   ¥5000@"
	db "VB    ¥1500@"
	
CeladonDeptStore3FConsoleClerk_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonDeptStore3FConsoleClerk_HereYouGoText
	waitbutton
	jump CeladonDeptStore3FConsoleClerk_LoopScript

CeladonDeptStore3FConsoleClerk_Cancel:
	writetext CeladonDeptStore3FConsoleClerkTakeCare
	waitbutton
	closetext
	end
	
CeladonDeptStore3FConsoleClerkNotEnoughMoney:
	writetext CeladonDeptStore3FConsoleClerkNotEnoughMoneyText
	waitbutton
	closetext
	end


CeladonDeptStore3FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore3FYoungsterText

CeladonDeptStore3FGameboyKid1Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid1Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID1, DOWN
	end

CeladonDeptStore3FGameboyKid2Script:
	faceplayer
	opentext
	writetext CeladonDeptStore3FGameboyKid2Text
	waitbutton
	closetext
	turnobject CELADONDEPTSTORE3F_GAMEBOY_KID2, DOWN
	end

CeladonDeptStore3FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore3FSuperNerdText

CeladonDeptStore3FElevatorButton:
	jumpstd ElevatorButtonScript

CeladonDeptStore3FDirectory:
	jumptext CeladonDeptStore3FDirectoryText

CeladonDeptStore3FYoungsterText:
	text "I can't decide"
	line "which #MON I"

	para "should use this TM"
	line "on…"
	done

CeladonDeptStore3FGameboyKid1Text:
	text "Uh-oh! I traded my"
	line "#MON without"

	para "removing the UP-"
	line "GRADE from it."
	done

CeladonDeptStore3FGameboyKid2Text:
	text "Yeah! I'm finally"
	line "getting a PORYGON!"

	para "I'm no good at the"
	line "slots, so I could"

	para "never get enough"
	line "coins…"

	para "…Huh?"

	para "The traded PORYGON"
	line "turned into a dif-"
	cont "ferent #MON!"
	done

CeladonDeptStore3FSuperNerdText:
	text "The TM SHOP sells"
	line "some rare moves."
	done

CeladonDeptStore3FDirectoryText:
	text "3F: TM SHOP"

	para "Make Your #MON"
	line "Stronger!"
	done

CeladonDeptStore3FConsoleClerkHeyKidText:
	text "Hey kid! Want a"
	line "new GAME CONSOLE?"
	done
	
CeladonDeptStore3FConsoleClerk_AskWhichConsoleText:
	text "See anything that"
	line "interests you?"
	done

CeladonDeptStore3FConsoleClerk_AreYouSureText:
	text "Are you sure?"
	done

CeladonDeptStore3FConsoleClerk_AlreadyHaveDecoText:
	text "Don't you already"
	line "own this CONSOLE?"
	done

CeladonDeptStore3FConsoleClerk_HereYouGoText:
	text "Here you go! We"
	line "will deliver this"
	cont "item to your home"
	cont "without delay!"
	done

CeladonDeptStore3FConsoleClerkNotEnoughMoneyText:
	text "Sorry. You don't"
	line "have enough money."
	done
	
CeladonDeptStore3FConsoleClerkTakeCare:
	text "Please come again!"
	done

CeladonDeptStore3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14,  0, CELADON_DEPT_STORE_2F, 1
	warp_event 17,  0, CELADON_DEPT_STORE_4F, 2
	warp_event  4,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 16,  0, BGEVENT_READ, CeladonDeptStore3FDirectory
	bg_event  5,  0, BGEVENT_READ, CeladonDeptStore3FElevatorButton

	def_object_events
	object_event  9,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FClerkScript, -1
	object_event  8,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FYoungsterScript, -1
	object_event 11,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid1Script, -1
	object_event 12,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FGameboyKid2Script, -1
	object_event 15,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FSuperNerdScript, -1
	object_event  8,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore3FConsoleClerkScript, -1
