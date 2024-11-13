/area/awaymission/vr
	name = "Virtual Reality"
	icon_state = "awaycontent1"
	requires_power = FALSE
	base_lighting_alpha = 255
	var/pacifist = TRUE // if when you enter this zone, you become a pacifist or not
	var/death = FALSE // if when you enter this zone, you die

/*




// RUINS










///////////////////////////// SCIENTIST RAID

/area/awaymission/vr/scientist_raid
	name = "Small Abandoned Station"
	icon_state = "awaycontent3"



/////////////////////////////////// COMBAT FACTORY (MIGHT BE USED IG)

/area/awaymission/vr/combat_robot_factory
	name = "Abandoned Robot Factory"
	icon_state = "awaycontent4"
	//pacifist = FALSE


//////////////////////////////////// ABANDONED_MINE

/area/awaymission/vr/abandoned_mine
	name = "Abandoned Mine"
	icon_state = "awaycontent5"
	//pacifist = FALSE




//////////////////////////////// VR HUB

/area/awaymission/vr/general
	name = "Virtual Reality Forbidden Zone"
	//death = TRUE

/area/awaymission/vr/hub
	name = "Virtual Reality Hub Area"
	icon_state = "awaycontent2"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/awaymission/vr/hub/boxing
	name = "Virtual Reality Boxing Ring"
	icon_state = "awaycontent9"
	//pacifist = FALSE

/area/awaymission/vr/syndicate
	name = "Virtual Reality Syndicate Trainer"
	icon_state = "awaycontent6"
	//pacifist = FALSE



//////////////////////////////// SPACEBATTLE

/area/awaymission/spacebattle
	name = "Space Battle"
	icon_state = "awaycontent1"
	requires_power = FALSE

/area/awaymission/spacebattle/cruiser
	name = "Nanotrasen Cruiser"
	icon_state = "awaycontent2"

/area/awaymission/spacebattle/syndicate1
	name = "Syndicate Assault Ship 1"
	icon_state = "awaycontent3"

/area/awaymission/spacebattle/syndicate2
	name = "Syndicate Assault Ship 2"
	icon_state = "awaycontent4"

/area/awaymission/spacebattle/syndicate3
	name = "Syndicate Assault Ship 3"
	icon_state = "awaycontent5"

/area/awaymission/spacebattle/syndicate4
	name = "Syndicate War Sphere 1"
	icon_state = "awaycontent6"

/area/awaymission/spacebattle/syndicate5
	name = "Syndicate War Sphere 2"
	icon_state = "awaycontent7"

/area/awaymission/spacebattle/syndicate6
	name = "Syndicate War Sphere 3"
	icon_state = "awaycontent8"

/area/awaymission/spacebattle/syndicate7
	name = "Syndicate Fighter"
	icon_state = "awaycontent9"

/area/awaymission/spacebattle/secret
	name = "Hidden Chamber"
	icon_state = "awaycontent10"

/////////////////////////////// VR RUNNER
/area/awaymission/vr/runner
	name = "VrRunner"
	icon_state = "awaycontent5"

////////////////////////////////// MURDERDOME
/area/awaymission/vr/murderdome
	name = "Murderdome"
	icon_state = "awaycontent8"
	//pacifist = FALSE

//////////////////////////// VR MEGAFAUNA ARENA

/area/awaymission/vr/megafauna_arena
	name = "Virtual Reality Megafauna Trainer Safe Area"
	icon_state = "awaycontent3"

/area/awaymission/vr/megafauna_arena/arena
	name = "Virtual Reality Megafauna Trainer Fighting Area"
	icon_state = "awaycontent4"
	//pacifist = FALSE

//////////////////////////////////// CHALLENGE AREAS

/area/awaymission/challenge/start
	name = "Where Am I?"
	icon_state = "away"

/area/awaymission/challenge/main
	name = "Danger Room"
	icon_state = "away1"
	requires_power = FALSE

/area/awaymission/challenge/end
	name = "Administration"
	icon_state = "away2"
	requires_power = FALSE



/////////////////////// CENTCOMAWAY (USED IN VR)

/area/awaymission/centcomAway
	name = "XCC-P5831"
	icon_state = "away"
	requires_power = FALSE

/area/awaymission/centcomAway/general
	name = "XCC-P5831"
	ambientsounds = list('sound/ambience/ambigen3.ogg')

/area/awaymission/centcomAway/maint
	name = "XCC-P5831 Maintenance"
	icon_state = "away1"
	ambientsounds = list('sound/ambience/ambisin1.ogg')

/area/awaymission/centcomAway/thunderdome
	name = "XCC-P5831 Thunderdome"
	icon_state = "away2"
	ambientsounds = list('sound/ambience/ambisin2.ogg')

/area/awaymission/centcomAway/cafe
	name = "XCC-P5831 Kitchen Arena"
	icon_state = "away3"
	ambientsounds = list('sound/ambience/ambisin3.ogg')

/area/awaymission/centcomAway/courtroom
	name = "XCC-P5831 Courtroom"
	icon_state = "away4"
	ambientsounds = list('sound/ambience/ambisin4.ogg')

/area/awaymission/centcomAway/hangar
	name = "XCC-P5831 Hangars"
	icon_state = "away4"
	ambientsounds = list('sound/ambience/ambigen5.ogg')




////////////// BMPCAVES AREAS

/area/awaymission/caves/BMP_asteroid
	name = "\improper BMP Asteroid Level 1"
	icon_state = "awaycontent1"

/area/awaymission/caves/BMP_asteroid/level_two
	name = "\improper BMP Asteroid Level 2"
	icon_state = "awaycontent2"

/area/awaymission/caves/BMP_asteroid/level_three
	name = "\improper BMP Asteroid Level 3"
	icon_state = "awaycontent3"

/area/awaymission/caves/BMP_asteroid/level_four
	name = "\improper BMP Asteroid Level 4"
	icon_state = "awaycontent4"

/area/awaymission/caves/research
	name = "Research Outpost"
	icon_state = "awaycontent5"
	static_lighting = TRUE

/area/awaymission/caves/northblock //engineering, bridge (not really north but it doesnt really need its own APC)

/area/awaymission/caves/listeningpost
	name = "Listening Post"
	icon_state = "awaycontent6"
	requires_power = FALSE




/////////////////////// CABIN AREAS
/area/awaymission/cabin
	name = "Cabin"
	icon_state = "away2"
	requires_power = TRUE
	static_lighting = TRUE

/area/awaymission/snowforest
	name = "Snow Forest"
	icon_state = "away"
	requires_power = FALSE
	static_lighting = TRUE

/area/awaymission/snowforest/lumbermill
	name = "Lumbermill"
	icon_state = "away3"




///////////////// Academy Areas

/area/awaymission/academy
	icon_state = "away"
	requires_power = FALSE

/area/awaymission/academy/academyclassroom
	name = "Academy Classrooms"
	icon_state = "away1"

/area/awaymission/academy/academyfore
	name = "Academy Fore (N) Block"
	icon_state = "away2"

/area/awaymission/academy/academyaft
	name = "Academy Aft (S) Block"
	icon_state = "away3"

/area/awaymission/academy/academycellar
	name = "Academy Cellar"
	icon_state = "away4"



////////// FROM AWAY_CONTENT.DM
/*
Unused icons for new areas are "awaycontent1" ~ "awaycontent30"
*/

// Away Missions
/area/awaymission
	name = "Strange Location"
	icon_state = "away"
	has_gravity = STANDARD_GRAVITY
	ambience_index = AMBIENCE_AWAY
	sound_environment = SOUND_ENVIRONMENT_ROOM
	unique = TRUE


/area/awaymission/beach
	name = "Beach"
	icon_state = "away"
	static_lighting = FALSE
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	ambientsounds = list('sound/ambience/shore.ogg', 'sound/ambience/seag1.ogg','sound/ambience/seag2.ogg','sound/ambience/seag2.ogg','sound/ambience/ambiodd.ogg','sound/ambience/ambinice.ogg')

/area/awaymission/secret
	area_flags = NOTELEPORT
	unique = TRUE
	hidden = TRUE


/area/awaymission/secret/unpowered
	always_unpowered = TRUE

/area/awaymission/secret/unpowered/outdoors
	outdoors = TRUE

/area/awaymission/secret/unpowered/no_grav
	has_gravity = FALSE

/area/awaymission/secret/fullbright
	static_lighting = FALSE
	base_lighting_alpha = 255
	

/area/awaymission/secret/powered
	requires_power = FALSE

/area/awaymission/secret/powered/fullbright
	static_lighting = FALSE
	base_lighting_alpha = 255


















*/
