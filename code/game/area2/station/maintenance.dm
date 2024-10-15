/area/station/maintenance
	name = "Maintenance Areas"
	icon_state = ""
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/maint

	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	ambient_buzz = 'sound/ambience/source_corridor2.ogg'
	ambient_buzz_vol = 20
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS

	valid_territory = FALSE

	lights_always_start_on = TRUE
	lighting_colour_tube = "#ffe5cb"
	lighting_colour_bulb = "#ffdbb4"

/area/station/maintenance/disposal
	name = "\improper Waste Disposal"
	icon_state = "disposal"


//- General Maintenance Areas -//
// Keep order going clockwise from north pls ty

/area/station/maintenance/general
	name = "General Maintenance Areas"
	icon_state = "maintcentral"

/area/station/maintenance/general/central
	name = "\improper Central Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/general/north
	name = "\improper Fore (N) Maintenance"
	icon_state = "fmaint"

/area/station/maintenance/general/northeast
	name = "\improper Starboard Fore (NE) Maintenance"
	icon_state = "fsmaint"

/area/station/maintenance/general/east
	name = "\improper Starboard (E) Maintenance"
	icon_state = "smaint"

/area/station/maintenance/general/southeast
	name = "\improper Starboard Quarter (SE) Maintenance"
	icon_state = "asmaint"

/area/station/maintenance/general/south
	name = "\improper Aft (S) Maintenance"
	icon_state = "amaint"

/area/station/maintenance/general/southwest
	name = "\improper Port Quarter (SW) Maintenance"
	icon_state = "apmaint"

/area/station/maintenance/general/west
	name = "\improper Port (W) Maintenance"
	icon_state = "pmaint"

/area/station/maintenance/general/northwest
	name = "\improper Port Bow (NW) Maintenance"
	icon_state = "fpmaint"


//- Departmental Maintenance -//
// For maintenance areas INSIDE/INBETWEEN rooms inside departments
// Subtypes of this subtype are exceptions to the above tho (ex: electrical maint)

/area/station/maintenance/department
	name = "Department Maintenance Areas"
	icon_state = ""

/area/station/maintenance/department/command
	name = "\improper Bridge Maintenance"
	icon_state = "maint_bridge"

/area/station/maintenance/department/security
	name = "\improper Brig Maintenance"
	icon_state = "maint_brig"

/area/station/maintenance/department/engineering
	name = "\improper Engineering Maintenance"
	icon_state = "maint_engi"

/area/station/maintenance/department/engineering/electrical
	name = "\improper Electrical Maintenance"
	icon_state = "maint_electrical"

/area/station/maintenance/department/medical
	name = "\improper Medbay Maintenance"
	icon_state = "medbay_maint"

/area/station/maintenance/department/science
	name = "\improper Science Maintenance"
	icon_state = "maint_sci"

/area/station/maintenance/department/supply
	name = "\improper Cargo Maintenance"
	icon_state = "maint_cargo"






/area/station/maintenance/department/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/station/maintenance/department/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/station/maintenance/department/crew_quarters/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"
	sound_environment = SOUND_AREA_WOODFLOOR


/area/station/maintenance/department/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/station/maintenance/department/engine/atmos
	name = "Atmospherics Maintenance"
	icon_state = "maint_atmos"




/area/station/maintenance/department/medical/central
	name = "Central Medbay Maintenance"
	icon_state = "medbay_maint_central"

/area/station/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "morgue_maint"



/area/station/maintenance/department/science/central
	name = "Central Science Maintenance"
	icon_state = "maint_sci_central"


/area/station/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "xenomaint"
	xenobiology_compatible = TRUE







/*area/station/maintenance/central/secondary
	name = "Central Maintenance"
	icon_state = "maintcentral"
	clockwork_warp_allowed = FALSE
*/
