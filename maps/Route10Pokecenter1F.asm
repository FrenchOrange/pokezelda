	object_const_def
	const ROUTE10POKECENTER1F_NURSE
	const ROUTE10POKECENTER1F_GENTLEMAN
	const ROUTE10POKECENTER1F_GYM_GUIDE
	const ROUTE10POKECENTER1F_COOLTRAINER_F
	const ROUTE10POKECENTER1F_HIKER

Route10Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route10Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route10Pokecenter1FGentlemanScript:
	jumptextfaceplayer Route10Pokecenter1FGentlemanText

Route10Pokecenter1FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext Route10Pokecenter1FGymGuideText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext Route10Pokecenter1FGymGuideText_ReturnedMachinePart
	waitbutton
	closetext
	end

Route10Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route10Pokecenter1FCooltrainerFText

Route10Pokecenter1FGentlemanText:
	text "A #MON CENTER"
	line "near a cave?"

	para "That's mighty"
	line "convenient."
	done

Route10Pokecenter1FGymGuideText:
	text "The POWER PLANT's"
	line "MANAGER is looking"

	para "for a strong #-"
	line "MON trainer."

	para "He needs help"
	line "getting back"

	para "something that"
	line "was stolen."
	done

Route10Pokecenter1FGymGuideText_ReturnedMachinePart:
	text "I hear TEAM ROCKET"
	line "got back together"

	para "in JOHTO but fell"
	line "apart right away."

	para "I didn't know any-"
	line "thing about that."
	done

Route10Pokecenter1FCooltrainerFText:
	text "There is a large"
	line "building just"
	para "south of here."

	para "That's the POWER"
	line "PLANT."
	done

Route10Pokecenter1FHikerScript:
	faceplayer
	opentext
	checkitem GOLD_PEARL
	iftrue .GotGoldPearl
	checkevent EVENT_GAVE_GOLD_PEARL
	iftrue .HikerPostStep
	writetext Route10Pokecenter1FHiker_NoItem
	waitbutton
	closetext
	end

.GotGoldPearl:
	writetext Route10Pokecenter1FHiker_HasItem
	promptbutton
	takeitem GOLD_PEARL
	giveitem COMPASS
	writetext Route10Pokecenter1FHiker_GetItem
	playsound SFX_ITEM
	waitsfx
	waitbutton
	closetext
	setevent EVENT_GAVE_GOLD_PEARL
	end

.HikerPostStep:
	writetext Route10Pokecenter1FHiker_After
	waitbutton
	closetext
	end

Route10Pokecenter1FHiker_NoItem:
	text "I'm not just a"
	line "mere HIKER, I'm"
	cont "an adventurer"
	cont "extraordinaire!"

	para "I crawled through"
	line "the deepest caves"
	cont "and climbed the"

	para "highest peaks in"
	line "search of riches."

	para "A NUGGET is but"
	line "child's play when"
	cont "compared to the"
	cont "treasures I found."
	done

Route10Pokecenter1FHiker_HasItem:
	text "My oh my! This"
	line "PEARL is unlike"
	cont "any I've seen"
	cont "before."

	para "Say, from one"
	line "treasure hoarder"
	cont "to another, how"

	para "about you trade it"
	line "to me in exchange"
	cont "for an adventurer"
	cont "starter kit?"
	done

Route10Pokecenter1FHiker_GetItem:
	text "<PLAYER> obtained a"
	line "COMPASS."
	done

Route10Pokecenter1FHiker_After:
	text "Don't scoff at"
	line "this COMPASS."

	para "Safety is worth"
	line "every teasure, ah!"

	para "You may not need"
	line "it yourself, but"
	cont "maybe you'll run"

	para "into a lost soul"
	line "who will."

	para "Treasure-hunt"
	line "responsibly! Hehe."
	done

Route10Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ROUTE_10, 1
	warp_event  6,  7, ROUTE_10, 1
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGentlemanScript, -1
	object_event  9,  2, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FGymGuideScript, -1
	object_event  3,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route10Pokecenter1FCooltrainerFScript, -1
	object_event  6,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, 0, 1, Route10Pokecenter1FHikerScript, -1
