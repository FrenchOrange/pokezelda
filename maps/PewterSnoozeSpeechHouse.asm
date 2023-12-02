	object_const_def
	const PEWTERSNOOZESPEECHHOUSE_GRAMPS
	const PEWTERSNOOZESPEECHHOUSE_BUG_CATCHER
	const PEWTERSNOOZESPEECHHOUSE_POKEDEX

PewterSnoozeSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PewterSnoozeSpeechHouseGrampsScript:
	showemote EMOTE_SLEEP, PEWTERSNOOZESPEECHHOUSE_GRAMPS, 25
	jumptextfaceplayer PewterSnoozeSpeechHouseGrampsText

PewterSnoozeSpeechHouseBugCatcherScript:
	faceplayer
	opentext
	writetext PewterSnoozeSpeechHouseBugCatcherText
	waitbutton
	closetext
	turnobject PEWTERSNOOZESPEECHHOUSE_BUG_CATCHER, UP
	end

PewterSnoozeSpeechHousePokedexScript:
	opentext
	writetext PewterSnoozeSpeechHousePokedexText
.Loop:
	loadmenu .PokedexMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Foreword
	ifequal 2, .Articuno
	ifequal 3, .Zapdos
	ifequal 4, .Moltres
	closetext
	end

.Foreword:
	writetext PewterSnoozeSpeechHouseForewordText
	waitbutton
	sjump .Loop

.Articuno:
	writetext PewterSnoozeSpeechHouseArticunoText
	waitbutton
	sjump .Loop

.Zapdos:
	writetext PewterSnoozeSpeechHouseZapdosText
	waitbutton
	sjump .Loop

.Moltres:
	writetext PewterSnoozeSpeechHouseMoltresText
	waitbutton
	sjump .Loop

.PokedexMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 5, 1 ; rows, columns
	db 4 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "FOREWORD@"
	db "ARTICUNO@"
	db "ZAPDOS@"
	db "MOLTRES@"
	db "QUIT@"

PewterSnoozeSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

PewterSnoozeSpeechHouseGrampsText:
	text "I like snoozing"
	line "with the radio on…"
	cont "…Zzzz…"
	done

PewterSnoozeSpeechHouseBugCatcherText:
	text "Pop is always"
	line "napping, so I read"
	cont "his old books to"
	cont "keep me busy."
	done

PewterSnoozeSpeechHousePokedexText:
	text "An old storybook!"
	line "Read which tale?"
	done

PewterSnoozeSpeechHouseForewordText:
	text "Three mighty birds"
	line "of prey look after"
	cont "our region."

	para "They only show"
	line "themselves to ones"
	cont "they deem worthy."
	done

PewterSnoozeSpeechHouseArticunoText:
	text "Bird of ice, it"
	line "sleeps deep in its"
	cont "glacial lair."

	para "When angered, it"
	line "is said to cause"
	cont "harsh winters."
	done

PewterSnoozeSpeechHouseZapdosText:
	text "Bird of lightning,"
	line "it rains thunder"
	cont "as it flies among"
	cont "dark clouds."

	para "Blame a stormy"
	line "harvest on this"
	cont "#MON."
	done

PewterSnoozeSpeechHouseMoltresText:
	text "Bird of flames, it"
	line "nests up in the"
	cont "highest mountains."

	para "The guiding light"
	line "of its fiery wings"
	cont "is like that of a"
	cont "lighthouse."
	done

PewterSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, PEWTER_CITY, 5
	warp_event  5,  7, PEWTER_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf

	def_object_events
	object_event  7,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHouseGrampsScript, -1
	object_event  2,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHouseBugCatcherScript, -1
	object_event  5,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHousePokedexScript, -1
