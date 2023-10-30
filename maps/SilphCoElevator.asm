	object_const_def
	const SILPHCOELEVATOR_SCIENTIST

SilphCoElevator_MapScripts:
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
	follow SILPHCOELEVATOR_SCIENTIST, PLAYER
	applymovement SILPHCOELEVATOR_SCIENTIST, SilphCoElevatorScientistWalksIn_MovementData
	applymovement PLAYER, SilphCoElevatorPlayerWalksIn_MovementData
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	follow SILPHCOELEVATOR_SCIENTIST, PLAYER
	applymovement SILPHCOELEVATOR_SCIENTIST, SilphCoElevatorExitElevator_MovementData
	stopfollow
	warpsound
	disappear SILPHCOELEVATOR_SCIENTIST
	applymovement PLAYER, SilphCoElevatorExitElevator_MovementData
	warpcheck
	end

SilphCoElevatorScientistWalksIn_MovementData:
	step RIGHT
	turn_head DOWN
	step_end

SilphCoElevatorPlayerWalksIn_MovementData:
	turn_head DOWN
	step_end

SilphCoElevatorExitElevator_MovementData:
	step DOWN
	step_end

SilphCoElevator_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, SILPH_CO_RD, 1
	warp_event  4,  3, SILPH_CO_RD, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCoElevatorScientistWalksIn_MovementData, -1
