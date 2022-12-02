	object_const_def
	const BATTLETOWERELEVATOR_RECEPTIONIST

BattleTowerElevator_MapScripts:
	def_scene_scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	def_callbacks

.Scene0:
	sdefer .RideElevator
	setscene SCENE_FINISHED
.Scene1:
	end

.RideElevator:
	follow BATTLETOWERELEVATOR_RECEPTIONIST, PLAYER
	applymovement BATTLETOWERELEVATOR_RECEPTIONIST, MovementData_BattleTowerElevatorReceptionistWalksIn
	applymovement PLAYER, MovementData_BattleTowerElevatorPlayerWalksIn
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	follow BATTLETOWERELEVATOR_RECEPTIONIST, PLAYER
	applymovement BATTLETOWERELEVATOR_RECEPTIONIST, MovementData_BattleTowerElevatorExitElevator
	stopfollow
	warpsound
	disappear BATTLETOWERELEVATOR_RECEPTIONIST
	applymovement PLAYER, MovementData_BattleTowerElevatorExitElevator
	warpcheck
	end

MovementData_BattleTowerElevatorReceptionistWalksIn:
	step RIGHT
	turn_head DOWN
	step_end

MovementData_BattleTowerElevatorPlayerWalksIn:
	turn_head DOWN
	step_end

BattleTowerElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  4, BATTLE_TOWER_HALLWAY, 1
	warp_event  4,  4, BATTLE_TOWER_HALLWAY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MovementData_BattleTowerElevatorReceptionistWalksIn, -1
