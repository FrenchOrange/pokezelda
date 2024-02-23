	object_const_def
	const EVOLUTION_GUY
	const EVOLUTION_GUY_EEVEE

EcruteakEvoGuyHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .PCBlocks

.PCBlocks:
	changeblock 8,  0, $1C ; pc
	endcallback

EvolutionGuyScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_EVO_GUY_ONCE
	iftrue .shortintro
	writetext EvoGuyLongIntroText
	yesorno
	iftrue .agreed
	writetext EvoGuyUnderstoodText
	waitbutton
	closetext
	turnobject EVOLUTION_GUY, UP
	end

.shortintro:
	writetext EvoGuyShortIntroText
	yesorno
	iftrue .agreed
	writetext EvoGuyUnderstoodText
	waitbutton
	closetext
	turnobject EVOLUTION_GUY, UP
	end

.agreed:
	special EvolutionNPC
	waitbutton
	closetext
	turnobject EVOLUTION_GUY, UP
	setevent EVENT_TALKED_TO_EVO_GUY_ONCE
	end

EvoGuyLongIntroText:
	text "Oh, good day young"
	line "trainer!"

	para "As you can see I'm"
	line "knee deep in my"
	cont "research papers."

	para "Research on what"
	line "you ask? Why but"
	cont "#MON evolution!"

	para "Not every #MON"
	line "evolves the same"
	cont "way, and there are"

	para "still many things"
	line "we don't know."

	para "Say… Could I see"
	line "one of the #MON"
	cont "on your team?"

	para "It may help test"
	line "out my data-base."
	done

EvoGuyShortIntroText:
	text "Oh, it's you again!"
	line "Hope your journey's"
	cont "going along fine."

	para "Want me to run my"
	line "program once more?"
	done

EvoGuyUnderstoodText:
	text "Understood! See"
	line "you soon!"
	done

EeveeScript:
	cry EEVEE
	opentext
	writetext EcruteakEvoGuyHouseEeveeText
	waitbutton
	closetext
	end

EcruteakEvoGuyHouseEeveeText:
	text "EEVEE: Vee! Vee!"
	done

EcruteakEvoGuyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ECRUTEAK_CITY, 16
	warp_event  5,  7, ECRUTEAK_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EvolutionGuyScript, -1
	object_event  3,  5, SPRITE_EEVEE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EeveeScript, -1
