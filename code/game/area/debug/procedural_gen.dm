/area/debug/procedural_gen
	name = "Procedurally Generated Areas"
	icon_state = ""

	map_generator = /datum/map_generator/dungeon_generator
	unique = FALSE

	/// If there's other areas on the same z-level that share a generator, their turfs will be aggregated together into a combined working area
	var/shared_generator_initialized = FALSE

/area/debug/procedural_gen/RunGeneration()
	if(ispath(map_generator))
		map_generator = new map_generator(src)
		map_generator.combine_local_areas()
	
	if(!shared_generator_initialized)
		map_generator.generate_terrain()

/area/procedural_gen/test_gen()
	if(!ispath(map_generator))
		map_generator.generate_terrain()
