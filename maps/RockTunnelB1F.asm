	object_const_def
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3
	const ROCKTUNNELB1F_GRANNY1
	const ROCKTUNNELB1F_GRANNY2
	const ROCKTUNNELB1F_GRANNY3

RockTunnelB1F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMargret:
	trainer MEDIUM, MARGRET, EVENT_BEAT_MEDIUM_MARGRET, MediumMargretSeenText, MediumMargretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMargretAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumEthel:
	trainer MEDIUM, ETHEL, EVENT_BEAT_MEDIUM_ETHEL, MediumEthelSeenText, MediumEthelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumEthelAfterBattleText
	waitbutton
	closetext
	end

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION

MediumBethanySeenText:
	text "Fufufu… They threw"
	line "us all out. Fufu…"
	para "But now, we haunt!"
	done

MediumBethanyBeatenText:
	text "I don't know what"
	line "came over me!"
	done

MediumBethanyAfterBattleText:
	text "I'm sorry, dear."
	line "It seems I got"
	cont "possessed by an"
	cont "evil spirit."
	done

MediumMargretSeenText:
	text "Me and the other"
	line "MEDIUMS are trying"
	cont "to cleanse this"
	cont "place of spirits."

	para "Could you be an"
	line "apparition?"
	done

MediumMargretBeatenText:
	text "You are so young,"
	line "so full of life!"
	done

MediumMargretAfterBattleText:
	text "The darkness of"
	line "this cave makes it"
	cont "hard to tell the"
	para "living from the"
	line "departed."
	done

MediumEthelSeenText:
	text "Begone, spirit!"
	line "You do not belong"
	cont "in this place!"
	done

MediumEthelBeatenText:
	text "I mistook you for"
	line "a specter!"
	done

MediumEthelAfterBattleText:
	text "The POKéMON TOWER"
	line "was converted into"
	cont "the RADIO TOWER."

	para "And now, all the"
	line "ghosts moved to"
	cont "ROCK TUNNEL!"
	done

RockTunnelB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROCK_TUNNEL_1F, 6
	warp_event 17,  9, ROCK_TUNNEL_1F, 4
	warp_event 23,  3, ROCK_TUNNEL_1F, 3
	warp_event 25, 23, ROCK_TUNNEL_1F, 5

	def_coord_events

	def_bg_events
	bg_event  4, 14, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

	def_object_events
	object_event  7, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event  6, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumBethany, -1
	object_event 15, 22, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumMargret, -1
	object_event 24, 15, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumEthel, -1
