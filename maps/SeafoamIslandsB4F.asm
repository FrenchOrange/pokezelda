	object_const_def
	const SEAFOAMISLANDSB4F_ARTICUNO
	const SEAFOAMISLANDSB4F_BOULDER1
	const SEAFOAMISLANDSB4F_BOULDER2
	const SEAFOAMISLANDSB4F_CURRENT

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .SeafoamIslandsB4FCurrent
	callback MAPCALLBACK_OBJECTS, .Articuno

.SeafoamIslandsB4FCurrent:
	checkevent EVENT_BOTH_BOULDERS_IN_SEAFOAM_B4F
	iftrue .CalmWaterB4FCallback
	iffalse .CheckBoulderScript
	endcallback

.CalmWaterB4FCallback:
	changeblock  4, 16, $51 ; water
	changeblock  4, 14, $51 ; water
	changeblock  6, 14, $51 ; water
	endcallback

.CheckBoulderScript:
	checkevent EVENT_BOULDER_IN_SEAFOAM_B4F_1
	iftrue .NeedsBoulderB4F
	checkevent EVENT_BOULDER_IN_SEAFOAM_B4F_2
	iftrue .NeedsBoulderB4F
.CalmWaterB4F:
	changeblock  4, 16, $51 ; water
	changeblock  4, 14, $51 ; water
	changeblock  6, 14, $51 ; water
	reloadmappart
	setevent EVENT_BOTH_BOULDERS_IN_SEAFOAM_B4F

.NeedsBoulderB4F:
	endcallback

.Articuno:
	checkevent EVENT_SEAFOAM_ISLANDS_B4F_ARTICUNO_AVAILABLE
	iftrue .NoAppear
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Appear

.NoAppear:
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	endcallback

.Appear:
	appear SEAFOAMISLANDSB4F_ARTICUNO
	endcallback

SeafoamIslandsB4FBoulder:
	jumpstd StrengthBoulderScript

SeafoamCurrentSign:
	jumptext SeafoamCurrentSignText

SeafoamBoulderSign:
	jumptext SeafoamBoulderSignText

SeafoamIslandsB4FCurrent:
	jumptext SeafoamIslandsB4FCurrentText

ArticunoScript:
	opentext
	writetext ArticunoBattleText
	cry ARTICUNO
	waitbutton
	closetext
	loadwildmon ARTICUNO, 50
	startbattle
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	setevent EVENT_SEAFOAM_ISLANDS_B4F_ARTICUNO_AVAILABLE
	reloadmapafterbattle
	end

SeafoamCurrentSignText:
	text "DANGER"
	line "Fast current!"
	done

SeafoamBoulderSignText:
	text "Boulders might"
	line "change the flow"
	cont "of water!"
	done

ArticunoBattleText:
	text "Gyaoo!"
	done

SeafoamIslandsB4FCurrentText:
	text "The current is"
	line "way too strong!"
	done

SeafoamIslandsB4FHiddenUltraBall:
	hiddenitem NUGGET, EVENT_SEAFOAM_ISLANDS_B4F_HIDDEN_ULTRA_BALL

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  9, SEAFOAM_ISLANDS_B3F, 4
	warp_event 25,  5, SEAFOAM_ISLANDS_B3F, 5
	warp_event  4, 16, SEAFOAM_ISLANDS_B3F, 8 ; hole (from)
	warp_event  5, 16, SEAFOAM_ISLANDS_B3F, 9 ; hole (from)
	warp_event 20, 19, SEAFOAM_ISLANDS_B3F, 10 ; waterfall
	warp_event 21, 19, SEAFOAM_ISLANDS_B3F, 11 ; waterfall

	def_coord_events
	

	def_bg_events
	bg_event 25, 19, BGEVENT_ITEM, SeafoamIslandsB4FHiddenUltraBall
	bg_event 23,  3, BGEVENT_READ, SeafoamCurrentSign
	bg_event  9, 17, BGEVENT_READ, SeafoamBoulderSign

	def_object_events
	object_event  7,  3, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoScript, EVENT_SEAFOAM_ISLANDS_B4F_ARTICUNO
	object_event  5, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FBoulder, EVENT_BOULDER_IN_SEAFOAM_B4F_1
	object_event  4, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FBoulder, EVENT_BOULDER_IN_SEAFOAM_B4F_2
	object_event  7, 14, SPRITE_BLANK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FCurrent, EVENT_BOTH_BOULDERS_IN_SEAFOAM_B4F
