/area/external/mining
	name = "External Mining Areas"
	icon_state = "mining"

	ambient_buzz = 'sound/ambience/magma.ogg'
	ambient_buzz_vol = 10
	
	lighting_colour_tube = "#ffe8d2"
	lighting_colour_bulb = "#ffdcb7"

	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE

//- Shaft Miner Mining Base -//

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


//- Labor Camp/Gulag -//

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


//- Lavaland -//

/area/external/mining/lavaland
	name = "Lavaland Areas"
	icon_state = ""

	ambience_index = AMBIENCE_MINING
	ambient_buzz = 'sound/ambience/magma.ogg'

	flags_1 = NONE
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE

// Put this in safe "discovered" areas where we don't want map generation like outside ruins/buildings and lava rivers
/area/external/mining/lavaland/explored
	name = "\improper Lavaland Wastes"
	icon_state = "explored"

// Special type for area in proximity to the labor camp, place on every normal ground turf up until you meet a wall/lava
/area/external/mining/lavaland/explored/labor
	name = "\improper Labor Camp Exterior"
	icon_state = ""

// Put this in areas where we don't want megafauna and useful flora to spawn like near the labor camp
/area/external/mining/lavaland/light_unexplored
	name = "\improper Lavaland Wastes"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | MOB_SPAWN_ALLOWED

// Standard lavaland unexplored danger zone
/area/external/mining/lavaland/unexplored
	name = "\improper Lavaland Wastes"
	icon_state = "danger"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/lavaland


//- Icemoon -//

/area/external/mining/icemoon
	name = "Lavaland Areas"
	icon_state = ""

	ambience_index = AMBIENCE_ICEMOON
	sound_environment = SOUND_ENVIRONMENT_FOREST
	ambient_buzz = null // Stillness

	flags_1 = NONE
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	blob_allowed = FALSE
	area_flags = FLORA_ALLOWED
	outdoors = TRUE

	uses_daylight = TRUE
	daylight_multiplier = 0.7

// Put this in safe "discovered" areas where we don't want map generation like outside ruins/buildings and lava rivers
/area/external/mining/icemoon/explored
	name = "\improper Lavaland Wastes"
	icon_state = ""













/**********************Ice Moon Areas**************************/

/area/icemoon



/area/icemoon/top_layer
	name = "Icemoon Surface"
	icon_state = "explored"
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	uses_daylight = TRUE
	daylight_multiplier = 0.7

/area/icemoon/top_layer/outdoors
	name = "Icemoon Wastes"
	outdoors = TRUE

/area/icemoon/top_layer/outdoors/unexplored
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon/top_layer
	
/area/icemoon/top_layer/outdoors/unexplored/danger
	icon_state = "danger"	

/area/icemoon/top_layer/outdoors/explored
	area_flags = NONE

/area/icemoon/surface
	name = "Icemoon"
	icon_state = "explored"
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE

/area/icemoon/surface/outdoors
	name = "Icemoon Wastes"
	outdoors = TRUE

/area/icemoon/surface/outdoors/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon/surface

/area/icemoon/surface/outdoors/unexplored/danger
	icon_state = "danger"

/area/icemoon/surface/outdoors/explored
	name = "Icemoon Labor Camp"
	area_flags = NONE

/area/icemoon/underground
	name = "Icemoon Caves"
	outdoors = TRUE
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE

/area/icemoon/underground/unexplored // mobs and megafauna and ruins spawn here
	name = "Icemoon Caves"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED
	map_generator = /datum/map_generator/cave_generator/icemoon
	
/area/icemoon/underground/explored
	name = "Icemoon Underground"
	area_flags = NONE

/area/icemoon/underground/explored/laborcamp
	name = "Icemoon Labor Camp"
