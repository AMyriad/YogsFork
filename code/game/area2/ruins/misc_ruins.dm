/area/ruins
	name = "Ruins Areas"
	icon_state = "away"

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE

/area/external/ruins/powered
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/external/ruins/unpowered
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/external/ruins/desolate // Unpowered + no gravity
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	has_gravity = FALSE
