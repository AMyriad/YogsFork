/area/station/public
	name = "Public Areas"
	icon_state = "pub"
	minimap_color = "#8d8c68"

	sound_environment = SOUND_AREA_STANDARD_STATION

	lights_always_start_on = TRUE
	lighting_colour_tube = "#fdf3ea"
	lighting_colour_bulb = "#ffebd6"

/area/station/public/arrivals
	name = "\improper Arrivals Hallway"
	icon_state = "pub_arrivals"

/area/station/public/departures
	name = "\improper Departures Hallway"
	icon_state = "pub_departures"

/area/station/public/departures/lounge
	name = "\improper Departures Lounge"


//-- Hallways --//
// Keep order going clockwise from north pls ty

/area/station/public/hallway
	name = "Primary Hallway Areas"
	icon_state = "pub_hallway"

/area/station/public/hallway/central
	name = "\improper Central Primary Hallway"
	icon_state = ""

/area/station/public/hallway/central/command
	name = "\improper Command Hallway"
	icon_state = ""

/area/station/public/hallway/north
	name = "\improper Fore (N) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/northeast
	name = "\improper Starboard Bow (NE) Maintenance"
	icon_state = ""

/area/station/public/hallway/east
	name = "\improper Starboard (E) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/southeast
	name= "\improper Starboard Quarter (SE) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/south
	name = "\improper Aft (S) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/southwest
	name = "\improper Port Quarter (SW) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/west
	name = "\improper Port (W) Primary Hallway"
	icon_state = ""

/area/station/public/hallway/northwest
	name = "\improper Port Bow (NW) Primary Hallway"
	icon_state = ""


//-- Misc and Recreational --//

/area/station/public/misc
	name = "Miscellaneous Areas"
	icon_state = "pub_misc"
	minimap_color = "#f8ff83"
	lights_always_start_on = TRUE

/area/station/public/misc/dorms
	name = "\improper Dormitories"
	icon_state = "pub_misc_dorms"
	minimap_color = "#b0e1ff"
	safe = TRUE

/area/station/public/misc/cryo
	name = "\improper Cryosleep Room"
	icon_state = "pub_misc_cryo"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"
	safe = TRUE

/area/station/public/misc/locker
	name = "\improper Locker Room"
	icon_state = "pub_misc_locker"
	minimap_color = "#766e97"

/area/station/public/misc/fitness
	name = "\improper Fitness Room"
	icon_state = "pub_misc_fitness"

/area/station/public/misc/garden
	name = "\improper Garden"
	icon_state = "pub_misc_garden"
	mood_bonus = 3
	mood_message = span_nicegreen("I love being in the garden!\n")

/area/station/public/misc/restrooms
	name = "\improper Restrooms"
	icon_state = "pub_misc_restrooms"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/station/public/misc/restrooms/dorms
	name = "\improper Dormitory Restrooms"

/area/station/public/misc/restrooms/locker
	name = "\improper Locker Room Restrooms"
	minimap_color = "#766e97"

/area/station/public/misc/restrooms/aux
	name = "\improper Auxiliary Restrooms"

/area/station/public/misc/restrooms/skibidi // Kill me
	name = "\improper Skibidi Restrooms"
	icon_state = "pub_misc_killme"
	ambience_index = AMBIENCE_DANGER
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS
	ambientsounds = 'yogstation/sound/misc/honk_echo_distant.ogg'
	valid_territory = FALSE

/area/station/public/misc/pod_bay
	name = "\improper Space Pod Bay"
	icon_state = "pub_misc_podbay"

/area/station/public/misc/shipbreak_staging
	name = "\improper Shipbreaking Staging Area"
	icon_state = "pub_misc_shipbreak_staging"

/area/station/public/misc/shipbreak_zone
	name = "\improper Shipbreaking Field"
	icon_state = "pub_misc_shipbreak_zone"


//-- Storage --//

/area/station/public/storage
	name = "Storage Areas"
	icon_state = "pub_storage"
	minimap_color = "#f8ff83"
	lights_always_start_on = TRUE

/area/station/public/storage/tool_primary
	name = "\improper Primary Tool Storage"
	icon_state = "pub_storage_tool_primary"

/area/station/public/storage/tool_aux
	name = "\improper Auxiliary Tool Storage"
	icon_state = "pub_storage_tool_aux"

/area/station/public/storage/art
	name = "\improper Art Supplies Storage"
	icon_state = "pub_storage_art"


//-- Vacant Rooms --//

/area/station/public/vacant
	name = "Vacant Areas"
	icon_state = "pub_vacant"
	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/public/vacant/room
	name = "\improper Vacant Room"
	minimap_color = "#4f4e3a"

/area/station/public/vacant/office
	name = "\improper Vacant Office"

/area/station/public/vacant/commissary
	name = "\improper Vacant Commissary"
