	object_const_def
	const SEAFOAMISLANDSB3F_BOULDER1
	const SEAFOAMISLANDSB3F_BOULDER2
	const SEAFOAMISLANDSB3F_BOULDER3
	const SEAFOAMISLANDSB3F_BOULDER4
	const SEAFOAMISLANDSB3F_BOULDER5
	const SEAFOAMISLANDSB3F_BOULDER6

SeafoamIslandsB3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_CMDQUEUE, SetUpStoneTable
	callback MAPCALLBACK_TILES, SeafoamIslandsB3FCurrentCallback
	callback MAPCALLBACK_OBJECTS, SeafoamIslandsB3FCurrent


SeafoamIslandsB3FCurrentCallback:
	checkevent EVENT_BOTH_BOULDERS_IN_SEAFOAM_B3F
	iftrue .CalmWaterB3FCallback
	endcallback

.CalmWaterB3FCallback:
	changeblock 20,  8, $51 ; water
	changeblock 16, 10, $51 ; water
	changeblock 18, 10, $51 ; water
	changeblock 20, 10, $51 ; water
	changeblock 20, 12, $51 ; water
	changeblock 22, 12, $51 ; water
	changeblock 24, 12, $51 ; water
	changeblock 22, 14, $51 ; water
	changeblock 22, 16, $51 ; water
	endcallback


SetUpStoneTable:
	writecmdqueue .CommandQueue
	endcallback

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 9, SEAFOAMISLANDSB3F_BOULDER3, .Boulder1
	stonetable 8, SEAFOAMISLANDSB3F_BOULDER4, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMISLANDSB3F_BOULDER3
	clearevent EVENT_BOULDER_IN_SEAFOAM_B4F_1
	sjump .Fall

.Boulder2:
	disappear SEAFOAMISLANDSB3F_BOULDER4
	clearevent EVENT_BOULDER_IN_SEAFOAM_B4F_2
	sjump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext SeafoamIslandsB3FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	endcallback

SeafoamIslandsB3FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslandsB3FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done


SeafoamIslandsB3FCurrent:
	checkevent EVENT_BOULDER_IN_SEAFOAM_B3F_1
	iftrue .NeedsBoulderB3F
	checkevent EVENT_BOULDER_IN_SEAFOAM_B3F_2
	iftrue .NeedsBoulderB3F
.CalmWaterB3F:
	changeblock 20,  8, $51 ; water
	changeblock 16, 10, $51 ; water
	changeblock 18, 10, $51 ; water
	changeblock 20, 10, $51 ; water
	changeblock 20, 12, $51 ; water
	changeblock 22, 12, $51 ; water
	changeblock 24, 12, $51 ; water
	changeblock 22, 14, $51 ; water
	changeblock 22, 16, $51 ; water
	reloadmappart
	setevent EVENT_BOTH_BOULDERS_IN_SEAFOAM_B3F

.NeedsBoulderB3F:
	endcallback

SeafoamIslandsB3FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_SEAFOAM_ISLANDS_B3F_HIDDEN_MAX_ELIXER

SeafoamIslandsB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29,  5, SEAFOAM_ISLANDS_B2F, 5
	warp_event  7, 13, SEAFOAM_ISLANDS_B2F, 6
	warp_event 27, 15, SEAFOAM_ISLANDS_B2F, 7
	warp_event 10,  8, SEAFOAM_ISLANDS_B4F, 1
	warp_event 25,  5, SEAFOAM_ISLANDS_B4F, 2
	warp_event 20,  9, SEAFOAM_ISLANDS_B2F, 10 ; hole (from)
	warp_event 21,  9, SEAFOAM_ISLANDS_B2F, 11 ; hole (from)
	warp_event  5, 18, SEAFOAM_ISLANDS_B4F, 3 ; hole
	warp_event  8, 18, SEAFOAM_ISLANDS_B4F, 4 ; hole
	warp_event 22, 21, SEAFOAM_ISLANDS_B4F, 5 ; waterfall
	warp_event 23, 21, SEAFOAM_ISLANDS_B4F, 6 ; waterfall

	def_coord_events

	def_bg_events
	bg_event 11, 18, BGEVENT_ITEM, SeafoamIslandsB3FHiddenMaxElixer

	def_object_events
	object_event 11, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, -1
	object_event  6, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, -1
	object_event 10, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B3F_3
	object_event  5, 17, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B3F_4
	object_event 20,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B3F_1
	object_event 21,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_B3F_2
