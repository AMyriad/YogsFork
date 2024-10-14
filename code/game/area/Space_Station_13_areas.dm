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

/area/start
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	static_lighting = FALSE
	base_lighting_alpha = 255
	ambience_index = null
	ambient_buzz = null

/area/testroom
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

//STATION13

//Maintenance

/area/maintenance
	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	valid_territory = FALSE
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/maint
	ambient_buzz = 'sound/ambience/source_corridor2.ogg'
	ambient_buzz_vol = 20
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS
	lights_always_start_on = TRUE
	lighting_colour_tube = "#ffe5cb"
	lighting_colour_bulb = "#ffdbb4"

//Departments

/area/maintenance/department/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/maintenance/department/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/maintenance/department/crew_quarters/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/maintenance/department/crew_quarters/dorms
	name = "Dormitory Maintenance"
	icon_state = "maint_dorms"

/area/maintenance/department/eva
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/maintenance/department/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/maintenance/department/engine/atmos
	name = "Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/maintenance/department/security
	name = "Security Maintenance"
	icon_state = "maint_sec"

/area/maintenance/department/security/brig
	name = "Brig Maintenance"
	icon_state = "maint_brig"

/area/maintenance/department/medical
	name = "Medbay Maintenance"
	icon_state = "medbay_maint"

/area/maintenance/department/medical/central
	name = "Central Medbay Maintenance"
	icon_state = "medbay_maint_central"

/area/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "morgue_maint"

/area/maintenance/department/science
	name = "Science Maintenance"
	icon_state = "maint_sci"

/area/maintenance/department/science/central
	name = "Central Science Maintenance"
	icon_state = "maint_sci_central"

/area/maintenance/department/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/maintenance/department/bridge
	name = "Bridge Maintenance"
	icon_state = "maint_bridge"

/area/maintenance/department/engine
	name = "Engineering Maintenance"
	icon_state = "maint_engi"

/area/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "xenomaint"
	xenobiology_compatible = TRUE


//Maintenance - Generic

/area/maintenance/aft
	name = "Aft (S) Maintenance"
	icon_state = "amaint"

/area/maintenance/aft/secondary
	name = "Aft (S) Maintenance"
	icon_state = "amaint_2"

/area/maintenance/central
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/maintenance/central/secondary
	name = "Central Maintenance"
	icon_state = "maintcentral"
	clockwork_warp_allowed = FALSE

/area/maintenance/fore
	name = "Fore (N) Maintenance"
	icon_state = "fmaint"

/area/maintenance/fore/secondary
	name = "Fore (N) Maintenance"
	icon_state = "fmaint_2"

/area/maintenance/starboard
	name = "Starboard (E) Maintenance"
	icon_state = "smaint"

/area/maintenance/starboard/central
	name = "Central Starboard (E) Maintenance"
	icon_state = "smaint"

/area/maintenance/starboard/secondary
	name = "Secondary Starboard (E) Maintenance"
	icon_state = "smaint_2"

/area/maintenance/starboard/aft
	name = "Starboard Quarter (SE) Maintenance"
	icon_state = "asmaint"

/area/maintenance/starboard/aft/secondary
	name = "Secondary Starboard Quarter (SE) Maintenance"
	icon_state = "asmaint_2"

/area/maintenance/starboard/fore
	name = "Starboard Bow (NE) Maintenance"
	icon_state = "fsmaint"

/area/maintenance/port
	name = "Port (W) Maintenance"
	icon_state = "pmaint"

/area/maintenance/port/central
	name = "Central Port (W) Maintenance"
	icon_state = "maintcentral"

/area/maintenance/port/aft
	name = "Port Quarter (SW) Maintenance"
	icon_state = "apmaint"

/area/maintenance/port/fore
	name = "Port Bow (NW) Maintenance"
	icon_state = "fpmaint"

/area/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/maintenance/disposal/incinerator
	name = "Incinerator"
	icon_state = "incinerator"


//Hallway

/area/hallway
	minimap_color = "#8d8c68"
	sound_environment = SOUND_AREA_STANDARD_STATION
	lights_always_start_on = TRUE
	lighting_colour_tube = "#fdf3ea"
	lighting_colour_bulb = "#ffebd6"

/area/hallway/primary/aft
	name = "Aft (S) Primary Hallway"
	icon_state = "hallA"

/area/hallway/primary/fore
	name = "Fore (N) Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/starboard
	name = "Starboard (E) Primary Hallway"
	icon_state = "hallS"

/area/hallway/primary/port
	name = "Port (W) Primary Hallway"
	icon_state = "hallP"

/area/hallway/primary/central
	name = "Central Primary Hallway"
	icon_state = "hallC"

/area/hallway/primary/aft_starboard
	name="Aft Starboard (SE) Primary Hallway"
	icon_state = "hallAS"

/area/hallway/secondary/command
	name = "Command Hallway"
	icon_state = "bridge_hallway"

/area/hallway/secondary/construction
	name = "Construction Area"
	icon_state = "construction"

/area/hallway/secondary/exit
	name = "Escape Shuttle Hallway"
	icon_state = "escape"

/area/hallway/secondary/exit/departure_lounge
	name = "Departure Lounge"
	icon_state = "escape_lounge"

/area/hallway/secondary/entry
	name = "Arrival Shuttle Hallway"
	icon_state = "entry"

/area/hallway/secondary/service
	name = "Service Hallway"
	icon_state = "hall_service"

//Command




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

/area/crew_quarters/cafeteria
	name = "Cafeteria"
	icon_state = "cafeteria"
	minimap_color = "#5ac866"


/area/crew_quarters/public_lounge
	name = "Lounge"
	icon_state = "bar"
	minimap_color = "#5ac866"
	mood_bonus = 5
	mood_message = span_nicegreen("I love being in the lounge!\n")
	airlock_wires = /datum/wires/airlock/service

/area/crew_quarters/bar/Initialize(mapload)
	. = ..()
	GLOB.bar_areas += src

/area/crew_quarters/bar/atrium
	name = "Atrium"
	icon_state = "bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/crew_quarters/electronic_marketing_den
	name = "Electronic Marketing Den"
	icon_state = "bar"

/area/crew_quarters/abandoned_gambling_den
	name = "Abandoned Gambling Den"
	icon_state = "abandoned_g_den"

/area/crew_quarters/abandoned_gambling_den/secondary
	icon_state = "abandoned_g_den_2"



/area/crew_quarters/theatre/abandoned
	name = "Abandoned Theatre"
	icon_state = "Theatre"


/area/library/abandoned
	name = "Abandoned Library"
	icon_state = "library"
	flags_1 = NONE


//Solars

/area/solar
	valid_territory = FALSE
	blob_allowed = FALSE
	mining_speed = TRUE
	flags_1 = NONE
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_SPACE
	lights_always_start_on = TRUE
	minimap_color = "#6b6b6b"
	airlock_wires = /datum/wires/airlock/engineering

/area/solar/fore
	name = "Fore (N) Solar Array"
	icon_state = "yellow"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/solar/aft
	name = "Aft (S) Solar Array"
	icon_state = "yellow"

/area/solar/aux/port
	name = "Port Bow (NW) Auxiliary Solar Array"
	icon_state = "panelsA"

/area/solar/aux/starboard
	name = "Starboard Bow (NE) Auxiliary Solar Array"
	icon_state = "panelsA"

/area/solar/starboard
	name = "Starboard (E) Solar Array"
	icon_state = "panelsS"

/area/solar/starboard/aft
	name = "Starboard Quarter (SE) Solar Array"
	icon_state = "panelsAS"

/area/solar/starboard/aft/icemoon
	name = "Southeast (SE) Geothermal Station" // it's a planetary station and not a ship, cardinal directions apply
	uses_daylight = TRUE

/area/solar/starboard/fore
	name = "Starboard Bow (NE) Solar Array"
	icon_state = "panelsFS"

/area/solar/starboard/fore/icemoon
	name = "Northeast (NE) Geothermal Station"
	uses_daylight = TRUE

/area/solar/port
	name = "Port (W) Solar Array"
	icon_state = "panelsP"

/area/solar/port/aft
	name = "Port Quarter (SW) Solar Array"
	icon_state = "panelsAP"

/area/solar/port/aft/icemoon
	name = "Southwest (SW) Geothermal Station"
	uses_daylight = TRUE

/area/solar/port/fore
	name = "Port Bow (NW) Solar Array"
	icon_state = "panelsFP"

/area/solar/port/fore/icemoon
	name = "Northwest (NW) Geothermal Station"
	uses_daylight = TRUE


//Solar Maint

/area/maintenance/solars
	name = "Solar Maintenance"
	icon_state = "yellow"

/area/maintenance/solars/port
	name = "Port (W) Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/maintenance/solars/port/aft
	name = "Port Quarter (SW) Solar Maintenance"
	icon_state = "SolarcontrolAP"

/area/maintenance/solars/port/fore
	name = "Port Bow (NW) Solar Maintenance"
	icon_state = "SolarcontrolFP"

/area/maintenance/solars/starboard
	name = "Starboard (E) Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/maintenance/solars/starboard/aft
	name = "Starboard Quarter (SE) Solar Maintenance"
	icon_state = "SolarcontrolAS"

/area/maintenance/solars/starboard/fore
	name = "Starboard Bow (NE) Solar Maintenance"
	icon_state = "SolarcontrolFS"




//MedBay

/area/medical
	name = "Medical"
	icon_state = "medbay3"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION
	minimap_color = "#5d57a5"
	airlock_wires = /datum/wires/airlock/medbay
	lighting_colour_tube = "#e7f8ff"
	lighting_colour_bulb = "#d5f2ff"

/area/medical/abandoned
	name = "Abandoned Medbay"
	icon_state = "medbay3"
	ambientsounds = list('sound/ambience/signal.ogg')
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/medical/medbay/central
	name = "Medbay Central"
	icon_state = "medbay"

/area/medical/medbay/lobby
	name = "Medbay Lobby"
	icon_state = "medbay"

	//Medbay is a large area, these additional areas help level out APC load.

/area/medical/medbay/zone2
	name = "Medbay"
	icon_state = "medbay2"

/area/medical/medbay/aft
	name = "Medbay Aft"
	icon_state = "medbay3"

/area/medical/storage
	name = "Medbay Storage"
	icon_state = "medbay2"

/area/medical/storage/locker
	name = "Medbay Locker Room"
	icon_state = "medbay2"

/area/medical/storage/backroom
	name = "Medbay Backroom"
	icon_state = "medbay2"

/area/medical/patients_rooms
	name = "Patients' Rooms"
	icon_state = "patients"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/medical/patients_rooms/room_a
	name = "Patient Room A"
	icon_state = "patients"

/area/medical/patients_rooms/room_b
	name = "Patient Room B"
	icon_state = "patients"

/area/medical/patients_rooms/room_c
	name = "Patient Room C"
	icon_state = "patients"

/area/medical/virology
	name = "Virology"
	icon_state = "virology"
	flags_1 = NONE
	minimap_color = "#01f5b3"
	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"
	minimap_color = "#006384"

/area/medical/genetics/cloning
	name = "Cloning Lab"
	icon_state = "cloning"

/area/medical/sleeper
	name = "Medbay Treatment Center"
	icon_state = "exam_room"





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

/area/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	clockwork_warp_allowed = FALSE
	minimap_color = "#c8c0ff"

/area/storage/emergency/starboard
	name = "Starboard (E) Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/emergency/port
	name = "Port (W) Emergency Storage"
	icon_state = "emergencystorage"

/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"
	minimap_color = "#9ccf00"

//Construction

/area/construction
	name = "Construction Area"
	icon_state = "yellow"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_STANDARD_STATION
	minimap_color = "#4f4e3a"

/area/construction/mining/aux_base
	name = "Auxiliary Base Construction"
	icon_state = "aux_base_construction"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/construction/storage_wing
	name = "Storage Wing"
	icon_state = "storage_wing"

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


// Telecommunications Satellite

/area/tcommsat
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "For safety reasons, warping here is disallowed; the radio and bluespace noise could cause catastrophic results."
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')
	minimap_color = "#00fff6"
	airlock_wires = /datum/wires/airlock/engineering

/area/tcommsat/computer
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/tcommsat/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"

/area/tcommsat/storage
	name = "Telecomms Storage Room"
	icon_state = "tcomsatstorage"
