	object_const_def
	const CERULEANBIKESHOP_YOUNGSTER
	const CERULEANBIKESHOP_BUG_CATCHER
	const CERULEANBIKESHOP_POKEFAN_F

CeruleanBikeShop_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanBikeShopMotherScript:
	jumptextfaceplayer CeruleanBikeShopMotherText

CeruleanBikeShopLittleBoyScript:
	jumptextfaceplayer CeruleanBikeShopLittleBoyText

CeruleanBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext CeruleanBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext CeruleanBikeShopClerkAgreedText
	promptbutton
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleKantoText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext CeruleanBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext CeruleanBikeShopClerkRefusedText
	waitbutton
	closetext
	end

CeruleanBikeShopJustReleasedCompactBike:
	jumptext CeruleanBikeShopJustReleasedCompactBikeText

CeruleanBikeShopBicycle:
	jumptext CeruleanBikeShopBicycleText

CeruleanBikeShopClerkIntroText:
	text "The old owner"
	line "recently set up"
	cont "shop in JOHTO, to"
	cont "look for clients."

	para "Everyone in KANTO"
	line "seems to have a"
	cont "BICYCLE already,"

	para "so my job is to"
	line "look after the old"
	cont "shop just in case."

	para "Oh! You don't have"
	line "a BICYCLE!"

	para "Would you like to"
	line "loan one?"
	done

CeruleanBikeShopClerkAgreedText:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done

BorrowedABicycleKantoText:
	text "<PLAYER> borrowed a"
	line "BICYCLE."
	done

CeruleanBikeShopClerkFirstRateBikesText:
	text "Our BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

CeruleanBikeShopClerkRefusedText:
	text "Oh… Sure thing."
	line "Well, have a good"
	cont "day then."
	done

CeruleanBikeShopMotherText:
	text "Look out for those"
	line "nasty BIKERS on"
	cont "CYCLING ROAD."

	para "They don't hold"
	line "back!"
	done

CeruleanBikeShopLittleBoyText:
	text "Mommy's soup tastes"
	line "yucky, but I want"
	cont "to get tall enough"
	cont "to ride her MTB!"
	done

CeruleanBikeShopJustReleasedCompactBikeText:
	text "Just released!"

	para "First-rate compact"
	line "BICYCLES!"
	done

CeruleanBikeShopBicycleText:
	text "It's a shiny new"
	line "BICYCLE!"
	done

CeruleanBikeShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CERULEAN_CITY, 7
	warp_event  5,  7, CERULEAN_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  3,  2, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  2,  3, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  3,  3, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  2,  5, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  3,  5, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  2,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  3,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  8,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  9,  6, BGEVENT_READ, CeruleanBikeShopBicycle
	bg_event  4,  1, BGEVENT_READ, CeruleanBikeShopJustReleasedCompactBike
	bg_event  6,  1, BGEVENT_READ, CeruleanBikeShopJustReleasedCompactBike
	bg_event  7,  1, BGEVENT_READ, CeruleanBikeShopJustReleasedCompactBike

	def_object_events
	object_event  9,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopClerkScript, -1
	object_event  8,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopLittleBoyScript, -1
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopMotherScript, -1
