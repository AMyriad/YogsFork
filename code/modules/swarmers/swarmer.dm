/**
  * # Swarmer
  *
  * Tiny machines made by an ancient civilization, they seek only to consume materials and replicate.
  *
  * Tiny robots which, while not lethal, seek to destroy station components in order to recycle them into more swarmers.
  * Sentient player swarmers spawn from a beacon spawned in maintenance and they can spawn melee swarmers to protect them.
  * Swarmers have the following abilities:
  * - Can melee targets to deal stamina damage.  Stuns cyborgs.
  * - Can teleport friend and foe alike away using ctrl + click.  Applies binds to carbons, preventing them from immediate retaliation
  * - Can shoot lasers which deal stamina damage to carbons and direct damage to simple mobs
  * - Can self repair for free, completely healing themselves
  * - Can construct traps which stun targets, and walls which block non-swarmer entites and projectiles
  * - Can create swarmer drones, which lack the above abilities sans melee stunning targets.  A swarmer can order its drones around by middle-clicking a tile.
  */

/mob/living/simple_animal/hostile/swarmer
	name = "swarmer"
	icon = 'icons/mob/swarmer.dmi'
	desc = "Robotic constructs of unknown design, swarmers seek only to consume materials and replicate themselves indefinitely."
	speak_emote = list("tones")
	initial_language_holder = /datum/language_holder/swarmer
	bubble_icon = BUBBLE_SWARMER
	mob_biotypes = MOB_ROBOTIC
	health = 40
	maxHealth = 40
	status_flags = CANPUSH
	icon_state = "swarmer"
	icon_living = "swarmer"
	icon_dead = "swarmer_unactivated"
	icon_gib = null
	wander = 0
	harm_intent_damage = 5
	minbodytemp = 0
	maxbodytemp = 500
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0
	melee_damage_lower = 15
	melee_damage_upper = 15
	melee_damage_type = STAMINA
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	hud_possible = list(ANTAG_HUD, DIAG_STAT_HUD, DIAG_HUD)
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	attacktext = "shocks"
	attack_sound = 'sound/effects/empulse.ogg'
	friendly = "pinches"
	speed = 0
	faction = list("swarmer")
	AIStatus = AI_OFF
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_TINY
	ventcrawler = VENTCRAWLER_ALWAYS
	ranged = 1
	projectiletype = /obj/projectile/beam/disabler/swarmer
	ranged_cooldown_time = 20
	projectilesound = 'sound/weapons/taser2.ogg'
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/ore/bluespace_crystal)
	del_on_death = 1
	deathmessage = "explodes with a sharp pop!"
	light_color = LIGHT_COLOR_CYAN
	hud_type = /datum/hud/living/swarmer
	speech_span = SPAN_ROBOT
	///Resource points, generated by consuming metal/glass
	var/resources = 0
	///Maximum amount of resources a swarmer can store
	var/max_resources = 100
	///List used for player swarmers to keep track of their drones
	var/list/mob/living/simple_animal/hostile/swarmer/melee/dronelist
	///Prevents alert spam
	var/last_alert = 0
	light_system = MOVABLE_LIGHT
	light_range = 3
	///Bitflags to store boolean conditions, such as whether the light is on or off.
	var/swarmer_flags = NONE

/mob/living/simple_animal/hostile/swarmer/Initialize(mapload)
	. = ..()
	remove_verb(src, /mob/verb/pulled)
	for(var/datum/atom_hud/data/diagnostic/diag_hud in GLOB.huds)
		diag_hud.add_atom_to_hud(src)

/mob/living/simple_animal/hostile/swarmer/med_hud_set_health()
	var/image/holder = hud_list[DIAG_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	holder.icon_state = "huddiag[RoundDiagBar(health/maxHealth)]"

/mob/living/simple_animal/hostile/swarmer/med_hud_set_status()
	var/image/holder = hud_list[DIAG_STAT_HUD]
	var/icon/I = icon(icon, icon_state, dir)
	holder.pixel_y = I.Height() - world.icon_size
	holder.icon_state = "hudstat"

/mob/living/simple_animal/hostile/swarmer/get_status_tab_items()
	. = ..()
	. += "Resources: [resources]"

/mob/living/simple_animal/hostile/swarmer/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	var/emp_damage = severity/EMP_HEAVY
	if(health > emp_damage)
		adjustHealth(health - emp_damage)
	else
		death()

/mob/living/simple_animal/hostile/swarmer/CanAllowThrough(atom/movable/O)
	. = ..()
	if(istype(O, /obj/projectile/beam/disabler))//Allows for swarmers to fight as a group without wasting their shots hitting each other
		return TRUE
	if(isswarmer(O))
		return TRUE

////CTRL CLICK FOR SWARMERS AND SWARMER_ACT()'S////
/mob/living/simple_animal/hostile/swarmer/AttackingTarget()
	if(!isliving(target))
		if(!environment_check(target))
			return FALSE
		return target.swarmer_act(src)
	if(iscyborg(target))
		var/mob/living/silicon/borg = target
		borg.adjustBruteLoss(melee_damage_lower)
	return ..()

/mob/living/simple_animal/hostile/swarmer/MiddleClickOn(atom/A)
	. = ..()
	if(!LAZYLEN(dronelist))
		return
	var/turf/clicked_turf = get_turf(A)
	if(!clicked_turf)
		return
	for(var/d in dronelist)
		var/mob/living/simple_animal/hostile/drone = d
		drone.LoseTarget()
		drone.Goto(clicked_turf, drone.move_to_delay)

/mob/living/simple_animal/hostile/swarmer/CtrlClickOn(atom/A)
	. = TRUE
	face_atom(A)
	if(!isturf(loc))
		return
	if(next_move > world.time)
		return
	if(!A.Adjacent(src))
		return
	if(isliving(A))
		prepare_target(A)

////END CTRL CLICK FOR SWARMERS////

///Checks whether a target atom is safe to deconstruct.
/mob/living/simple_animal/hostile/swarmer/proc/environment_check(atom/target)
	var/turf/target_area = get_area(target)
	if(istype(target_area, /area/engine/supermatter))
		to_chat(src, span_warning("Disrupting the containment of a supermatter crystal would not be to our benefit. Aborting."))
		target = null
		return FALSE
	if(istype(target_area, /area/shuttle)) // some of you can't behave
		to_chat(src, span_warning("Preventing crew evacuation interferes with our goal. Aborting."))
		target = null
		return FALSE
	if(target.can_atmos_pass == ATMOS_PASS_YES) // will never block atmos, it's safe to deconstruct
		return TRUE
	var/turf/target_turf = get_turf(target)
	for(var/direction in GLOB.cardinals_multiz) // check any adjacent turfs
		var/turf/open/adjacent_turf = get_step_multiz(target_turf, direction)
		if(!adjacent_turf || !isopenturf(adjacent_turf))
			continue
		if(adjacent_turf.active_hotspot || adjacent_turf.turf_fire)
			to_chat(src, span_warning("Destroying this object could allow fire to spread. Aborting."))
			target = null
			return FALSE
		var/datum/gas_mixture/turf_air = adjacent_turf.return_air()
		if(turf_air.return_pressure() < HAZARD_LOW_PRESSURE || isspaceturf(adjacent_turf) || istype(get_area(adjacent_turf), /area/shuttle))
			to_chat(src, span_warning("Destroying this object has the potential to cause a hull breach. Aborting."))
			target = null
			return FALSE
		if(turf_air.return_temperature() > BODYTEMP_HEAT_DAMAGE_LIMIT || turf_air.return_temperature() < BODYTEMP_COLD_DAMAGE_LIMIT || turf_air.return_pressure() > HAZARD_HIGH_PRESSURE)
			to_chat(src, span_warning("Destroying this object may result in an inhospitable environment. Aborting."))
			target = null
			return FALSE
		for(var/gas_id in turf_air.get_gases())
			if((GLOB.gas_data.flags[gas_id] & GAS_FLAG_DANGEROUS) && turf_air.get_moles(gas_id) > MINIMUM_MOLE_COUNT)
				to_chat(src, span_warning("Destroying this object will likely cause a gas leak. Aborting."))
				target = null
				return FALSE
	return TRUE

/**
  * Called when a swarmer creates a structure or drone
  *
  * Proc called whenever a swarmer creates a structure or drone
  * Arguments:
  * * fabrication_object - The atom to create
  * * fabrication_cost - How many resources it costs for a swarmer to create the object
  */
/mob/living/simple_animal/hostile/swarmer/proc/Fabricate(atom/fabrication_object,fabrication_cost = 0)
	if(!isturf(loc))
		balloon_or_message(src, "not a suitable location", \
			span_warning("This is not a suitable location for fabrication. We need more space."))
		return
	if(resources < fabrication_cost)
		balloon_or_message(src, "not enough resources", \
			span_warning("You do not have the necessary resources to fabricate this object."))
		return
	resources -= fabrication_cost
	var/atom/fabricated_object = new fabrication_object(drop_location())
	fabricated_object.balloon_or_message(src, "successfully fabricated", \
			span_notice("Sucessfully fabricated [fabricated_object]."))
	return fabricated_object

/**
  * Called when a swarmer attempts to consume an object
  *
  * Proc which determines interaction between a swarmer and whatever it is attempting to consume
  * Arguments:
  * * target - The material or object the swarmer is attempting to consume
  */
/mob/living/simple_animal/hostile/swarmer/proc/Integrate(obj/target)
	var/resource_gain = target.integrate_amount()
	if(resources + resource_gain > max_resources)
		balloon_or_message(src, "storage is full", \
			span_warning("We cannot hold more materials!"))
		return TRUE
	if(!resource_gain)
		target.balloon_or_message(src, "incompatible, aborting", \
			span_warning("[target] is incompatible with our internal matter recycler."))
		return FALSE
	resources += resource_gain
	do_attack_animation(target)
	changeNext_move(CLICK_CD_RAPID)
	var/obj/effect/temp_visual/swarmer/integrate/I = new /obj/effect/temp_visual/swarmer/integrate(get_turf(target))
	I.pixel_x = target.pixel_x
	I.pixel_y = target.pixel_y
	I.pixel_z = target.pixel_z
	if(istype(target, /obj/item/stack))
		var/obj/item/stack/S = target
		S.use(1)
		if(S.amount)
			return TRUE
	qdel(target)
	return TRUE

/**
  * Called when a swarmer attempts to destroy a structure
  *
  * Proc which determines interaction between a swarmer and a structure it is destroying
  * Arguments:
  * * target - The material or object the swarmer is attempting to destroy
  */
/mob/living/simple_animal/hostile/swarmer/proc/dis_integrate(atom/movable/target)
	new /obj/effect/temp_visual/swarmer/disintegration(get_turf(target))
	do_attack_animation(target)
	changeNext_move(CLICK_CD_MELEE)
	SSexplosions.med_mov_atom += target

/**
  * Called when a swarmer attempts to teleport a living entity away
  *
  * Proc which finds a safe location to teleport a living entity to when a swarmer teleports it away.  Also energy handcuffs carbons.
  * Arguments:
  * * target - The entity the swarmer is trying to teleport away
  */
/mob/living/simple_animal/hostile/swarmer/proc/prepare_target(mob/living/target)
	if(target == src)
		return

	if(!is_station_level(z) && !is_mining_level(z))
		balloon_or_message(src, "cannot locate a bluespace link", \
			span_warning("Our bluespace transceiver cannot locate a viable bluespace link, our teleportation abilities are useless in this area."))
		return

	to_chat(src, span_info("Attempting to remove this being from our presence."))

	if(!do_after(src, 3 SECONDS, target))
		return

	teleport_target(target)

/mob/living/simple_animal/hostile/swarmer/proc/teleport_target(mob/living/target)
	var/turf/open/floor/safe_turf = find_safe_turf(zlevels = z, extended_safety_checks = TRUE)

	if(!safe_turf)
		return
	// If we're getting rid of a human, slap some energy cuffs on
	// them to keep them away from us a little longer

	if(ishuman(target))
		var/mob/living/carbon/human/victim = target
		if(!victim.handcuffed)
			victim.set_handcuffed(new /obj/item/restraints/handcuffs/energy/used/swarmer(victim))
			victim.update_handcuffed()
			log_combat(src, victim, "handcuffed")

	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(4,0,get_turf(target))
	sparks.start()
	playsound(src, 'sound/effects/sparks4.ogg', 50, TRUE)
	do_teleport(target, safe_turf , 0, channel = TELEPORT_CHANNEL_BLUESPACE)

/mob/living/simple_animal/hostile/swarmer/electrocute_act(shock_damage, obj/source, siemens_coeff = 1, zone = null, override = FALSE, tesla_shock = FALSE, illusion = FALSE, stun = TRUE, gib = FALSE)
	if(!tesla_shock)
		return FALSE
	return ..()

/**
  * Called when a swarmer attempts to disassemble a machine
  *
  * Proc called when a swarmer attempts to disassemble a machine.  Destroys the machine, and gives the swarmer metal.
  * Arguments:
  * * target - The machine the swarmer is attempting to disassemble
  */
/mob/living/simple_animal/hostile/swarmer/proc/dismantle_machine(obj/machinery/target, alert = FALSE)
	do_attack_animation(target)
	to_chat(src, span_info("We begin to dismantle this machine. We will need to be uninterrupted for some time."))
	var/obj/effect/temp_visual/swarmer/dismantle/dismantle_effect = new /obj/effect/temp_visual/swarmer/dismantle(get_turf(target))
	dismantle_effect.pixel_x = target.pixel_x
	dismantle_effect.pixel_y = target.pixel_y
	dismantle_effect.pixel_z = target.pixel_z
	var/dismantle_time = 10 SECONDS
	if(alert)
		dismantle_time = 30 SECONDS
		if(last_alert < world.time)
			last_alert = world.time + 5 SECONDS
			priority_announce("Connection encryption violation in machine: [target]! Deconstruction projected to complete in: 30 SECONDS")
	if(do_after(src, dismantle_time, target))
		balloon_or_message(src, "dismantling complete", \
			span_info("Dismantling complete."))
		var/atom/target_loc = target.drop_location()
		new /obj/item/stack/sheet/metal(target_loc, 5)
		for(var/p in target.component_parts)
			var/obj/item/part = p
			part.forceMove(target_loc)
		var/obj/effect/temp_visual/swarmer/disintegration/disintegration_effect = new /obj/effect/temp_visual/swarmer/disintegration(get_turf(target))
		disintegration_effect.pixel_x = target.pixel_x
		disintegration_effect.pixel_y = target.pixel_y
		disintegration_effect.pixel_z = target.pixel_z
		target.dropContents()
		if(istype(target, /obj/machinery/computer))
			var/obj/machinery/computer/computer_target = target
			if(computer_target.circuit)
				computer_target.circuit.forceMove(target_loc)
		qdel(target)

/**
  * Called when a swarmer attempts to create a trap
  *
  * Proc used to allow a swarmer to create a trap.  Checks if a trap is on the tile, then if the swarmer can afford, and then places the trap.
  */
/mob/living/simple_animal/hostile/swarmer/proc/create_trap()
	set name = "Create trap"
	set category = "Swarmer"
	set desc = "Creates a simple trap that will non-lethally electrocute anything that steps on it. Costs 4 resources."
	if(locate(/obj/structure/swarmer/trap) in loc)
		balloon_or_message(src, "already a trap here", \
			span_warning("There is already a trap here. Aborting."))
		return
	if(resources < 4)
		balloon_or_message(src, "not enough resources", \
			span_warning("We do not have the resources for this!"))
		return
	Fabricate(/obj/structure/swarmer/trap, 4)

/**
  * Called when a swarmer attempts to create a barricade
  *
  * Proc used to allow a swarmer to create a barricade.  Checks if a barricade is on the tile, then if the swarmer can afford it, and then will attempt to create a barricade after a second delay.
  */
/mob/living/simple_animal/hostile/swarmer/proc/create_barricade()
	set name = "Create barricade"
	set category = "Swarmer"
	set desc = "Creates a barricade that will stop anything but swarmers and disabler beams from passing through.  Costs 4 resources."
	if(locate(/obj/structure/swarmer/blockade) in loc)
		balloon_or_message(src, "already a blockade here", \
			span_warning("There is already a blockade here. Aborting."))
		return
	if(resources < 4)
		balloon_or_message(src, "not enough resources", \
			span_warning("We do not have the resources for this!"))
		return
	if(!do_after(src, 1 SECONDS))
		return
	Fabricate(/obj/structure/swarmer/blockade, 4)

/**
  * Called when a swarmer attempts to create a drone
  *
  * Proc used to allow a swarmer to create a drone.  Checks if the swarmer can afford the drone, then creates it after 5 seconds, and also registers it to the creating swarmer so it can command it
  */
/mob/living/simple_animal/hostile/swarmer/proc/create_swarmer()
	set name = "Replicate"
	set category = "Swarmer"
	set desc = "Creates a duplicate of ourselves, capable of protecting us while we complete our objectives."
	to_chat(src, span_info("We are attempting to replicate ourselves. We will need to stand still until the process is complete."))
	if(resources < 20)
		balloon_or_message(src, "not enough resources", \
			span_warning("We do not have the resources for this!"))
		return
	if(!isturf(loc))
		balloon_or_message(src, "not a suitable location", \
			span_warning("This is not a suitable location for replicating ourselves. We need more room."))
		return
	if(!do_after(src, 5 SECONDS))
		return
	var/createtype = swarmer_type_to_create()
	if(!createtype)
		return
	var/mob/newswarmer = Fabricate(createtype, 20)
	LAZYADD(dronelist, newswarmer)
	RegisterSignal(newswarmer, COMSIG_QDELETING, PROC_REF(remove_drone), newswarmer)
	playsound(loc,'sound/items/poster_being_created.ogg', 20, TRUE, -1)

/**
  * Used to determine what type of swarmer a swarmer should create
  *
  * Returns the type of the swarmer to be created
  */
/mob/living/simple_animal/hostile/swarmer/proc/swarmer_type_to_create()
	return /mob/living/simple_animal/hostile/swarmer/melee

/**
  * Called when a swarmer attempts to repair itself
  *
  * Proc used to allow a swarmer self-repair.  If the swarmer does not move after a period of time, then it will heal fully
  */
/mob/living/simple_animal/hostile/swarmer/proc/repair_self()
	set name = "Self Repair"
	set category = "Swarmer"
	set desc = "Attempts to repair damage to our body. You will have to remain motionless until repairs are complete."
	if(!isturf(loc))
		return
	to_chat(src, span_info("Attempting to repair damage to our body, stand by..."))
	if(!do_after(src, 10 SECONDS))
		return
	adjustHealth(-maxHealth)
	balloon_or_message(src, "successfully repaired" ,\
		span_info("We successfully repaired ourselves."))

/**
  * Called when a swarmer toggles its light
  *
  * Proc used to allow a swarmer to toggle its  light on and off.  If a swarmer has any drones, change their light settings to match their master's.
  */
/mob/living/simple_animal/hostile/swarmer/proc/toggle_light()
	if(swarmer_flags & SWARMER_LIGHT_ON)
		swarmer_flags = ~SWARMER_LIGHT_ON
		set_light_on(FALSE)
		if(!mind)
			return
		for(var/d in dronelist)
			var/mob/living/simple_animal/hostile/swarmer/melee/drone = d
			drone.swarmer_flags = ~SWARMER_LIGHT_ON
			drone.set_light_on(FALSE)
		return
	swarmer_flags |= SWARMER_LIGHT_ON
	set_light_on(TRUE)
	if(!mind)
		return

	for(var/d in dronelist)
		var/mob/living/simple_animal/hostile/swarmer/melee/drone = d
		drone.swarmer_flags |= SWARMER_LIGHT_ON
		drone.set_light_on(TRUE)

	balloon_alert(src, "light toggled")

/**
  * Proc which is used for swarmer comms
  *
  * Proc called which sends a message to all other swarmers.
  * Arugments:
  * * msg - The message the swarmer is sending, gotten from ContactSwarmers()
  */
/mob/living/simple_animal/hostile/swarmer/proc/swarmer_chat(msg)
	var/rendered = "<B>Swarm communication - [src]</b> [say_quote(msg)]"
	for(var/i in GLOB.mob_list)
		var/mob/M = i
		if(isswarmer(M))
			to_chat(M, rendered)
		else if(isobserver(M))
			var/link = FOLLOW_LINK(M, src)
			to_chat(M, "[link] [rendered]")

/**
  * Proc which is used for inputting a swarmer message
  *
  * Proc which is used for a swarmer to input a message on a pop-up box, then attempt to send that message to the other swarmers
  */
/mob/living/simple_animal/hostile/swarmer/proc/contact_swarmers()
	var/message = stripped_input(src, "Announce to other swarmers", "Swarmer contact")
	// TODO get swarmers their own colour rather than just boldtext
	if(message)
		swarmer_chat(message)

/**
  * Removes a drone from the swarmer's list.
  *
  * Removes the drone from our list.
  * Called specifically when a drone is about to be destroyed, so we don't have any null references.
  * Arguments:
  * * mob/drone - The drone to be removed from the list.
  */
mob/living/simple_animal/hostile/swarmer/proc/remove_drone(mob/drone, force)
	dronelist -= drone

/**
  * # Swarmer Drone
  *
  * Melee subtype of swarmers, always AI-controlled under normal circumstances.  Cannot fire projectiles, but does double stamina damage on melee
  */
/mob/living/simple_animal/hostile/swarmer/melee
	icon_state = "swarmer_melee"
	icon_living = "swarmer_melee"
	ranged = FALSE
	AIStatus = AI_ON
	melee_damage_lower = 30
	melee_damage_upper = 30

/obj/projectile/beam/disabler/swarmer/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!.)
		return
	if(!istype(target, /mob/living/simple_animal) || istype(target, /mob/living/simple_animal/hostile/swarmer))
		return
	var/mob/living/simple_animal/hostile/swarmer/swarmer = firer
	swarmer.teleport_target(target)
