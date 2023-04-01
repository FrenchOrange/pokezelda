	object_const_def
	const CIANWOODPHARMACY_PHARMACIST
	const CIANWOODPHARMACY_FEAROW

CianwoodPharmacy_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	promptbutton
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd DifficultBookshelfScript

CianwoodPharmacyFearowScript:
	faceplayer
	opentext
	writetext CianwoodPharmacyFearowSText
	cry FEAROW
	waitbutton
	closetext
	end

CianwoodPharmacyFearowSText:
	text "FEAROW: Kyuin!"
	done

PharmacistGiveSecretpotionText:
	text "Your #MON ap-"
	line "pear to be fine."

	para "Is something wor- "
	line "rying you?"

	para "…"

	para "The LIGHTHOUSE"
	line "#MON is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> received"
	line "SECRETPOTION."
	done

PharmacistDescribeSecretpotionText:
	text "My SECRETPOTION is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CIANWOOD_CITY, 4
	warp_event  5,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  3,  1, BGEVENT_READ, CianwoodPharmacyBookshelf

	def_object_events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
	object_event  8,  4, SPRITE_FEAROW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacyFearowScript, -1
