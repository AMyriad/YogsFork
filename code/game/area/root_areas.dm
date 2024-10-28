/*	AREA FORMATTING GUIDE
*	Areas are put into 4 categories (see below) depending on where it exists in the game
*	
*	


* BASE TYPES
*	These are the ROOTS for all main area types
*	We organize areas like this to keep the work tree in map editors nice and pretty :]
*
*	Quickref:
*	/debug/ - Areas that (mostly) aren't supposed to appear on station, or exist behind the scenes
*	/external/ - Areas outside Space Station 13
*	/ruins/ - Random ruins and derelicts found in space, mining environments, etc
*	/station/ - Areas on Space Station 13
*
*/
/area/debug
	name = "Debug Areas"
	icon_state = "debug"
	icon = 'icons/area/areas_debug.dmi'

/area/external
	name = "External Areas"
	icon_state = "external"
	icon = 'icons/area/areas_external.dmi'

/area/ruins
	name = "Ruins Areas"
	icon_state = "ruins"
	icon = 'icons/area/areas_ruins.dmi'

/area/station
	name = "Station Areas"
	icon_state = "station"
	icon = 'icons/area/areas_station.dmi'
	blob_allowed = TRUE
	valid_territory = TRUE

/**
 *	BASE ENVIRONMENTS
 *	These areas are the default environments in a space station map
 *	They are essentially the background, and hence must stay unsorted at the root level
 */
/area/space
	name = "Space"
	icon_state = "space"

	ambience_index = null
	ambient_music_index = AMBIENCE_SPACE
	sound_environment = SOUND_AREA_SPACE
	ambient_buzz = null

	base_lighting_alpha = 255
	base_lighting_color = COLOR_STARLIGHT

	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

	flags_1 = NONE
	outdoors = TRUE

/area/space/nearstation
	icon_state = "space_near"
	base_lighting_alpha = 0
	base_lighting_color = null
	always_unpowered = FALSE

/area/asteroid
	name = "Asteroid"
	icon_state = "asteroid"

	ambience_index = null
	ambient_music_index = AMBIENCE_SPACE
	sound_environment = SOUND_AREA_ASTEROID
	ambient_buzz = null

	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

	flags_1 = NONE
	has_gravity = STANDARD_GRAVITY
	outdoors = TRUE

/area/asteroid/nearstation
	icon_state = "asteroid_near"
	always_unpowered = FALSE

/**
 * A blank area subtype solely used by the golem area editor for the purpose of
 * allowing golems to create new areas without suffering from the hazard_area debuffs.
 */
/area/golem
	name = "Golem Territory"
