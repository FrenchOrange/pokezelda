SafariZoneFuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneFuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 22, 16, SAFARI_ZONE, 1
	warp_event 23, 16, SAFARI_ZONE, 2
	warp_event 22, 21, FUCHSIA_CITY, 7
	warp_event 23, 21, FUCHSIA_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
