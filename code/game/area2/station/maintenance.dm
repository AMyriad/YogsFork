/area/station/maintenance
	name = "Maintenance Areas"
	icon_state = ""
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/maint

	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	ambient_buzz = 'sound/ambience/source_corridor2.ogg''
	ambient_buzz_vol = 20
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS
	ambientsounds = list('sound/ambience/ambimaint1.ogg',
						 'sound/ambience/ambimaint2.ogg',
						 'sound/ambience/ambimaint3.ogg',
						 'sound/ambience/ambimaint4.ogg',
						 'sound/ambience/ambimaint5.ogg',
						 'sound/voice/lowHiss2.ogg', //Xeno Breathing Hisses, Hahahaha I'm not even sorry.
						 'sound/voice/lowHiss3.ogg',
						 'sound/voice/lowHiss4.ogg',
						 'yogstation/sound/misc/honk_echo_distant.ogg')

	valid_territory = FALSE

	lights_always_start_on = TRUE
	lighting_colour_tube = "#ffe5cb"
	lighting_colour_bulb = "#ffdbb4"

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

/area/station/maintenance/department/command //- COMMAND
	name = "\improper Bridge Maintenance"
	icon_state = "maint_bridge"
	clockwork_warp_allowed = FALSE

/area/station/maintenance/department/security //- SECURITY
	name = "\improper Brig Maintenance"
	icon_state = "maint_brig"

/area/station/maintenance/department/engineering //- ENGINEERING
	name = "\improper Engineering Maintenance"
	icon_state = "maint_engi"

/area/station/maintenance/department/engineering/electrical
	name = "\improper Electrical Maintenance"
	icon_state = "maint_electrical"

/area/station/maintenance/department/engineering/atmospherics
	name = "\improper Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/station/maintenance/department/medical //- MEDICAL
	name = "\improper Medbay Maintenance"
	icon_state = "medbay_maint"

/area/station/maintenance/department/medical/morgue
	name = "\improper Morgue Maintenance"
	icon_state = "morgue_maint"

/area/station/maintenance/department/supply //- SUPPLY
	name = "\improper Cargo Maintenance"
	icon_state = "maint_cargo"

/area/station/maintenance/department/supply/disposal
	name = "\improper Waste Disposal"
	icon_state = "disposal"

/area/station/maintenance/department/science //- SCIENCE
	name = "\improper Science Maintenance"
	icon_state = "maint_sci"

/area/station/maintenance/department/science/xenobiology
	name = "\improper Xenobiology Maintenance"
	icon_state = "xenomaint"
	xenobiology_compatible = TRUE

/area/station/maintenance/department/service //- SUPPLY
	name = "\improper Service Maintenance"
	icon_state = ""

/area/station/maintenance/department/service/bar
	name = "\improper Maintenance Bar" // My beloved
	icon_state = "maint_bar"
	sound_environment = SOUND_AREA_WOODFLOOR


//- Solar Maintenance/Control Rooms -//
// Keep order going clockwise from north pls ty

/area/station/maintenance/external_power
	name = "External Power Maintenance Areas"
	icon_state = "yellow"

/area/station/maintenance/external_power/north
	name = "North Areas"
	icon_state = "fmaint"

/area/station/maintenance/external_power/north/solar
	name = "\improper Fore (N) Solar Maintenance"
	icon_state = "fmaint"

/area/station/maintenance/external_power/north/geothermal
	name = "\improper Fore (N) Geothermal Maintenance"
	icon_state = "fmaint"

/area/station/maintenance/external_power/northeast
	name = "Northeast Areas"
	icon_state = "fsmaint"

/area/station/maintenance/external_power/northeast/solar
	name = "\improper Starboard Fore (NE) Solar Maintenance"
	icon_state = "fsmaint"

/area/station/maintenance/external_power/northeast/geothermal
	name = "\improper Starboard Fore (NE) Geothermal Maintenance"
	icon_state = "fsmaint"



/area/station/maintenance/external_power/east
	name = "\improper Starboard (E) Maintenance"
	icon_state = "smaint"

/area/station/maintenance/external_power/southeast
	name = "\improper Starboard Quarter (SE) Maintenance"
	icon_state = "asmaint"

/area/station/maintenance/external_power/south
	name = "\improper Aft (S) Maintenance"
	icon_state = "amaint"

/area/station/maintenance/external_power/southwest
	name = "\improper Port Quarter (SW) Maintenance"
	icon_state = "apmaint"

/area/station/maintenance/external_power/west
	name = "\improper Port (W) Maintenance"
	icon_state = "pmaint"

/area/station/maintenance/external_power/northwest
	name = "\improper Port Bow (NW) Maintenance"
	icon_state = "fpmaint"






/area/station/maintenance/external_power/port
	name = "Port (W) Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/station/maintenance/external_power/port/aft
	name = "Port Quarter (SW) Solar Maintenance"
	icon_state = "SolarcontrolAP"

/area/station/maintenance/external_power/port/fore
	name = "Port Bow (NW) Solar Maintenance"
	icon_state = "SolarcontrolFP"

/area/station/maintenance/external_power/starboard
	name = "Starboard (E) Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/station/maintenance/external_power/starboard/aft
	name = "Starboard Quarter (SE) Solar Maintenance"
	icon_state = "SolarcontrolAS"

/area/station/maintenance/external_power/starboard/fore
	name = "Starboard Bow (NE) Solar Maintenance"
	icon_state = "SolarcontrolFS"
