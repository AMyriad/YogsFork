

//Glorified teleporter that puts you in a new human body.
// it's """VR"""
/obj/machinery/vr_sleeper
	name = "virtual reality sleeper"
	desc = "A sleeper modified to alter the subconscious state of the user, allowing them to visit virtual worlds."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	state_open = TRUE
	occupant_typecache = list(/mob/living/carbon/human) // turned into typecache in Initialize
	circuit = /obj/item/circuitboard/machine/vr_sleeper
	var/you_die_in_the_game_you_die_for_real = FALSE
	var/datum/effect_system/spark_spread/sparks
	var/mob/living/carbon/human/virtual_reality/vr_human
	var/vr_category = "default" //Specific category of spawn points to pick from
	var/allow_creating_vr_humans = TRUE //So you can have vr_sleepers that always spawn you as a specific person or 1 life/chance vr games
	var/only_current_user_can_interact = FALSE

/obj/machinery/vr_sleeper/Initialize(mapload)
	. = ..()
	sparks = new /datum/effect_system/spark_spread()
	sparks.set_up(2,0)
	sparks.attach(src)
	update_appearance(UPDATE_ICON)

/obj/machinery/vr_sleeper/attackby(obj/item/I, mob/user, params)
	if(!state_open && !occupant)
		if(default_deconstruction_screwdriver(user, "[initial(icon_state)]-o", initial(icon_state), I))
			return
	if(default_change_direction_wrench(user, I))
		return
	if(default_pry_open(I))
		return
	if(default_deconstruction_crowbar(I))
		return
	return ..()

/obj/machinery/vr_sleeper/relaymove(mob/user)
	open_machine()

/obj/machinery/vr_sleeper/container_resist(mob/living/user)
	open_machine()

/obj/machinery/vr_sleeper/Destroy()
	open_machine()
	cleanup_vr_human()
	QDEL_NULL(sparks)
	return ..()

/obj/machinery/vr_sleeper/hugbox
	desc = "A sleeper modified to alter the subconscious state of the user, allowing them to visit virtual worlds. Seems slightly more secure."
	flags_1 = NODECONSTRUCT_1
	only_current_user_can_interact = TRUE

/obj/machinery/vr_sleeper/hugbox/emag_act(mob/user, obj/item/card/emag/emag_card)
	return

/obj/machinery/vr_sleeper/emag_act(mob/user, obj/item/card/emag/emag_card)
	you_die_in_the_game_you_die_for_real = TRUE
	sparks.start()
	addtimer(CALLBACK(src, PROC_REF(emagNotify)), 150)
	return TRUE
	
/obj/machinery/vr_sleeper/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][state_open ? "-open" : ""]"

/obj/machinery/vr_sleeper/open_machine()
	if(!state_open)
		if(vr_human)
			vr_human.revert_to_reality(FALSE)
		if(occupant)
			SStgui.close_user_uis(occupant, src)
		..()

/obj/machinery/vr_sleeper/MouseDrop_T(mob/target, mob/living/user)
	if(!istype(user))
		return
	if(user.stat || !Adjacent(user) || !user.Adjacent(target) || !iscarbon(target) || !user.IsAdvancedToolUser())
		return
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_STAND))
			return
	close_machine(target)

/obj/machinery/vr_sleeper/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "VRSleeper", name)
		ui.open()

/obj/machinery/vr_sleeper/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("vr_connect")
			var/mob/living/carbon/human/human_occupant = occupant
			if(human_occupant && human_occupant.mind && usr == occupant)
				to_chat(occupant, span_warning("Transferring to virtual reality..."))
				if(vr_human && vr_human.stat == CONSCIOUS && !vr_human.real_mind)
					SStgui.close_user_uis(occupant, src)
					if(istype(human_occupant, /mob/living/carbon/human/virtual_reality))
						var/mob/living/carbon/human/virtual_reality/vr_human_occupant = human_occupant
						vr_human.real_mind = vr_human_occupant.real_mind
					else
						vr_human.real_mind = human_occupant.mind
					vr_human.ckey = human_occupant.ckey
					to_chat(vr_human, span_notice("Transfer successful! You are now playing as [vr_human] in VR!"))
				else
					if(allow_creating_vr_humans)
						to_chat(occupant, span_warning("Virtual avatar not found, attempting to create one..."))
						var/obj/effect/landmark/vr_spawn/V = get_vr_spawnpoint()
						var/turf/T = get_turf(V)
						if(T)
							SStgui.close_user_uis(occupant, src)
							build_virtual_human(occupant, T, V.vr_outfit)
							to_chat(vr_human, span_notice("Transfer successful! You are now playing as [vr_human] in VR!"))
						else
							to_chat(occupant, span_warning("Virtual world misconfigured, aborting transfer"))
					else
						to_chat(occupant, span_warning("The virtual world does not support the creation of new virtual avatars, aborting transfer"))
			return TRUE
		if("delete_avatar")
			if(!occupant || usr == occupant)
				if(vr_human)
					cleanup_vr_human()
			else
				to_chat(usr, span_warning("The VR Sleeper's safeties prevent you from doing that."))
			return TRUE
		if("toggle_open")
			if(state_open)
				close_machine()
			else if ((!occupant || usr == occupant) || !only_current_user_can_interact)
				open_machine()
			return TRUE

/obj/machinery/vr_sleeper/ui_data(mob/user)
	var/list/data = list()
	if(vr_human && !QDELETED(vr_human))
		data["can_delete_avatar"] = TRUE
		var/status
		switch(vr_human.stat)
			if(CONSCIOUS)
				status = "Conscious"
			if(DEAD)
				status = "Dead"
			if(UNCONSCIOUS)
				status = "Unconscious"
			if(SOFT_CRIT)
				status = "Barely Conscious"
		data["vr_avatar"] = list("name" = vr_human.name, "status" = status, "health" = vr_human.health, "maxhealth" = vr_human.maxHealth)
	data["toggle_open"] = state_open
	data["isoccupant"] = (user == occupant)
	return data

/obj/machinery/vr_sleeper/proc/get_vr_spawnpoint() //proc so it can be overridden for team games or something
	return safepick(GLOB.vr_spawnpoints[vr_category])

/obj/machinery/vr_sleeper/proc/build_spawnpoints() // used to rebuild the list for admins if need be
	GLOB.vr_spawnpoints = list()
	for(var/obj/effect/landmark/vr_spawn/V in GLOB.landmarks_list)
		GLOB.vr_spawnpoints[V.vr_category] = V

/obj/machinery/vr_sleeper/proc/build_virtual_human(mob/living/carbon/human/H, location, datum/outfit/outfit, transfer = TRUE)
	if(H)
		cleanup_vr_human()
		vr_human = new /mob/living/carbon/human/virtual_reality(location)
		vr_human.mind_initialize()
		vr_human.vr_sleeper = src
		vr_human.real_mind = H.mind
		H.dna.transfer_identity(vr_human)
		vr_human.name = H.name
		vr_human.real_name = H.real_name
		vr_human.socks = H.socks
		vr_human.undershirt = H.undershirt
		vr_human.underwear = H.underwear
		vr_human.updateappearance(TRUE, TRUE, TRUE)
		if(outfit)
			var/datum/outfit/O = new outfit()
			O.equip(vr_human)
		var/datum/job/vr_job = vr_human.mind.assigned_role
		vr_human.dna.species.after_equip_job(vr_job, vr_human)
		if(transfer && H.mind)
			SStgui.close_user_uis(H, src)
			vr_human.ckey = H.ckey

/obj/machinery/vr_sleeper/proc/cleanup_vr_human()
	if(vr_human)
		vr_human.vr_sleeper = null // Prevents race condition where a new human could get created out of order and set to null.
		QDEL_NULL(vr_human)

/obj/machinery/vr_sleeper/proc/emagNotify()
	vr_human?.adjust_dizzy(10 SECONDS)

/obj/effect/landmark/vr_spawn //places you can spawn in VR, auto selected by the vr_sleeper during get_vr_spawnpoint()
	var/vr_category = "default" //So we can have specific sleepers, eg: "Basketball VR Sleeper", etc.
	var/vr_outfit = /datum/outfit/vr

/obj/effect/landmark/vr_spawn/Initialize(mapload)
	. = ..()
	LAZYADD(GLOB.vr_spawnpoints[vr_category], src)

/obj/effect/landmark/vr_spawn/Destroy()
	LAZYREMOVE(GLOB.vr_spawnpoints[vr_category], src)
	return ..()

/obj/effect/landmark/vr_spawn/team_1
	vr_category = "team_1"

/obj/effect/landmark/vr_spawn/team_2
	vr_category = "team_2"

/obj/effect/landmark/vr_spawn/admin
	vr_category = "event"

/obj/effect/landmark/vr_spawn/syndicate // Multiple missions will use syndicate gear
	vr_outfit = /datum/outfit/vr/syndicate

/obj/effect/vr_clean_master // Will keep VR areas that have this relatively clean.
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	color = "#00FF00"
	invisibility = INVISIBILITY_ABSTRACT
	var/area/vr_area

/obj/effect/vr_clean_master/Initialize(mapload)
	. = ..()
	vr_area = get_area(src)
	addtimer(CALLBACK(src, PROC_REF(clean_up)), 3 MINUTES)

/obj/effect/vr_clean_master/proc/clean_up()
	if (vr_area)
		for (var/obj/item/ammo_casing/casing in vr_area)
			qdel(casing)
		for(var/obj/effect/decal/cleanable/C in vr_area)
			qdel(C)
		for (var/mob/living/carbon/human/virtual_reality/H in vr_area)
			if (H.stat == DEAD && !H.vr_sleeper && !H.real_mind)
				qdel(H)
		addtimer(CALLBACK(src, PROC_REF(clean_up)), 3 MINUTES)
