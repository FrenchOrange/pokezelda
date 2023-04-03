GOLDENRODGAMECORNER_TM25_COINS EQU 5500
GOLDENRODGAMECORNER_TM14_COINS EQU 5500
GOLDENRODGAMECORNER_TM38_COINS EQU 5500
GOLDENRODGAMECORNER_ABRA_COINS     EQU 200
GOLDENRODGAMECORNER_CLEFAIRY_COINS EQU 800
GOLDENRODGAMECORNER_PIKACHU_COINS  EQU 1500

	object_const_def
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_MOVETUTOR

GoldenrodGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNER_MOVETUTOR
	endcallback

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNER_MOVETUTOR
.finish
	endcallback

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_MOVETUTOR, RIGHT
	end

GoldenrodGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNER_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM25_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNER_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM14_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNER_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM38_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Clefairy
	ifequal 3, .Pikachu
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 10
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .loop

.Clefairy:
	checkcoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CLEFAIRY
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval CLEFAIRY
	special GameCornerPrizeMonCheckDex
	givepoke CLEFAIRY, 12
	takecoins GOLDENRODGAMECORNER_CLEFAIRY_COINS
	sjump .loop

.Pikachu:
	checkcoins GOLDENRODGAMECORNER_PIKACHU_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, PIKACHU
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 12
	takecoins GOLDENRODGAMECORNER_PIKACHU_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        200@"
	db "CLEFAIRY    800@"
	db "PIKACHU    1500@"
	db "CANCEL@"

GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerLeftTheirDrinkScript:
	jumptext GoldenrodGameCornerLeftTheirDrinkText

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerLuckySlotsMachineScript
	showemote EMOTE_HAPPY, PLAYER, 20
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	showemote EMOTE_HAPPY, PLAYER, 20
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	showemote EMOTE_HAPPY, PLAYER, 20
	refreshscreen
	special CardFlip
	closetext
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

GoldenrodGameCornerPokefanM1Text:
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done

GoldenrodGameCornerCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

GoldenrodGameCornerPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

GoldenrodGameCornerCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

GoldenrodGameCornerGentlemanText:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

GoldenrodGameCornerPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

GoldenrodGameCornerLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, GOLDENROD_CITY, 10
	warp_event  5, 13, GOLDENROD_CITY, 10

	def_coord_events

	def_bg_events
	bg_event  8,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  8,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  8,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  8,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  8, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  8, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  9,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  9,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  9,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  9,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  9, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  9, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 14,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 14,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 14,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 14,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 14, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 14, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 15,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 15,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 15,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 15,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 15, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 15, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 20, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 14,  1, BGEVENT_LEFT, GoldenrodGameCornerLeftTheirDrinkScript

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCoinVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 20,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event 10,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 10,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 13, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 16,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event 19,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event  4,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
	object_event 19, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
