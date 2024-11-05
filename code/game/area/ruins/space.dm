/area/ruins/space
	name = "Space Ruin Areas"
	icon_state = ""

	has_gravity = STANDARD_GRAVITY


/area/ruins/space/generic
	name = "\improper Unidentified Location"

/area/ruin/space/onehalf_hallway
	name = "\improper Destroyed Ship Hallway"
	icon_state = "hallC"

/area/ruin/space/onehalf_drone
	name = "\improper Destroyed Ship Mining Drone Bay"
	icon_state = "engine"

/area/ruin/space/onehalf_med
	name = "\improper Destroyed Ship Crew Quarters"
	icon_state = "Sleep"

/area/ruin/space/onehalf_bridge
	name = "\improper Destroyed Ship Bridge"
	icon_state = "bridge"

//-- Powered --//

/area/ruins/space/powered
	name = "Powered Ruin Areas"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/space/powered/generic
	name = "\improper Unidentified Location"

/area/ruin/space/powered/spacebar
	name = "\improper Space Bar"
	icon_state = "dk_yellow"

/area/ruin/space/powered/dinner_for_two
	name = "\improper Dinner for Two"

/area/ruin/space/powered/cat_man
	name = "\improper Kitty Den"

/area/ruin/space/powered/authorship
	name = "\improper Authorship"

/area/ruin/space/powered/aesthetic
	name = "\improper Aesthetic"
	ambientsounds = list('sound/ambience/ambivapor1.ogg')

/area/ruin/space/powered/gaming
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

/area/ruins/space/no_gravity/powered //- POWERED GRAVITY
	name = "Powered Gravity Ruin Areas"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/space/no_gravity/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/space/no_gravity/unpowered //- UNPOWERED GRAVITY
	name = "Unpowered Gravity Ruin Areas"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/space/no_gravity/unpowered/generic
	name = "\improper Unidentified Location"























//Ruin of Hotel

/area/ruin/space/gravity/hotel
	name = "Hotel"

/area/ruin/space/gravity/hotel/guestroom
	name = "Hotel Guest Room"
	icon_state = "Sleep"

/area/ruin/space/gravity/hotel/guestroom/room_1
	name = "Hotel Guest Room 1"

/area/ruin/space/gravity/hotel/guestroom/room_2
	name = "Hotel Guest Room 2"

/area/ruin/space/gravity/hotel/guestroom/room_3
	name = "Hotel Guest Room 3"

/area/ruin/space/gravity/hotel/guestroom/room_4
	name = "Hotel Guest Room 4"

/area/ruin/space/gravity/hotel/guestroom/room_5
	name = "Hotel Guest Room 5"

/area/ruin/space/gravity/hotel/guestroom/room_6
	name = "Hotel Guest Room 6"

/area/ruin/space/gravity/hotel/security
	name = "Hotel Security Post"
	icon_state = "security"

/area/ruin/space/gravity/hotel/pool
	name = "Hotel Pool Room"
	icon_state = "fitness"

/area/ruin/space/gravity/hotel/bar
	name = "Hotel Bar"
	icon_state = "cafeteria"

/area/ruin/space/gravity/hotel/power
	name = "Hotel Power Room"
	icon_state = "engine_smes"

/area/ruin/space/gravity/hotel/custodial
	name = "Hotel Custodial Closet"
	icon_state = "janitor"

/area/ruin/space/gravity/hotel/shuttle
	name = "Hotel Shuttle"
	icon_state = "shuttle"
	requires_power = FALSE

/area/ruin/space/gravity/hotel/dock
	name = "Hotel Shuttle Dock"
	icon_state = "start"

/area/ruin/space/gravity/hotel/workroom
	name = "Hotel Staff Room"
	icon_state = "crew_quarters"




//Ruin of Derelict Oupost

/area/ruin/space/gravity/derelictoutpost
	name = "Derelict Outpost"
	icon_state = "green"

/area/ruin/space/gravity/derelictoutpost/cargostorage
	name = "Derelict Outpost Cargo Storage"
	icon_state = "storage"

/area/ruin/space/gravity/derelictoutpost/cargobay
	name = "Derelict Outpost Cargo Bay"
	icon_state = "quartstorage"

/area/ruin/space/gravity/derelictoutpost/powerstorage
	name = "Derelict Outpost Power Storage"
	icon_state = "engine_smes"

/area/ruin/space/gravity/derelictoutpost/dockedship
	name = "Derelict Outpost Docked Ship"
	icon_state = "red"

//Ruin of turretedoutpost

/area/ruin/space/gravity/turretedoutpost
	name = "Turreted Outpost"
	icon_state = "red"


//Ruin of old teleporter

/area/ruin/space/oldteleporter
	name = "Old Teleporter"
	icon_state = "teleporter"


//Ruin of mech transport

/area/ruin/space/gravity/powered/mechtransport
	name = "Mech Transport"
	icon_state = "green"


//Ruin of gas the lizard

/area/ruin/space/gravity/gasthelizard
	name = "Gas the lizard"


//Ruin of Deep Storage

/area/ruin/space/gravity/deepstorage
	name = "Deep Storage"
	icon_state = "storage"

/area/ruin/space/gravity/deepstorage/airlock
	name = "Deep Storage Airlock"
	icon_state = "quart"

/area/ruin/space/gravity/deepstorage/power
	name = "Deep Storage Power and Atmospherics Room"
	icon_state = "engi_storage"

/area/ruin/space/gravity/deepstorage/hydroponics
	name = "Deep Storage Hydroponics"
	icon_state = "garden"

/area/ruin/space/gravity/deepstorage/armory
	name = "Deep Storage Secure Storage"
	icon_state = "armory"

/area/ruin/space/gravity/deepstorage/storage
	name = "Deep Storage Storage"
	icon_state = "storage_wing"

/area/ruin/space/gravity/deepstorage/dorm
	name = "Deep Storage Dormitory"
	icon_state = "crew_quarters"

/area/ruin/space/gravity/deepstorage/kitchen
	name = "Deep Storage Kitchen"
	icon_state = "kitchen"

/area/ruin/space/gravity/deepstorage/crusher
	name = "Deep Storage Recycler"
	icon_state = "storage"


//Ruin of Abandoned Zoo

/area/ruin/space/gravity/abandonedzoo
	name = "Abandoned Zoo"
	icon_state = "green"


//Old Station
//please stop calling it charlie station, that's just the cryo module

/area/ruin/space/gravity/ancientstation
	name = "Charlie Station Main Corridor"
	icon_state = "green"

/area/ruin/space/gravity/ancientstation/space
	name = "Exposed To Space"
	icon_state = "teleporter"
	has_gravity = FALSE

/area/ruin/space/gravity/ancientstation/atmo
	name = "Beta Station Atmospherics"
	icon_state = "red"

/area/ruin/space/gravity/ancientstation/betanorth
	name = "Beta Station North Corridor"
	icon_state = "blue"

/area/ruin/space/gravity/ancientstation/solars
	name = "Beta Station Solar Control"
	icon_state = "blue"

/area/ruin/space/gravity/ancientstation/solararray
	name = "Beta Station Solar Array"
	icon_state = "panelsAP"

/area/ruin/space/gravity/ancientstation/engi
	name = "Charlie Station Engineering"
	icon_state = "engine"

/area/ruin/space/gravity/ancientstation/comm
	name = "Charlie Station Command"
	icon_state = "captain"

/area/ruin/space/gravity/ancientstation/hydroponics
	name = "Charlie Station Hydroponics"
	icon_state = "garden"

/area/ruin/space/gravity/ancientstation/kitchen
	name = "Charlie Station Kitchen"
	icon_state = "kitchen"

/area/ruin/space/gravity/ancientstation/sec
	name = "Charlie Station Security"
	icon_state = "red"

/area/ruin/space/gravity/ancientstation/deltacorridor
	name = "Delta Station Main Corridor"
	icon_state = "green"

/area/ruin/space/gravity/ancientstation/proto
	name = "Delta Station Prototype Lab"
	icon_state = "toxlab"

/area/ruin/space/gravity/ancientstation/deltaai
	name = "Delta Station AI Core"
	icon_state = "ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/ruin/space/gravity/ancientstation/medbay
	name = "Beta Station Medbay"
	icon_state = "medbay"

/area/ruin/space/gravity/ancientstation/mining
	name = "Beta Station Mining Equipment"
	icon_state = "mining"

/area/ruin/space/gravity/ancientstation/betastorage
	name = "Beta Station Storage"
	icon_state = "storage"

/area/ruin/space/gravity/ancientstation/betacorridor
	name = "Beta Station Main Corridor"
	icon_state = "bluenew"

/area/ruin/space/gravity/ancientstation/rnd
	name = "Delta Station Research and Development"
	icon_state = "toxlab"



//DERELICT

/area/ruin/space/derelict
	name = "Derelict Station"
	icon_state = "storage"

/area/ruin/space/derelict/hallway/primary
	name = "Derelict Primary Hallway"
	icon_state = "hallP"

/area/ruin/space/derelict/hallway/secondary
	name = "Derelict Secondary Hallway"
	icon_state = "hallS"

/area/ruin/space/derelict/hallway/primary/port
	name = "Derelict Port (W) Hallway"
	icon_state = "hallFP"

/area/ruin/space/derelict/arrival
	name = "Derelict Arrival Centre"
	icon_state = "yellow"

/area/ruin/space/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/ruin/space/derelict/bridge
	name = "Derelict Control Room"
	icon_state = "bridge"

/area/ruin/space/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/ruin/space/derelict/bridge/ai_upload
	name = "Derelict Computer Core"
	icon_state = "ai"

/area/ruin/space/derelict/solar_control
	name = "Derelict Solar Control"
	icon_state = "engine"

/area/ruin/space/derelict/se_solar
	name = "Derelict South East Solars"
	icon_state = "engine"

/area/ruin/space/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/ruin/space/derelict/medical/chapel
	name = "Derelict Chapel"
	icon_state = "chapel"


/area/ruin/space/derelict/singularity_engine
	name = "Derelict Singularity Engine"
	icon_state = "engine"

/area/ruin/space/derelict/gravity_generator
	name = "Derelict Gravity Generator Room"
	icon_state = "red"

/area/ruin/space/derelict/atmospherics
	name = "Derelict Atmospherics"
	icon_state = "red"

//DJSTATION

/area/ruin/space/djstation
	name = "Ruskie DJ Station"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY
	blob_allowed = FALSE //Nope, no winning on the DJ station as a blob. Gotta eat the main station.

/area/ruin/space/djstation/solars
	name = "DJ Station Solars"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY


//ABANDONED TELEPORTER

/area/ruin/space/abandoned_tele
	name = "Abandoned Teleporter"
	icon_state = "teleporter"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg')



//ABANDONED BOX WHITESHIP

/area/ruin/space/gravity/whiteship/box

	name = "Adrift Ship" //it might get confused with whiteship
	icon_state = "red"


//SYNDICATE LISTENING POST STATION

/area/ruin/space/gravity/listeningstation
	name = "Unidentified Asteroid"
	icon_state = "yellow"

/area/ruin/space/gravity/listeningstation/telecomms
	name = "Listening Post Telecommunications"
	icon_state = "tcomsatcham"

/area/ruin/space/gravity/listeningstation/engineering
	name = "Listening Post Maintenance"
	icon_state = "engine"

/area/ruin/space/gravity/listeningstation/quarters
	name = "Listening Post Crew Quarters"
	icon_state = "green"

/area/ruin/space/gravity/listeningstation/warehouse
	name = "Listening Post Warehouse"
	icon_state = "storage"

/area/ruin/space/gravity/listeningstation/hallway
	name = "Listening Post Central Hallway"
	icon_state = "hallP"

/area/ruin/space/gravity/listeningstation/airlock
	name = "Listening Post Dock"
	icon_state = "red"

//ANCIENT SHUTTLE

/area/ruin/space/gravity/powered/ancient_shuttle
	name = "Ancient Shuttle"
	icon_state = "yellow"

//PUBBY MONASTERY

/area/ruin/space/gravity/monastery
	name = "Monastery"
	icon_state = "chapel"

/area/ruin/space/gravity/monastery/dock
	name = "Monastery Dock"
	icon_state = "construction"

/area/ruin/space/gravity/monastery/garden
	name = "Monastery Garden"
	icon_state = "hydro"

/area/ruin/space/gravity/monastery/office
	name = "Monastery Office"
	icon_state = "chapeloffice"

/area/ruin/space/gravity/monastery/maint
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/ruin/space/gravity/monastery/library
	name = "Monastery Library"
	icon_state = "library"

/area/ruin/space/gravity/monastery/library/lounge
	name = "Monastery Library Lounge"

//SYNDICATE DERELICT STATION

/area/ruin/space/gravity/syndiederelict
	name = "Syndicate Derelict Station"
	icon_state = "red"

/area/ruin/space/gravity/syndiederelict/engineering
	name = "Syndicate Derelict Engineering"
	icon_state = "construction"

/area/ruin/space/gravity/syndiederelict/solars
	name = "Syndicate Derelict Solar Array"
	icon_state = "yellow"
	requires_power = FALSE

/area/ruin/space/gravity/syndiederelict/hydroponics
	name = "Syndicate Derelict Hydroponics"
	icon_state = "hydro"

/area/ruin/space/gravity/syndiederelict/kitchen
	name = "Syndicate Derelict Kitchen"
	icon_state = "kitchen"

/area/ruin/space/gravity/syndiederelict/hallway
	name = "Syndicate Derelict Hallway"
	icon_state = "red"

/area/ruin/space/gravity/syndiederelict/research
	name = "Syndicate Derelict Research Wing"
	icon_state = "toxlab"

/area/ruin/space/gravity/syndiederelict/medbay
	name = "Syndicate Derelict Medical Bay"
	icon_state = "medbay"

/area/ruin/space/gravity/syndiederelict/virology
	name = "Syndicate Derelict Virology"
	icon_state = "virology"








//Space Ruin Parents

/area/ruin/space
	has_gravity = FALSE
	blob_allowed = FALSE //Nope, no winning in space as a blob. Gotta eat the station.
	mining_speed = FALSE

/area/ruin/space/gravity
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/gravity/powered
	requires_power = FALSE


/area/ruin/fakespace
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

/////////////



