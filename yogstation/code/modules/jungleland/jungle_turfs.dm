/* JUNGLELAND ATMOS REFERENCE FROM IN GAME
Moles: 208 mol
Volume: 2500 L
Pressure: 276.56 kPa
Oxygen: 21.15 % (44 mol)
Nitrogen: 78.85 % (164 mol)
Temperature: 126.85 °C (400 K)
*/


/area/pregen
	name = "Pregenerated Space"
	icon = 'yogstation/icons/turf/floors/jungle.dmi'
	icon_state = "pregen"
	map_generator = /datum/map_generator/jungleland
	static_lighting = FALSE

	base_lighting_alpha = 255
	has_gravity = TRUE

/area/jungleland
	name = "Jungleland"
	static_lighting = FALSE

	base_lighting_alpha = 255
	outdoors = TRUE
	has_gravity = TRUE
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	outdoors = TRUE
	mining_speed = TRUE

/area/jungleland/explored
	name = "Explored Jungle"

/area/jungleland/ocean
	name = "Toxic Ocean"

/area/jungleland/proper 
	name = "Jungle"

/area/jungleland/toxic_pit 
	name = "Toxic Pit"

/area/jungleland/barren_rocks 
	name = "Barren Rocks"

/area/jungleland/dry_swamp 
	name = "Rocky Beach"

/area/jungleland/dying_forest
	name = "Dying Jungle"

/area/ruin/powered/sinden
	name = "Den of Sin"
	icon_state = "dk_yellow"

/turf/open/floor/plating/dirt/jungleland
	name = "generic jungle land turf"
	desc = "Nothing but blood, sweat, and tears here. You feel like you should report seeing this."
	icon = 'yogstation/icons/turf/floors/jungle.dmi'
	icon_state = "nothing"
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/water/toxic_pit
	icon_state_regular_floor = "nothing" //used to remember what icon state the tile should have by default
	icon_regular_floor = 'yogstation/icons/turf/floors/jungle.dmi' //used to remember what icon the tile should have by default
	icon_plating = "nothing"
	var/can_spawn_ore = TRUE
	var/ore_present = ORE_EMPTY
	var/spawn_overlay = TRUE
	var/can_mine = TRUE 

/turf/open/floor/plating/dirt/jungleland/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill)
	if(drill.do_after_mecha(src, 10 / drill.drill_level))
		spawn_rock()
		drill.move_ores()

/turf/open/floor/plating/dirt/jungleland/proc/spawn_rock()
	if(ore_present == ORE_EMPTY || !can_spawn_ore)
		return
	can_spawn_ore = FALSE
	if(spawn_overlay)
		add_overlay(image(icon='yogstation/icons/obj/jungle.dmi',icon_state="dug_spot",layer=BELOW_OBJ_LAYER))
	var/datum/ore_patch/ore = GLOB.jungle_ores[ ore_present ]
	if(ore)
		ore.spawn_at(src)
		for(var/i in 0 to 2)
			new /obj/item/stack/ore/glass(src)

/turf/open/floor/plating/dirt/jungleland/tool_act(mob/living/user, obj/item/I, tool_type)
	if(tool_type != TOOL_MINING && tool_type != TOOL_SHOVEL)
		return ..()
	
	if(ore_present == ORE_EMPTY)
		return ..()

	if(!can_spawn_ore)
		return ..()
	
	if(!can_mine)
		return

	can_mine = FALSE
	I.play_tool_sound(user)	
	if(!do_after(user,10 SECONDS * I.toolspeed,src))
		can_mine = TRUE
		return ..()
	can_mine = TRUE
	spawn_rock()
	
/turf/open/floor/plating/dirt/jungleland/ex_act(severity, target)
	if(can_spawn_ore && prob( (severity/3)*100  ))	
		spawn_rock()

/turf/open/floor/plating/dirt/jungleland/barren_rocks
	name = "barren rock"
	desc = "A dense ground of magmatic rock laden with cracks and fissures. It's faintly warm to the touch."
	gender = PLURAL // That's some barren rock
	icon_state = "barren_rocks"
	icon_plating = "barren_rocks"
	icon_state_regular_floor = "barren_rocks" 

/* /turf/open/floor/plating/dirt/jungleland/toxic_rocks		// There appears to be an area icon for this, but this turf type is completely unused; this is its only mention
	name = "mud"											// Uncomment this if you want it to exist again for some reason
	desc = "Liquid mixed with dirt."
	icon_state = "toxic_rocks" // <- The area icon in question
	icon_plating = "toxic_rocks"
	icon_state_regular_floor = "toxic_rocks" */

/turf/open/floor/plating/dirt/jungleland/dry_swamp
	name = "sand"
	desc = "Dunes of coarse, rough, and irritating sand. Great for the eyes."
	gender = PLURAL
	icon_state = "dry_swamp"
	icon_plating = "dry_swamp"
	icon_state_regular_floor = "dry_swamp" 

/turf/open/floor/plating/dirt/jungleland/toxic_pit
	name = "mud"
	desc = "A healthy blend of dirt and the acidic river water. Probably isn't the best kind for your skin."
	gender = PLURAL
	icon_state = "mud"
	icon_plating = "mud"
	icon_state_regular_floor = "mud"

/turf/open/floor/plating/dirt/jungleland/dry_swamp1
	name = "dried surface"
	desc = "it used to be a riverbed"
	icon_state = "dry_swamp1"
	icon_plating = "dry_swamp1"
	icon_state_regular_floor = "dry_swamp1" 

/turf/open/floor/plating/dirt/jungleland/dying_forest
	name = "jungle sand"
	desc = "Jungle sand. Sand in the jungle. It's coarse, rough, irritating, and great for the eyes. Jungle sand."
	gender = PLURAL
	icon_state = "dune"
	icon_plating = "dune"
	icon_state_regular_floor = "dune"

/turf/open/floor/plating/dirt/jungleland/deep_jungle
	name = "tropical grass"
	desc = "A rich bed of thick, leafy plant life deck these grounds.  "
	gender = PLURAL
	icon = 'icons/turf/floors/junglegrass.dmi'
	icon_state = "junglegrass-255"
	base_icon_state = "junglegrass"

	icon_regular_floor = 'icons/turf/floors/junglegrass.dmi'
	icon_plating = "junglegrass-255"	// So we remember what we looked like before plating was placed
	icon_state_regular_floor = "junglegrass-255"

	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_JUNGLE_GRASS
	canSmoothWith = SMOOTH_GROUP_JUNGLE_GRASS

/turf/open/floor/plating/dirt/jungleland/quarry
	name = "loose quarry stones"
	desc = "there are some mineral underneath"
	icon_state = "quarry"
	icon_plating = "quarry"
	icon_state_regular_floor = "quarry"
	spawn_overlay = FALSE

/turf/open/floor/plating/dirt/jungleland/quarry/Initialize()
	. = ..()
	ore_present = pick(GLOB.quarry_ores)

/turf/open/floor/plating/dirt/jungleland/quarry/spawn_rock()
	if(prob(75))
		for(var/i in 2 to rand(4,10))
			new /obj/item/stack/ore/glass/basalt()
	else 
		. = ..()
		ore_present = pick(GLOB.quarry_ores)
	can_spawn_ore = TRUE

/turf/open/water/toxic_pit
	name = "sulphuric water"
	desc = ""
	color = "#00c167"
	slowdown = 2
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/water/toxic_pit

/turf/open/water/toxic_pit/Entered(atom/movable/AM)
	. = ..()
	if(!ishuman(AM))
		return
		
	var/mob/living/carbon/human/humie = AM
	var/chance = (100 - humie.getarmor(null,BIO)) * 0.33

	if(AM.movement_type & (FLYING|FLOATING) || !AM.has_gravity() || HAS_TRAIT(AM,TRAIT_SULPH_PIT_IMMUNE))
		return

	if(isipc(humie) && prob(chance))
		humie.adjustFireLoss(33)
		to_chat(humie,span_danger("the sulphuric solution burns and singes into your plating!"))
		return 

	if(HAS_TRAIT(humie,TRAIT_TOXIMMUNE) || HAS_TRAIT(humie,TRAIT_TOXINLOVER))
		return
	
	if(prob(chance * 0.33))
		humie.reagents.add_reagent(/datum/reagent/toxic_metabolities, 7.5)
	
	if(prob((chance * 0.15 ) + 10 ))
		humie.acid_act(5, 7.5)

/turf/open/water/safe/jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/open/water/toxic_pit/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	switch(the_rcd.construction_mode)
		if(RCD_FLOORWALL)
			return list("mode" = RCD_FLOORWALL, "delay" = 0, "cost" = 3)
	return FALSE

/turf/open/water/toxic_pit/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	switch(passed_mode)
		if(RCD_FLOORWALL)
			to_chat(user, span_notice("You build a floor."))
			place_on_top(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
			return TRUE
	return FALSE

/turf/open/water/deep_toxic_pit
	name = "deep sulphuric water"
	desc = "Extraordinarly toxic"
	color = "#004700"
	slowdown = 4
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/water/deep_toxic_pit

/turf/open/water/deep_toxic_pit/Entered(atom/movable/AM)
	. = ..()
	if(!ishuman(AM))
		return

	var/mob/living/carbon/human/humie = AM
	
	if(AM.movement_type & (FLYING|FLOATING) || !AM.has_gravity())
		return

	if(isipc(humie))
		humie.adjustFireLoss(33)
		to_chat(humie,span_danger("the sulphuric solution burns and singes into your plating!"))
		return

	if(HAS_TRAIT(humie,TRAIT_TOXIMMUNE) || HAS_TRAIT(humie,TRAIT_TOXINLOVER))
		return
	
	humie.reagents.add_reagent(/datum/reagent/toxic_metabolities,15)
	humie.adjustFireLoss(33)
	humie.acid_act(15,15)

/turf/open/water/deep_toxic_pit/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	switch(the_rcd.construction_mode)
		if(RCD_FLOORWALL)
			return list("mode" = RCD_FLOORWALL, "delay" = 0, "cost" = 3)
	return FALSE

/turf/open/water/deep_toxic_pit/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	switch(passed_mode)
		if(RCD_FLOORWALL)
			to_chat(user, span_notice("You build a floor."))
			place_on_top(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
			return TRUE
	return FALSE

/turf/open/floor/wood/jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/open/floor/plating/ashplanet/rocky/jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/open/floor/plating/jungle_baseturf
	baseturfs = /turf/open/floor/plating/dirt/jungleland/deep_jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/open/floor/plating/jungle_baseturf/dying
	baseturfs = /turf/open/floor/plating/dirt/jungleland/dying_forest

/turf/open/indestructible/grass/jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/open/floor/plasteel/jungle
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/closed/mineral/ash_rock/jungle
	turf_type = /turf/open/floor/plating/jungle_baseturf
	baseturfs = /turf/open/floor/plating/jungle_baseturf
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS

/turf/closed/mineral/ash_rock/jungle/deepjungle
	turf_type = /turf/open/floor/plating/dirt/jungleland/deep_jungle
	baseturfs = /turf/open/floor/plating/dirt/jungleland/deep_jungle

/turf/closed/mineral/ash_rock/jungle/swamp
	turf_type = /turf/open/floor/plating/dirt/jungleland/toxic_pit
	baseturfs = /turf/open/floor/plating/dirt/jungleland/toxic_pit

/turf/open/water/tar_basin
	name = "tar basin"
	gender = NEUTER
	color = "#680047"
	slowdown = 4
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/water/tar_basin


/turf/open/floor/plating/dirt/jungleland/obsidian 
	name =	"obsidian ground"
	desc = "Dark crystaline flooring"
	icon_state = "obsidian"
	can_mine = FALSE

/turf/closed/obsidian
	name = "obsidian wall"
	desc = "Obsidian wal tearing out of the earth, it reflects light in all the colours you could ever imagine, and you can see something shining brightly within it. You can't quite seem to destroy it with a pickaxe, but maybe an explosion mau suffice?"
	icon = 'yogstation/icons/turf/walls/obsidian.dmi'	
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_groups = SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_MINERAL_WALLS
	canSmoothWith = SMOOTH_GROUP_MINERAL_WALLS
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	var/list/explosion_threshold = list(EXPLODE_DEVASTATE, EXPLODE_HEAVY, EXPLODE_LIGHT)
	var/list/droppable_gems = list(
		null = 25,
		/obj/item/gem/topaz = 5,
		/obj/item/gem/emerald = 5,
		/obj/item/gem/sapphire = 5,
		/obj/item/gem/ruby = 5,
		/obj/item/gem/purple = 2,
		/obj/item/gem/phoron = 1
	)

/turf/closed/obsidian/ex_act(severity, target)
	. = ..()
	if(severity in explosion_threshold)
		drop_gems()
		ChangeTurf(/turf/open/floor/plating/dirt/jungleland/obsidian)

/turf/closed/obsidian/proc/drop_gems()
	var/type = pickweight(droppable_gems)
	if(type)
		new type(src)

/turf/closed/obsidian/hard 
	name = "tough obsidian wall"
	icon = 'yogstation/icons/turf/walls/obsidian_hard.dmi'
	explosion_threshold = list(EXPLODE_DEVASTATE, EXPLODE_HEAVY)
	droppable_gems = list (
		/obj/item/gem/topaz = 1,
		/obj/item/gem/emerald = 2,
		/obj/item/gem/sapphire = 3,
		/obj/item/gem/ruby = 4,
		/obj/item/gem/purple = 5,
		/obj/item/gem/phoron = 5
	)

/turf/open/lava/smooth/jungle_surface
	initial_gas_mix = JUNGLELAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/lava/smooth/jungle_surface
