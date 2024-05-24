	object_const_def
	const FUCHSIACITY_YOUNGSTER1
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_FISHER1
	const FUCHSIACITY_FISHER2
	const FUCHSIACITY_YOUNGSTER2

FuchsiaCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .OpenCloseDoor

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

.OpenCloseDoor:
	changeblock -2,  8, $9f ; tree
	changeblock 30, 38, $a6 ; tree
	changeblock 40,  8, $9f ; tree
	changeblock 42,  8, $9f ; tree
	changeblock  0, 38, $a4 ; tree
	changeblock  2, 38, $a4 ; tree
	changeblock  4, 38, $a4 ; tree
	changeblock  6, 38, $a4 ; tree
	changeblock  8, 38, $a3 ; tree
	readvar VAR_DEXCAUGHT
	ifgreater 249, .ClearRocks
	changeblock 18, 4, $91 ; door
.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock 16, 38, $7a ; rock
	changeblock 18, 38, $7a ; rock
	changeblock 20, 38, $7a ; rock
	changeblock 22, 40, $7a ; rock
	changeblock 18, 42, $7a ; rock
.Done:
	endcallback

FuchsiaCityFisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext FuchsiaCityFisher1Text
	waitbutton
	closetext
	turnobject FUCHSIACITY_FISHER1, DOWN
	end

.RocksCleared:
	writetext FuchsiaCityFisher1Text_RocksCleared
	waitbutton
	closetext
	turnobject FUCHSIACITY_FISHER1, DOWN
	end

FuchsiaCityFisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext FuchsiaCityFisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext FuchsiaCityFisher2Text_RocksCleared
	waitbutton
	closetext
	end

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd PokecenterSignScript

FuchsiaCityMartSign:
	jumpstd MartSignScript

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityYoungsterText:
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done

FuchsiaCityPokefanMText:
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done

FuchsiaCityTeacherText:
	text "The SAFARI ZONE is"
	line "closed… It's sad,"

	para "considering it was"
	line "FUCHSIA's main"
	cont "attraction."
	done

FuchsiaCitySignText:
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: JANINE"

	para "The Poisonous"
	line "Ninja Master"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneClosedSignText:
	text "The WARDEN is"
	line "traveling abroad."

	para "Therefore, the"
	line "SAFARI ZONE is"
	cont "closed."
	done

NoLitteringSignText:
	text "No littering."

	para "Please take your"
	line "waste with you."
	done

FuchsiaCityFisher1Text:
	text "Sorry. This road"
	line "is closed for"
	cont "construction."

	para "If you want to get"
	line "to CINNABAR, you'd"

	para "better go south"
	line "from PALLET TOWN."
	done

FuchsiaCityFisher1Text_RocksCleared:
	text "I'm all sweaty."
	line "Time for a swim!"
	done

FuchsiaCityFisher2Text:
	text "Who knows how long"
	line "it would take to"
	cont "move this boulder…"
	done

FuchsiaCityFisher2Text_RocksCleared:
	text "The roadwork is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, FUCHSIA_MART, 2
	warp_event 22, 15, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 29, FUCHSIA_GYM, 1
	warp_event 11, 29, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 29, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 29, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  5, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 31, 29, FUCHSIA_CITY_FISHER_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 25, 17, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 31, BGEVENT_READ, FuchsiaGymSign
	bg_event 21, 17, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 27, 31, BGEVENT_READ, WardensHomeSign
	bg_event 17,  7, BGEVENT_READ, SafariZoneClosedSign
	bg_event 13, 17, BGEVENT_READ, NoLitteringSign
	bg_event 20, 29, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 15, BGEVENT_READ, FuchsiaCityMartSign

	def_object_events
	object_event 23, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 16, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event  8,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
	object_event 21, 37, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, FuchsiaCityFisher1Script, -1
	object_event 19, 37, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, FuchsiaCityFisher2Script, -1
	object_event -5, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
