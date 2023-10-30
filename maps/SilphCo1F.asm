	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_SCIENTIST

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoElevator:
	jumptext SilphCoElevatorText

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

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
;	playsound SFX_ENTER_DOOR
;	special FadeOutPalettes
;	pause 15
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
	line "#MON TRAINER!"

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
