/*
* Only put an area here if it doesn't fit sorting criteria
* If more areas are created of an area in this file, please
* make a new file for it!
*/

/*
* This is the ROOT for all main areas
* It keeps the work tree in mapping tools nice and pretty :)
*/
/area/debug
	name = "Debug Areas"
	icon_state = "external"
	icon = 'icons/area/areas_debug.dmi'

/area/external
	name = "External Areas"
	icon_state = "external"
	icon = 'icons/area/areas_external.dmi'

/area/station
	name = "Station Areas"
	icon_state = "station"
	icon = 'icons/area/areas_station.dmi'

/**
 * A blank area subtype solely used by the golem area editor for the purpose of
 * allowing golems to create new areas without suffering from the hazard_area debuffs.
 */
/area/golem
	name = "Golem Territory"
