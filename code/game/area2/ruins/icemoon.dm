/area/ruins/icemoon
	name = "Icemoon Ruin Areas"
	icon_state = ""

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE

/area/ruins/icemoon/generic
	name = "\improper Unidentified Location"


//Syndicate Icemoon

/area/ruins/icemoon/syndicate_icemoon
	name = "Syndicate Research Outpost"
	icon_state = "dk_yellow"

/area/ruins/icemoon/syndicate_icemoon/security
	name = "Syndicate Research Outpost Security"

/area/ruins/icemoon/syndicate_icemoon/research
	name = "Syndicate Research Outpost Research Wing"

/area/ruins/icemoon/syndicate_icemoon/hallway
	name = "Syndicate Research Outpost Central Hallway"

/area/ruins/icemoon/syndicate_icemoon/command
	name = "Syndicate Research Outpost Command"

/area/ruins/icemoon/syndicate_icemoon/engine
	name = "Syndicate Research Outpost Engineering"

/area/ruins/icemoon/syndicate_icemoon/reactor
	name = "Syndicate Research Outpost Power Station"

/area/ruins/icemoon/syndicate_icemoon/dorms
	name = "Syndicate Research Outpost Dormitories"

/area/ruins/icemoon/syndicate_icemoon/canteen
	name = "Syndicate Research Outpost Canteen"

/area/ruins/icemoon/syndicate_icemoon/medical
	name = "Syndicate Research Outpost Medical Bay"

/area/ruins/icemoon/syndicate_icemoon/warehouse
	name = "Syndicate Research Outpost Warehouse"

/area/ruins/icemoon/syndicate_icemoon/shed
	name = "Syndicate Research Outpost Shed"

/area/ruins/icemoon/syndicate_icemoon/xenobio
	name = "Syndicate Research Outpost Xenobiology"
	xenobiology_compatible = TRUE

/area/ruins/icemoon/syndicate_icemoon/maintenance
	name = "Syndicate Research Outpost Maintenance"


//-- Powered --//

/area/ruins/icemoon/powered
	name = "Powered Ruin Areas"
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

/area/ruins/icemoon/powered/icemoon_hermit
	name = "\improper Unidentified Structure"
	ambience_index = NONE // Not creepy
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruins/icemoon/powered/alien_lab
	name = "\improper Unidentified Structure"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED


//-- Unpowered --//

/area/ruins/icemoon/unpowered
	name = "Unpowered Ruin Areas"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/icemoon/unpowered/generic
	name = "\improper Unidentified Location"

/area/ruins/icemoon/unpowered/buried_library
	name = "\improper Buried Library"
