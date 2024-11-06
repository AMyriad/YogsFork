/area/station/external_power
	name = "EXTERNAL POWER AREAS"
	icon_state = "ext_power"
	minimap_color = "#6b6b6b"
	airlock_wires = /datum/wires/airlock/engineering

	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_SPACE

	lights_always_start_on = TRUE

	flags_1 = NONE
	valid_territory = FALSE
	blob_allowed = FALSE // Stay inside the station silly billy
	mining_speed = TRUE


//-- Solar Panel Arrays --//
// Keep order going clockwise from north pls ty

/area/station/external_power/solar
	name = "SOLAR ARRAY AREAS"
	icon_state = "ext_power_solar"

/area/station/external_power/solar/central
	name = "\improper Central Primary Solar Array"

/area/station/external_power/solar/north
	name = "\improper Fore (N) Solar Array"

/area/station/external_power/solar/northeast
	name = "\improper Starboard Bow (NE) Solar Array"

/area/station/external_power/solar/east
	name = "\improper Starboard (E) Solar Array"

/area/station/external_power/solar/southeast
	name = "\improper Starboard Quarter (SE) Solar Array"

/area/station/external_power/solar/south
	name = "\improper Aft (S) Solar Array"

/area/station/external_power/solar/southwest
	name = "\improper Port Quarter (SW) Solar Array"

/area/station/external_power/solar/west
	name = "\improper Port (W) Solar Array"

/area/station/external_power/solar/northwest
	name = "\improper Port Bow (NW) Solar Array"


//-- Geothermal Stations --//
// We're on solid ground not a ship, cardinal directions apply

/area/station/external_power/geothermal
	name = "GEOTHERMAL STATION AREAS"
	icon_state = "ext_power_geo"
	ambient_buzz = null // Stillness
	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_ENVIRONMENT_FOREST
	area_flags = FLORA_ALLOWED
	uses_daylight = TRUE

/area/station/external_power/geothermal/north
	name = "\improper Geothermal Station North"

/area/station/external_power/geothermal/northeast
	name = "\improper Geothermal Station Northwest"

/area/station/external_power/geothermal/east
	name = "\improper Geothermal Station East"

/area/station/external_power/geothermal/southeast
	name = "\improper Geothermal Station Southeast"

/area/station/external_power/geothermal/south
	name = "\improper Geothermal Station South"

/area/station/external_power/geothermal/southwest
	name = "\improper Geothermal Station Southwest"

/area/station/external_power/geothermal/west
	name = "\improper Geothermal Station West"

/area/station/external_power/geothermal/northwest
	name = "\improper Geothermal Station Northwest"
