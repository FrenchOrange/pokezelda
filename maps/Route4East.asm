	object_const_def
	const ROUTE4EAST_YOUNGSTER
	const ROUTE4EAST_LASS1
	const ROUTE4EAST_LASS2
	const ROUTE4EAST_LASS3
	const ROUTE4EAST_POKE_BALL
	const ROUTE4EAST_COOLTRAINERM
	const ROUTE4EAST_OFFICER

Route4East_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

TrainerLassChloe:
	trainer LASS, CHLOE, EVENT_BEAT_LASS_CHLOE, LassChloeSeenText, LassChloeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassChloeAfterBattleText
	waitbutton
	closetext
	end

Route4EastOfficerScript:
	jumptextfaceplayer Route4EastOfficerText

MtMoonRouteSign:
	jumptext MtMoonRouteSignText

Route4EastHPUp:
	itemball HP_UP

Route4EastHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done

BirdKeeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

BirdKeeperHankAfterBattleText:
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

PicnickerHopeAfterBattleText:
	text "I heard CLEFAIRY"
	line "appear at MT.MOON."

	para "But where could"
	line "they be?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "……I'll go train"
	line "some more…"
	done

LassChloeSeenText:
	text "I'm looking for"
	line "POKéMON to catch."
	para "Yours look cool,"
	line "can I have them?"
	done

LassChloeBeatenText:
	text "But I want a cool"
	line "POKéMON of my own…"
	done

Route4EastOfficerText:
	text "I'm sorry, but"
	line "access to MT.MOON"
	cont "is currently"
	cont "restricted."

	para "We had reports of"
	line "a shady young man"
	cont "training there."

	para "He could be linked"
	line "to the POWER PLANT"
	cont "incident."
	done

LassChloeAfterBattleText:
	text "I'm still a newbie."
	line "So please don't be"
	cont "too harsh on me."
	done

MtMoonRouteSignText:
	text "ROUTE 4"
	para "MT.MOON -"
	line "CERULEAN CITY"
	done

Route4East_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  5,  7, BGEVENT_READ, MtMoonRouteSign
	bg_event 18,  3, BGEVENT_ITEM, Route4EastHiddenUltraBall

	def_object_events
	object_event 27,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event 17,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 33,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 47, 13, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassChloe, -1
	object_event 40,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4EastHPUp, EVENT_ROUTE_4_HP_UP
	object_event 71,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCaveNPCScript, -1
	object_event  2,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route4EastOfficerScript, EVENT_VERMILION_CITY_SNORLAX
