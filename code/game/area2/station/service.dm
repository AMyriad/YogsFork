/area/station/service
	name = "Service Areas"
	icon_state = "Theatre"
	minimap_color = "#5ac866"
	airlock_wires = /datum/wires/airlock/service

	sound_environment = SOUND_AREA_SMALL_ENCLOSED

	lights_always_start_on = FALSE

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
	lighting_colour_tube = "#fff4d6"
	lighting_colour_bulb = "#ffebc1"

/area/station/service/kitchen/freezer
	name = "\improper Kitchen Freezer"
	icon_state = "kitchen_cold"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/station/service/bar
	name = "\improper Bar"
	icon_state = "bar"
	mood_bonus = 5
	mood_message = span_nicegreen("I love being in the bar!\n")
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/janitor
	name = "\improper Custodial Closet"
	icon_state = "janitor"
	minimap_color = "#cc00ff"

/area/station/service/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/service/theatre
	name = "\improper Theatre"
	icon_state = "Theatre"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/library
	name = "\improper Library"
	icon_state = "library"
	flags_1 = NONE
	lighting_colour_tube = "#fff1cc"
	lighting_colour_bulb = "#ffe9b9"

/area/station/service/chapel
	name = "\improper Chapel"
	icon_state = "chapel"
	flags_1 = NONE
	ambience_index = AMBIENCE_HOLY
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "The consecration here prevents you from warping in."

/area/station/service/chapel/office
	name = "\improper Chapel Office"
	icon_state = "chapeloffice"

/area/station/service/law_office
	name = "\improper Law Office"
	icon_state = "law"
	minimap_color = "#b12527"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/service/gift_shop
	name = "\improper Gift Shop"
	icon_state = "cafeteria"
