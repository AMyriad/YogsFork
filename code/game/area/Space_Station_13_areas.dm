/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = 'ICON FILENAME' 			(defaults to 'icons/turf/areas.dmi')
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = FALSE 				(defaults to true)
	ambientsounds = list()				(defaults to GENERIC from sound.dm. override it as "ambientsounds = list('sound/ambience/signal.ogg')" or using another define.

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/


/*-----------------------------------------------------------------------------*/

/area/ai_monitored	//stub defined ai_monitored.dm

/area/space
	icon_state = "space"
	requires_power = TRUE
	always_unpowered = TRUE
	static_lighting = TRUE

	base_lighting_alpha = 0
	base_lighting_color = COLOR_STARLIGHT
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	valid_territory = FALSE
	outdoors = TRUE
	blob_allowed = FALSE //Eating up space doesn't count for victory as a blob.
	ambience_index = null
	ambient_music_index = AMBIENCE_SPACE
	flags_1 = CAN_BE_DIRTY_1
	ambient_buzz = null
	sound_environment = SOUND_AREA_SPACE

/area/space/nearstation
	icon_state = "space_near"

/area/start //sort this with centcom
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	static_lighting = FALSE
	base_lighting_alpha = 255
	ambience_index = null
	ambient_buzz = null

/area/testroom //sort this with centcom
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	static_lighting = FALSE
	base_lighting_alpha = 255
	name = "Test Room"
	icon_state = "test_room"

//EXTRA

/area/asteroid
	name = "Asteroid"
	icon_state = "asteroid"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	blob_allowed = FALSE //Nope, no winning on the asteroid as a blob. Gotta eat the station.
	valid_territory = FALSE
	mining_speed = TRUE
	ambience_index = AMBIENCE_MINING
	sound_environment = SOUND_AREA_ASTEROID

/area/asteroid/nearstation
	static_lighting = TRUE
	ambience_index = AMBIENCE_RUINS
	always_unpowered = FALSE
	requires_power = TRUE
	blob_allowed = TRUE

/area/asteroid/nearstation/bomb_site
	name = "Bomb Testing Asteroid"






//Crew

/area/crew_quarters
	minimap_color = "#b0e1ff"
	sound_environment = SOUND_AREA_STANDARD_STATION
	lights_always_start_on = TRUE

/area/crew_quarters/dorms
	name = "Dormitories"
	icon_state = "Sleep"
	safe = TRUE
	minimap_color = "#b0e1ff"

/area/crew_quarters/cryopods
	name = "Cryopod Room"
	safe = TRUE
	icon_state = "cryopod"
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"
	minimap_color = "#b0e1ff"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	lighting_colour_tube = "#e3ffff"
	lighting_colour_bulb = "#d5ffff"

/area/crew_quarters/toilet/auxiliary
	name = "Auxiliary Restrooms"
	icon_state = "toilet"

/area/crew_quarters/toilet/locker
	name = "Locker Toilets"
	icon_state = "toilet"
	minimap_color = "#766e97"

/area/crew_quarters/toilet/restrooms
	name = "Restrooms"
	icon_state = "toilet"

/area/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"
	minimap_color = "#766e97"

/area/crew_quarters/lounge
	name = "Lounge"
	icon_state = "yellow"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/crew_quarters/fitness/locker_room
	name = "Unisex Locker Room"
	icon_state = "fitness"

/area/crew_quarters/fitness/recreation
	name = "Recreation Area"
	icon_state = "fitness"

/area/hydroponics/garden
	name = "Garden"
	icon_state = "garden"
	minimap_color = "#70ff38"

/area/hydroponics/garden/abandoned
	name = "Abandoned Garden"
	icon_state = "abandoned_garden"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/hydroponics/garden/monastery
	name = "Monastery Garden"
	icon_state = "hydro"



/area/crew_quarters/public_lounge
	name = "Lounge"
	icon_state = "bar"
	minimap_color = "#5ac866"
	mood_bonus = 5
	mood_message = span_nicegreen("I love being in the lounge!\n")
	airlock_wires = /datum/wires/airlock/service










//Storage

/area/storage
	minimap_color = "#f8ff83"
	sound_environment = SOUND_AREA_STANDARD_STATION
	lights_always_start_on = TRUE

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/art
	name = "Artist's Coven"
	icon_state = "storage"

/area/storage/tcom
	name = "Telecomms Storage"
	icon_state = "green"
	valid_territory = FALSE


/area/storage/emergency/starboard
	name = "Starboard (E) Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency/port
	name = "Port (W) Emergency Storage"
	icon_state = "emergencystorage"


// Vacant Rooms
/area/vacant_room
	name = "Vacant Room"
	icon_state = "yellow"
	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR
	icon_state = "vacant_room"
	minimap_color = "#4f4e3a"

/area/vacant_room/office
	name = "Vacant Office"
	icon_state = "vacant_office"

/area/vacant_room/commissary
	name = "Vacant Commissary"
	icon_state = "vacant_commissary"

//AI

/area/ai_monitored/security/armory
	name = "Armory"
	icon_state = "armory"
	ambience_index = AMBIENCE_DANGER
	minimap_color = "#b12527"
	airlock_wires = /datum/wires/airlock/security

/area/ai_monitored/security/armory/upper
	name = "Upper Armory"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	ambience_index = AMBIENCE_DANGER
	minimap_color = "#c8c0ff"

/area/ai_monitored/storage/satellite
	name = "AI Satellite Maint"
	icon_state = "storage"
	ambience_index = AMBIENCE_DANGER
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/ai

/area/ai_monitored/storage/satellite/teleporter
	name = "AI Satellite Access Teleporter"
	icon_state = "storage"
	ambience_index = AMBIENCE_DANGER
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/ai
 
/area/ai_monitored/secondarydatacore
	name = "AI Secondary Datacore Monitoring"
	icon_state =  "ai"
	minimap_color = "#00fff6"
	ambience_index = AMBIENCE_DANGER

/area/ai_monitored/secondarydatacoreserver
	name = "AI Secondary Datacore Servers"
	icon_state = "ai"
	minimap_color = "#00fff6"
	ambience_index = AMBIENCE_DANGER

//Turret_protected

/area/ai_monitored/turret_protected
	ambience_index = AMBIENCE_AI
	minimap_color = "#00fff6"
	airlock_wires = /datum/wires/airlock/ai

/area/ai_monitored/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"
	minimap_color = "#4f4e3a"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/ai_monitored/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/ai_monitored/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/ai_monitored/turret_protected/aisat
	name = "AI Satellite"
	icon_state = "ai"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/ai_monitored/turret_protected/aisat/atmos
	name = "AI Satellite Atmos"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/foyer
	name = "AI Satellite Foyer"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/service
	name = "AI Satellite Service"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/hallway
	name = "AI Satellite Hallway"
	icon_state = "ai"

/area/aisat
	name = "AI Satellite Exterior"
	icon_state = "yellow"
	minimap_color = "#00fff6"
	airlock_wires = /datum/wires/airlock/ai
	lights_always_start_on = TRUE

/area/ai_monitored/turret_protected/aisat_interior
	name = "AI Satellite Antechamber"
	icon_state = "ai"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/ai_monitored/turret_protected/AIsatextAS
	name = "AI Sat Ext"
	icon_state = "storage"

/area/ai_monitored/turret_protected/AIsatextAP
	name = "AI Sat Ext"
	icon_state = "storage"

