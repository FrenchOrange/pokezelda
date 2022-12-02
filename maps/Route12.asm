	object_const_def
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_FISHER5
	const ROUTE12_FISHER6
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherStephen:
	trainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStephenAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBarney:
	trainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBarneyAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherFrancis:
	trainer FISHER, FRANCIS, EVENT_BEAT_FISHER_FRANCIS, FisherFrancisSeenText, FisherFrancisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherFrancisAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherBruce:
	trainer FISHER, BRUCE, EVENT_BEAT_FISHER_BRUCE, FisherBruceSeenText, FisherBruceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherBruceAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

Route12HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_12_HIDDEN_REVIVE

FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #MON."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "I'm too impatient"
	line "for fishing…"
	done

FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

FisherStephenAfterBattleText:
	text "Have you checked"
	line "out KANTO's radio"

	para "programs? We get a"
	line "good variety here."
	done

FisherBarneySeenText:
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done

FisherBarneyBeatenText:
	text "The answer is"
	line "coming up next!"
	done

FisherBarneyAfterBattleText:
	text "I think electric-"
	line "ity is the most"

	para "important thing in"
	line "our daily lives."

	para "If it weren't,"
	line "people wouldn't"

	para "have made such a"
	line "fuss when the"

	para "POWER PLANT went"
	line "out of commission."
	done

FisherKyleSeenText:
	text "Do you remember?"
	done

FisherKyleBeatenText:
	text "You do remember?"
	done

FisherKyleAfterBattleText:
	text "The tug you feel"
	line "on the ROD when"

	para "you hook a #-"
	line "MON…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done

FisherFrancisSeenText:
	text "I keep catching"
	line "the same #MON…"

	para "Maybe a battle"
	line "will turn things"
	cont "around for me."
	done

FisherFrancisBeatenText:
	text "Nothing ever goes"
	line "right for me now…"
	done

FisherFrancisAfterBattleText:
	text "How come the guy"
	line "next to me catches"
	cont "good #MON?"
	done

FisherBruceSeenText:
	text "Heh, I'm on a roll"
	line "today. How about a"
	cont "battle, kid?"
	done

FisherBruceBeatenText:
	text "Oof. I wasn't"
	line "lucky that time."
	done

FisherBruceAfterBattleText:
	text "You have to have a"
	line "good ROD if you"

	para "want to catch good"
	line "#MON."
	done

Route12SignText:
	text "ROUTE 12"
	para "NORTH TO LAVENDER"
	done

FishingSpotSignText:
	text "SPORT FISHING AREA"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 77, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  0, 62, ROUTE_11_GATE, 3
	warp_event  0, 63, ROUTE_11_GATE, 4
	warp_event 12, 17, ROUTE_12_GATE, 1
	warp_event 13, 17, ROUTE_12_GATE, 2
	warp_event 12, 21, ROUTE_12_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 15, 13, BGEVENT_READ, Route12Sign
	bg_event 13, 63, BGEVENT_READ, FishingSpotSign
	bg_event  6, 63, BGEVENT_ITEM, Route12HiddenElixer
	bg_event 17, 34, BGEVENT_ITEM, Route12HiddenRevive

	def_object_events
	object_event  7, 35, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event 15, 73, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherStephen, -1
	object_event 14, 90, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFisherBarney, -1
	object_event  9, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1
	object_event  9, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherFrancis, -1
	object_event 15, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherBruce, -1
	object_event  7, 87, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  8, 101, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
