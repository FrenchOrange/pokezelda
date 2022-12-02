	object_const_def
	const FISHERHOUSE_FISHING_GURU
	const FISHERHOUSE_POKEFAN_M
	const FISHERHOUSE_MAGIKARP_1
	const FISHERHOUSE_MAGIKARP_2
	const FISHERHOUSE_MAGIKARP_3
	const FISHERHOUSE_MAGIKARP_4

FuchsiaCityFisherHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaCityFisherHouseMagikarpScript:
	opentext
	writetext FuchsiaCityFisherHouseMagikarpText
	cry MAGIKARP
	waitbutton
	closetext
	end

FuchsiaCityFisherHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext FuchsiaCityFisherHouseFishingGuruText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext FuchsiaCityFisherHouseFishingGuruText_RocksCleared
	waitbutton
	closetext
	end

FuchsiaCityFisherHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext FuchsiaCityFisherHousePokefanMText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext FuchsiaCityFisherHousePokefanMText_RocksCleared
	waitbutton
	closetext
	end

FuchsiaCityFisherHouseFishingGuruText:
	text "CINNABAR's volcano"
	line "suddenly erupted"
	para "last year."

	para "It hurled boulders"
	line "that cut off ROUTE"
	cont "19 indefinitely."

	para "I wonder if the"
	line "people of CINNABAR"
	cont "are safe…"
	done

FuchsiaCityFisherHouseFishingGuruText_RocksCleared:
	text "No CINNABAR citi-"
	line "zens were injured"

	para "by the eruption."
	line "That's great!"
	done

FuchsiaCityFisherHousePokefanMText:
	text "ROUTE 19 has been"
	line "blocked off for a"
	cont "while now."

	para "And when they"
	line "finally decided to"
	cont "clear it, the"
	para "recent POWER PLANT"
	line "incident slowed"
	cont "things to a crawl…"
	done

FuchsiaCityFisherHousePokefanMText_RocksCleared:
	text "ROUTE 19 is all"
	line "cleared now?"
	cont "Amazing!"

	para "Me and my buddy"
	line "can finally take"
	cont "easy trips to go"
	cont "fish near SEAFOAM!"
	done

FuchsiaCityFisherHouseMagikarpText:
	text "MAGIKARP: Kaaarp…"
	done

FuchsiaCityFisherHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, FUCHSIA_CITY, 8
	warp_event  5,  7, FUCHSIA_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHouseFishingGuruScript, -1
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHousePokefanMScript, -1
	object_event  6,  1, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHouseMagikarpScript, -1
	object_event  2,  3, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHouseMagikarpScript, -1
	object_event  9,  5, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHouseMagikarpScript, -1
	object_event  7,  6, SPRITE_MAGIKARP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFisherHouseMagikarpScript, -1
