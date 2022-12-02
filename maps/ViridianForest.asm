	object_const_def
	const VIRIDIAN_FOREST_CAMPER1
	const VIRIDIAN_FOREST_CAMPER2
	const VIRIDIAN_FOREST_CAMPER3
	const VIRIDIAN_FOREST_CAMPER4
	const VIRIDIAN_FOREST_CAMPER5
	const VIRIDIAN_FOREST_CAMPER6
	const VIRIDIAN_FOREST_POKE_BALL1
	const VIRIDIAN_FOREST_POKE_BALL2
	const VIRIDIAN_FOREST_FRUIT_TREE

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperHarvey:
	trainer CAMPER, HARVEY, EVENT_BEAT_CAMPER_HARVEY, CamperHarveySeenText, CamperHarveyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperHarveyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperDale:
	trainer CAMPER, DALE, EVENT_BEAT_CAMPER_DALE, CamperDaleSeenText, CamperDaleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDaleAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperThomas:
	trainer CAMPER, THOMAS, EVENT_BEAT_CAMPER_THOMAS, CamperThomasSeenText, CamperThomasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperThomasAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLeroy:
	trainer CAMPER, LEROY, EVENT_BEAT_CAMPER_LEROY, CamperLeroySeenText, CamperLeroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLeroyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperDavid:
	trainer CAMPER, DAVID, EVENT_BEAT_CAMPER_DAVID, CamperDavidSeenText, CamperDavidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDavidAfterBattleText
	waitbutton
	closetext
	end


ViridianForestCamper:
	jumptextfaceplayer ViridianForestCamperText

ViridianForestSign1:
	jumptext ViridianForestSign1Text

ViridianForestSign2:
	jumptext ViridianForestSign2Text

ViridianForestSign3:
	jumptext ViridianForestSign3Text

ViridianForestSign4:
	jumptext ViridianForestSign4Text

ViridianForestSign5:
	jumptext ViridianForestSign5Text

ViridianForestSign6:
	jumptext ViridianForestSign6Text

ViridianForestCamperText:
	text "Me and my friends"
	line "are setting camp"
	cont "in this forest."

	para "Look out for them,"
	line "they're always"
	cont "ready to battle!"
	done

CamperHarveySeenText:
	text "My team is raised"
	line "to perfection."

	para "But yours looks"
	line "pretty tough too!"
	done

CamperHarveyBeatenText:
	text "What an intense"
	line "battle. Good job!"
	done

CamperHarveyAfterBattleText:
	text "We CAMPERS have to"
	line "respect a strict"
	cont "conduct code."

	para "I also use it when"
	line "training my team."
	done

CamperDaleSeenText:
	text "Growing up in"
	line "SAFFRON, I always"
	cont "wanted to live"
	cont "closer to nature."

	para "That's why I"
	line "became a CAMPER!"
	done

CamperDaleBeatenText:
	text "Outdoors fun at"
	line "its purest!"
	done

CamperDaleAfterBattleText:
	text "SAFFRON is such a"
	line "busy place."

	para "But to each their"
	line "own I suppose."
	done

CamperThomasSeenText:
	text "Oh! This forest is"
	line "so thick I almost"
	cont "didn't see you!"
	done

CamperThomasBeatenText:
	text "No ray of hope nor"
	line "sun for me..."
	done

CamperThomasAfterBattleText:
	text "A forest's canopy"
	line "is too dense for"
	cont "one to simply FLY"
	cont "through it."

	para "That makes ESCAPE"
	line "ROPES a must-have!"
	done

CamperLeroySeenText:
	text "Hey! Want some"
	line "lightly toasted"
	cont "marshmallows?"
	done

CamperLeroyBeatenText:
	text "Ouch! All charred!"
	done

CamperLeroyAfterBattleText:
	text "Nothing beats a"
	line "good campfire"
	cont "under the shade."

	para "Just use fire"
	line "responsibly!"
	done

CamperDavidSeenText:
	text "I've got many"
	line "badges, that means"
	cont "I'm a good trainer!"
	done

CamperDavidBeatenText:
	text "Oww… Well there"
	line "goes my bragging."
	done

CamperDavidAfterBattleText:
	text "Woah. You have so"
	line "many more badges"
	cont "than me. I don't"
	para "even recognize"
	line "most of them!"
	done

ViridianForestSign1Text:
	text "LEAVING"
	line "VIRIDIAN FOREST"
	para "PEWTER CITY AHEAD"
	done

ViridianForestSign2Text:
	text "TRAINER TIPS"

	para "No stealing of"
	line "#MON from"
	cont "other trainers!"
	cont "Catch only wild"
	cont "#MON!"
	done

ViridianForestSign3Text:
	text "TRAINER TIPS"

	para "Contact PROF.OAK"
	line "via PC to get"
	cont "your #DEX"
	cont "evaluated!"
	done

ViridianForestSign4Text:
	text "TRAINER TIPS"

	para "If you want to"
	line "avoid battles,"
	cont "give yourself a"
	cont "quick REPEL spray!"
	done

ViridianForestSign5Text:
	text "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done

ViridianForestSign6Text:
	text "TRAINER TIPS"

	para "Weaken #MON"
	line "before attempting"
	cont "capture!"

	para "When healthy,"
	line "they may escape!"
	done

ViridianForestDireHit:
	itemball DIRE_HIT

ViridianForestMaxPotion:
	itemball MAX_POTION

ViridianForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_VIRIDIAN_FOREST_HIDDEN_MAX_ETHER

ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_RESTORE

ViridianForestHiddenRevive:
	hiddenitem REVIVE, EVENT_VIRIDIAN_FOREST_HIDDEN_REVIVE

Route2FruitTree:
	fruittree FRUITTREE_ROUTE_2

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  5, VIRIDIAN_NORTH_GATE, 1
	warp_event 16, 53, VIRIDIAN_SOUTH_GATE, 3
	warp_event 17, 53, VIRIDIAN_SOUTH_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  2,  7, BGEVENT_READ, ViridianForestSign1
	bg_event  4, 30, BGEVENT_READ, ViridianForestSign2
	bg_event 26, 23, BGEVENT_READ, ViridianForestSign3
	bg_event 24, 46, BGEVENT_READ, ViridianForestSign4
	bg_event 16, 38, BGEVENT_READ, ViridianForestSign5
	bg_event 18, 51, BGEVENT_READ, ViridianForestSign6
	bg_event 19, 13, BGEVENT_ITEM, ViridianForestHiddenMaxEther
	bg_event 16, 48, BGEVENT_ITEM, ViridianForestHiddenFullRestore
	bg_event 30, 48, BGEVENT_ITEM, ViridianForestHiddenRevive

	def_object_events
	object_event 16, 49, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianForestCamper, -1
	object_event  1, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperHarvey, -1
	object_event  7, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperDale, -1
	object_event 32, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperThomas, -1
	object_event  4, 36, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperLeroy, -1
	object_event 27, 43, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperDavid, -1
	object_event  1, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestDireHit, EVENT_VIRIDIAN_FOREST_DIRE_HIT
	object_event 11, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxPotion, EVENT_VIRIDIAN_FOREST_MAX_POTION
	object_event 31,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree, -1
