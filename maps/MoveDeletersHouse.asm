	object_const_def
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MoveDeletersHouseBookshelf:
	jumpstd DifficultBookshelfScript

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, BLACKTHORN_CITY, 6
	warp_event  5,  7, BLACKTHORN_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, MoveDeletersHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
