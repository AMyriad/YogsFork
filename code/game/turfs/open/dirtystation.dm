//Janitors!  Janitors, janitors, janitors!  -Sayu


//Conspicuously not-recent versions of suspicious cleanables

//This file was made not awful by Xhuis on September 13, 2016

//Making the station dirty, one tile at a time. Called by master controller's setup_objects

/turf/open/floor/proc/MakeDirty()
	// We start with a 1/3 chance of having this proc called by Initialize(mapload)

	if(!(flags_1 & CAN_BE_DIRTY_1))
		return

	if(locate(/obj/structure/grille) in contents)
		return

	var/area/A = get_area(src)

	if(A && !(A.flags_1 & CAN_BE_DIRTY_1))
		return

	//The code below here isn't exactly optimal, but because of the individual decals that each area uses it's still applicable.

				//high dirt - 1/3 chance.
	var/static/list/high_dirt_areas = typecacheof(list(
		/area/station/science/toxins/testing_site,
		/area/external/mining/base,
		/area/external/mining/labor,
		/area/station/public/vacant,
		/area/ruins/space,
	))
	if(is_type_in_typecache(A, high_dirt_areas))
		new /obj/effect/decal/cleanable/dirt(src)	//vanilla, but it works
		return


	if(prob(80))	//mid dirt  - 1/15
		return

		//Construction zones. Blood, sweat, and oil.  Oh, and dirt.
	var/static/list/engine_dirt_areas = typecacheof(list(
		/area/station/engineering,
		/area/station/command/heads/ce,
		/area/station/science/robotics,
		/area/station/maintenance,
		/area/debug/procedural_gen/maintenance,
		/area/station/public/vacant,
		/area/external/survival_pod,
	))
	if(is_type_in_typecache(A, engine_dirt_areas))
		if(prob(3))
			new /obj/effect/decal/cleanable/blood/old(src)
		else
			if(prob(35))
				if(prob(4))
					new /obj/effect/decal/cleanable/robot_debris/old(src)
				else
					new /obj/effect/decal/cleanable/oil(src)
			else
				new /obj/effect/decal/cleanable/dirt(src)
		return

		//Bathrooms. Blood, vomit, and shavings in the sinks.
	var/static/list/bathroom_dirt_areas = typecacheof(list(
		/area/station/public/misc/restrooms,
	))
	if(is_type_in_typecache(A, bathroom_dirt_areas))
		if(prob(40))
			if(prob(90))
				new /obj/effect/decal/cleanable/vomit/old(src)
			else
				new /obj/effect/decal/cleanable/blood/old(src)
		return

		//Hangars and pods covered in oil.
	var/static/list/oily_areas = typecacheof(list(
		/area/station/supply,
		/area/station/public/misc/pod_bay,
		/area/station/public/misc/shipbreak_staging,
	))
	if(is_type_in_typecache(A, oily_areas))
		if(prob(25))
			new /obj/effect/decal/cleanable/oil(src)
		return


	if(prob(75))	//low dirt  - 1/60
		return

		//Areas where gibs will be present. Robusting probably happened some time ago.
	var/static/list/gib_covered_areas = typecacheof(list(
		/area/station/ai_monitored/ai,
		/area/station/security,
		/area/station/command/heads/hos,
		/area/station/maintenance,
		/area/debug/procedural_gen/maintenance,
	))
	if(is_type_in_typecache(A, gib_covered_areas))
		if(prob(20))
			if(prob(5))
				new /obj/effect/decal/cleanable/blood/gibs/old(src)
			else
				new /obj/effect/decal/cleanable/blood/old(src)
		return

		//Kitchen areas. Broken eggs, flour, spilled milk (no crying allowed.)
	var/static/list/kitchen_dirt_areas = typecacheof(list(
		/area/station/service/kitchen,
	))
	if(is_type_in_typecache(A, kitchen_dirt_areas))
		if(prob(60))
			if(prob(50))
				new /obj/effect/decal/cleanable/food/egg_smudge(src)
			else
				new /obj/effect/decal/cleanable/food/flour(src)
		return

		//Medical areas. Mostly clean by space-OSHA standards, but has some blood and oil spread about.
	var/static/list/medical_dirt_areas = typecacheof(list(
		/area/station/medical,
		/area/station/command/heads/cmo,
	))
	if(is_type_in_typecache(A, medical_dirt_areas))
		if(prob(66))
			if(prob(5))
				new /obj/effect/decal/cleanable/blood/gibs/old(src)
			else
				new /obj/effect/decal/cleanable/blood/old(src)
		else if(prob(30))
			if(istype(A, /area/station/medical/morgue))
				new /obj/item/ectoplasm(src)
			else
				new /obj/effect/decal/cleanable/vomit/old(src)
		return

		//Science messes. Mostly green glowy stuff -WHICH YOU SHOULD NOT INGEST-.
	var/static/list/science_dirt_areas = typecacheof(list(
		/area/station/science,
		/area/station/command/heads/rd,
	))
	if(is_type_in_typecache(A, science_dirt_areas))
		if(prob(20))
			new /obj/effect/decal/cleanable/greenglow/filled(src)	//this cleans itself up but it might startle you when you see it.
		return

	return TRUE
