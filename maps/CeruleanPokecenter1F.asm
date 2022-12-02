	object_const_def
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUIDE
	const CERULEANPOKECENTER1F_MELANIE

CeruleanPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeruleanPokecenter1FSuperNerdScript:
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText

CeruleanPokecenter1FGymGuideScript:
	jumptextfaceplayer CeruleanPokecenter1FGymGuideText

CeruleanPokecenter1FMelanieScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBASAUR
	iftrue .GotBulbasaur
	special GetFirstPokemonHappiness
	writetext CeruleanPokecenter1FMelanieIntro
	promptbutton
	ifgreater 150 - 1, .VeryHappy
	sjump .NotVeryHappy

.VeryHappy:
	writetext CeruleanPokecenter1FMelanieTakeThisBulbasaurText
	yesorno
	iffalse .Refused
	writetext CeruleanPokecenter1FMelanieCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 10, NO_ITEM, GiftBulbasaurName, GiftBulbasaurOTName
	setevent EVENT_GOT_BULBASAUR
	closetext
	end

.NoRoom:
	writetext CeruleanPokecenter1FMelaniePartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext CeruleanPokecenter1FMelanieNoBulbasaurText
	waitbutton
	closetext
	end

.NotVeryHappy:
	closetext
	end

.GotBulbasaur:
	writetext CeruleanPokecenter1FMelanieAfterText
	waitbutton
	closetext
	end

CeruleanPokecenter1FSuperNerdText:
	text "For battles, I'd"
	line "much rather use"

	para "#MON I've been"
	line "raising, even if"

	para "they're weaker"
	line "than some newly"
	cont "caught #MON."
	done

CeruleanPokecenter1FGymGuideText:
	text "The MAGNET TRAIN"
	line "travels at over"

	para "340 mph. It goes"
	line "between KANTO and"

	para "JOHTO in almost no"
	line "time at all."

	para "It really makes"
	line "JOHTO accessible."
	done

CeruleanPokecenter1FMelanieIntro:
	text "I take care of"
	line "injured #MON."

	para "I nursed this"
	line "BULBASAUR back to"
	cont "health."

	para "It needs a good"
	line "trainer to take"
	cont "care of it now."
	done

CeruleanPokecenter1FMelanieTakeThisBulbasaurText:
	text "I know! Would you"
	line "take care of this"
	cont "BULBASAUR?"
	done

CeruleanPokecenter1FMelanieCareForItText:
	text "Please take care"
	line "of BULBASAUR!"
	done

ReceivedBulbasaurText:
	text "<PLAYER> received"
	line "BULBASAUR"
	done

CeruleanPokecenter1FMelaniePartyFullText:
	text "Oh! Your team is"
	line "full it seems."
	cont "How inconvenient…"
	done

CeruleanPokecenter1FMelanieNoBulbasaurText:
	text "Oh… That's too bad…"
	done

CeruleanPokecenter1FMelanieAfterText:
	text "Why hello <PLAYER>!"
	line "Is BULBASAUR"
	cont "doing well?"
	done

GiftBulbasaurName:
	db "BULBASAUR@"

GiftBulbasaurOTName:
	db "MELANIE@"

	db FEMALE

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CERULEAN_CITY, 4
	warp_event  6,  7, CERULEAN_CITY, 4
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event 10,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FSuperNerdScript, -1
	object_event  3,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FGymGuideScript, -1
	object_event 10,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FMelanieScript, -1
