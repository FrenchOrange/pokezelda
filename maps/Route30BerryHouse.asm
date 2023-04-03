	object_const_def
	const ROUTE30BERRYHOUSE_POKEFAN_M
	const ROUTE30BERRYHOUSE_WEEDLE

Route30BerryHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route30BerryHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseMonEatBerriesText
	promptbutton
	verbosegiveitem BERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
.GotBerry:
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route30BerryHouseBookshelf:
	jumpstd MagazineBookshelfScript

Route30BerrySpeechHouseMonEatBerriesText:
	text "You know, #MON"
	line "eat BERRIES."

	para "Well, my #MON"
	line "got healthier by"
	cont "eating a BERRY."

	para "Here. I'll share"
	line "one with you!"
	done

Route30BerrySpeechHouseCheckTreesText:
	text "Check trees for"
	line "BERRIES. They just"
	cont "drop right off."
	done

Route30BerrySpeechHouseWeedleScript:
	cry WEEDLE
	opentext
	writetext Route30BerrySpeechHouseWeedleText
	waitbutton
	closetext
	end

Route30BerrySpeechHouseWeedleText:
	text "WEEDLE is nibbling"
	line "on a BERRY… Cute!"
	done

Route30BerryHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_30, 1
	warp_event  5,  7, ROUTE_30, 1

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, Route30BerryHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, Route30BerryHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route30BerryHousePokefanMScript, -1
	object_event  8,  5, SPRITE_WEEDLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30BerrySpeechHouseWeedleScript, -1
