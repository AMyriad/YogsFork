/area/station/command
	name = "Command Areas"
	icon_state = "com"
	minimap_color = "#0b37b1"
	airlock_wires = /datum/wires/airlock/command

	ambientsounds = list('sound/ambience/signal.ogg')
	sound_environment = SOUND_AREA_STANDARD_STATION


/area/station/command/main
	name = "\improper Bridge"
	icon_state = "com_main"

/area/station/command/main/upper
	name = "\improper Upper Bridge"
	icon_state = "com_main_up"

/area/station/command/main/lower
	name = "\improper Lower Bridge"
	icon_state = "com_main_low"

/area/station/command/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "com_meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/meeting_room/council
	name = "\improper Council Chamber"

/area/station/command/meeting_room/showroom
	name = "\improper Corporate Showroom"

/area/station/command/teleporter
	name = "\improper Teleporter Room"
	icon_state = "com_tele"
	ambience_index = AMBIENCE_ENGI


//-- Heads of Staff Quarters/Offices --//

/area/station/command/heads
	name = "Heads of Staff Office Areas"
	clockwork_warp_allowed = FALSE
	lights_always_start_on = FALSE

/area/station/command/heads/captain
	name = "\improper Captain's Office"
	icon_state = "com_heads_cap"
	minimap_color = "#1432df"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads/hop
	name = "\improper Head of Personnel's Office"
	icon_state = "com_heads_hop"
	minimap_color = "#070094"

/area/station/command/heads/rd
	name = "\improper Research Director's Office"
	icon_state = "com_heads_rd"
	minimap_color = "#721392"

/area/station/command/heads/ce
	name = "\improper Chief Engineer's Office"
	icon_state = "com_heads_ce"
	minimap_color = "#e6cf08"

/area/station/command/heads/cmo
	name = "\improper Chief Medical Officer's Office"
	icon_state = "com_heads_cmo"
	minimap_color = "#00fff0"

/area/station/command/heads/hos
	name = "\improper Head of Security's Office"
	icon_state = "com_heads_hos"
	minimap_color = "#e92828"
