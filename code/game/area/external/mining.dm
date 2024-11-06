/area/external/mining
	name = "MINING AREAS"
	icon_state = "mining"
	
	lighting_colour_tube = "#ffe8d2"
	lighting_colour_bulb = "#ffdcb7"

	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE


/area/external/mining/survival_pod
	name = "\improper Emergency Shelter"
	icon_state = "mining_survival_pod"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	static_lighting = TRUE
	requires_power = FALSE
	mining_speed = FALSE


//-- Shaft Miner Mining Base -//

/area/external/mining/base
	name = "MINING BASE AREAS"
	icon_state = "base"
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/external/mining/base/main
	name = "\improper Mining Base Central Hall"
	icon_state = "base_main"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/external/mining/base/eva_north
	name = "\improper Mining Base EVA North"
	icon_state = "base_eva_north"

/area/external/mining/base/eva_south
	name = "\improper Mining Base EVA South"
	icon_state = "base_eva_south"

/area/external/mining/base/infirmary
	name = "\improper Mining Base Infirmary"
	icon_state = "base_infirmary"

/area/external/mining/base/life_support
	name = "\improper Mining Base Life Support"
	icon_state = "base_life_support"
	lighting_colour_tube = "#edfdff"
	lighting_colour_bulb = "#dafffd"

/area/external/mining/base/breakroom
	name = "\improper Mining Base Break Room"
	icon_state = "base_breakroom"

/area/external/mining/base/refinery
	name = "\improper Mining Base Refinery"
	icon_state = "base_refinery"

/area/external/mining/base/restrooms
	name = "\improper Mining Base Restrooms"
	icon_state = "base_restrooms"

/area/external/mining/base/quarters
	name = "\improper Mining Base Quarters"
	icon_state = "base_quarters"

/area/external/mining/base/vacant
	name = "\improper Mining Base Vacant Room"
	icon_state = "base_vacant"

/area/external/mining/base/maintenance
	name = "\improper Mining Base Storage Maintenance"
	icon_state = "base_maint"


//-- Labor Camp/Gulag --//

/area/external/mining/labor
	name = "LABOR CAMP AREAS"
	icon_state = "labor"

/area/external/mining/labor/main
	name = "\improper Labor Camp"
	icon_state = "labor_main"

/area/external/mining/labor/security
	name = "\improper Labor Camp Security Desk"
	icon_state = "labor_sec"
	airlock_wires = /datum/wires/airlock/security
	ambience_index = AMBIENCE_DANGER


//-- Lavaland --//

/area/external/mining/lavaland
	name = "LAVALAND AREAS"
	icon_state = "lavaland"

	ambience_index = AMBIENCE_MINING
	ambient_buzz = 'sound/ambience/magma.ogg'
	ambient_buzz_vol = 10

	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	poweralm = FALSE

	flags_1 = NONE
	outdoors = TRUE

// IMPORTANT! COMMENTS HERE APPLY TO ALL MINING AREAS!
// Put this in safe "discovered" areas where we don't want map generation like outside ruins/buildings and lava rivers
/area/external/mining/lavaland/explored
	name = "\improper Lavaland Wastes"
	icon_state = "lavaland_explored"

// Special type for area in proximity to the labor camp, place on every normal ground turf up until you meet a wall/lava
/area/external/mining/lavaland/explored/labor
	name = "\improper Labor Camp Grounds"
	icon_state = "lavaland_explored_labor"

// Put this in areas where we don't want megafauna, ruins, or useful flora to spawn like near the labor camp
/area/external/mining/lavaland/unexplored_light
	name = "\improper Lavaland Wastes"
	icon_state = "lavaland_unexplored_light"
	area_flags = CAVES_ALLOWED | MOB_SPAWN_ALLOWED

// Standard unexplored danger zone
/area/external/mining/lavaland/unexplored
	name = "\improper Lavaland Wastes"
	icon_state = "lavaland_unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/lavaland


//-- Icemoon --//

/area/external/mining/icemoon
	name = "ICEMOON AREAS"
	icon_state = "icemoon"

	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_ENVIRONMENT_FOREST
	ambient_buzz = null // Stillness

	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	poweralm = FALSE

	flags_1 = NONE
	area_flags = FLORA_ALLOWED
	outdoors = TRUE

/area/external/mining/icemoon/surface //- SURFACE
	name = "Surface Areas"
	uses_daylight = TRUE
	daylight_multiplier = 0.7

/area/external/mining/icemoon/surface/explored
	name = "\improper Icemoon Wastes"
	icon_state = "icemoon_surface_explored"
	area_flags = NONE

/area/external/mining/icemoon/surface/unexplored
	name = "\improper Icemoon Wastes"
	icon_state = "icemoon_surface_unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon/surface

/area/external/mining/icemoon/underground //- UNDERGROUND
	name = "Underground Areas"

/area/external/mining/icemoon/underground/explored
	name = "\improper Icemoon Subterranean Wastes"
	icon_state = "icemoon_underground_explored"

/area/external/mining/icemoon/underground/explored/labor
	name = "\improper Labor Camp Grounds"
	icon_state = "icemoon_explored_labor"
	area_flags = NONE

/area/external/mining/icemoon/underground/unexplored
	name = "\improper Icemoon Subterranean Wastes"
	icon_state = "icemoon_underground_unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon


//-- Jungleland --//

/area/external/mining/jungleland
	name = "JUNGLELAND AREAS"
	icon_state = "jungleland"

	//ambience_index = AMBIENCE_JUNGLE // One day...
	sound_environment = SOUND_ENVIRONMENT_FOREST

	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	poweralm = FALSE

	flags_1 = NONE
	outdoors = TRUE

	static_lighting = TRUE
	uses_daylight = TRUE

/area/external/mining/jungleland/pregen // Used in biome gen
	name = "Pregen Space"
	icon_state = "jungleland_pregen"
	map_generator = /datum/map_generator/jungleland
	base_lighting_alpha = 255

/area/external/mining/jungleland/explored
	name = "\improper Jungle Wilderness"
	icon_state = "jungleland_explored"

// Note that jungleland uses a different map gen system than icemoon and lavaland (see JungleGen.dm) so same vars and flags do not apply
/area/external/mining/jungleland/unexplored
	name = "\improper Jungle Wilderness"
	icon_state = "jungleland_unexplored"

/area/external/mining/jungleland/unexplored/dying_forest
	name = "\improper Dying Forest"
	icon_state = "jungleland_dying_forest"

/area/external/mining/jungleland/unexplored/toxic_pit
	name = "\improper Toxic Pits"
	icon_state = "jungleland_toxic_pit"

/area/external/mining/jungleland/unexplored/dry_swamp
	name = "\improper Dry Swamps"
	icon_state = "jungleland_dry_swamp"

/area/external/mining/jungleland/unexplored/tar_wastes
	name = "\improper Tar-Infested Wastes"
	icon_state = "jungleland_tar_wastes"
