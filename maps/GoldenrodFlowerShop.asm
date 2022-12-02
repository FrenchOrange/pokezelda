	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ShopSetup
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText

.HaventMetFloria:
	jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text

.ShopSetup:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherMannersText
	waitbutton
GoldenrodFlowerShopTeacher_LoopScript:
	writetext GoldenrodFlowerShopTeacher_AskWhichPlantText
	special PlaceMoneyTopRight
	loadmenu GoldenrodFlowerShopTeacherMenu
	verticalmenu
	closewindow
	ifequal 1, .Plant1
	ifequal 2, .Plant2
	ifequal 3, .Plant3
	jump GoldenrodFlowerShopTeacher_Cancel
	
.Plant1
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, GoldenrodFlowerShopTeacherNotEnoughMoney
	writetext GoldenrodFlowerShopTeacher_AreYouSureText
	yesorno
	iffalse GoldenrodFlowerShopTeacher_Cancel
	checkevent EVENT_DECO_PLANT_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_1
	takemoney YOUR_MONEY, 3000
	jump GoldenrodFlowerShopTeacher_FinishScript
	end
	
.Plant2
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, GoldenrodFlowerShopTeacherNotEnoughMoney
	writetext GoldenrodFlowerShopTeacher_AreYouSureText
	yesorno
	iffalse GoldenrodFlowerShopTeacher_Cancel
	checkevent EVENT_DECO_PLANT_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_2
	takemoney YOUR_MONEY, 3000
	jump GoldenrodFlowerShopTeacher_FinishScript
	end
	
.Plant3
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, GoldenrodFlowerShopTeacherNotEnoughMoney
	writetext GoldenrodFlowerShopTeacher_AreYouSureText
	yesorno
	iffalse GoldenrodFlowerShopTeacher_Cancel
	checkevent EVENT_DECO_PLANT_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_PLANT_3
	takemoney YOUR_MONEY, 3000
	jump GoldenrodFlowerShopTeacher_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext GoldenrodFlowerShopTeacher_AlreadyHaveDecoText
	waitbutton
	jump GoldenrodFlowerShopTeacher_LoopScript

	
GoldenrodFlowerShopTeacherMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "MAGNA   ¥3000@"
	db "TROPIC  ¥3000@"
	db "JUMBO   ¥3000@"
	
GoldenrodFlowerShopTeacher_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodFlowerShopTeacher_HereYouGoText
	waitbutton
	jump GoldenrodFlowerShopTeacher_LoopScript

GoldenrodFlowerShopTeacher_Cancel:
	writetext GoldenrodFlowerShopTeacherTakeCare
	waitbutton
	closetext
	end
	
GoldenrodFlowerShopTeacherNotEnoughMoney:
	writetext GoldenrodFlowerShopTeacherNotEnoughMoneyText
	waitbutton
	closetext
	end

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Have you seen that"
	line "wiggly tree that's"

	para "growing on ROUTE"
	line "36?"

	para "My little sister"
	line "got all excited"

	para "and went to see"
	line "it…"

	para "I'm worried… Isn't"
	line "it dangerous?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Do you want to"
	line "borrow the water"

	para "bottle too?"
	line "I don't want you"

	para "doing anything"
	line "dangerous with it."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, you're better"
	line "than WHITNEY…"

	para "You'll be OK,"
	line "then. Here's the"
	cont "SQUIRTBOTTLE!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Don't do anything"
	line "too dangerous!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Have plenty of"
	cont "water, my lovely!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she told me"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, you beat"
	line "WHITNEY? Cool!"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "So it really was a"
	line "#MON!"
	done

GoldenrodFlowerShopTeacherMannersText:
	text "Oh! But where are"
	line "my manners."
	para "I run a business"
	line "after all!"
	done
	
GoldenrodFlowerShopTeacher_AskWhichPlantText:
	text "Which PLANT caught"
	line "your eye? Tell me."
	done
	
GoldenrodFlowerShopTeacher_AreYouSureText:
	text "Are you sure?"
	done

GoldenrodFlowerShopTeacher_AlreadyHaveDecoText:
	text "You already have"
	line "this PLANT!"
	done

GoldenrodFlowerShopTeacher_HereYouGoText:
	text "Here you go! We"
	line "will deliver this"
	cont "item to your home"
	cont "without delay!"
	done

GoldenrodFlowerShopTeacherNotEnoughMoneyText:
	text "I'm sorry, but it"
	line "seems you don't"
	cont "have enough money."
	done
	
GoldenrodFlowerShopTeacherTakeCare:
	text "It was a pleasure."
	line "Take care!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, GOLDENROD_CITY, 6
	warp_event  5,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  7,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
