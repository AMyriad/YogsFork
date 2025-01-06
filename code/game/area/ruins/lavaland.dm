/area/ruins/lavaland
	name = "LAVALAND RUIN AREAS"
	icon_state = ""

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE


/area/ruins/lavaland/generic
	name = "\improper Unidentified Location"


//-- Powered --//

/area/ruins/lavaland/powered
	name = "POWERED RUIN AREAS"
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/ruins/lavaland/powered/generic
	name = "\improper Unidentified Location"

/area/ruins/lavaland/powered/biodome/beach
	name = "\improper Beach Biodome"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing
	name = "\improper Fishing Biodome Pier"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing/kitchen
	name = "\improper Fishing Biodome Kitchen"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing/bedroom
	name = "\improper Fishing Biodome Bedroom"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing/shop
	name = "\improper Fishing Biodome Gift Shop"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing/hall
	name = "\improper Fishing Biodome Hallway"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/fishing/tcom
	name = "\improper Fishing Biodome Telecomms"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/clownplanet
	name = "\improper Clown Biodome"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/inn
	name = "\improper Snowy Inn Biodome"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/biodome/snow
	name = "\improper Snowy Biodome"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/sin/gluttony
	name = "\improper Unidentified Structure"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/sin/greed
	name = "\improper Unidentified Structure"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/sin/pride
	name = "\improper Unidentified Structure"

/area/ruins/lavaland/powered/golem_ship
	name = "\improper Free Golem Ship"

/area/ruins/lavaland/powered/animal_hospital
	name = "\improper Unidentified Structure"

/area/ruins/lavaland/powered/seedvault
	name = "\improper Unidentified Structure"

/area/ruins/lavaland/powered/kinggoat_lair
	name = "\improper Unidentified Goat Lair"

/area/ruins/lavaland/powered/gasstation
	name = "\improper Lavaland Gas Station"


//-- Unpowered --//

/area/ruins/lavaland/unpowered
	name = "UNPOWERED RUIN AREAS"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruins/lavaland/unpowered/generic
	name = "\improper Unidentified Location"

/area/ruins/lavaland/unpowered/russianbunker
	name = "\improper Unidentified Russian Structure"
	area_flags = NOTELEPORT

/area/ruins/lavaland/unpowered/hierophant
	name = "Hierophant's Arena"
	icon_state = "dk_yellow"

/area/ruins/lavaland/unpowered/necropolis
	name = "The Necropolis"
	hidden = TRUE
	area_flags = NOTELEPORT

/area/ruins/lavaland/unpowered/xenonest
	name = "\improper Hive"

/area/ruins/lavaland/unpowered/ash_walkers
	name = "\improper Unidentified Nest"
	icon_state = "red"
	ambient_buzz = 'sound/ambience/magma.ogg'
