/area/station/public
	name = "Public Areas"
	minimap_color = "#8d8c68"

	sound_environment = SOUND_AREA_STANDARD_STATION

	lights_always_start_on = TRUE
	lighting_colour_tube = "#fdf3ea"
	lighting_colour_bulb = "#ffebd6"

/area/station/public/arrivals
	name = "\improper Arrivals Hallway"
	icon_state = "entry"

/area/station/public/departures
	name = "\improper Departures Hallway"
	icon_state = "escape"

/area/station/public/departures/lounge
	name = "\improper Departures Lounge"
	icon_state = "escape_lounge"


//-- Hallways --//
// Keep order going clockwise from north pls ty

/area/station/public/hallway
	name = "Primary Hallway Areas"
	icon_state = "hallC"

/area/station/public/hallway/central
	name = "\improper Central Primary Hallway"
	icon_state = "hallC"

/area/station/public/hallway/central/command
	name = "\improper Command Hallway"
	icon_state = "bridge_hallway"

/area/station/public/hallway/north
	name = "\improper Fore (N) Primary Hallway"
	icon_state = "hallF"

/area/station/public/hallway/northeast
	name = "\improper Starboard Bow (NE) Maintenance"
	icon_state = "fsmaint"

/area/station/public/hallway/east
	name = "\improper Starboard (E) Primary Hallway"
	icon_state = "hallS"

/area/station/public/hallway/southeast
	name= "\improper Starboard Quarter (SE) Primary Hallway"
	icon_state = "hallAS"

/area/station/public/hallway/south
	name = "\improper Aft (S) Primary Hallway"
	icon_state = "hallA"

/area/station/public/hallway/southwest
	name = "\improper Port Quarter (SW) Primary Hallway"
	icon_state = "apmaint"

/area/station/public/hallway/west
	name = "\improper Port (W) Primary Hallway"
	icon_state = "hallP"

/area/station/public/hallway/northwest
	name = "\improper Port Bow (NW) Primary Hallway"
	icon_state = "fpmaint"


//-- Misc and Recreational --//

/area/station/public/misc
	name = "Miscellaneous Areas"
	icon_state = ""
	minimap_color = "#f8ff83"
	lights_always_start_on = TRUE

/area/station/public/misc/dorms
	name = "\improper Dormitories"
	icon_state = "Sleep"
	minimap_color = "#b0e1ff"
	safe = TRUE

/area/station/public/misc/cryo
	name = "\improper Cryosleep Room"
	icon_state = "cryopod"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"
	safe = TRUE

/area/station/public/misc/locker
	name = "\improper Locker Room"
	icon_state = "locker"
	minimap_color = "#766e97"

/area/station/public/misc/fitness
	name = "\improper Fitness Room"
	icon_state = "fitness"

/area/station/public/misc/garden
	name = "\improper Garden"
	icon_state = "garden"
	mood_bonus = 3
	mood_message = span_nicegreen("I love being in the garden!\n")

/area/station/public/misc/restrooms
	name = "\improper Restrooms"
	icon_state = "toilet"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/station/public/misc/restrooms/dorms
	name = "\improper Dormitory Restrooms"
	icon_state = "toilet"

/area/station/public/misc/restrooms/locker
	name = "\improper Locker Room Restrooms"
	icon_state = "toilet"
	minimap_color = "#766e97"

/area/station/public/misc/restrooms/aux
	name = "\improper Auxiliary Restrooms"
	icon_state = "toilet"

/area/station/public/misc/restrooms/skibidi // Kill me
	name = "\improper Skibidi Restrooms"
	icon_state = "toilet"
	ambience_index = AMBIENCE_DANGER
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS
	ambientsounds = 'yogstation/sound/misc/honk_echo_distant.ogg'
	valid_territory = FALSE

/area/station/public/misc/pod_bay
	name = "\improper Space Pod Bay"
	icon_state = "fitness"

/area/station/public/misc/shipbreak_staging
	name = "\improper Shipbreaking Staging Area"
	icon_state = "fitness"

/area/station/public/misc/shipbreak_zone
	name = "\improper Shipbreaking Field"
	icon_state = "fitness"


//-- Storage --//

/area/station/public/storage
	name = "Storage Areas"
	icon_state = ""
	minimap_color = "#f8ff83"
	lights_always_start_on = TRUE

/area/station/public/storage/tool_primary
	name = "\improper Primary Tool Storage"
	icon_state = "primarystorage"

/area/station/public/storage/tool_aux
	name = "\improper Auxiliary Tool Storage"
	icon_state = "storage"

/area/station/public/storage/art
	name = "\improper Art Supplies Storage"
	icon_state = "storage"


//-- Vacant Rooms --//

/area/station/public/vacant
	name = "Vacant Areas"
	icon_state = ""
	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/public/vacant/room
	name = "\improper Vacant Room"
	icon_state = "vacant_room"
	minimap_color = "#4f4e3a"

/area/station/public/vacant/office
	name = "\improper Vacant Office"
	icon_state = "vacant_office"

/area/station/public/vacant/commissary
	name = "\improper Vacant Commissary"
	icon_state = "vacant_commissary"
