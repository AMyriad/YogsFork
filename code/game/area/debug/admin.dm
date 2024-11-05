/area/debug/admin
	name = "Admin Areas"
	icon_state = "centcom"

	static_lighting = TRUE

	requires_power = FALSE

	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = NOTELEPORT


/area/debug/admin/start
	name = "\improper Start Area"
	icon_state = "start"
	static_lighting = FALSE
	base_lighting_alpha = 255
	ambience_index = null
	ambient_buzz = null

/area/debug/admin/testroom
	name = "\improper Test Room"
	icon_state = "test_room"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/debug/admin/error_room
	name = "\improper Super Secret Room"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/debug/admin/ctf
	name = "\improper Capture The Flag"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/debug/admin/reality
	name = "\improper Tear in the Fabric of Reality"
	icon_state = ""
	static_lighting = FALSE
	base_lighting_alpha = 255
	var/turf/origin

/area/debug/admin/holding_restaurant
	name = "\improper Hidama-ya Café" // A hidden place, away in space...

/area/debug/admin/bluespace_locker
	name = "\improper Bluespace Locker"
	icon_state = "away"
	requires_power = TRUE
	static_lighting = FALSE


//-- Centcom Station --//

/area/debug/admin/centcom
	name = "Central Command Areas"
	icon_state = ""

/area/debug/admin/centcom/main
	name = "\improper Central Command Station"
	icon_state = ""

/area/debug/admin/centcom/dock_main
	name = "\improper CentCom Main Dock"
	icon_state = ""

/area/debug/admin/centcom/recovery_ship
	name = "\improper CentCom Recovery Ship"
	icon_state = ""

/area/debug/admin/centcom/tribunal
	name = "\improper CentCom Corporate Tribunal"
	icon_state = ""

/area/debug/admin/centcom/supply
	name = "\improper CentCom Supply Depot"
	icon_state = ""

/area/debug/admin/centcom/mission_control
	name = "\improper CentCom Mission Control"
	icon_state = ""

/area/debug/admin/centcom/prison
	name = "\improper CentCom Prison"
	icon_state = ""

/area/debug/admin/centcom/capitalism
	name = "\improper CentCom Capitalism Chamber"
	icon_state = ""

/area/debug/admin/centcom/test
	name = "\improper CentCom Test Chamber"
	icon_state = ""

/area/debug/admin/centcom/supplypod //- SUPPLY POD
	name = "Supply Pod Areas"
	icon_state = ""
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/debug/admin/centcom/supplypod/main
	name = "\improper Supply Pod Facility"
	icon_state = "supplypod"

/area/debug/admin/centcom/supplypod/storage
	name = "\improper Supply Pod Storage"
	icon_state = "supplypod_holding"

/area/debug/admin/centcom/supplypod/storage/Initialize(mapload) // temp_pod holding area
	. = ..()
	var/obj/imgbound = locate() in locate(200,SUPPLYPOD_X_OFFSET*-4.5, 1)
	call(GLOB.podlauncher, "RegisterSignal")(imgbound, "ct[GLOB.podstyles[14][9]]", "[GLOB.podstyles[14][10]]dlauncher")

/area/debug/admin/centcom/supplypod/loading
	name = "Payload Loading Areas"
	icon_state = "supplypod_loading"
	var/loading_id = ""

/area/debug/admin/centcom/supplypod/loading/Initialize(mapload)
	. = ..() 
	if(!loading_id)
		CRASH("[type] created without a loading_id")
	if(GLOB.supplypod_loading_bays[loading_id])
		CRASH("Duplicate loading bay area: [type] ([loading_id])")
	GLOB.supplypod_loading_bays[loading_id] = src

/area/debug/admin/centcom/supplypod/loading/one
	name = "\improper Podbay #1"
	loading_id = "1"

/area/debug/admin/centcom/supplypod/loading/two
	name = "\improper Podbay #2"
	loading_id = "2"

/area/debug/admin/centcom/supplypod/loading/three
	name = "\improper Podbay #3"
	loading_id = "3"

/area/debug/admin/centcom/supplypod/loading/four
	name = "\improper Podbay #4"
	loading_id = "4"

/area/debug/admin/centcom/thunderdome //- THUNDERDOME
	name = "Thunderdome Areas"
	icon_state = ""
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/debug/admin/centcom/thunderdome/main
	name = "\improper THE THUNDERDOME"
	icon_state = ""

/area/debug/admin/centcom/thunderdome/observer
	name = "\improper Thunderdome Observer Hall"
	icon_state = ""

/area/debug/admin/centcom/thunderdome/admin
	name = "\improper Thunderdome Administration"
	icon_state = ""


//-- Gamemode-relevant stuff --//

/area/debug/admin/gamemode
	name = "Gamemode Areas"
	icon_state = ""

/area/debug/admin/gamemode/wizard
	name = "\improper Wizard's Den"
	icon_state = "yellow"

/area/debug/admin/gamemode/abductor
	name = "\improper Abductor Ship"
	icon_state = "yellow"
	base_lighting_alpha = 255

/area/debug/admin/gamemode/syndicate
	name = "Syndicate Gamemode Areas"
	icon_state = "syndie-ship"
	ambience_index = AMBIENCE_DANGER
	base_lighting_alpha = 255

/area/debug/admin/gamemode/syndicate/nukeops_main
	name = "\improper Syndicate Dreadnought"
	icon_state = "syndie-control"

/area/debug/admin/gamemode/syndicate/nukeops_control
	name = "\improper Syndicate Dreadnought Control Room"

/area/debug/admin/gamemode/syndicate/nukeops_pod
	name = "\improper Syndicate Dreadnought Assault Podbay"

/area/debug/admin/gamemode/syndicate/infiltrator_main
	name = "\improper Syndicate Infiltrator Base"

/area/debug/admin/gamemode/syndicate/infiltrator_main/poweralert(state, obj/source)
	return

/area/debug/admin/gamemode/syndicate/infiltrator_main/atmosalert(danger_level, obj/source)
	return

/area/debug/admin/gamemode/syndicate/infiltrator_jail
	name = "\improper Syndicate Infiltrator Base Brig"

/area/debug/admin/gamemode/syndicate/infiltrator_exterior // Headcanon lore: this is some random snowy moon that the syndies use as a base
	name = "\improper Syndicate Base X-77"
	icon_state = "yellow"

/area/debug/admin/gamemode/clock
	name = "Clock Cult Gamemode Areas"
	icon_state = "yellow"
	ambience_index = AMBIENCE_REEBE
	static_lighting = FALSE
	base_lighting_alpha = 255
	requires_power = FALSE
	flags_1 = NONE
	area_flags = NONE // Yes teleporting

/area/debug/admin/gamemode/clock/reebe
	name = "\improper Reebe"
	icon_state = "yellow"
	hidden = TRUE

/area/debug/admin/gamemode/clock/city
	name = "\improper City of Cogs"
	icon_state = "purple"
	hidden = FALSE

/area/debug/admin/gamemode/brazil
	name = "\improper Location Unresolved"
