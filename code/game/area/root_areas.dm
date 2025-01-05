/*	READ: AREAS
*	All areas stem from the 4 types below depending on where they belong in the game
*	Never put down areas that are all caps and end in "-AREAS"
*	Always put new areas at the bottom of the sorting category they belong in
*	If a new category or file must be created, try to put it where it belongs best
*	When making a bunch directional areas (like /area/station/public/hallway) order them from North to Northwest, or in other words clockwise
*/

/*	ROOT AREAS
*	These are the ROOT for all main area types
*	We organize areas like this to keep the work tree in map editors nice and pretty :]
*
*	/debug/ - Areas that (mostly) aren't supposed to appear on station, exist behind the scenes, or are otherwise special
*	/external/ - Areas outside Space Station 13 e.g. lavaland and shuttles
*	/ruins/ - Ruins and derelicts found in space, mining environments, etc.
*	/station/ - Areas on Space Station 13
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
	blob_allowed = TRUE // Blobs only allowed here
	valid_territory = TRUE // Gang territories only allowed here

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
	icon_state = "ocean_dark"
	base_lighting_alpha = 0

/area/ocean/nearstation
	icon_state = "ocean_near"
	base_lighting_alpha = 0
	always_unpowered = FALSE


/**
 * A blank area subtype solely used by the golem area editor for the purpose of
 * allowing golems to create new areas without suffering from the hazard_area debuffs.
 */
/area/golem
	name = "Golem Territory"
	icon_state = "golem"

/*
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
