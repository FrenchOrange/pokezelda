	object_const_def
	const OLIVINEPHARMACYSPEECHHOUSE_TEACHER
	const OLIVINEPHARMACYSPEECHHOUSE_RHYDON

OlivinePharmacySpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

OlivinePharmacySpeechHouseTeacherScript:
	jumptextfaceplayer OlivinePharmacySpeechHouseTeacherText

OlivinePharmacySpeechHouseRhydonScript:
	opentext
	writetext OlivinePharmacySpeechHouseRhydonText
	cry RHYDON
	waitbutton
	closetext
	end

OlivinePharmacySpeechHouseBookshelf1:
	jumpstd PictureBookshelfScript

OlivinePharmacySpeechHouseBookshelf2:
	jumpstd MagazineBookshelfScript

OlivinePharmacySpeechHouseTeacherText:
	text "When my #MON"
	line "got sick, the"

	para "PHARMACIST in"
	line "CIANWOOD made some"
	cont "medicine for me."
	done

OlivinePharmacySpeechHouseRhydonText:
	text "RHYDON: Gugooh!"
	done

OlivinePharmacySpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, OLIVINE_CITY, 3
	warp_event  5,  7, OLIVINE_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, OlivinePharmacySpeechHouseBookshelf1
	bg_event  3,  1, BGEVENT_READ, OlivinePharmacySpeechHouseBookshelf2

	def_object_events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePharmacySpeechHouseTeacherScript, -1
	object_event  8,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OlivinePharmacySpeechHouseRhydonScript, -1

