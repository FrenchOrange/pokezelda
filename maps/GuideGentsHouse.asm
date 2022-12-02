	object_const_def
	const GUIDEGENTSHOUSE_GRAMPS

GuideGentsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GuideGentsHouseGuideGent:
	jumptextfaceplayer GuideGentsHouseGuideGentText

GuideGentsHouseDaughter:
	jumptextfaceplayer GuideGentsHouseDaughterText

GuideGentsHouseBookshelf:
	jumpstd MagazineBookshelfScript

GuideGentsHouseGuideGentText:
	text "When I was a wee"
	line "lad, I was a hot-"
	cont "shot trainer!"

	para "Here's a word of"
	line "advice: Catch lots"
	cont "of #MON!"

	para "Treat them all"
	line "with kindness!"
	done

GuideGentsHouseDaughterText:
	text "My father might be"
	line "old, be he's still"
	cont "as fast as ever."

	para "If you want to go"
	line "around quicker,"
	cont "just hold down B,"
	para "and you'll start"
	line "sprinting!"
	done

GuideGentsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CHERRYGROVE_CITY, 4
	warp_event  5,  7, CHERRYGROVE_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, GuideGentsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, GuideGentsHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseGuideGent, EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GuideGentsHouseDaughter, -1
