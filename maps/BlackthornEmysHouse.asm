	object_const_def
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Emy:
	faceplayer
	opentext
	trade NPC_TRADE_EMY
	waitbutton
	closetext
	end

EmysHouseBookshelf:
	jumpstd MagazineBookshelfScript

BlackthornEmysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, BLACKTHORN_CITY, 3
	warp_event  5,  7, BLACKTHORN_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, EmysHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, EmysHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
