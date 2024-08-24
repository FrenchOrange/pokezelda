	object_const_def
	const OLIVINEPORTPASSAGE_POKEFAN_M
	const OLIVINEPORTPASSAGE_COOLTRAINER_M

OlivinePortPassage_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePortPassagePokefanMScript:
	jumptextfaceplayer OlivinePortPassagePokefanMText

OlivinePortPassagePokefanMText:
	text "FAST SHIP S.S.AQUA"
	line "sails to KANTO on"

	para "Mondays and Fri-"
	line "days."
	done

OlivinePortPassageCooltrainerMScript:
	faceplayer
	opentext
	checkitem LUCKY_GEM
	iftrue .GotLuckyGem
	checkevent EVENT_GAVE_LUCKY_GEM
	iftrue .CooltrainerMPostStep
	writetext OlivinePortPassageCooltrainerM_NoItem
	waitbutton
	closetext
	end

.GotLuckyGem:
	writetext OlivinePortPassageCooltrainerM_HasItem
	promptbutton
	takeitem LUCKY_GEM
	giveitem OLD_SANDWICH
	writetext OlivinePortPassageCooltrainerM_GetItem
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	setevent EVENT_GAVE_LUCKY_GEM
	end

.CooltrainerMPostStep:
	writetext OlivinePortPassageCooltrainerM_After
	waitbutton
	closetext
	end

OlivinePortPassageCooltrainerM_NoItem:
	text "Dart! I'm just so"
	line "unlucky!"

	para "I went to buy some"
	line "RAGECANDYBAR, but"
	cont "they were all sold"
	cont "out."

	para "On the way back I"
	line "got pick-pocketed"
	cont "by some shady guys"
	cont "in black."

	para "And by the time"
	line "I arrived here I'd"
	cont "missed my ferry"
	cont "back to KANTO…"
	done

OlivinePortPassageCooltrainerM_HasItem:
	text "Uh? You say this"
	line "gem will bring me"
	cont "luck? Thanks!!"

	para "I don't have much"
	line "to offer, but you"
	cont "can have this"

	para "sandwich made with"
	line "love by my mom."

	para "The cheese is a"
	line "bit aged now, but"
	cont "that's the kind of"

	para "delicacy you JOHTO"
	line "folks just aren't"
	cont "used to."
	done

OlivinePortPassageCooltrainerM_GetItem:
	text "<PLAYER> obtained"
	line "an OLD SANDWICH."
	done

OlivinePortPassageCooltrainerM_After:
	text "See that?"

	para "As I was walking"
	line "around, I found a"
	cont "shiny coin!"

	para "Luck's finally"
	line "coming my way!"
	done

OlivinePortPassage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, OLIVINE_CITY, 9
	warp_event 16,  0, OLIVINE_CITY, 10
	warp_event 15,  4, OLIVINE_PORT_PASSAGE, 4
	warp_event  3,  2, OLIVINE_PORT_PASSAGE, 3
	warp_event  3, 14, OLIVINE_PORT, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassagePokefanMScript, EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	object_event  2, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassageCooltrainerMScript, -1
