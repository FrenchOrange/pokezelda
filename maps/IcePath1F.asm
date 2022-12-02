	object_const_def
	const ICEPATH1F_BEAUTY
	const ICEPATH1F_ROCKER
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3

IcePath1F_MapScripts:
	def_scene_scripts

	def_callbacks

IcePath1FHMWaterfall:
	itemball HM_WATERFALL

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN

TrainerSkierJessica:
	trainer SKIER, JESSICA, EVENT_BEAT_SKIER_JESSICA, SkierJessicaSeenText, SkierJessicaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierJessicaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderMarty:
	trainer BOARDER, MARTY, EVENT_BEAT_BOARDER_MARTY, BoarderMartySeenText, BoarderMartyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderMartyAfterBattleText
	waitbutton
	closetext
	end

SkierJessicaSeenText:
	text "I'm waiting for my"
	line "friend to join me"

	para "here. But he keeps"
	line "me waiting!"
	done

SkierJessicaBeatenText:
	text "I need to revise"
	line "my strategy!"
	done

SkierJessicaAfterBattleText:
	text "I prefer planning"
	line "things out."

	para "Going in blind can"
	line "be disastrous"
	cont "sometimes."
	done

BoarderMartySeenText:
	text "I have a friend to"
	line "meet, but that ice"

	para "puzzle has me"
	line "stumped!"
	done

BoarderMartyBeatenText:
	text "I'll figure it out."
	line "Eventually!"
	done

BoarderMartyAfterBattleText:
	text "The more you try,"
	line "the more you're"
	cont "likely to succeed."

	para "That's how it works"
	line "I think."
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 20, ROUTE_44, 1
	warp_event 36, 28, BLACKTHORN_CITY, 7
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 23,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerSkierJessica, -1
	object_event 30, 12, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBoarderMarty, -1
	object_event 31,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	object_event 32, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	object_event 35,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
