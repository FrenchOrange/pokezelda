	object_const_def
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike:
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "…sigh… I moved"
	line "here, but I can't"

	para "sell my BICYCLES."
	line "Why is that?"

	para "Could you ride a"
	line "BICYCLE and adver-"
	cont "tise for me?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done

BorrowedABicycleText:
	text "<PLAYER> borrowed a"
	line "BICYCLE."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "Our BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

GoldenrodBikeShopClerkRefusedText:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Just released!"

	para "First-rate compact"
	line "BICYCLES!"
	done

GoldenrodBikeShopBicycleText:
	text "It's a shiny new"
	line "BICYCLE!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, GOLDENROD_CITY, 2
	warp_event  5,  7, GOLDENROD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  2,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  3,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  2,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  3,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  2,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  3,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  8,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  9,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  4,  1, BGEVENT_READ, GoldenrodBikeShopJustReleasedCompactBike
	bg_event  6,  1, BGEVENT_READ, GoldenrodBikeShopJustReleasedCompactBike
	bg_event  7,  1, BGEVENT_READ, GoldenrodBikeShopJustReleasedCompactBike

	def_object_events
	object_event  9,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
