
//Solars

/area/solar
	valid_territory = FALSE
	blob_allowed = FALSE
	mining_speed = TRUE
	flags_1 = NONE
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_SPACE
	lights_always_start_on = TRUE
	minimap_color = "#6b6b6b"
	airlock_wires = /datum/wires/airlock/engineering

/area/solar/fore
	name = "Fore (N) Solar Array"
	icon_state = "yellow"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/solar/aft
	name = "Aft (S) Solar Array"
	icon_state = "yellow"

/area/solar/aux/port
	name = "Port Bow (NW) Auxiliary Solar Array"
	icon_state = "panelsA"

/area/solar/aux/starboard
	name = "Starboard Bow (NE) Auxiliary Solar Array"
	icon_state = "panelsA"

/area/solar/starboard
	name = "Starboard (E) Solar Array"
	icon_state = "panelsS"

/area/solar/starboard/aft
	name = "Starboard Quarter (SE) Solar Array"
	icon_state = "panelsAS"

/area/solar/starboard/aft/icemoon
	name = "Southeast (SE) Geothermal Station" // it's a planetary station and not a ship, cardinal directions apply
	uses_daylight = TRUE

/area/solar/starboard/fore
	name = "Starboard Bow (NE) Solar Array"
	icon_state = "panelsFS"

/area/solar/starboard/fore/icemoon
	name = "Northeast (NE) Geothermal Station"
	uses_daylight = TRUE

/area/solar/port
	name = "Port (W) Solar Array"
	icon_state = "panelsP"

/area/solar/port/aft
	name = "Port Quarter (SW) Solar Array"
	icon_state = "panelsAP"

/area/solar/port/aft/icemoon
	name = "Southwest (SW) Geothermal Station"
	uses_daylight = TRUE

/area/solar/port/fore
	name = "Port Bow (NW) Solar Array"
	icon_state = "panelsFP"

/area/solar/port/fore/icemoon
	name = "Northwest (NW) Geothermal Station"
	uses_daylight = TRUE


