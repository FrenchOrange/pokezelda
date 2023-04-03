	object_const_def
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUIDE
	const CELADONGAMECORNER_GRAMPS

CeladonGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	promptbutton
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	getstring STRING_BUFFER_4, .coinname
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "COIN@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuideScript:
	jumptextfaceplayer CeladonGymGuideText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext CeladonGameCornerPoster2MaleText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	opentext
	writetext CeladonGameCornerPoster2FemaleText
	waitbutton
	closetext
	end

CeladonGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, CeladonGameCornerSlotMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	showemote EMOTE_HAPPY, PLAYER, 20
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	showemote EMOTE_HAPPY, PLAYER, 20
	refreshscreen
	special CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

CeladonGameCornerSodaCanScript:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end

CeladonGameCornerReceptionistText:
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done

CeladonGameCornerPokefanMText:
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done

CeladonGameCornerTeacherText:
	text "It's this machine"
	line "I want."

	para "It cleaned me out"
	line "yesterday, so it"

	para "should pay out"
	line "today."
	done

CeladonGameCornerFishingGuruText:
	text "I think this slot"
	line "machine will pay"
	cont "out…"

	para "The odds vary"
	line "among machines."
	done

CeladonGameCornerFisherText1:
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done

CeladonGameCornerFisherText2:
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Hey, you don't"
	line "have a COIN CASE."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done

CeladonGameCornerFisherFullCoinCaseText:
	text "Hey, your COIN"
	line "CASE is full, kid."

	para "You must be riding"
	line "a winning streak"
	cont "too."
	done

CeladonGymGuideText:
	text "Hey! CHAMP in"
	line "making!"

	para "Are you playing"
	line "the slots too?"

	para "I'm trying to get"
	line "enough coins for a"
	cont "prize #MON."

	para "But I don't have"
	line "enough coins yet…"
	done

CeladonGameCornerGrampsText:
	text "Hmmm… The odds are"
	line "surely better for"

	para "PIKACHU's line,"
	line "but… What to do?"
	done

CeladonGameCornerPoster1Text:
	text "Hey!"

	para "Underneath this"
	line "poster…"

	para "There's nothing!"
	done

CeladonGameCornerPoster2MaleText:
	text "A poster asking"
	line "patrons to gamble"
	cont "responsibly."

	para "On it is also a"
	line "picture of a lady"
	cont "in a bunny outfit."

	para "…For good measure?"
	done

CeladonGameCornerPoster2FemaleText:
	text "A poster asking"
	line "patrons to gamble"
	cont "responsibly."

	para "On it is also a"
	line "picture of a very,"
	cont "very pretty lady"
	cont "in a bunny outfit."

	para "For good measure?"
	done

CeladonGameCornerLighterText:
	text "There's a lighter"
	line "here."
	done

CeladonGameCornerSodaCanText:
	text "A can of soda…"

	para "Someone must be"
	line "coming back…"

	para "Huh? It's empty!"
	done

CeladonGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 16, 13, CELADON_CITY, 6
	warp_event 17, 13, CELADON_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  3,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  3,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  3,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  3,  9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  3, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  3, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event  8,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  8,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  8,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  8,  9, BGEVENT_READ, CeladonGameCornerSodaCanScript
	bg_event  8, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  8, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event  9,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  9,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  9,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  9,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  9, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event  9, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 14,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 14,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 14,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 14,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 14, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 14, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 15, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 15, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 20,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 20,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 20,  8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 20,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 20, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 20, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 11,  0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event 17,  0, BGEVENT_READ, CeladonGameCornerPoster2Script

	def_object_events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event  5,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 16, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 19,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 13,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event 10, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 10, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 13,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuideScript, -1
	object_event  4,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
