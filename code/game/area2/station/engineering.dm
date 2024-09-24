/area/station/engineering
	name = "Engineering Areas"
	icon_state = "engineering_template"
	minimap_color = "#edea00"
	airlock_wires = /datum/wires/airlock/engineering

	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

	lighting_colour_tube = "#ffce93"
	lighting_colour_bulb = "#ffbc6f"

/area/engine/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"

/area/engine/engineering
	name = "Engineering"
	icon_state = "engine"

/area/engine/atmos
	name = "Atmospherics"
	icon_state = "atmos"
	flags_1 = NONE
	minimap_color = "#85ff02"

/area/engine/atmos/distro
	name = "Atmospherics Distribution"
	icon_state = "atmos_distro"

/area/engine/atmos/project
	name = "\improper Atmospherics Project Room"
	icon_state = "atmos_project"

/area/engine/atmos/engine
	name = "\improper Atmospherics Engine"
	icon_state = "atmos_engine"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/engine/atmos/pumproom
	name = "\improper Atmospherics Pumping Room"
	icon_state = "atmos_pump_room"

/area/engine/atmos/mix
	name = "\improper Atmospherics Mixing Room"
	icon_state = "atmos_mix"

/area/engine/atmos/storage
	name = "\improper Atmospherics Storage Room"
	icon_state = "atmos_storage"

/area/engine/atmos/foyer
	name = "\improper Atmospherics Foyer"
	icon_state = "atmos_foyer"

/area/engine/atmos/hfr
	name = "\improper Atmospherics HFR Room"
	icon_state = "atmos_hfr"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/engine/supermatter
	name = "Supermatter Engine"
	icon_state = "engine_sm"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/engine/foyer
	name = "Engineering Foyer"
	icon_state = "engine_foyer"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/engine/break_room
	name = "Engineering Break Room"
	icon_state = "engine_foyer"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/engine/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "grav_gen"
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "The gravitons generated here could throw off your warp's destination and possibly throw you into deep space."

/area/engine/storage
	name = "Engineering Storage"
	icon_state = "engi_storage"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/engine/storage_shared
	name = "Shared Engineering Storage"
	icon_state = "engi_storage"

/area/engine/transit_tube
	name = "Transit Tube"
	icon_state = "transit_tube"
