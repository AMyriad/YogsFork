/area/station/command
	name = "Command Areas"
	icon_state = "command_template"
	minimap_color = "#0400a2"
	airlock_wires = /datum/wires/airlock/command

	ambientsounds = list('sound/ambience/signal.ogg')
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/command/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/station/command/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/meeting_room/council
	name = "Council Chamber"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/showroom/corporate
	name = "Corporate Showroom"
	icon_state = "showroom"

/area/station/command/teleporter
	name = "Teleporter Room"
	icon_state = "teleporter"
	ambience_index = AMBIENCE_ENGI


// Heads of staff quarters/offices

/area/station/command/heads
	name = "Heads of Staff Offices"
	icon_state = "heads"
	clockwork_warp_allowed = FALSE
	lights_always_start_on = FALSE

/area/station/command/heads/captain
	name = "Captain's Office"
	icon_state = "captain"
	minimap_color = "#2900d8"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads/hop
	name = "Head of Personnel's Office"
	icon_state = "hop"
	minimap_color = "#070094"

/area/station/command/heads/hor
	name = "Research Director's Office"
	icon_state = "rd"
	minimap_color = "#9257a6"

/area/station/command/heads/ce
	name = "Chief Engineer's Office"
	icon_state = "ce"
	minimap_color = "#a5a000"

/area/station/command/heads/cmo
	name = "Chief Medical Officer's Office"
	icon_state = "cmo"
	minimap_color = "#00fff0"

/area/station/command/heads/hos
	name = "Head of Security's Office"
	icon_state = "hos"
	minimap_color = "#ff6868"
