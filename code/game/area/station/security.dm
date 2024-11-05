/area/station/security
	name = "Security Areas"
	icon_state = "sec"
	minimap_color = "#b12527"
	airlock_wires = /datum/wires/airlock/security

	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_STANDARD_STATION

	lighting_colour_tube = "#ffeee2"
	lighting_colour_bulb = "#ffdfca"


/area/station/security/main
	name = "\improper Brig"
	icon_state = "sec_main"

/area/station/security/main/upper
	name = "\improper Upper Brig"
	icon_state = "sec_main_up"

/area/station/security/main/lower
	name = "\improper Lower Brig"
	icon_state = "sec_main_low"

/area/station/security/office
	name = "\improper Security Office"
	icon_state = "sec_office"

/area/station/security/interrogation
	name = "\improper Interrogation Room"
	icon_state = "sec_interrogation"

/area/station/security/firing_range
	name = "\improper Brig Firing Range"
	icon_state = "sec_firing_range"

/area/station/security/warden
	name = "\improper Warden's Office"
	icon_state = "sec_warden"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/security/detective
	name = "\improper Detective's Office"
	icon_state = "sec_detective"
	ambientsounds = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/station/security/courtroom
	name = "\improper Courtroom"
	icon_state = "sec_courtroom"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/security/infirmary
	name = "\improper Brig Infirmary"
	icon_state = "sec_infirmary"

/area/station/security/infirmary/office
	name = "\improper Brig Physician's Office"
	icon_state = "sec_infirmary_office"


//-- Prison and Detention Rooms --//

/area/station/security/detention
	name = "Detention Areas"
	icon_state = "sec_det"
	minimap_color = "#530505"
	lights_always_start_on = TRUE

/area/station/security/detention/prison
	name = "\improper Prison Wing"
	icon_state = "sec_det_prison"

/area/station/security/detention/prison_hallway
	name = "\improper Prison Wing Hallway"
	icon_state = "sec_det_prison_hallway"

/area/station/security/detention/execution
	name = "\improper Prisoner Transfer Centre"
	icon_state = "sec_det_kill"
	lights_always_start_on = FALSE

/area/station/security/detention/execution/reeducation
	name = "\improper Prisoner Re-Education Chamber"

/area/station/security/detention/labor_dock
	name = "\improper Labor Shuttle Dock"
	icon_state = "sec_det_labor_dock"


//-- Security Posts --//

/area/station/security/post
	name = "Security Post Areas"

/area/station/security/post/arrivals
	name = "\improper Arrivals Security Post"
	icon_state = "sec_post_arr"

/area/station/security/post/departures
	name = "\improper Departures Security Post"
	icon_state = "sec_post_dep"

/area/station/security/post/engineering
	name = "\improper Engineering Security Post"
	icon_state = "sec_post_eng"

/area/station/security/post/medical
	name = "\improper Medical Security Post"
	icon_state = "sec_post_med"

/area/station/security/post/science
	name = "\improper Science Security Post"
	icon_state = "sec_post_sci"

/area/station/security/post/service
	name = "\improper Service Security Post"
	icon_state = "sec_post_srv"

/area/station/security/post/supply
	name = "\improper Supply Security Post"
	icon_state = "sec_post_sup"
