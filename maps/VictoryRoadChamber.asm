	object_const_def
	const VICTORYROADCHAMBER_MOLTRES

VictoryRoadChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Moltres

.Moltres:
	checkevent EVENT_VICTORY_ROAD_CHAMBER_MOLTRES
	iftrue .NoAppear
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Appear

.NoAppear:
	disappear VICTORYROADCHAMBER_MOLTRES
	endcallback

.Appear:
	appear VICTORYROADCHAMBER_MOLTRES
	endcallback

MoltresScript:
	opentext
	writetext MoltresBattleText
	cry MOLTRES
	waitbutton
	closetext
	loadwildmon MOLTRES, 50
	startbattle
	disappear VICTORYROADCHAMBER_MOLTRES
	setevent EVENT_VICTORY_ROAD_CHAMBER_MOLTRES
	reloadmapafterbattle
	end

MoltresBattleText:
	text "Gyaoo!"
	done

VictoryRoadChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 19, VICTORY_ROAD_2F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 10, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoltresScript, EVENT_VICTORY_ROAD_CHAMBER_MOLTRES


