	object_const_def
	const ROUTE10_LASS
	const ROUTE10_ROCKER

Route10_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	endcallback

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

RockTunnelSign:
	jumptext RockTunnelSignText

Route10HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROUTE_10_HIDDEN_MAX_POTION

TrainerLassSarah:
	trainer LASS, SARAH, EVENT_BEAT_LASS_SARAH, LassSarahSeenText, LassSarahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassSarahAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristEli:
	trainer GUITARIST, ELI, EVENT_BEAT_GUITARIST_ELI, GuitaristEliSeenText, GuitaristEliBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristEliAfterBattleText
	waitbutton
	closetext
	end

LassSarahSeenText:
	text "My #MON doesn't"
	line "do well with those"
	cont "scary GHOST types."
	done

LassSarahBeatenText:
	text "Eeek! You're scary"
	line "strong!"
	done

LassSarahAfterBattleText:
	text "We're both a bit"
	line "spooked of walking"
	cont "in dark places…"
	done

GuitaristEliSeenText:
	text "I like playing my"
	line "tunes here, the"
	cont "air is just fine."
	done

GuitaristEliBeatenText:
	text "Electrifying!"
	done

GuitaristEliAfterBattleText:
	text "I'm no fame-chaser,"
	line "I just want the"
	cont "thrill of music."
	done

RockTunnelSignText:
	text "ROCK TUNNEL"
	done

PowerPlantSignText:
	text "POWER PLANT"
	done

Route10_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 19, ROUTE_10_POKECENTER_1F, 1
	warp_event  6, 39, POWER_PLANT, 1
	warp_event  8, 17, ROCK_TUNNEL_1F, 1
	def_coord_events

	def_bg_events
	bg_event  5, 41, BGEVENT_READ, PowerPlantSign
	bg_event 12, 19, BGEVENT_READ, Route10PokecenterSign
	bg_event  7, 19, BGEVENT_READ, RockTunnelSign
	bg_event  9, 17, BGEVENT_ITEM, Route10HiddenMaxPotion

	def_object_events
	object_event  2, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassSarah, -1
	object_event 12, 44, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGuitaristEli, -1
