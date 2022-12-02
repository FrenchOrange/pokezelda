	object_const_def
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SeerScript:
	faceplayer
	opentext
	special PokeSeer
	waitbutton
	closetext
	end

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CIANWOOD_CITY, 7
	warp_event  5,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SeerScript, -1
