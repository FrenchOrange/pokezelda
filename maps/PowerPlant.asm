	object_const_def
	const POWERPLANT_OFFICERJENNY
	const POWERPLANT_GYM_GUIDE1
	const POWERPLANT_GYM_GUIDE2
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUIDE3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST
	const POWERPLANT_FISHER1
	const POWERPLANT_FISHER2
	const POWERPLANT_RECEPTIONIST1
	const POWERPLANT_RECEPTIONIST2
	const POWERPLANT_RECEPTIONIST3
	const POWERPLANT_VOLTORB
	const POWERPLANT_ZAPDOS
	const POWERPLANT_OFFICER2
	const POWERPLANT_RECEPTIONIST4

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	def_callbacks
	callback MAPCALLBACK_TILES, .ZapdosRoomDoor
	callback MAPCALLBACK_OBJECTS, .Zapdos

.DummyScene0:
	end

.DummyScene1:
	end

.ZapdosRoomDoor:
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .DoorOpen
	changeblock 22, 10, $2C ; door
.DoorOpen:
	endcallback

.Zapdos:
	checkevent EVENT_POWER_PLANT_ZAPDOS
	iftrue .NoAppear
	readvar VAR_BADGES
	ifequal NUM_BADGES, .Appear

.NoAppear:
	disappear POWERPLANT_ZAPDOS
	endcallback

.Appear:
	appear POWERPLANT_ZAPDOS
	endcallback

ZapdosScript:
	opentext
	writetext ZapdosBattleText
	cry ZAPDOS
	waitbutton
	closetext
	loadwildmon ZAPDOS, 50
	startbattle
	disappear POWERPLANT_ZAPDOS
	setevent EVENT_POWER_PLANT_ZAPDOS
	reloadmapafterbattle
	end

PowerPlantGuardPhoneScript1:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICERJENNY, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ApproachWorkerMovement1
	turnobject POWERPLANT_GYM_GUIDE2, LEFT
	turnobject PLAYER, UP
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ApproachPlayerMovement1
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ReturnToPostMovement1
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantGuardPhoneScript2:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICERJENNY, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ApproachWorkerMovement2
	turnobject POWERPLANT_GYM_GUIDE2, LEFT
	turnobject PLAYER, UP
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ApproachPlayerMovement2
	turnobject PLAYER, UP
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICERJENNY, PowerPlantOfficer1ReturnToPostMovement2
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuide1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuide2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuide4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuide4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuide4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	promptbutton
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_OFFICER_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setevent EVENT_DECO_VOLTORB_DOLL
	turnobject POWERPLANT_MANAGER, UP
	writetext PowerPlantManagerHereAndThereText
	promptbutton
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	changeblock 22, 10, $07 ; floor
	reloadmappart
	pause 30
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	faceplayer
	opentext
	writetext PowerPlantManagerTakeThisTMText
	promptbutton
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd DifficultBookshelfScript

PowerPlantOfficer1ApproachWorkerMovement1:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PowerPlantOfficer1ApproachPlayerMovement1:
	step DOWN
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

PowerPlantOfficer1ReturnToPostMovement1:
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1ApproachWorkerMovement2:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

PowerPlantOfficer1ApproachPlayerMovement2:
	step DOWN
	step DOWN
	step_end

PowerPlantOfficer1ReturnToPostMovement2:
	step LEFT
	step DOWN
	step DOWN
	step LEFT
	turn_head DOWN
	step_end

PowerPlantFisher1Script:
	jumptextfaceplayer PowerPlantFisher1Text

PowerPlantFisher2Script:
	jumptextfaceplayer PowerPlantFisher2Text

PowerPlantReceptionist1Script:
	jumptextfaceplayer PowerPlantReceptionist1Text

PowerPlantReceptionist2Script:
	jumptextfaceplayer PowerPlantReceptionist2Text

PowerPlantReceptionist3Script:
	jumptextfaceplayer PowerPlantReceptionist3Text

PowerPlantReceptionist4Script:
	faceplayer
	opentext
	writetext PowerPlantReceptionist4Text
	waitbutton
	closetext
	turnobject POWERPLANT_RECEPTIONIST4, UP
	end

PowerPlantVoltorbScript:
	opentext
	writetext PowerPlantVoltorbText
	cry VOLTORB
	showemote EMOTE_BOLT, POWERPLANT_VOLTORB, 25
	waitbutton
	closetext
	end

PowerPlantOfficer3Script:
	jumptextfaceplayer PowerPlantOfficer3Text

PowerPlantOfficer1AThiefBrokeInText:
	text "A thief broke into"
	line "the POWER PLANT…"

	para "What is the world"
	line "coming to?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "I just got word"
	line "from CERULEAN."

	para "It appears that a"
	line "shady character"

	para "has been loitering"
	line "around."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Could I ask for"
	line "your cooperation?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "We'll have to beef"
	line "up our security"
	cont "presence."
	done

PowerPlantGymGuide1SomeoneStoleAPartText:
	text "Someone made off"
	line "with a part that's"

	para "essential for the"
	line "generator."

	para "Without it, the"
	line "new generator's"
	cont "useless!"
	done

PowerPlantGymGuide1GeneratorUpAndRunningText:
	text "The generator's up"
	line "and running. It's"

	para "making electricity"
	line "to spare."
	done

PowerPlantGymGuide2PowerPlantUpAndRunningText:
	text "This POWER PLANT"
	line "had been abandoned"
	cont "in the past."

	para "We got it back up"
	line "and running to"

	para "provide power to"
	line "the MAGNET TRAIN."
	done

PowerPlantGymGuide2GeneratorIsRunningAgainText:
	text "The generator's"
	line "running again!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "The POWER PLANT's"
	line "MANAGER is up"
	cont "ahead."

	para "But since someone"
	line "wrecked the gener-"
	cont "ator, he's been"
	cont "both sad and"
	cont "furious…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Since the gener-"
	line "ator's been fixed,"

	para "the MANAGER has"
	line "been cheerful."
	done

PowerPlantGymGuide4MagnetTrainConsumesElectricityText:
	text "The MAGNET TRAIN"
	line "consumes a lot of"
	cont "electricity."

	para "It can't move if"
	line "the new generator"
	cont "isn't operating."
	done

PowerPlantGymGuide4WeCanGetMagnetTrainRunningText:
	text "All right! We can"
	line "finally get the"

	para "MAGNET TRAIN"
	line "running again."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "MANAGER: I, I, I'm"
	line "ready to blast"
	cont "someone!"

	para "Who would dare"
	line "ruin my generator?"

	para "I spent so much"
	line "time on it!"

	para "If I catch him,"
	line "he's going to get"

	para "a taste of my ZAP"
	line "CANNON!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "MANAGER: I won't"
	line "forgive him!"

	para "The culprit can"
	line "cry and apologize,"

	para "but I'll still"
	line "hammer him!"

	para "Gahahahah!"
	done

PowerPlantManagerThatsThePartText:
	text "MANAGER: Ah! Yeah!"

	para "That's the missing"
	line "PART from my be-"
	cont "loved generator!"
	cont "You found it?"
	done

PowerPlantManagerHereAndThereText:
	text "Alright! Let's put"
	line "this here… and"
	cont "then there…"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Thanks!"

	para "Here! Take this TM"
	line "as a reward!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "MANAGER: TM07 is"
	line "my ZAP CANNON."

	para "It's a powerful"
	line "technique!"

	para "It's not what any-"
	line "one would consider"

	para "accurate, but it"
	line "packs a wallop!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "MANAGER: My be-"
	line "loved generator!"

	para "Keep pumping the"
	line "electricity out!"
	done

PowerPlantFisher1Text:
	text "I caught my"
	line "VOLTORB back when"
	cont "we renovated the"
	cont "POWER PLANT."

	para "It is still super"
	line "energized to come"
	cont "back to its old"
	cont "home!"
	done

PowerPlantFisher2Text:
	text "My job is to make"
	line "sure the machines"
	cont "work just fine."

	para "But it's hard to"
	line "focus when the"
	cont "MANAGER's so vocal"
	cont "about everything."
	done

PowerPlantReceptionist1Text:
	text "This place used to"
	line "be overrun with"
	cont "wild #MON."

	para "They were returned"
	line "to the great out-"
	cont "doors, but still…"

	para "Do you think they"
	line "miss this place?"
	done

PowerPlantReceptionist2Text:
	text "The air is so"
	line "electric around"
	cont "here. I just can't"
	cont "sit still!"
	done

PowerPlantReceptionist3Text:
	text "The MACHINE PART"
	line "thief was dressed"
	cont "in all black."

	para "Could TEAM ROCKET"
	line "be back?!"
	done

PowerPlantVoltorbText:
	text "VOLTORB: Bzzzt!"
	done

PowerPlantOfficer3Text:
	text "Beyond this door"
	line "is the second"
	cont "generator room."

	para "Don't let the"
	line "MANAGER hear this,"
	cont "but this one is"
	cont "way more powerful."
	done

ZapdosBattleText:
	text "Gyaoo!"
	done

PowerPlantReceptionist4Text:
	text "I'm sorry dear, but"
	line "I have paperwork"
	cont "to fill out."
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 29, ROUTE_10, 2
	warp_event  5, 29, ROUTE_10, 2

	def_coord_events
	coord_event  6, 26, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript1
	coord_event  7, 26, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript2

	def_bg_events
	bg_event 18, 27, BGEVENT_READ, PowerPlantBookshelf
	bg_event 19, 27, BGEVENT_READ, PowerPlantBookshelf

	def_object_events
	object_event  5, 27, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  4, 21, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide1Script, -1
	object_event  8, 23, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide2Script, -1
	object_event 11, 15, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event 19, 24, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuide4Script, -1
	object_event 18, 18, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  7, 17, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
	object_event 13,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlantFisher1Script, -1
	object_event 28, 28, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlantFisher2Script, -1
	object_event 16, 28, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantReceptionist1Script, -1
	object_event  4,  8, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantReceptionist2Script, -1
	object_event 29, 17, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantReceptionist3Script, -1
	object_event 12,  2, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PowerPlantVoltorbScript, -1
	object_event 23,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ZapdosScript, EVENT_POWER_PLANT_ZAPDOS
	object_event 20, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer3Script, -1
	object_event 10,  9, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantReceptionist4Script, -1
