	object_const_def
	const CERULEANCAVEB1F_MEWTWO

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

MewtwoScript:
	opentext
	writetext MewtwoBattleText
	cry MEWTWO
	waitbutton
	closetext
	loadwildmon MEWTWO, 70
	startbattle
	disappear CERULEANCAVEB1F_MEWTWO
	setevent EVENT_CERULEAN_CAVE_B1F_MEWTWO
	reloadmapafterbattle
	end

MewtwoBattleText:
	text "Mew!"
	done

CeruleanCaveB1FMaxRevive:
	itemball MAX_REVIVE

CeruleanCaveB1FHiddenUltraBall:
	hiddenitem MAX_POTION, EVENT_CERULEAN_CAVE_B1F_HIDDEN_ULTRA_BALL

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CERULEAN_CAVE_1F, 2

	def_coord_events

	def_bg_events
	bg_event 24, 11, BGEVENT_ITEM, CeruleanCaveB1FHiddenUltraBall

	def_object_events
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FMaxRevive, EVENT_CERULEAN_CAVE_B1F_MAX_REVIVE
	object_event  7, 13, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewtwoScript, EVENT_CERULEAN_CAVE_B1F_MEWTWO
