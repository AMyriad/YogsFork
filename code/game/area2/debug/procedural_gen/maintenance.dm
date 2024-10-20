/area/debug/procedural_gen/maintenance
	name = "Procedural Maintenance Areas"
	icon_state = ""
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

/area/procedural_gen/maintenance/backrooms
	name = "The Backrooms"
	requires_power = FALSE
	map_generator = /datum/map_generator/dungeon_generator/maintenance/backrooms

//-- General Maintenance --//
// Keep order going clockwise from north pls ty

/area/debug/procedural_gen/maintenance/general
	name = "General Maintenance Areas"
	icon_state = "maintcentral"

/area/debug/procedural_gen/maintenance/general/central
	name = "\improper Central Maintenance"
	icon_state = "maintcentral"

/area/debug/procedural_gen/maintenance/general/north
	name = "\improper Fore (N) Maintenance"
	icon_state = "fmaint"

/area/debug/procedural_gen/maintenance/general/northeast
	name = "\improper Starboard Bow (NE) Maintenance"
	icon_state = "fsmaint"

/area/debug/procedural_gen/maintenance/general/east
	name = "\improper Starboard (E) Maintenance"
	icon_state = "smaint"

/area/debug/procedural_gen/maintenance/general/southeast
	name = "\improper Starboard Quarter (SE) Maintenance"
	icon_state = "asmaint"

/area/debug/procedural_gen/maintenance/general/south
	name = "\improper Aft (S) Maintenance"
	icon_state = "amaint"

/area/debug/procedural_gen/maintenance/general/southwest
	name = "\improper Port Quarter (SW) Maintenance"
	icon_state = "apmaint"

/area/debug/procedural_gen/maintenance/general/west
	name = "\improper Port (W) Maintenance"
	icon_state = "pmaint"

/area/debug/procedural_gen/maintenance/general/northwest
	name = "\improper Port Bow (NW) Maintenance"
	icon_state = "fpmaint"


//-- Departmental Maintenance --//
// For maintenance areas INSIDE/INBETWEEN rooms inside departments
// Subtypes of this subtype are exceptions to the above (ex: electrical maint)

/area/debug/procedural_gen/maintenance/department
	name = "Department Maintenance Areas"
	icon_state = ""

/area/debug/procedural_gen/maintenance/department/command //- COMMAND
	name = "\improper Bridge Maintenance"
	icon_state = "maint_bridge"
	clockwork_warp_allowed = FALSE

/area/debug/procedural_gen/maintenance/department/security //- SECURITY
	name = "\improper Brig Maintenance"
	icon_state = "maint_brig"

/area/debug/procedural_gen/maintenance/department/engineering //- ENGINEERING
	name = "\improper Engineering Maintenance"
	icon_state = "maint_engi"

/area/debug/procedural_gen/maintenance/department/engineering/electrical
	name = "\improper Electrical Maintenance"
	icon_state = "maint_electrical"

/area/debug/procedural_gen/maintenance/department/engineering/atmospherics
	name = "\improper Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/debug/procedural_gen/maintenance/department/medical //- MEDICAL
	name = "\improper Medbay Maintenance"
	icon_state = "medbay_maint"

/area/debug/procedural_gen/maintenance/department/medical/morgue
	name = "\improper Morgue Maintenance"
	icon_state = "morgue_maint"

/area/debug/procedural_gen/maintenance/department/supply //- SUPPLY
	name = "\improper Cargo Maintenance"
	icon_state = "maint_cargo"

/area/debug/procedural_gen/maintenance/department/supply/disposal
	name = "\improper Waste Disposal"
	icon_state = "disposal"

/area/debug/procedural_gen/maintenance/department/science //- SCIENCE
	name = "\improper Science Maintenance"
	icon_state = "maint_sci"

/area/debug/procedural_gen/maintenance/department/science/xenobiology
	name = "\improper Xenobiology Maintenance"
	icon_state = "xenomaint"
	xenobiology_compatible = TRUE

/area/debug/procedural_gen/maintenance/department/service //- SUPPLY
	name = "\improper Service Maintenance"
	icon_state = ""

/area/debug/procedural_gen/maintenance/department/service/bar
	name = "\improper Maintenance Bar" // My beloved
	icon_state = "maint_bar"
	sound_environment = SOUND_AREA_WOODFLOOR
