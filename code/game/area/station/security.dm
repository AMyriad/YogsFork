/area/station/security
	name = "Security Areas"
	icon_state = "security"
	minimap_color = "#b12527"
	airlock_wires = /datum/wires/airlock/security

	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_STANDARD_STATION

	lighting_colour_tube = "#ffeee2"
	lighting_colour_bulb = "#ffdfca"

/area/station/security/main
	name = "\improper Brig"
	icon_state = "brig"

/area/station/security/main/upper
	name = "\improper Upper Brig"
	icon_state = "brig"

/area/station/security/main/lower
	name = "\improper Lower Brig"
	icon_state = "brig"

/area/station/security/office
	name = "\improper Security Office"
	icon_state = "security"

/area/station/security/interrogation
	name = "\improper Interrogation Room"
	icon_state = "security"

/area/station/security/firing_range
	name = "\improper Brig Firing Range"
	icon_state = "firingrange"

/area/station/security/warden
	name = "\improper Warden's Office"
	icon_state = "Warden"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/security/detective
	name = "\improper Detective's Office"
	icon_state = "detective"
	ambientsounds = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/station/security/courtroom
	name = "\improper Courtroom"
	icon_state = "courtroom"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/security/infirmary
	name = "\improper Brig Infirmary"
	icon_state = "brig_infirmary"

/area/station/security/infirmary/office
	name = "\improper Brig Physician's Office"
	icon_state = "physician"


//-- Prison and Detention Rooms --//

/area/station/security/detention
	name = "Detention Areas"
	icon_state = "sec_prison"
	minimap_color = "#530505"
	lights_always_start_on = TRUE

/area/station/security/detention/prison
	name = "\improper Prison Wing"
	icon_state = "sec_prison"

/area/station/security/detention/prison_hallway
	name = "\improper Prison Wing Hallway"

/area/station/security/detention/execution
	name = "\improper Prisoner Transfer Centre"
	icon_state = "execution_room"
	lights_always_start_on = FALSE

/area/station/security/detention/execution/reeducation
	name = "\improper Prisoner Re-Education Chamber"

/area/station/security/detention/labor_shuttle
	name = "\improper Labor Shuttle Dock"
	icon_state = "sec_prison"


//-- Security Posts --//

/area/station/security/post
	name = "Security Post Areas"
	icon_state = "checkpoint1"

/area/station/security/post/arrivals
	name = "\improper Arrivals Security Post"
	icon_state = "checkpoint_aux"

/area/station/security/post/departures
	name = "\improper Departures Security Post"
	icon_state = "checkpoint_esc"

/area/station/security/post/supply
	name = "\improper Supply Security Post"
	icon_state = "checkpoint_supp"

/area/station/security/post/engineering
	name = "\improper Engineering Security Post"
	icon_state = "checkpoint_engi"

/area/station/security/post/medical
	name = "\improper Medical Security Post"
	icon_state = "checkpoint_med"

/area/station/security/post/science
	name = "\improper Science Security Post"
	icon_state = "checkpoint_sci"

/area/station/security/post/service
	name = "\improper Service Security Post"
	icon_state = "checkpoint_srv"
