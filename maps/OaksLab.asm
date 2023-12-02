	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3
	const OAKSLAB_BLUE

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksLabBlue:
	faceplayer
	checkevent EVENT_TALKED_TO_BLUE_IN_OAKS_LAB
	iftrue .SpareStarterGift
	opentext
	writetext OaksLabBlueText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_BLUE, 15
	opentext
	writetext OaksLabBlueYouBeatRedText
	waitbutton
	closetext
	readvar VAR_XCOORD
	ifequal 2, .BlueScriptLeft
	ifequal 4, .BlueScriptRight
.BlueScriptBottom
	turnobject OAKSLAB_BLUE, RIGHT
	opentext
	writetext OaksLabBlueCelebratingText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, DOWN
	setevent EVENT_TALKED_TO_BLUE_IN_OAKS_LAB
	sjump .SpareStarterGift

.BlueScriptLeft:
	turnobject OAKSLAB_BLUE, RIGHT
	opentext
	writetext OaksLabBlueCelebratingText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, LEFT
	setevent EVENT_TALKED_TO_BLUE_IN_OAKS_LAB
	sjump .SpareStarterGift


.BlueScriptRight:
	turnobject OAKSLAB_BLUE, LEFT
	opentext
	writetext OaksLabBlueCelebratingText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, RIGHT
	setevent EVENT_TALKED_TO_BLUE_IN_OAKS_LAB
	sjump .SpareStarterGift


.SpareStarterGift:
	opentext
	checkevent EVENT_GOT_SPARE_STARTER
	iftrue .GotStarter
	writetext OaksLabBlueTakeThisStarterText
	yesorno
	iffalse .Refused
	writetext OaksLabBlueCareForItText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
; Cyndaquil
	writetext ReceivedSpareTotodileText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TOTODILE, 5, BERRY
	sjump .AfterStarter

.Totodile:
	writetext ReceivedSpareChikoritaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHIKORITA, 5, BERRY
	sjump .AfterStarter

.Chikorita:
	writetext ReceivedSpareCyndaquilText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CYNDAQUIL, 5, BERRY
	sjump .AfterStarter

.AfterStarter:
	setevent EVENT_GOT_SPARE_STARTER
	closetext
	turnobject OAKSLAB_BLUE, UP
	end

.NoRoom:
	writetext OaksLabBluePartyFullText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, UP
	end

.Refused:
	writetext OaksLabBlueNoStarterText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, UP
	end

.GotStarter:
	writetext OaksLabBlueAfterText
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, UP
	end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "MT.SILVER can be"
	line "reached from the"

	para "gate that leads to"
	line "VICTORY ROAD."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksLabBlueText:
	text "GARY: Oh, nice to"
	line "see you <PLAYER>!"

	para "What am I doing"
	line "here? You see,"
	cont "gramps is getting"

	para "old, so I help him"
	line "out with his work"
	cont "whenever I can."

	para "Nice, eh?"

	para "I could be the"
	line "first GYM LEADER"
	cont "to also work as a"
	cont "#MON PROFESSOR."

	para "But anyway, what"
	line "are you up to now?"

	para "… … …"
	line "… …!!"
	done

OaksLabBlueYouBeatRedText:
	text "You beat RED?!"
	line "Unbelievable!"
	done

OaksLabBlueCelebratingText:
	text "That's something"
	line "worth celebrating!"

	para "Now let me just--"
	line "Where did I put"
	cont "it again… There!"
	done

OaksLabBlueTakeThisStarterText:
	text "GARY: PROF.ELM was"
	line "paying us a visit"
	cont "recently, and this"

	para "goof forgot some-"
	line "thing at our lab."

	para "It's a # BALL"
	line "containing a JOHTO"
	cont "partner POKéMON."

	para "I know it's not"
	line "mine to give, but"
	cont "I wanted you to"
	cont "have it."

	para "How does this"
	line "sound to you?"
	done

OaksLabBlueCareForItText:
	text "Wonderful! "
	line "Say hello to your"
	cont "new companion."
	done

ReceivedSpareChikoritaText:
	text "<PLAYER> received"
	line "CHIKORITA!"
	done

ReceivedSpareCyndaquilText:
	text "<PLAYER> received"
	line "CYNDAQUIL!"
	done

ReceivedSpareTotodileText:
	text "<PLAYER> received"
	line "TOTODILE!"
	done

OaksLabBluePartyFullText:
	text "Your team is full."
	line "Err… Gramps never"
	cont "told me what to do"
	cont "when that happens."
	done

OaksLabBlueNoStarterText:
	text "No, I understand."

	para "I'll keep it around"
	line "until PROF.ELM"
	cont "comes back."
	done

OaksLabBlueAfterText:
	text "To tell you the"
	line "truth, I have been"
	cont "practicing this"
	cont "partner #MON"

	para "thing for a while"
	line "with gramps."

	para "But handing out a"
	line "#MON to a real"
	cont "trainer like that."

	para "It sent shivers"
	line "down my spine!"

	para "People don't become"
	line "#MON PROFESSORS"
	cont "for nothing!"
	done

OaksAssistant1Text:
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 11, PALLET_TOWN, 3
	warp_event  7, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event 10,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event 11,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  5,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event 10,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event 11,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  7,  0, BGEVENT_READ, OaksLabPoster2
	bg_event 11,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  2,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  6,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  3,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event 10,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	object_event  3,  2, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabBlue, EVENT_OAKS_LAB_BLUE
