/area/station/external_power
	name = "External Power Areas"
	icon_state = ""
	minimap_color = "#6b6b6b"
	airlock_wires = /datum/wires/airlock/engineering

	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_SPACE

	lights_always_start_on = TRUE

	flags_1 = NONE
	valid_territory = FALSE
	blob_allowed = FALSE
	mining_speed = TRUE

//-- Solar Panel Arrays --//
// Keep order going clockwise from north pls ty

/area/station/external_power/solar
	name = "Solar Array Areas"
	icon_state = ""

/area/station/external_power/solar/north
	name = "\improper Fore (N) Solar Array"
	icon_state = "yellow"

/area/station/external_power/solar/northeast
	name = "\improper Starboard Bow (NE) Solar Array"
	icon_state = "panelsA"

/area/station/external_power/solar/east
	name = "\improper Starboard (E) Solar Array"
	icon_state = "panelsS"

/area/station/external_power/solar/southeast
	name = "\improper Starboard Quarter (SE) Solar Array"
	icon_state = "panelsAS"

/area/station/external_power/solar/south
	name = "\improper Aft (S) Solar Array"
	icon_state = "yellow"

/area/station/external_power/solar/southwest
	name = "\improper Port Quarter (SW) Solar Array"
	icon_state = "panelsAP"

/area/station_external_power/solar/west
	name = "\improper Port (W) Solar Array"
	icon_state = "panelsP"

/area/station_external_power/solar/northwest
	name = "\improper Port Bow (NW) Solar Array"
	icon_state = "panelsFP"


//-- Geothermal Stations --//
// We're on a planet not a ship, cardinal directions apply

/area/station/external_power/geothermal
	name = "Geothermal Station Areas"
	icon_state = ""
	ambient_buzz = null // Stillness
	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_ENVIRONMENT_FOREST
	area_flags = FLORA_ALLOWED
	uses_daylight = TRUE

/area/station/external_power/geothermal/north
	name = "\improper Geothermal Station North"
	icon_state = "yellow"

/area/station/external_power/geothermal/northeast
	name = "\improper Geothermal Station Northwest"
	icon_state = "panelsA"

/area/station/external_power/geothermal/east
	name = "\improper Geothermal Station East"
	icon_state = "panelsS"

/area/station/external_power/geothermal/southeast
	name = "\improper Geothermal Station Southeast"
	icon_state = "panelsAS"

/area/station/external_power/geothermal/south
	name = "\improper Geothermal Station South"
	icon_state = "yellow"

/area/station/external_power/geothermal/southwest
	name = "\improper Geothermal Station Southwest"
	icon_state = "panelsAP"

/area/station_external_power/geothermal/west
	name = "\improper Geothermal Station West"
	icon_state = "panelsP"

/area/station_external_power/geothermal/northwest
	name = "\improper Geothermal Station Northwest"
	icon_state = "panelsFP"
