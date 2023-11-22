	object_const_def
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersNeighborsDaughterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LeftoverStarterGift
	writetext PlayersNeighborsDaughterText
	waitbutton
	closetext
	end

.LeftoverStarterGift:
	checkevent EVENT_GOT_LEFTOVER_STARTER
	iftrue .GotStarter
	writetext PlayersNeighborsDaughterTakeThisStarterText
	yesorno
	iffalse .Refused
	writetext PlayersNeighborsDaughterCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
; Cyndaquil
	writetext ReceivedLeftoverChikoritaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHIKORITA, 5, BERRY
	sjump .AfterStarter

.Totodile:
	writetext ReceivedLeftoverCyndaquilText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CYNDAQUIL, 5, BERRY
	sjump .AfterStarter

.Chikorita:
	writetext ReceivedLeftoverTotodileText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 5, BERRY
	sjump .AfterStarter

.AfterStarter:
	setevent EVENT_GOT_LEFTOVER_STARTER
	promptbutton
	closetext
	end

.NoRoom:
	writetext PlayersNeighborsDaughterPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext PlayersNeighborsDaughterNoStarterText
	waitbutton
	closetext
	end

.GotStarter:
	writetext PlayersNeighborsDaughterAfterText
	waitbutton
	closetext
	end


PlayersNeighborScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PlayersNeighborBeatEliteFour
	writetext PlayersNeighborText
	waitbutton
	closetext
	end

.PlayersNeighborBeatEliteFour:
	writetext PlayersNeighborAfterLeagueText
	waitbutton
	closetext
	end

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "PIKACHU is an"
	line "evolved #MON."

	para "I was amazed by"
	line "PROF.ELM's find-"
	cont "ings."

	para "He's so famous for"
	line "his research on"
	cont "#MON evolution."

	para "…sigh…"

	para "I wish I could be"
	line "a researcher like"
	cont "him…"
	done

PlayersNeighborsDaughterTakeThisStarterText:
	text "Ooh, <PLAYER>!"

	para "You're a big shot"
	line "trainer now, you"
	cont "even defeated the"
	cont "ELITE FOUR!"

	para "We're all super"
	line "proud of you!"

	para "I tried becoming"
	line "a TRAINER myself,"
	cont "I even got my own"
	cont "partner #MON."

	para "But I don't think"
	line "I'm cut out for it…"

	para "I don't want to"
	line "abandon the little"
	cont "guy, but I'm too"

	para "ashamed to hand it"
	line "back to PROF.ELM."

	para "So, would you"
	line "like to have it?"
	done

PlayersNeighborsDaughterCareForItText:
	text "Wonderful! I know"
	line "you will do an"
	cont "infinitely better"
	cont "job than me."
	done

ReceivedLeftoverChikoritaText:
	text "<PLAYER> received"
	line "CHIKORITA!"
	done

ReceivedLeftoverCyndaquilText:
	text "<PLAYER> received"
	line "CYNDAQUIL!"
	done

ReceivedLeftoverTotodileText:
	text "<PLAYER> received"
	line "TOTODILE!"
	done

PlayersNeighborsDaughterPartyFullText:
	text "Oh, your party is"
	line "full. Too bad…"
	done

PlayersNeighborsDaughterNoStarterText:
	text "Alright. I'll keep"
	line "taking care of it"
	cont "for now then."
	done

PlayersNeighborsDaughterAfterText:
	text "I still adore"
	line "POKéMON, but now I"
	cont "know how much of a"

	para "responsability it"
	line "is to raise one."

	para "They're living"
	line "beings after all."
	done

PlayersNeighborText:
	text "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"

	para "But then, so do I!"
	done

PlayersNeighborAfterLeagueText:
	text "<PLAYER>! They"
	line "were talking about"
	cont "you on the radio!"

	para "You took on the"
	line "LEAGUE! You've"
	cont "grown so much!"

	para "Same for my little"
	line "girl."

	para "…sniff…"

	para "You kids grow up"
	line "so fast."
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, NEW_BARK_TOWN, 3
	warp_event  5,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  3,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  9,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  4,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  7,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
