/area/station/command
	name = "Command Areas"
	icon_state = "command_template"
	minimap_color = "#0b37b1"
	airlock_wires = /datum/wires/airlock/command

	ambientsounds = list('sound/ambience/signal.ogg')
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/command/main
	name = "\improper Bridge"
	icon_state = "bridge"

/area/station/command/main/upper
	name = "\improper Upper Bridge"
	icon_state = "bridge"

/area/station/command/main/lower
	name = "\improper Lower Bridge"
	icon_state = "bridge"

/area/station/command/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/meeting_room/council
	name = "\improper Council Chamber"
	icon_state = "meeting"

/area/station/command/showroom
	name = "\improper Corporate Showroom"
	icon_state = "showroom"

/area/station/command/teleporter
	name = "\improper Teleporter Room"
	icon_state = "teleporter"
	ambience_index = AMBIENCE_ENGI


//-- Heads of Staff Quarters/Offices --//

/area/station/command/heads
	name = "Heads of Staff Office Areas"
	icon_state = "heads"
	clockwork_warp_allowed = FALSE
	lights_always_start_on = FALSE

/area/station/command/heads/captain
	name = "\improper Captain's Office"
	icon_state = "captain"
	minimap_color = "#1432df"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads/hop
	name = "\improper Head of Personnel's Office"
	icon_state = "hop"
	minimap_color = "#070094"

/area/station/command/heads/rd
	name = "\improper Research Director's Office"
	icon_state = "rd"
	minimap_color = "#9257a6"

/area/station/command/heads/ce
	name = "\improper Chief Engineer's Office"
	icon_state = "ce"
	minimap_color = "#a5a000"

/area/station/command/heads/cmo
	name = "\improper Chief Medical Officer's Office"
	icon_state = "cmo"
	minimap_color = "#00fff0"

/area/station/command/heads/hos
	name = "\improper Head of Security's Office"
	icon_state = "hos"
	minimap_color = "#ff6868"
