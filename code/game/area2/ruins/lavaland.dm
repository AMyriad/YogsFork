/area/ruins/lavaland
	name = "Lavaland Ruin Areas"
	icon_state = ""

	ambience_index = AMBIENCE_RUINS
	has_gravity = STANDARD_GRAVITY
	mining_speed = TRUE

//-- Powered --//

/area/ruins/lavaland/powered
	name = "Powered Ruin Areas"
	requires_power = FALSE
	lights_always_start_on = TRUE

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
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/golem_ship
	name = "\improper Free Golem Ship"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/animal_hospital
	name = "\improper Unidentified Structure"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/seedvault
	name = "\improper Unidentified Structure"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/kinggoatlair
	name = "\improper Unidentified Goat Lair"
	icon_state = "dk_yellow"

/area/ruins/lavaland/powered/gasstation
	name = "\improper Lavaland Gas Station"
	icon_state = "dk_yellow"






/area/ruins/lavaland/powered/syndicate_lava_base
	name = "Syndicate Lavaland"
	icon_state = "syndie-control"
	ambience_index = AMBIENCE_DANGER
	ambient_buzz = 'sound/ambience/magma.ogg'
	ambient_buzz_vol = 10
	hidden = FALSE
	requires_power = TRUE

/area/ruins/lavaland/powered/syndicate_lava_base/engineering
	name = "Syndicate Lavaland Engineering"

/area/ruins/lavaland/powered/syndicate_lava_base/medbay
	name = "Syndicate Lavaland Medbay"

/area/ruins/lavaland/powered/syndicate_lava_base/arrivals
	name = "Syndicate Lavaland Arrivals"

/area/ruins/lavaland/powered/syndicate_lava_base/bar
	name = "Syndicate Lavaland Bar"

/area/ruins/lavaland/powered/syndicate_lava_base/main
	name = "Syndicate Lavaland Primary Hallway"

/area/ruins/lavaland/powered/syndicate_lava_base/cargo
	name = "Syndicate Lavaland Cargo Bay"

/area/ruins/lavaland/powered/syndicate_lava_base/chemistry
	name = "Syndicate Lavaland Chemistry"

/area/ruins/lavaland/powered/syndicate_lava_base/virology
	name = "Syndicate Lavaland Virology"

/area/ruins/lavaland/powered/syndicate_lava_base/testlab
	name = "Syndicate Lavaland Experimentation Lab"

/area/ruins/lavaland/powered/syndicate_lava_base/dormitories
	name = "Syndicate Lavaland Dormitories"

/area/ruins/lavaland/powered/syndicate_lava_base/telecomms
	name = "Syndicate Lavaland Telecommunications"

/area/ruins/lavaland/powered/syndicate_lava_base/vault
	name = "Syndicate Lavaland Vault"


//-- Unpowered --//

/area/ruins/lavaland/unpowered
	name = "Unpowered Ruin Areas"
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

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
