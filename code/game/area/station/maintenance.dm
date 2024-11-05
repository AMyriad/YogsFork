/area/station/maintenance
	name = "Maintenance Areas"
	icon_state = "maint"
	minimap_color = "#4f4e3a"
	airlock_wires = /datum/wires/airlock/maint

	ambience_index = AMBIENCE_MAINT
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	ambient_buzz = 'sound/ambience/source_corridor2.ogg'
	ambient_buzz_vol = 20
	min_ambience_cooldown = 20 SECONDS
	max_ambience_cooldown = 35 SECONDS
	ambientsounds = list('sound/ambience/ambimaint1.ogg',
						 'sound/ambience/ambimaint2.ogg',
						 'sound/ambience/ambimaint3.ogg',
						 'sound/ambience/ambimaint4.ogg',
						 'sound/ambience/ambimaint5.ogg',
						 'sound/voice/lowHiss2.ogg', // Xeno breathing hisses, hahahaha I'm not even sorry
						 'sound/voice/lowHiss3.ogg',
						 'sound/voice/lowHiss4.ogg',
						 'yogstation/sound/misc/honk_echo_distant.ogg')

	lights_always_start_on = TRUE
	lighting_colour_tube = "#ffe5cb"
	lighting_colour_bulb = "#ffdbb4"

	valid_territory = FALSE


/area/station/maintenance/central
	name = "\improper Central Maintenance"
	icon_state = "maint_central"

/area/station/maintenance/north
	name = "\improper Fore (N) Maintenance"
	icon_state = "maint_n"

/area/station/maintenance/northeast
	name = "\improper Starboard Bow (NE) Maintenance"
	icon_state = "maint_ne"

/area/station/maintenance/east
	name = "\improper Starboard (E) Maintenance"
	icon_state = "maint_e"

/area/station/maintenance/southeast
	name = "\improper Starboard Quarter (SE) Maintenance"
	icon_state = "maint_se"

/area/station/maintenance/south
	name = "\improper Aft (S) Maintenance"
	icon_state = "maint_s"

/area/station/maintenance/southwest
	name = "\improper Port Quarter (SW) Maintenance"
	icon_state = "maint_sw"

/area/station/maintenance/west
	name = "\improper Port (W) Maintenance"
	icon_state = "maint_w"

/area/station/maintenance/northwest
	name = "\improper Port Bow (NW) Maintenance"
	icon_state = "maint_nw"


//-- Departmental Maintenance --//
// For maintenance areas INSIDE/INBETWEEN rooms inside departments
// Subtypes of this subtype are exceptions to the above (ex: electrical maint)

/area/station/maintenance/department
	name = "Department Maintenance Areas"

/area/station/maintenance/department/command //- COMMAND
	name = "\improper Bridge Maintenance"
	icon_state = "maint_dept_com"
	clockwork_warp_allowed = FALSE

/area/station/maintenance/department/security //- SECURITY
	name = "\improper Brig Maintenance"
	icon_state = "maint_dept_sec"

/area/station/maintenance/department/engineering //- ENGINEERING
	name = "\improper Engineering Maintenance"
	icon_state = "maint_dept_eng"

/area/station/maintenance/department/engineering/electrical
	name = "\improper Electrical Maintenance"

/area/station/maintenance/department/engineering/atmospherics
	name = "\improper Atmospherics Maintenance"

/area/station/maintenance/department/medical //- MEDICAL
	name = "\improper Medbay Maintenance"
	icon_state = "maint_dept_med"

/area/station/maintenance/department/medical/morgue
	name = "\improper Morgue Maintenance"

/area/station/maintenance/department/supply //- SUPPLY
	name = "\improper Cargo Maintenance"
	icon_state = "maint_dept_sup"

/area/station/maintenance/department/supply/disposal
	name = "\improper Waste Disposal"

/area/station/maintenance/department/science //- SCIENCE
	name = "\improper Science Maintenance"
	icon_state = "maint_dept_sci"

/area/station/maintenance/department/science/xenobiology
	name = "\improper Xenobiology Maintenance"
	xenobiology_compatible = TRUE

/area/station/maintenance/department/service //- SUPPLY
	name = "\improper Service Maintenance"
	icon_state = "maint_dept_srv"

/area/station/maintenance/department/service/bar
	name = "\improper Maintenance Bar" // my beloved
	sound_environment = SOUND_AREA_WOODFLOOR


//-- External Power Maintenance/Control Rooms --//
// Keep order going clockwise from north pls ty

/area/station/maintenance/external_power
	name = "External Power Maintenance Areas"
	icon_state = "maint_extpower"

/area/station/maintenance/external_power/solar //- SOLARS
	name = "Solar Array Areas"
	icon_state = "maint_power_solar"

/area/station/maintenance/external_power/solar/north
	name = "\improper Fore (N) Solar Maintenance"

/area/station/maintenance/external_power/solar/northeast
	name = "\improper Starboard Bow (NE) Solar Maintenance"

/area/station/maintenance/external_power/solar/east
	name = "\improper Starboard (E) Solar Maintenance"

/area/station/maintenance/external_power/solar/southeast
	name = "\improper Starboard Quarter (SE) Solar Maintenance"

/area/station/maintenance/external_power/solar/south
	name = "\improper Aft (S) Solar Maintenance"

/area/station/maintenance/external_power/solar/southwest
	name = "\improper Port Quarter (SW) Solar Maintenance"

/area/station/maintenance/external_power/solar/west
	name = "\improper Port (W) Solar Maintenance"

/area/station/maintenance/external_power/solar/northwest
	name = "\improper Port Bow (NW) Solar Maintenance"

/area/station/maintenance/external_power/geothermal //- GEOTHERMAL
	name = "Geothermal Station Areas"
	icon_state = "maint_power_geo"

/area/station/maintenance/external_power/geothermal/north
	name = "\improper Fore (N) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/northeast
	name = "\improper Starboard Bow (NE) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/east
	name = "\improper Starboard (E) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/southeast
	name = "\improper Starboard Quarter (SE) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/south
	name = "\improper Aft (S) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/southwest
	name = "\improper Port Quarter (SW) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/west
	name = "\improper Port (W) Geothermal Maintenance"

/area/station/maintenance/external_power/geothermal/northwest
	name = "\improper Port Bow (NW) Geothermal Maintenance"
