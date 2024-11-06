/area/debug/procedural_gen/maintenance
	name = "PROCEDURAL MAINTENANCE AREAS"
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

/area/debug/procedural_gen/maintenance/backrooms
	name = "\improper The Backrooms"
	requires_power = FALSE
	map_generator = /datum/map_generator/dungeon_generator/maintenance/backrooms

//-- General Maintenance --//
// Keep order going clockwise from north pls ty

/area/debug/procedural_gen/maintenance/general
	name = "GENERAL MAINTENANCE AREAS"
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
