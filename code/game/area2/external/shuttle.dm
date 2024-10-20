/area/external/shuttle
	name = "Shuttle Areas"
	icon_state = "shuttle"

	static_lighting = TRUE
	lights_always_start_on = TRUE
	lighting_colour_tube = "#fff0dd"
	lighting_colour_bulb = "#ffe1c1"

	always_unpowered = FALSE

	unique = FALSE
	has_gravity = STANDARD_GRAVITY
	valid_territory = FALSE // RIP gangs
	area_limited_icon_smoothing = /area/external/shuttle // Loading the same shuttle map at a different time will produce distinct area instances

	/// List of miners & their mining points from gems to be given once all exports are processed, used by supply shuttles
	var/list/gem_payout = list()

/area/external/shuttle/place_on_topReact(list/new_baseturfs, turf/fake_turf_type, flags)
	. = ..()
	if(length(new_baseturfs) > 1 || fake_turf_type)
		return // More complicated larger changes indicate this isn't a player
	if(ispath(new_baseturfs[1], /turf/open/floor/plating))
		new_baseturfs.Insert(1, /turf/baseturf_skipover/shuttle)

//-- Station Standard Shuttles --//
// Contains crucial shuttles station needs like arrivals, evac, labor, escape pods, etc
// Don't put new areas in this category if you're adding a new custom shuttle

/area/external/shuttle/station
	name = "Station Shuttle Areas"

/area/external/shuttle/station/arrival
	name = "\improper Arrival Shuttle"
	unique = TRUE  // SSjob refers to this area for latejoiners

/area/external/shuttle/station/arrival/on_joining_game(mob/living/boarder)
	if(SSshuttle.arrivals?.mode == SHUTTLE_CALL)
		var/atom/movable/screen/splash/Spl = new(null, boarder.client, TRUE)
		Spl.Fade(TRUE)
		boarder.playsound_local(get_turf(boarder), 'sound/voice/ApproachingTG.ogg', 25)
	boarder.update_parallax_teleport()

/area/external/shuttle/station/escape
	name = "\improper Emergency Shuttle"
	area_limited_icon_smoothing = /area/external/shuttle/station/escape

/area/external/shuttle/station/escape/backup
	name = "\improper Backup Emergency Shuttle"

/area/external/shuttle/station/escape/pod_1
	name = "\improper Escape Pod One"
	area_flags = NONE

/area/external/shuttle/station/escape/pod_2
	name = "\improper Escape Pod Two"
	area_flags = NONE

/area/external/shuttle/station/escape/pod_3
	name = "\improper Escape Pod Three"
	area_flags = NONE

/area/external/shuttle/station/escape/pod_4
	name = "\improper Escape Pod Four"
	area_flags = NONE

/area/external/shuttle/station/mining
	name = "\improper Mining Shuttle"
	blob_allowed = FALSE

/area/external/shuttle/station/labor
	name = "\improper Labor Camp Shuttle"
	blob_allowed = FALSE

/area/external/shuttle/station/supply
	name = "\improper Supply Shuttle"
	blob_allowed = FALSE
	area_flags = NOTELEPORT

// Emergency response teams and deathsquads
/area/external/shuttle/station/centcom_transport
	name = "\improper Transport Shuttle"
	blob_allowed = FALSE

/area/external/shuttle/station/ai
	name = "\improper AI Satellite Shuttle"
	blob_allowed = FALSE


//-- Debug Shuttles --//

/area/external/shuttle/debug
	name = "Debug Shuttle Areas"

/area/external/shuttle/debug/transit
	name = "Bluespace"
	desc = "Weeeeee"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/external/shuttle/debug/custom
	name = "\improper Custom Shuttle"

/area/external/shuttle/debug/custom_powered
	name = "\improper Custom Powered Shuttle"
	requires_power = FALSE


//-- Custom Evac Shuttles --//
// IMPORTANT! Separated from station shuttles for sake of readability but has same parents, so put yo custom shuttles here dawg

/area/external/shuttle/station/escape/custom
	name = "Custom Emergency Shuttle Areas"

/area/external/shuttle/station/escape/custom/luxury
	name = "\improper Luxurious Emergency Shuttle"
	area_flags = NOTELEPORT

/area/external/shuttle/station/escape/custom/arena
	name = "The Arena"
	area_flags = NOTELEPORT

/area/external/shuttle/station/escape/custom/meteor
	name = "\proper a meteor with engines strapped to it"
	luminosity = NONE


//-- Misc Shuttles --//
// For anything that doesn't fit into other categories or is part of an antagonist/gamemode like nuke ops, hunters, and space pirates

/area/external/shuttle/misc
	name = "Miscellaneous Shuttle Areas"

/area/external/shuttle/misc/nukeop_dropship
	name = "\improper Syndicate Dropship"
	ambience_index = AMBIENCE_DANGER
	blob_allowed = FALSE
	area_limited_icon_smoothing = /area/external/shuttle/misc/nukeop_dropship

/area/external/shuttle/misc/assault_pod
	name = "Steel Rain"
	blob_allowed = FALSE

/area/external/shuttle/misc/space_pirate
	name = "\improper Pirate Shuttle"
	blob_allowed = FALSE
	requires_power = TRUE

/area/external/shuttle/misc/fugitive_hunter
	name = "\improper Hunter Shuttle"
	blob_allowed = FALSE


//-- Ruins Shuttles --//

/area/external/shuttle/ruins
	name = "Ruins Shuttle Areas"
	area_flags = NOTELEPORT
	blob_allowed = FALSE
	requires_power = TRUE

/area/external/shuttle/ruins/whiteship
	name = "\improper Abandoned Ship"
	area_limited_icon_smoothing = /area/external/shuttle/ruins/whiteship

/area/external/shuttle/ruins/freeminer
	name = "\improper Frontiersfolk Ship"
	area_limited_icon_smoothing = /area/external/shuttle/ruin/freeminer

/area/external/shuttle/ruins/fighter_syndicate
	name = "\improper Syndicate Fighter"

/area/external/shuttle/ruins/dropship_syndicate
	name = "\improper Syndicate Dropship"

/area/external/shuttle/ruins/pirate_cutter
	name = "\improper Pirate Cutter"

/area/external/shuttle/ruins/freighter_small
	name = "\improper Small Freighter"

/area/external/shuttle/ruins/freighter_medium
	name = "\improper Freighter"

/area/external/shuttle/ruins/freighter_large
	name = "\improper Large Freighter"
