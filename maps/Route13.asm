	object_const_def
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_BEAUTY1
	const ROUTE13_BEAUTY2

Route13_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVeronica:
	trainer BEAUTY, VERONICA, EVENT_BEAT_BEAUTY_VERONICA, BeautyVeronicaSeenText, BeautyVeronicaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVeronicaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyTheresa:
	trainer BEAUTY, THERESA, EVENT_BEAT_BEAUTY_THERESA, BeautyTheresaSeenText, BeautyTheresaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyTheresaAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13TrainerTips2:
	jumptext Route13TrainerTips2Text

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

Route13HiddenPPUp:
	hiddenitem PP_UP, EVENT_ROUTE_13_HIDDEN_PP_UP

PokefanmAlexSeenText:
	text "Bow down before my"
	line "regal #MON!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

PokefanmAlexAfterBattleText:
	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "PIKACHU gang?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "You look like you"
	line "have many #MON,"

	para "but PIKACHU is"
	line "still the best."
	done

BirdKeeperPerrySeenText:
	text "Agility is the key"
	line "attribute of bird"
	cont "#MON."
	done

BirdKeeperPerryBeatenText:
	text "You beat me with"
	line "your speed…"
	done

BirdKeeperPerryAfterBattleText:
	text "Your #MON are"
	line "remarkably well-"
	cont "trained."
	done

BirdKeeperBretSeenText:
	text "Check out my #-"
	line "MON. Just look at"

	para "their coloring and"
	line "their plumage."
	done

BirdKeeperBretBeatenText:
	text "Shoot!"
	line "Not good enough!"
	done

BirdKeeperBretAfterBattleText:
	text "If you groom them,"
	line "#MON get happy."
	done

BeautyVeronicaSeenText:
	text "I give my #MON"
	line "haircuts, it makes"
	para "for a nice bonding"
	line "moment."
	done

BeautyVeronicaBeatenText:
	text "I better keep my"
	line "brush on hand."
	done

BeautyVeronicaAfterBattleText:
	text "Don't you think"
	line "your #MON gets"
	cont "closer to you the"

	para "more time you"
	line "spend with them?"
	done

BeautyTheresaSeenText:
	text "Every Friday I"
	line "treat my #MON"

	para "to a haircut over"
	line "in GOLDENROD CITY."
	done

BeautyTheresaBeatenText:
	text "Oh no! Now my hair"
	line "needs care…"
	done

BeautyTheresaAfterBattleText:
	text "The service is"
	line "always great, but"
	para "the result depends"
	line "on who's working"
	cont "that day."
	done

Route13TrainerTipsText:
	text "TRAINER TIPS"

	para "Look to the left"
	line "of that post!"
	done

Route13SignText:
	text "ROUTE 13"

	para "NORTH TO SILENCE"
	line "BRIDGE"
	done

Route13TrainerTips2Text:
	text "TRAINER TIPS"

	para "Use SELECT to"
	line "switch items in"
	cont "the ITEM window!"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 15, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 31, 11, BGEVENT_READ, Route13Sign
	bg_event 33,  5, BGEVENT_READ, Route13TrainerTips2
	bg_event 16, 13, BGEVENT_ITEM, Route13HiddenCalcium
	bg_event  1, 14, BGEVENT_ITEM, Route13HiddenPPUp

	def_object_events
	object_event 32,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 33,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event  9,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 18,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
	object_event 45, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyVeronica, -1
	object_event 44, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyTheresa, -1
