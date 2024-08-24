	object_const_def
	const REDSHOUSE1F_REDS_MOM
	const REDSHOUSE1F_REDS_MR_MIME

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FTVText:
	text "They have programs"
	line "that aren't shown"
	cont "in JOHTO…"
	done

RedsMom:
	faceplayer
	opentext
	checkitem TABLOID
	iftrue .GotTabloid
	checkevent EVENT_GAVE_TABLOID
	iftrue .RedsMomPostStep
	writetext RedsMom_NoItem
	waitbutton
	closetext
	end

.GotTabloid:
	writetext RedsMom_HasItem1
	waitbutton
	closetext
	takeitem TABLOID
	opentext
	writetext RedsMom_HasItem2
	waitbutton
	closetext
	setevent EVENT_GAVE_TABLOID
	clearevent EVENT_REDS_HOUSE_MASTER_BALL
	end

.RedsMomPostStep:
	writetext RedsMom_After
	waitbutton
	closetext
	end

RedsMom_NoItem:
	text "Hi!"

	para "RED's been away"
	line "for a long time."

	para "He hasn't called"
	line "either, so I have"

	para "no idea where he"
	line "is or what he's"
	cont "been doing."

	para "They say that no"
	line "word is proof that"

	para "he's doing fine,"
	line "but I do worry"
	cont "about him."
	done

RedsMom_HasItem1:
	text "Oh? What's this?"

	para "This magazine…"
	line "Children shouldn't"
	cont "read such rags."

	para "They're for adults"
	line "with nothing"
	cont "better to do."

	para "Let me take that"
	line "from you."
	done

RedsMom_HasItem2:
	text "… … …"

	para "RED…"

	para "Ah… You remind me"
	line "of RED, you have"
	cont "that same spark in"
	cont "your eyes."

	para "There's something"
	line "in his room that I"
	cont "want you to have."

	para "Looks like it'll"
	line "prove more useful"
	cont "for you than it"
	cont "did for him."
	done

RedsMom_After:
	text "I worry about RED"
	line "getting hurt or"

	para "sick, but he's a"
	line "tough boy."

	para "I'm proud that he"
	line "is doing what he"
	cont "wants to do."
	done

RedsMrMime:
	cry MR__MIME
	opentext
	checkevent EVENT_MET_REDS_MRMIME
	iftrue .MetAlready
	writetext RedsMrMimeText1
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MRMIME
	end
.MetAlready:
	writetext RedsMrMimeText2
	waitbutton
	closetext
	end

RedsMrMimeText1:
	text "MR.MIME: MIMIMI MI"
	line "MI-MR MIME!"
	done

RedsMrMimeText2:
	text "MR.MIME is singing"
	line "to itself as it"
	cont "sweeps the floor."
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, PALLET_TOWN, 1
	warp_event  5,  7, PALLET_TOWN, 1
	warp_event  9,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  4,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  7,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
	object_event  3,  3, SPRITE_MR__MIME, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RedsMrMime, -1
