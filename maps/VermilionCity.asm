	object_const_def
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_POKEFAN_M
	const VERMILIONCITY_OFFICER_JENNY

VermilionCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	endcallback

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext VermilionCityBadgeGuyTrainerText
	waitbutton
	closetext
	end

.SomeBadges:
	writetext VermilionCityBadgeGuySomeBadgesText
	waitbutton
	closetext
	end

.MostBadges:
	writetext VermilionCityBadgeGuyMostBadgesText
	waitbutton
	closetext
	end

.AllBadges:
	writetext VermilionCityBadgeGuyAllBadgesText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext VermilionCityBadgeGuyBattleEdgeText
	waitbutton
.Done:
	closetext
	end

VermilionCityOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SquirtleScript
	writetext VermilionCityOfficerSoMuchToDo
	waitbutton
	closetext
	end

.SquirtleScript:
	checkevent EVENT_GOT_SQUIRTLE
	iftrue .GotSquirtle
	writetext VermilionCityOfficerTakeThisSquirtleText
	yesorno
	iffalse .Refused
	writetext VermilionCityOfficerCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 10, NO_ITEM, GiftSquirtleName, GiftSquirtleOTName
	setevent EVENT_GOT_SQUIRTLE
	closetext
	end

.NoRoom:
	writetext VermilionCityOfficerPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext VermilionCityOfficerNoSquirtleText
	waitbutton
	closetext
	end

.GotSquirtle:
	writetext VermilionCityOfficerAfterText
	waitbutton
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityNoticeSign:
	jumptext VermilionCityNoticeSignText

VermilionCityPokecenterSign:
	jumpstd PokecenterSignScript

VermilionCityMartSign:
	jumpstd MartSignScript

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "VERMILION PORT is"
	line "KANTO's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

VermilionMachopOwnerText:
	text "My #MON is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

VermilionCitySuperNerdText:
	text "There are eight"
	line "GYMS in KANTO."

	para "That big building"
	line "is VERMILION's"
	cont "#MON GYM."
	done

VermilionCityBadgeGuyTrainerText:
	text "Skilled trainers"
	line "gather in KANTO."

	para "GYM LEADERS are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

VermilionCityBadgeGuySomeBadgesText:
	text "You've started to"
	line "collect KANTO GYM"
	cont "BADGES?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

VermilionCityBadgeGuyMostBadgesText:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of KANTO"
	line "GYMS soon."

	para "Let me know if"
	line "you get all eight"
	cont "BADGES."
	done

VermilionCityBadgeGuyAllBadgesText:
	text "Congratulations!"

	para "You got all the"
	line "KANTO GYM BADGES."

	para "I've got a reward"
	line "for your efforts."
	done

VermilionCityBadgeGuyBattleEdgeText:
	text "Having a variety"
	line "of #MON types"

	para "should give you an"
	line "edge in battle."

	para "I'm sure the KANTO"
	line "GYM BADGES will"
	cont "help you."
	done

VermilionCitySignText:
	text "VERMILION CITY"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning"
	line "American!"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "All #MON fans"
	line "welcome!"
	done

VermilionCityPortSignText:
	text "VERMILION HARBOR"
	done

VermilionCityNoticeSignText:
	text "NOTICE!"

	para "Sleeping SNORLAX"
	line "may result in"
	cont "road-blocks."

	para "Detour through"
	line "LAVENDER TOWN to"
	cont "FUCHSIA CITY."

	para "VERMILION POLICE"
	done

VermilionCityOfficerSoMuchToDo:
	text "A break-in at the"
	line "POWER PLANT…"

	para "Sightings of a"
	line "TEAM ROCKET GRUNT…"

	para "There's so much to"
	line "do around here!"
	done

VermilionCityOfficerTakeThisSquirtleText:
	text "You're the kid who"
	line "put a stop to the"
	cont "POWER PLANT thief?"

	para "You must be a"
	line "good trainer!"

	para "Thanks to you, I"
	line "was able to go"
	cont "back to helping"
	cont "with local issues."

	para "I just caught a"
	line "SQUIRTLE that was"
	cont "always getting"
	cont "into mischief."

	para "I think it needs a"
	line "good trainer to"
	cont "set it straight."

	para "Would you take"
	line "good care of it?"
	done

VermilionCityOfficerCareForItText:
	text "OK! Please treat"
	line "SQUIRTLE right!"
	done

ReceivedSquirtleText:
	text "<PLAYER> received"
	line "SQUIRTLE!"
	done

VermilionCityOfficerPartyFullText:
	text "Hey! You don't have"
	line "any room for it!"
	cont "I'm sorry kid."
	done

VermilionCityOfficerNoSquirtleText:
	text "Oh... What am I"
	line "to do now?"
	done

VermilionCityOfficerAfterText:
	text "How is SQUIRTLE"
	line "doing?"
	done

GiftSquirtleName:
	db "SQUIRTLE@"

GiftSquirtleOTName:
	db "JENNY@"

	db FEMALE

VermilionCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event 11,  3, VERMILION_POKECENTER_1F, 1
	warp_event  9, 13, POKEMON_FAN_CLUB, 1
	warp_event 15, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 23, 13, VERMILION_MART, 2
	warp_event 23, 19, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 12, 19, VERMILION_GYM, 1
	warp_event 18, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 2

	def_coord_events

	def_bg_events
	bg_event 27,  3, BGEVENT_READ, VermilionCitySign
	bg_event  7, 19, BGEVENT_READ, VermilionGymSign
	bg_event  7, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 29, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 37, 13, BGEVENT_READ, VermilionCityNoticeSign
	bg_event 12,  3, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 24, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 14, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	def_object_events
	object_event 20,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 27,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 30,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 16, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 33, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
	object_event 44, 14, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 15,  4, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionCityOfficerScript, -1
