/area/external/mining
	name = "Mining Areas"
	icon_state = "mining"

	ambient_buzz = 'sound/ambience/magma.ogg'
	ambient_buzz_vol = 10
	
	lighting_colour_tube = "#ffe8d2"
	lighting_colour_bulb = "#ffdcb7"

	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE

//-- Shaft Miner Mining Base -//

/area/external/mining/base
	name = "Mining Base Areas"
	icon_state = ""
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/external/mining/base/main
	name = "\improper Mining Base Central Hall"
	icon_state = "mining_living"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/external/mining/base/eva_north
	name = "\improper Mining Base EVA North"
	icon_state = "mining_eva_secondary"

/area/external/mining/base/eva_south
	name = "\improper Mining Base EVA South"
	icon_state = "mining_eva"

/area/external/mining/base/infirmary
	name = "\improper Mining Base Infirmary"
	icon_state = "mining_infirmary"

/area/external/mining/base/life_support
	name = "\improper Mining Base Life Support"
	icon_state = "mining_engineering"
	lighting_colour_tube = "#edfdff"
	lighting_colour_bulb = "#dafffd"

/area/external/mining/base/break_room
	name = "\improper Mining Base Break Room"
	icon_state = "mining_breakroom"

/area/external/mining/base/refinery
	name = "\improper Mining Base Refinery"
	icon_state = "mining_production"

/area/external/mining/base/restrooms
	name = "\improper Mining Base Restrooms"
	icon_state = "mining_living"

/area/external/mining/base/quarters
	name = "\improper Mining Base Quarters"
	icon_state = "mining_living"

/area/external/mining/base/vacant
	name = "\improper Mining Base Vacant Room"
	icon_state = "mining_vacant"

/area/external/mining/base/maintenance
	name = "\improper Mining Base Storage Maintenance"
	icon_state = "mining_storage"


//-- Labor Camp/Gulag --//

/area/external/mining/labor
	name = "Labor Camp Areas"

/area/external/mining/labor/main
	name = "\improper Labor Camp"
	icon_state = "mining_vacant"

/area/external/mining/labor/security
	name = "\improper Labor Camp Security Desk"
	icon_state = "security"
	airlock_wires = /datum/wires/airlock/security
	ambience_index = AMBIENCE_DANGER


//-- Lavaland --//

/area/external/mining/lavaland
	name = "Lavaland Areas"
	icon_state = ""

	ambience_index = AMBIENCE_MINING
	ambient_buzz = 'sound/ambience/magma.ogg'

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
	icon_state = "explored"

// Special type for area in proximity to the labor camp, place on every normal ground turf up until you meet a wall/lava
/area/external/mining/lavaland/explored/labor
	name = "\improper Labor Camp Grounds"
	icon_state = ""

// Put this in areas where we don't want megafauna and useful flora to spawn like near the labor camp
/area/external/mining/lavaland/light_unexplored
	name = "\improper Lavaland Wastes"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | MOB_SPAWN_ALLOWED

// Standard unexplored danger zone
/area/external/mining/lavaland/unexplored
	name = "\improper Lavaland Wastes"
	icon_state = "danger"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/lavaland


//-- Icemoon --//

/area/external/mining/icemoon
	name = "Icemoon Areas"
	icon_state = ""

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
	blob_allowed = FALSE
	area_flags = FLORA_ALLOWED
	outdoors = TRUE

/area/external/mining/icemoon/surface //- SURFACE
	name = "Surface Areas"
	icon_state = ""
	uses_daylight = TRUE
	daylight_multiplier = 0.7

/area/external/mining/icemoon/surface/explored
	name = "\improper Icemoon Wastes"
	icon_state = "explored"
	area_flags = NONE

/area/external/mining/icemoon/surface/unexplored
	name = "\improper Icemoon Wastes"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon/surface

/area/external/mining/icemoon/underground //- UNDERGROUND
	name = "Underground Areas"
	icon_state = ""

/area/external/mining/icemoon/underground/explored
	name = "\improper Icemoon Subterranean Wastes"
	icon_state = "explored"

/area/external/mining/icemoon/underground/explored/labor
	name = "\improper Labor Camp Grounds"
	area_flags = NONE

/area/external/mining/icemoon/underground/unexplored
	name = "\improper Icemoon Subterranean Wastes"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon


//-- Jungleland --//

/area/external/mining/jungleland
	name = "Jungleland Areas"
	icon_state = ""

	//ambience_index = AMBIENCE_JUNGLE // One day...
	sound_environment = SOUND_ENVIRONMENT_FOREST

	always_unpowered = TRUE
	requires_power = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	poweralm = FALSE

	flags_1 = NONE
	blob_allowed = FALSE
	outdoors = TRUE

	static_lighting = TRUE
	uses_daylight = TRUE

/area/external/mining/jungleland/explored
	name = "\improper Jungle Wilderness"
	icon_state = ""

// Note that jungleland uses a different map gen system than icemoon and lavaland (see JungleGen.dm) so same vars and flags do not apply
/area/external/mining/jungleland/unexplored
	name = "\improper Jungle Wilderness"
	icon_state = ""

/area/external/mining/jungleland/unexplored/dying_forest
	name = "\improper Dying Forest"
	icon_state = ""

/area/external/mining/jungleland/unexplored/toxic_pit
	name = "\improper Toxic Pits"
	icon_state = ""

/area/external/mining/jungleland/unexplored/dry_swamp
	name = "\improper Dry Swamps"
	icon_state = ""

/area/external/mining/jungleland/unexplored/tar_wastes
	name = "\improper Tar-Blighted Wastes"
	icon_state = ""
