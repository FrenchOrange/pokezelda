SafariZoneRestHouse_MapScripts:
	def_scene_scripts
	const SAFARIZONERESTHOUSE_ROCKER
	const SAFARIZONERESTHOUSE_SUPERNERD

	def_callbacks

SafariZoneRestHouseRockerScript:
	jumptextfaceplayer SafariZoneRestHouseRockerText

SafariZoneRestHouseSuperNerdScript:
	jumptextfaceplayer SafariZoneRestHouseSuperNerdText

SafariZoneRestHouseBookshelf1Script:
	jumptext SafariZoneRestHouseBookshelf1Text

SafariZoneRestHouseBookshelf2Script:
	jumptext SafariZoneRestHouseBookshelf2Text

SafariZoneRestHouseBookshelf3Script:
	jumptext SafariZoneRestHouseBookshelf3Text

SafariZoneRestHouseBookshelf4Script:
	jumptext SafariZoneRestHouseBookshelf4Text

SafariZoneRestHouseBookshelf1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Credits 1:"

	para "Unique #MON"
	line "icons made by:"

	para "-Twitter artist"
	line "LuigiTKO."

	para "-Twitter artist"
	line "GuiAbel."

	para "-PRET artist"
	line "SoupPotato."

	para "-The team over at"
	line "#MON SHOWDOWN."

	para "-The team over at"
	line "CRYSTAL CLEAR."
	done

SafariZoneRestHouseBookshelf2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Credits 2:"

	para "Updated trainer"
	line "sprites made by"
	cont "the team over at"
	cont "POLISHED CRYSTAL."

	para "Updated #MON"
	line "sprites made by"
	cont "SoupPotato."
	done

SafariZoneRestHouseBookshelf3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Credits 3:"

	para "-All the amazing"
	line "people who worked"
	para "tirelessly on the"
	line "different #MON"
	cont "disassemblies."

	para "-The awesome folks"
	line "who wrote down the"
	cont "various tutorials"
	cont "for Pokecrystal."
	done

SafariZoneRestHouseBookshelf4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Credits 4:"

	para "-#MON CRYSTAL"
	line "by GAME FREAK."

	para "-LINK'S AWAKENING"
	line "by NINTENDO."

	para "-ORACLE OF AGES &"
	line "ORACLE OF SEASONS"
	cont "by CAPCOM."
	done

SafariZoneRestHouseRockerText:
	text "IDAIN: This place"
	line "is so cozy!"

	para "I should've taken"
	line "my laptop with me."

	para "'Another PKMN"
	line "Crystal Remaster'"
	cont "isn't gonna develop"
	cont "itself!"
	done

SafariZoneRestHouseSuperNerdText:
	text "SEASICK: I can't"
	line "sit still!"

	para "Too many projects"
	line "left to finish…"

	para "Sniff… Wish me"
	line "luck, <PLAYER>."
	cont "Gotta solider on!"
	done

SafariZoneRestHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, SAFARI_ZONE, 3
	warp_event  5,  7, SAFARI_ZONE, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, SafariZoneRestHouseBookshelf1Script
	bg_event  7,  1, BGEVENT_READ, SafariZoneRestHouseBookshelf2Script
	bg_event  8,  1, BGEVENT_READ, SafariZoneRestHouseBookshelf3Script
	bg_event  9,  1, BGEVENT_READ, SafariZoneRestHouseBookshelf4Script

	def_object_events
	object_event  2,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneRestHouseRockerScript, -1
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneRestHouseSuperNerdScript, -1
