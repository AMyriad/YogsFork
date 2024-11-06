/area/ruins/jungleland
	name = "JUNGLELAND RUIN AREAS"
	icon_state = ""

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE


/area/ruins/jungleland/generic
	name = "\improper Unidentified Location"

//-- Powered --//

/area/ruins/jungleland/powered
	name = "POWERED RUIN AREAS"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/jungleland/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/jungleland/powered/sinden
	name = "\improper Den of Sin"


//-- Unpowered --//

/area/ruins/jungleland/unpowered
	name = "UNPOWERED RUIN AREAS"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/jungleland/unpowered/generic
	name = "\improper Unidentified Location"

/area/ruins/jungleland/unpowered/ivymen
	name = "\improper Unidentified Nest"
	uses_daylight = TRUE

/area/ruins/jungleland/unpowered/tar_temple
	name = "\improper Unidentified Structure"
	area_flags = NOTELEPORT
