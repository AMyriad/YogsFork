/area/ruins/icemoon
	name = "ICEMOON RUIN AREAS"
	icon_state = ""

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE


/area/ruins/icemoon/generic
	name = "\improper Unidentified Location"


//-- Powered --//

/area/ruins/icemoon/powered
	name = "POWERED RUIN AREAS"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/icemoon/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/icemoon/powered/walker_village
	name = "\improper Unidentified Encampment"
	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/ruins/icemoon/powered/bathhouse
	name = "\improper Subterranean Bath House"
	ambience_index = NONE // Not creepy
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	mood_bonus = 10
	mood_message = span_nicegreen("This place is like paradise, I don't ever want to leave!\n")

/area/ruins/icemoon/powered/inn
	name = "\improper Inn"
	ambience_index = NONE // Not creepy
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruins/icemoon/powered/inn/shed
	name = "\improper Inn Shed"
	icon_state = "dk_yellow"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruins/icemoon/powered/hermit
	name = "\improper Unidentified Structure"
	ambience_index = NONE // Not creepy
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruins/icemoon/powered/alien_lab
	name = "\improper Unidentified Structure"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED


//-- Unpowered --//

/area/ruins/icemoon/unpowered
	name = "UNPOWERED RUIN AREAS"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/icemoon/unpowered/generic
	name = "\improper Unidentified Location"

/area/ruins/icemoon/unpowered/buried_library
	name = "\improper Buried Library"
