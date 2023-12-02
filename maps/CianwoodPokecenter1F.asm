	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD
	const CIANWOODPOKECENTER1F_FISHING_GURU
	const CIANWOODPOKECENTER1F_TENTACOOL

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FFishingGuruScript:
	faceplayer
	opentext
	readvar VAR_PARTYCOUNT
	ifequal 1, .CianwoodSoftlock
	jump .NoNeedForTentacoolScript

.CianwoodSoftlock:
	setval TENTACOOL
	special MonCheck
	iftrue .NoNeedForTentacoolScript
	writetext CianwoodPokecenter1FFishingGuruSoftlockText
	waitbutton
	writetext ReceivedTentacoolText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TENTACOOL, 15
	closetext
	turnobject CIANWOODPOKECENTER1F_FISHING_GURU, LEFT
	end

.NoNeedForTentacoolScript:
	writetext CianwoodPokecenter1FFishingGuruNormalText
	waitbutton
	closetext
	turnobject CIANWOODPOKECENTER1F_FISHING_GURU, LEFT
	end


CianwoodPokecenter1FTentacoolScript:
	opentext
	writetext CianwoodPokecenter1FTentacoolText
	cry TENTACOOL
	waitbutton
	closetext
	end

CianwoodPokecenter1FLassText:
	text "Did you meet the"
	line "#MANIAC?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #MON."
	done

CianwoodGymGuideText:
	text "The #MON GYM"
	line "trainers here are"
	cont "macho bullies."

	para "If I stick around,"
	line "they might come"
	cont "after me."

	para "Here's some ad-"
	line "vice: the GYM"

	para "LEADER uses the"
	line "fighting-type."

	para "So you should"
	line "confound him with"
	cont "psychic #MON."

	para "Wipe out his #-"
	line "MON before they"

	para "can use their"
	line "physical strength."

	para "And those boulders"
	line "in the middle of"
	cont "the GYM?"

	para "If you don't move"
	line "them correctly,"

	para "you won't reach"
	line "the GYM LEADER."

	para "If you get stuck,"
	line "go outside."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done

CianwoodPokecenter1FFishingGuruNormalText:
	text "Do you know about"
	line "fishing?"

	para "Some #MON are"
	line "picky. They won't"
	cont "bite cheap bait!"

	para "'A lousy ROD only"
	line "reels in MAGIKARP'"
	cont "is what my old man"
	cont "used to say."
	done

CianwoodPokecenter1FFishingGuruSoftlockText:
	text "Huh?"

	para "Do you… only have"
	line "one #MON?"

	para "Sorry to hear that"
	line "kid, sounds tough."

	para "Hold on, I know!"
	line "I'll give you one"
	cont "of my TENTACOOL!"

	para "I caught a little"
	line "too many. I was"
	cont "going to release"
	cont "it, so take it!"
	done

ReceivedTentacoolText:
	text "<PLAYER> received"
	line "TENTACOOL!"
	done

CianwoodPokecenter1FTentacoolText:
	text "TENTACOOL: Menoo!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CIANWOOD_CITY, 3
	warp_event  6,  7, CIANWOOD_CITY, 3
	warp_event  2,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  7,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event 10,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
	object_event  9,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FFishingGuruScript, -1
	object_event  8,  1, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FTentacoolScript, -1
