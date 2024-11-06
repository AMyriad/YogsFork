/area/station/service
	name = "SERVICE AREAS"
	icon_state = "srv"
	minimap_color = "#5ac866"
	airlock_wires = /datum/wires/airlock/service

	sound_environment = SOUND_AREA_SMALL_ENCLOSED

	lights_always_start_on = FALSE


/area/station/service/main
	name = "\improper Service Hall"
	icon_state = "srv_main"

/area/station/service/main/upper
	name = "\improper Upper Service Hall"
	icon_state = "srv_main_up"

/area/station/service/main/lower
	name = "\improper Lower Service Hall"
	icon_state = "srv_main_low"

/area/station/service/kitchen
	name = "\improper Kitchen"
	icon_state = "srv_kitchen"
	lighting_colour_tube = "#fff4d6"
	lighting_colour_bulb = "#ffebc1"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/service/kitchen/freezer
	name = "\improper Kitchen Freezer"
	icon_state = "srv_kitchen_freezer"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/station/service/bar
	name = "\improper Bar"
	icon_state = "srv_bar"
	mood_bonus = 5
	mood_message = span_nicegreen("I love being in the bar!\n")
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/bar/Initialize(mapload)
	. = ..()
	GLOB.bar_areas += src

/area/station/service/janitor
	name = "\improper Custodial Closet"
	icon_state = "srv_janitor"
	minimap_color = "#cc00ff"

/area/station/service/hydroponics
	name = "\improper Hydroponics"
	icon_state = "srv_hydroponics"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/service/theatre
	name = "\improper Theatre"
	icon_state = "srv_theatre"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/library
	name = "\improper Library"
	icon_state = "srv_library"
	sound_environment = SOUND_AREA_WOODFLOOR
	lighting_colour_tube = "#fff1cc"
	lighting_colour_bulb = "#ffe9b9"
	flags_1 = NONE

/area/station/service/chapel
	name = "\improper Chapel"
	icon_state = "srv_chapel"
	flags_1 = NONE
	ambience_index = AMBIENCE_HOLY
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "The consecration here prevents you from warping in."

/area/station/service/chapel/office
	name = "\improper Chapel Office"
	icon_state = "srv_chapel_office"

/area/station/service/law_office
	name = "\improper Law Office"
	icon_state = "srv_law_office"
	minimap_color = "#b12527"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/service/gift_shop
	name = "\improper Gift Shop"
	icon_state = "srv_gift_shop"
