/area/ruins/space
	name = "Space Ruin Areas"
	icon_state = "space"

	has_gravity = STANDARD_GRAVITY


/area/ruins/space/generic
	name = "\improper Unidentified Location"

/area/ruins/space/onehalf_hallway
	name = "\improper Destroyed Ship Hallway"
	icon_state = "hallC"

/area/ruins/space/onehalf_drone
	name = "\improper Destroyed Ship Mining Drone Bay"
	icon_state = "engine"

/area/ruins/space/onehalf_med
	name = "\improper Destroyed Ship Crew Quarters"
	icon_state = "Sleep"

/area/ruins/space/onehalf_bridge
	name = "\improper Destroyed Ship Bridge"
	icon_state = "bridge"

/area/ruins/space/whiteshipruin_box
	name = "\improper Adrift Ship"

/area/ruins/space/turretedoutpost
	name = "\improper Broken Outpost"

/area/ruins/space/syndicate_derelict_engineering
	name = "\improper Syndicate Derelict Engineering"

/area/ruins/space/syndicate_derelict_solars
	name = "\improper Syndicate Derelict Solar Array"

/area/ruins/space/syndicate_derelict_hydroponics
	name = "\improper Syndicate Derelict Hydroponics"

/area/ruins/space/syndicate_derelict_kitchen
	name = "\improper Syndicate Derelict Kitchen"

/area/ruins/space/syndicate_derelict_hallway
	name = "\improper Syndicate Derelict Hallway"

/area/ruins/space/syndicate_derelict_research
	name = "\improper Syndicate Derelict Research Wing"

/area/ruins/space/syndicate_derelict_medbay
	name = "\improper Syndicate Derelict Medical Bay"

/area/ruins/space/syndicate_derelict_virology
	name = "\improper Syndicate Derelict Virology"

/area/ruins/space/space_hotel
	name = "\improper Hotel"

/area/ruins/space/space_hotel_room_1
	name = "\improper Hotel Guest Room 1"

/area/ruins/space/space_hotel_room_2
	name = "\improper Hotel Guest Room 2"

/area/ruins/space/space_hotel_room_3
	name = "\improper Hotel Guest Room 3"

/area/ruins/space/space_hotel_room_4
	name = "\improper Hotel Guest Room 4"

/area/ruins/space/space_hotel_room_5
	name = "\improper Hotel Guest Room 5"

/area/ruins/space/space_hotel_room_6
	name = "\improper Hotel Guest Room 6"

/area/ruins/space/space_hotel_security
	name = "\improper Hotel Security Post"

/area/ruins/space/space_hotel_pool
	name = "\improper Hotel Pool Room"

/area/ruins/space/space_hotel_bar
	name = "\improper Hotel Bar"

/area/ruins/space/space_hotel_power
	name = "\improper Hotel Power Room"

/area/ruins/space/space_hotel_custodial
	name = "\improper Hotel Custodial Closet"

/area/ruins/space/space_hotel_lobby
	name = "\improper Hotel Lobby"

/area/ruins/space/space_hotel_quarters
	name = "\improper Hotel Staff Quarters"

/area/ruins/space/space_hotel_laundry
	name = "\improper Hotel Laundry Room"

//------------------------------------------------------ progress stopped at map here




//-- Powered --//

/area/ruins/space/powered
	name = "Powered Ruin Areas"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/space/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/space/powered/spacebar
	name = "\improper Space Bar"
	icon_state = "dk_yellow"

/area/ruins/space/powered/dinner_for_two
	name = "\improper Dinner for Two"

/area/ruins/space/powered/cat_man
	name = "\improper Kitty Den"

/area/ruins/space/powered/authorship
	name = "\improper Authorship"

/area/ruins/space/powered/aesthetic
	name = "\improper Aesthetic"
	ambientsounds = list('sound/ambience/ambivapor1.ogg')

/area/ruins/space/powered/gaming
	name ="\improper Game Room"


//-- Unpowered --//

/area/ruins/space/unpowered
	name = "Unpowered Ruin Areas"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE


/area/ruins/space/unpowered/generic
	name = "\improper Unidentified Location"

/area/ruins/space/unpowered/way_home
	name = "\improper Salvation"






//-- No Gravity --//

/area/ruins/space/no_gravity
	name = "Gravity Ruin Areas"
	has_gravity = FALSE

/area/ruins/space/no_gravity/generic
	name = "\improper Unidentified Location"

/area/ruins/space/no_gravity/powered //- POWERED
	name = "Powered Gravity Ruin Areas"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/space/no_gravity/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/space/no_gravity/unpowered //- UNPOWERED
	name = "Unpowered Gravity Ruin Areas"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/space/no_gravity/unpowered/generic
	name = "\improper Unidentified Location"



















/*



//Ruin of Hotel






//Ruin of Derelict Oupost

/area/ruins/space/gravity/derelictoutpost
	name = "Derelict Outpost"
	icon_state = "green"

/area/ruins/space/gravity/derelictoutpost/cargostorage
	name = "Derelict Outpost Cargo Storage"
	icon_state = "storage"

/area/ruins/space/gravity/derelictoutpost/cargobay
	name = "Derelict Outpost Cargo Bay"
	icon_state = "quartstorage"

/area/ruins/space/gravity/derelictoutpost/powerstorage
	name = "Derelict Outpost Power Storage"
	icon_state = "engine_smes"

/area/ruins/space/gravity/derelictoutpost/dockedship
	name = "Derelict Outpost Docked Ship"
	icon_state = "red"





//Ruin of old teleporter

/area/ruins/space/oldteleporter
	name = "Old Teleporter"
	icon_state = "teleporter"


//Ruin of mech transport

/area/ruins/space/gravity/powered/mechtransport
	name = "Mech Transport"
	icon_state = "green"


//Ruin of gas the lizard

/area/ruins/space/gravity/gasthelizard
	name = "Gas the lizard"


//Ruin of Deep Storage

/area/ruins/space/gravity/deepstorage
	name = "Deep Storage"
	icon_state = "storage"

/area/ruins/space/gravity/deepstorage/airlock
	name = "Deep Storage Airlock"
	icon_state = "quart"

/area/ruins/space/gravity/deepstorage/power
	name = "Deep Storage Power and Atmospherics Room"
	icon_state = "engi_storage"

/area/ruins/space/gravity/deepstorage/hydroponics
	name = "Deep Storage Hydroponics"
	icon_state = "garden"

/area/ruins/space/gravity/deepstorage/armory
	name = "Deep Storage Secure Storage"
	icon_state = "armory"

/area/ruins/space/gravity/deepstorage/storage
	name = "Deep Storage Storage"
	icon_state = "storage_wing"

/area/ruins/space/gravity/deepstorage/dorm
	name = "Deep Storage Dormitory"
	icon_state = "crew_quarters"

/area/ruins/space/gravity/deepstorage/kitchen
	name = "Deep Storage Kitchen"
	icon_state = "kitchen"

/area/ruins/space/gravity/deepstorage/crusher
	name = "Deep Storage Recycler"
	icon_state = "storage"


//Ruin of Abandoned Zoo

/area/ruins/space/gravity/abandonedzoo
	name = "Abandoned Zoo"
	icon_state = "green"


//Old Station
//please stop calling it charlie station, that's just the cryo module

/area/ruins/space/gravity/ancientstation
	name = "Charlie Station Main Corridor"
	icon_state = "green"

/area/ruins/space/gravity/ancientstation/space
	name = "Exposed To Space"
	icon_state = "teleporter"
	has_gravity = FALSE

/area/ruins/space/gravity/ancientstation/atmo
	name = "Beta Station Atmospherics"
	icon_state = "red"

/area/ruins/space/gravity/ancientstation/betanorth
	name = "Beta Station North Corridor"
	icon_state = "blue"

/area/ruins/space/gravity/ancientstation/solars
	name = "Beta Station Solar Control"
	icon_state = "blue"

/area/ruins/space/gravity/ancientstation/solararray
	name = "Beta Station Solar Array"
	icon_state = "panelsAP"

/area/ruins/space/gravity/ancientstation/engi
	name = "Charlie Station Engineering"
	icon_state = "engine"

/area/ruins/space/gravity/ancientstation/comm
	name = "Charlie Station Command"
	icon_state = "captain"

/area/ruins/space/gravity/ancientstation/hydroponics
	name = "Charlie Station Hydroponics"
	icon_state = "garden"

/area/ruins/space/gravity/ancientstation/kitchen
	name = "Charlie Station Kitchen"
	icon_state = "kitchen"

/area/ruins/space/gravity/ancientstation/sec
	name = "Charlie Station Security"
	icon_state = "red"

/area/ruins/space/gravity/ancientstation/deltacorridor
	name = "Delta Station Main Corridor"
	icon_state = "green"

/area/ruins/space/gravity/ancientstation/proto
	name = "Delta Station Prototype Lab"
	icon_state = "toxlab"

/area/ruins/space/gravity/ancientstation/deltaai
	name = "Delta Station AI Core"
	icon_state = "ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/ruins/space/gravity/ancientstation/medbay
	name = "Beta Station Medbay"
	icon_state = "medbay"

/area/ruins/space/gravity/ancientstation/mining
	name = "Beta Station Mining Equipment"
	icon_state = "mining"

/area/ruins/space/gravity/ancientstation/betastorage
	name = "Beta Station Storage"
	icon_state = "storage"

/area/ruins/space/gravity/ancientstation/betacorridor
	name = "Beta Station Main Corridor"
	icon_state = "bluenew"

/area/ruins/space/gravity/ancientstation/rnd
	name = "Delta Station Research and Development"
	icon_state = "toxlab"



//DERELICT

/area/ruins/space/derelict
	name = "Derelict Station"
	icon_state = "storage"

/area/ruins/space/derelict/hallway/primary
	name = "Derelict Primary Hallway"
	icon_state = "hallP"

/area/ruins/space/derelict/hallway/secondary
	name = "Derelict Secondary Hallway"
	icon_state = "hallS"

/area/ruins/space/derelict/hallway/primary/port
	name = "Derelict Port (W) Hallway"
	icon_state = "hallFP"

/area/ruins/space/derelict/arrival
	name = "Derelict Arrival Centre"
	icon_state = "yellow"

/area/ruins/space/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/ruins/space/derelict/bridge
	name = "Derelict Control Room"
	icon_state = "bridge"

/area/ruins/space/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/ruins/space/derelict/bridge/ai_upload
	name = "Derelict Computer Core"
	icon_state = "ai"

/area/ruins/space/derelict/solar_control
	name = "Derelict Solar Control"
	icon_state = "engine"

/area/ruins/space/derelict/se_solar
	name = "Derelict South East Solars"
	icon_state = "engine"

/area/ruins/space/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/ruins/space/derelict/medical/chapel
	name = "Derelict Chapel"
	icon_state = "chapel"


/area/ruins/space/derelict/singularity_engine
	name = "Derelict Singularity Engine"
	icon_state = "engine"

/area/ruins/space/derelict/gravity_generator
	name = "Derelict Gravity Generator Room"
	icon_state = "red"

/area/ruins/space/derelict/atmospherics
	name = "Derelict Atmospherics"
	icon_state = "red"

//DJSTATION

/area/ruins/space/djstation
	name = "Ruskie DJ Station"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY
	blob_allowed = FALSE //Nope, no winning on the DJ station as a blob. Gotta eat the main station.

/area/ruins/space/djstation/solars
	name = "DJ Station Solars"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY


//ABANDONED TELEPORTER

/area/ruins/space/abandoned_tele
	name = "Abandoned Teleporter"
	icon_state = "teleporter"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg')



//ABANDONED BOX WHITESHIP

/area/ruins/space/gravity/whiteship/box

	name = "Adrift Ship" //it might get confused with whiteship
	icon_state = "red"


//SYNDICATE LISTENING POST STATION

/area/ruins/space/gravity/listeningstation
	name = "Unidentified Asteroid"
	icon_state = "yellow"

/area/ruins/space/gravity/listeningstation/telecomms
	name = "Listening Post Telecommunications"
	icon_state = "tcomsatcham"

/area/ruins/space/gravity/listeningstation/engineering
	name = "Listening Post Maintenance"
	icon_state = "engine"

/area/ruins/space/gravity/listeningstation/quarters
	name = "Listening Post Crew Quarters"
	icon_state = "green"

/area/ruins/space/gravity/listeningstation/warehouse
	name = "Listening Post Warehouse"
	icon_state = "storage"

/area/ruins/space/gravity/listeningstation/hallway
	name = "Listening Post Central Hallway"
	icon_state = "hallP"

/area/ruins/space/gravity/listeningstation/airlock
	name = "Listening Post Dock"
	icon_state = "red"

//ANCIENT SHUTTLE

/area/ruins/space/gravity/powered/ancient_shuttle
	name = "Ancient Shuttle"
	icon_state = "yellow"

//PUBBY MONASTERY

/area/ruins/space/gravity/monastery
	name = "Monastery"
	icon_state = "chapel"

/area/ruins/space/gravity/monastery/dock
	name = "Monastery Dock"
	icon_state = "construction"

/area/ruins/space/gravity/monastery/garden
	name = "Monastery Garden"
	icon_state = "hydro"

/area/ruins/space/gravity/monastery/office
	name = "Monastery Office"
	icon_state = "chapeloffice"

/area/ruins/space/gravity/monastery/maint
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/ruins/space/gravity/monastery/library
	name = "Monastery Library"
	icon_state = "library"

/area/ruins/space/gravity/monastery/library/lounge
	name = "Monastery Library Lounge"








//Space Ruin Parents

/area/ruins/space
	has_gravity = FALSE
	blob_allowed = FALSE //Nope, no winning in space as a blob. Gotta eat the station.
	mining_speed = FALSE

/area/ruins/space/gravity
	has_gravity = STANDARD_GRAVITY

/area/ruins/space/gravity/powered
	requires_power = FALSE


/area/ruins/fakespace
	icon_state = "space"
	requires_power = TRUE
	always_unpowered = TRUE
	static_lighting = FALSE

	base_lighting_alpha = 255
	has_gravity = FALSE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	valid_territory = FALSE
	outdoors = TRUE
	blob_allowed = FALSE
	ambience_index = null
	ambient_music_index = AMBIENCE_SPACE
	ambient_buzz = null
	sound_environment = SOUND_AREA_SPACE
	mining_speed = FALSE

*/////////////



