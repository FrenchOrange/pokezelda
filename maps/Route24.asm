	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_CAMPER
	const ROUTE24_DAMIAN

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperJohnScript:
	trainer CAMPER, JOHN, EVENT_BEAT_CAMPER_JOHN, CamperJohnSeenText, CamperJohnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJohnAfterBattleText
	waitbutton
	closetext
	end

Route24DamianScript:
	faceplayer
	opentext
	countseencaught
	readvar VAR_DEXCAUGHT
	ifgreater 49, .CharmanderScript
	writetext Route24DamianBrag
	waitbutton
	closetext
	end

.CharmanderScript:
	checkevent EVENT_GOT_CHARMANDER
	iftrue .GotCharmander
	writetext Route24DamianTakeThisCharmanderText
	yesorno
	iffalse .Refused
	writetext Route24DamianCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedCharmanderText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 10, NO_ITEM, GiftCharmanderName, GiftCharmanderOTName
	setevent EVENT_GOT_CHARMANDER
	closetext
	end

.NoRoom:
	writetext Route24DamianPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext Route24DamianNoCharmanderText
	waitbutton
	closetext
	end

.GotCharmander:
	writetext Route24DamianAfterText
	waitbutton
	closetext
	end

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, 0
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	setevent EVENT_DECO_DIGLETT_DOLL
	end

Route24RocketSeenText:
	text "Hey, kid! Me am a"
	line "TEAM ROCKET member"
	cont "kind of guy!"

	para "Come from another"
	line "country, a trainer"
	cont "number one, me!"

	para "Think I did, if"
	line "stop the energy,"

	para "be big panic for"
	line "here people!"

	para "Secret it is my"
	line "mission, so tell"
	cont "you I not!"

	para "But! If win you do"
	line "versus me, a man I"

	para "be and mine secret"
	line "to you I tell."

	para "Hey, kid! Battle"
	line "begin we do!"
	done

Route24RocketBeatenText:
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done

Route24RocketAfterBattleText:
	text "OK. Tell you mine"
	line "secret will I."

	para "MACHINE PART steal"
	line "by me, hide it I"

	para "did in GYM of the"
	line "CERULEAN."

	para "Inside water put"
	line "it I did. Look for"

	para "in water center of"
	line "GYM at."

	para "But you forget me"
	line "not!"

	para "Beat you for sure"
	line "will TEAM ROCKET."

	para "Come from JOHTO"
	line "will they, mine"

	para "friends, yes. Will"
	line "revenge they are."
	done

Route24RocketDisappearsText:
	text "…"

	para "You say what? TEAM"
	line "ROCKET bye-bye a"

	para "go-go? Broken it"
	line "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me?"
	done

CamperJohnSeenText:
	text "I've been training"
	line "hard, I swear!"
	para "Let me show you!"
	done

CamperJohnBeatenText:
	text "Yeah… I'm really"
	line "not up to par."
	done

CamperJohnAfterBattleText:
	text "The trainers on"
	line "ROUTE 25 are a"
	cont "close-knit group."

	para "I don't think they"
	line "will accept me"
	cont "anytime soon."
	done

Route24DamianBrag:
	text "Lucky for you, I'm"
	line "not in the mood to"
	cont "battle wimps."

	para "Else I would have"
	line "vaporized you with"
	cont "my team. I have"
	cont "around 50 #MON!"
	done

Route24DamianTakeThisCharmanderText:
	text "How did you get"
	line "so many POKéMON?!"

	para "Urgh… I would have"
	line "caught more, if"
	cont "that CHARMANDER of"
	cont "mine was stronger."

	para "I'm considering"
	line "releasing it."

	para "If you want it,"
	line "it's all yours. So?"
	done

Route24DamianCareForItText:
	text "Yeah, yeah. Have"
	line "fun raising it."
	done

ReceivedCharmanderText:
	text "<PLAYER> received"
	line "CHARMANDER!"
	done

Route24DamianPartyFullText:
	text "Ah! You have too"
	line "many #MON on"
	cont "hand!"
	done

Route24DamianNoCharmanderText:
	text "Quick, then. I'm"
	line "losing patience!"
	done

Route24DamianAfterText:
	text "Still taking care"
	line "of that runt"
	cont "CHARMANDER, eh?"
	done

GiftCharmanderName:
	db "CHARMANDER@"

GiftCharmanderOTName:
	db "DAMIAN@"

	db 0 ; unused

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 23, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
	object_event  5, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJohnScript, -1
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route24DamianScript, -1
