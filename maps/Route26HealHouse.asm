	object_const_def
	const ROUTE26HEALHOUSE_TEACHER
	const ROUTE26HEALHOUSE_GRAMPS

Route26HealHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route26HealHouseTeacherScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end

Route26HealHouseGrampsScript:
	jumptextfaceplayer Route26HealHouseGrampsText

Route26HealHouseBookshelf:
	jumpstd PictureBookshelfScript

Route26HealHouseRestAWhileText:
	text "Your #MON look"
	line "a little tired."

	para "You should rest"
	line "them a while."
	done

Route26HealHouseKeepAtItText:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Keep at it!"
	done

Route26HealHouseGrampsText:
	text "Preparations are"
	line "important!"

	para "Going in blind is"
	line "a good way to hurt"
	cont "yourself."

	para "Buy a HYPER POTION"
	line "or two, then. Even"
	cont "the trek up to the"

	para "LEAGUE is its own"
	line "challenge."
	done

Route26HealHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, ROUTE_26, 2
	warp_event  5,  7, ROUTE_26, 2

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, Route26HealHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, Route26HealHouseBookshelf

	def_object_events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26HealHouseTeacherScript, -1
	object_event  7,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26HealHouseGrampsScript, -1
