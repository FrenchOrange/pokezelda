	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_SUPER_NERD1
	const SEAFOAMGYM_SUPER_NERD2
	const SEAFOAMGYM_SUPER_NERD3
	const SEAFOAMGYM_SCIENTIST1
	const SEAFOAMGYM_SCIENTIST2
	const SEAFOAMGYM_SCIENTIST3
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SUPER_NERD_GREGG
	setevent EVENT_BEAT_SUPER_NERD_JAY
	setevent EVENT_BEAT_SUPER_NERD_DAVE
	setevent EVENT_BEAT_SCIENTIST_RUSS
	setevent EVENT_BEAT_SCIENTIST_NORTON
	setevent EVENT_BEAT_SCIENTIST_AVERY
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .SeafoamGymGuideWinScript
	writetext SeafoamGymGuideText
	waitbutton
	closetext
	end

.SeafoamGymGuideWinScript:
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	end

TrainerSuperNerdGregg:
	trainer SUPER_NERD, GREGG, EVENT_BEAT_SUPER_NERD_GREGG, SuperNerdGreggSeenText, SuperNerdGreggBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdGreggAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdJay:
	trainer SUPER_NERD, JAY, EVENT_BEAT_SUPER_NERD_JAY, SuperNerdJaySeenText, SuperNerdJayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdJayAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdDave:
	trainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, SuperNerdDaveSeenText, SuperNerdDaveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdDaveAfterText
	waitbutton
	closetext
	end

TrainerScientistRuss:
	trainer GOOD_SCIENTIST, RUSS, EVENT_BEAT_SCIENTIST_RUSS, ScientistRussSeenText, ScientistRussBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRussAfterText
	waitbutton
	closetext
	end

TrainerScientistNorton:
	trainer GOOD_SCIENTIST, NORTON, EVENT_BEAT_SCIENTIST_NORTON, ScientistNortonSeenText, ScientistNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistNortonAfterText
	waitbutton
	closetext
	end

TrainerScientistAvery:
	trainer GOOD_SCIENTIST, AVERY, EVENT_BEAT_SCIENTIST_AVERY, ScientistAverySeenText, ScientistAveryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistAveryAfterText
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

BlaineWinLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

SuperNerdGreggSeenText:
	text "Let's go go go!"
	line "I'm not gonna let."
	cont "you beat me!"
	done

SuperNerdGreggBeatenText:
	text "Oh no no no!"
	done

SuperNerdGreggAfterText:
	text "I'm so so so sorry!"
	line "All that coffee"
	cont "makes me jittery."
	done

SuperNerdJaySeenText:
	text "CINNABAR's volcano"
	line "erupted, and while"
	cont "I miss the island,"

	para "I got to meet a"
	line "new #MON!"
	done

SuperNerdJayBeatenText:
	text "My new friend!"
	line "Forgive me!"
	done

SuperNerdJayAfterText:
	text "SLUGMA lives in"
	line "the depths of the"
	cont "earth's crust."

	para "But a handful came"
	line "to the surface a"
	cont "year or so ago."
	done

SuperNerdDaveSeenText:
	text "My techniques are"
	line "all up-to-date."
	cont "So get ready!"
	done

SuperNerdDaveBeatenText:
	text "I'm overheating!"
	line "I'm bugging out!"
	done

SuperNerdDaveAfterText:
	text "Let's battle again"
	line "some time later!"

	para "In the mean time,"
	line "I have to update"
	cont "my strategy."
	done

ScientistRussSeenText:
	text "You're from JOHTO?"
	line "I heard you have a"
	cont "lot of interesting"
	cont "#MON!"
	done

ScientistRussBeatenText:
	text "So much for years"
	line "of experience…"
	done

ScientistRussAfterText:
	text "I worked at the"
	line "#MON MANSION"
	cont "many years ago."

	para "We studied all"
	line "sorts of #MON."
	done

ScientistNortonSeenText:
	text "It's ironic how"
	line "this GYM was built"
	cont "right next to an"
	cont "icy cave."

	para "Don't you think?"
	done

ScientistNortonBeatenText:
	text "It's better than"
	line "nothing I suppose."
	done

ScientistNortonAfterText:
	text "It was either a"
	line "GYM in SEAFOAM, or"
	cont "one in a volcano."

	para "I'll let you guess"
	line "what idea got shut"
	cont "down first."
	done

ScientistAverySeenText:
	text "For a time, BLAINE"
	line "was dead-set on"
	cont "rebuilding his GYM"

	para "deep inside the"
	line "CINNABAR volcano."
	done

ScientistAveryBeatenText:
	text "Ow! Ow! Too hot!"
	done

ScientistAveryAfterText:
	text "BLAINE may be old,"
	line "but his will is as"
	cont "fiery as ever."

	para "He won't let ice"
	line "set up camp in"
	cont "this grotto."
	done

SeafoamGymGuideText:
	text "Yo, CHAMP in"
	line "making!"

	para "This GYM has many"
	line "trainers and rocks"
	cont "in the way."

	para "Reaching BLAINE is"
	line "no easy task!"

	para "Keeping your cool"
	line "is key to finding"
	cont "the right path!"
	done

SeafoamGymGuideWinText:
	text "The GYM LEADER who"
	line "lost everything,"
	cont "and the trainer"

	para "from JOHTO who"
	line "challenged him…"

	para "We all witnessed"
	line "a burning battle!"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31, 18, ROUTE_20, 1
	warp_event 31,  6, ROUTE_20, 2
	warp_event 33,  1, SEAFOAM_ISLANDS_1F, 1
	warp_event 33, 13, SEAFOAM_ISLANDS_1F, 2
	warp_event 11, 21, SEAFOAM_GYM, 6
	warp_event 29, 15, SEAFOAM_GYM, 5
	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 12, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event 12, 18, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, -1
	object_event 16, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdGregg, -1
	object_event  8,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSuperNerdJay, -1
	object_event 10,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdDave, -1
	object_event 10, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerScientistRuss, -1
	object_event 13,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerScientistNorton, -1
	object_event  6, 14, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerScientistAvery, -1
