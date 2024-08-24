	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_SCIENTIST
	const SILPHCO1F_WORKER1
	const SILPHCO1F_WORKER2
	const SILPHCO1F_BLACKBELT

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoElevator:
	jumptext SilphCoElevatorText

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoBlackbeltScript:
	jumptextfaceplayer SilphCoBlackbeltText

SilphCoOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCoOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCoOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoScientistScript:
	faceplayer
	opentext
	checkevent EVENT_WENT_TO_SILPH_CO_RD_ONCE
	iftrue .OhItsYou
	writetext SilphCoScientistAreYouLost
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SILPHCO1F_SCIENTIST, 15
	opentext
	writetext SilphCoScientistYoureATrainer
	waitbutton
	writetext SilphCoScientistTellMeYoungOne
	yesorno
	iftrue .FollowScientist
	writetext SilphCoScientistItsAlrighText
	waitbutton
	closetext
	end

.OhItsYou:
	writetext SilphCoScientistOhItsYouText
	yesorno
	iftrue .FollowScientist
	writetext SilphCoScientistItsAlrighText
	waitbutton
	closetext
	end

.FollowScientist:
	writetext SilphCoScientistMarvelousText
	waitbutton
	closetext
	follow SILPHCO1F_SCIENTIST, PLAYER
	applymovement SILPHCO1F_SCIENTIST, SilphCoFollowScientist_MovementData
	turnobject PLAYER, UP
	pause 15
	playsound SFX_ELEVATOR
	waitsfx
	opentext
	writetext SilphCoAccessGrantedText
	waitbutton
	closetext
	applymovement SILPHCO1F_SCIENTIST, SilphCoFinishFollowScientist_MovementData
	warpsound
	disappear SILPHCO1F_SCIENTIST
	stopfollow
	applymovement PLAYER, SilphCoFinishFollowScientist_MovementData
	warpcheck
	end

SilphCoFollowScientist_MovementData:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

SilphCoFinishFollowScientist_MovementData:
	step UP
	step_end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "SILPH CO.'s HEAD"
	cont "OFFICE BUILDING."
	done

SilphCoBlackbeltText:
	text "Hey! Glad to see"
	line "you, kiddo!"

	para "I'm paying my old"
	line "workplace a visit."
	done

SilphCoOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "Rules are rules."

	para "… … …"

	para "Awh, why the long"
	line "face, kid?"

	para "Sigh… I'm too soft."

	para "Since you came"
	line "such a long way,"
	cont "have this neat"
	cont "little souvenir."
	done

SilphCoOfficerText_GotUpGrade:
	text "It's SILPH CO.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere yet."

	para "They have a stack"
	line "of those gathering"
	cont "dust, so this one"
	cont "won't be missed."
	done

SilphCoElevatorText:
	text "Elevator access"
	line "restricted to"
	cont "SILPH CO. staff."
	done

SilphCoScientistAreYouLost:
	text "Hmm? Are you lost?"

	para "I don't recall"
	line "SAFFRON ELEMENTARY"
	cont "planning a field"
	cont "trip for today."
	done

SilphCoScientistYoureATrainer:
	text "Oooh! You're a"
	line "#MON trainer!"

	para "Oh that's great,"
	line "marvelous even!"
	done

SilphCoScientistTellMeYoungOne:
	text "Tell me young one,"
	line "would you like to"
	cont "partake in a real"
	cont "scientific study?"
	done

SilphCoScientistItsAlrighText:
	text "Oh. It's alright."

	para "Come back later if"
	line "you feel like it."
	done

SilphCoScientistMarvelousText:
	text "Marvelous!! Now,"
	line "follow me!"
	done

SilphCoAccessGrantedText:
	text "ACCESS GRANTED."
	done

SilphCoScientistOhItsYouText:
	text "Oh, it's you again!"

	para "Do you want to go"
	line "the R&D department"
	cont "for study?"
	done

SilphCoWorker1Script:
	faceplayer
	opentext
	checkitem CLIPBOARD
	iftrue .GotClipboard
	checkevent EVENT_GAVE_CLIPBOARD
	iftrue .WorkerPostStep
	writetext SilphCoWorker1_NoItem
	waitbutton
	closetext
	end

.GotClipboard:
	writetext SilphCoWorker1_HasItem
	promptbutton
	takeitem CLIPBOARD
	giveitem TABLOID
	writetext SilphCoWorker1_GetItem
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	setevent EVENT_GAVE_CLIPBOARD
	end

.WorkerPostStep:
	writetext SilphCoWorker1_After
	waitbutton
	closetext
	end

SilphCoWorker1_NoItem:
	text "I'm the courrier"
	line "guy. It's a pretty"
	cont "boring job."

	para "I spend most of my"
	line "shifts reading"
	cont "whatever it is"
	cont "that comes my way."

	para "I'm just waiting"
	line "for documents to"
	cont "come around."
	done

SilphCoWorker1_HasItem:
	text "Oh? A report from"
	line "the PEWTER MUSEUM?"

	para "I'll transfer it"
	line "right away!"

	para "Hmm? You expect"
	line "something in"
	cont "exchange?"

	para "Well, you can have"
	line "this magazing I've"
	cont "been reading."

	para "Sound good?"
	done

SilphCoWorker1_GetItem:
	text "<PLAYER> obtained a"
	line "TABLOID."
	done

SilphCoWorker1_After:
	text "Enjoy your read!"
	line "There's some good"
	cont "articles in there."

	para "'I got engaged"
	line "with my GRAVELER'"
	cont "had me shedding a"
	cont "tear by the end."

	para "But the front page"
	line "news? Sightings"
	cont "of the legendary"

	para "trainer RED out"
	line "in the wild?"

	para "Now that's grand!"
	done

SilphCoWorker2Script:
	faceplayer
	opentext
	checkevent EVENT_GAVE_HARDTACK
	iftrue .BlackbeltIsBack
	writetext SilphCoWorker2_Alone
	waitbutton
	closetext
	end

.BlackbeltIsBack:
	writetext SilphCoWorker2_NotAlone
	waitbutton
	closetext
	turnobject SILPHCO1F_WORKER2, LEFT
	end

SilphCoWorker2_Alone:
	text "SILPH CO. is as"
	line "prestigious as it"
	cont "is cut-throat."

	para "Some people just"
	line "can't handle the"
	cont "stress and end up"

	para "living off the"
	line "land in the middle"
	cont "of nowhere."
	done

SilphCoWorker2_NotAlone:
	text "No way, SEBASTIAN"
	line "came back?!"

	para "We all thought he"
	line "got eaten by a"
	cont "wild ODDISH!"

	para "Woah… And he's"
	line "super jacked now."

	para "Maybe I could"
	line "spend some time in"
	cont "the wilderness"
	cont "myself…"
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 15, SAFFRON_CITY, 7
	warp_event 11, 15, SAFFRON_CITY, 7
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 20,  0, BGEVENT_READ, SilphCoElevator

	def_object_events
	object_event  5,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 25,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 16, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoScientistScript, -1
	object_event  5,  9, SPRITE_CLERK, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoWorker1Script, -1
	object_event 27,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoWorker2Script, -1
	object_event 26,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCoBlackbeltScript, EVENT_BLACKBELT_IN_SILPH_CO
