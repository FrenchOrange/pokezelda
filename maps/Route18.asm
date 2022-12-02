	object_const_def
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	readvar VAR_XCOORD
	ifgreater 34, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

Route18CyclingSign:
	jumptext Route18CyclingSignText

BirdKeeperBorisSeenText:
	text "If you're looking"
	line "for #MON, you"

	para "have to look in"
	line "the tall grass."
	done

BirdKeeperBorisBeatenText:
	text "Ayieee!"
	done

BirdKeeperBorisAfterBattleText:
	text "Since you're so"
	line "strong, it must be"
	cont "fun to battle."
	done

BirdKeeperBobSeenText:
	text "CYCLING ROAD is a"
	line "quick shortcut to"
	cont "CELADON."
	done

BirdKeeperBobBeatenText:
	text "…Whew!"
	done

BirdKeeperBobAfterBattleText:
	text "If you don't have"
	line "a BICYCLE, you're"

	para "not allowed to use"
	line "the shortcut."
	done

Route18SignText:
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route18CyclingSignText:
	text "CYCLING ROAD"
	para "No pedestrians"
	line "permitted!"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 40,  8, ROUTE_17_ROUTE_18_GATE, 3
	warp_event 40,  9, ROUTE_17_ROUTE_18_GATE, 4
	warp_event 33,  8, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 33,  9, ROUTE_17_ROUTE_18_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 43,  7, BGEVENT_READ, Route18Sign
	bg_event 33,  5, BGEVENT_READ, Route18CyclingSign

	def_object_events
	object_event 38, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 45,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
