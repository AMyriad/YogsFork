/*	READ: AREAS
*	Areas are put into 4 categories (see below) depending on where it exists in the game
*	No area should exist outside these categories nor the folder this file is in
*	
*

* BASE TYPES
*	These are the ROOT for all main area types
*	We organize areas like this to keep the work tree in map editors nice and pretty :]
*
*	Quickref:
*	/debug/ - Areas that (mostly) aren't supposed to appear on station, or exist behind the scenes
*	/external/ - Areas outside Space Station 13
*	/ruins/ - Random ruins and derelicts found in space, mining environments, etc
*	/station/ - Areas on (or around) Space Station 13
*/
/area/debug
	name = "Debug Areas"
	icon = 'icons/area/areas_debug.dmi'

/area/external
	name = "External Areas"
	icon = 'icons/area/areas_external.dmi'

/area/ruins
	name = "Ruins Areas"
	icon = 'icons/area/areas_ruins.dmi'

/area/station
	name = "Station Areas"
	icon = 'icons/area/areas_station.dmi'
	blob_allowed = TRUE
	valid_territory = TRUE

/**
 *	BASE ENVIRONMENTS
 *	These areas are the default environments in a space station map
 *	They are essentially the background, and hence must stay unsorted at the root level
 */
///--- SPACE ---///
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

///--- ASTEROID ---///
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

///--- OCEAN ---///
/area/ocean
	name = "Ocean"
	icon = 'yogstation/icons/obj/effects/liquid.dmi'
	base_icon_state = "ocean"
	icon_state = "ocean"

	ambience_index = AMBIENCE_SPACE
	sound_environment = SOUND_AREA_SPACE

	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

	base_lighting_alpha = 120
	flags_1 = NONE
	outdoors = TRUE

/area/ocean/Initialize(mapload) // See liquid_ocean.dm
	. = ..()
	GLOB.initalized_ocean_areas += src

/area/ocean/dark
	base_lighting_alpha = 0

/area/ocean/nearstation
	always_unpowered = FALSE


/**
 * A blank area subtype solely used by the golem area editor for the purpose of
 * allowing golems to create new areas without suffering from the hazard_area debuffs.
 */
/area/golem
	name = "Golem Territory"
