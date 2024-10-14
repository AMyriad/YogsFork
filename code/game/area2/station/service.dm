/area/station/service
	name = "Service Areas"
	icon_state = "Theatre"
	minimap_color = "#5ac866"
	airlock_wires = /datum/wires/airlock/service

	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/service/main
	name = "\improper Service Hall"
	icon_state = "janitor"

/area/station/service/main/upper
	name = "\improper Upper Service Hall"
	icon_state = "janitor"

/area/station/service/main/lower
	name = "\improper Lower Service Hall"
	icon_state = "janitor"

/area/station/service/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/station/service/kitchen/freezer
	name = "\improper Kitchen Freezer Storage"
	icon_state = "kitchen_cold"
	lighting_colour_tube = "#fff4d6"
	lighting_colour_bulb = "#ffebc1"


/area/station/service/bar
	name = "\improper Bar"
	icon_state = "bar"
	mood_bonus = 5
	mood_message = span_nicegreen("I love being in the bar!\n")
	sound_environment = SOUND_AREA_WOODFLOOR

/area/janitor
	name = "Custodial Closet"
	icon_state = "janitor"
	flags_1 = NONE
	minimap_color = "#cc00ff"
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/janitor/a //yogs start added two new areas
	name = "Custodial Closet A"
	icon_state = "janitor"
	flags_1 = NONE

/area/janitor/b
	name = "Custodial Closet B"
	icon_state = "janitor"
	flags_1 = NONE //yogs end added two new areas

/area/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"
	minimap_color = "#5ac866"
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/hydroponics/upper
	name = "Upper Hydroponics"
	icon_state = "hydro"





/area/crew_quarters/theatre
	name = "Theatre"
	icon_state = "Theatre"
	minimap_color = "#5ac866"
	sound_environment = SOUND_AREA_WOODFLOOR
	lights_always_start_on = FALSE

/area/library
	name = "Library"
	icon_state = "library"
	flags_1 = NONE
	minimap_color = "#5ac866"
	lighting_colour_tube = "#fff1cc"
	lighting_colour_bulb = "#ffe9b9"

/area/library/lounge
	name = "Library Lounge"
	icon_state = "library"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/chapel
	icon_state = "chapel"
	ambience_index = AMBIENCE_HOLY
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	flags_1 = NONE
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "The consecration here prevents you from warping in."
	minimap_color = "#5ac866"

/area/chapel/main
	name = "Chapel"

/area/chapel/main/monastery
	name = "Monastery"

/area/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/chapel/asteroid
	name = "Chapel Asteroid"
	icon_state = "explored"
	sound_environment = SOUND_AREA_ASTEROID

/area/chapel/asteroid/monastery
	name = "Monastery Asteroid"

/area/chapel/dock
	name = "Chapel Dock"
	icon_state = "construction"

/area/lawoffice
	name = "Law Office"
	icon_state = "law"
	minimap_color = "#b12527"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

