/datum/species/jelly
	// Entirely alien beings that seem to be made entirely out of gel. They have three eyes and a skeleton visible within them.
	name = "Jellyperson"
	plural_form = "Jellypeople"
	id = SPECIES_JELLYPERSON
	default_color = "00FF90"
	say_mod = "chirps"
	bubble_icon = BUBBLE_SLIME
	species_traits = list(MUTCOLORS, EYECOLOR, NOBLOOD, HAIR)
	inherent_traits = list(TRAIT_TOXINLOVER)
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/slime
	exotic_blood = /datum/reagent/toxin/slimejelly
	mutanttongue = /obj/item/organ/tongue/slime
	mutantlungs = /obj/item/organ/lungs/slime
	damage_overlay_type = ""
	liked_food = MEAT
	coldmod = 6
	heatmod = 0.5
	burnmod = 0.5 // = 1/2x generic burn damage
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/jelly
	swimming_component = /datum/component/swimming/dissolve
	hair_color = "mutcolor"
	hair_alpha = 140

	species_abilities = list(/datum/action/innate/regenerate_limbs)

	var/soggy = FALSE

/datum/species/jelly/on_species_loss(mob/living/carbon/C)
	C.faction -= "slime"
	C.remove_movespeed_modifier("slime_person_wet")
	return ..()

/datum/species/jelly/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.faction |= "slime"

/datum/species/jelly/spec_life(mob/living/carbon/human/H)
	handle_wetness(H)

	if(H.stat == DEAD) //can't farm slime jelly from a dead slime/jelly person indefinitely
		return
	
	if(!H.blood_volume)
		H.blood_volume += 5
		H.adjustBruteLoss(5)
		to_chat(H, span_danger("You feel empty!"))

	switch(H.blood_volume)
		if(0 to (BLOOD_VOLUME_GENERIC * BLOOD_BAD_MULTI))
			Cannibalize_Body(H)

		if((BLOOD_VOLUME_GENERIC * BLOOD_BAD_MULTI) to (BLOOD_VOLUME_GENERIC * BLOOD_OKAY_MULTI))
			if(prob(5))
				to_chat(H, span_danger("You feel drained!"))

		if((BLOOD_VOLUME_GENERIC * BLOOD_OKAY_MULTI) to BLOOD_VOLUME_GENERIC)
			if(H.nutrition >= NUTRITION_LEVEL_STARVING)
				H.blood_volume += 3
				H.adjust_nutrition(-2.5)

		if(BLOOD_VOLUME_GENERIC to INFINITY)
			H.adjustCloneLoss(-0.5) //slowly re-knit cell damage
      
	var/datum/action/innate/regenerate_limbs/ability = locate() in instantiated_abilities
	if(ability)
		ability.build_all_button_icons()

/datum/species/jelly/proc/handle_wetness(mob/living/carbon/human/H)
	var/datum/status_effect/fire_handler/wet_stacks/wetness = H.has_status_effect(/datum/status_effect/fire_handler/wet_stacks)
	if(wetness && wetness.stacks >= 1) // needs at least 1 wetness stack to do anything
		H.add_movespeed_modifier("slime_person_wet", update = TRUE, priority = 102, multiplicative_slowdown = 0.5, blacklisted_movetypes=(FLYING|FLOATING))
		H.adjustCloneLoss(2)
		if(H.stat != DEAD)
			H.set_jitter_if_lower(10 SECONDS)
			H.set_stutter_if_lower(1 SECONDS)
			if(!soggy)//play once when it starts
				H.emote("scream")
				to_chat(H, span_userdanger("Every cell in your body begins to break down from the excess of water, get dry!"))
		H.adjust_wet_stacks(-1)
		soggy = TRUE
	else if(soggy)
		H.remove_movespeed_modifier("slime_person_wet")
		to_chat(H, "You breathe a sigh of relief as you dry off.")
		soggy = FALSE

/datum/species/jelly/proc/Cannibalize_Body(mob/living/carbon/human/H)
	var/list/limbs_to_consume = list(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG) - H.get_missing_limbs()
	var/obj/item/bodypart/consumed_limb
	if(!limbs_to_consume.len)
		H.losebreath++
		return
	if(H.get_num_legs(FALSE)) //Legs go before arms
		limbs_to_consume -= list(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM)
	consumed_limb = H.get_bodypart(pick(limbs_to_consume))
	consumed_limb.drop_limb()
	to_chat(H, span_userdanger("Your [consumed_limb] is drawn back into your body, unable to maintain its shape!"))
	qdel(consumed_limb)
	H.blood_volume += 20

/datum/species/jelly/random_name(gender,unique,lastname)//they have no lore, just use human names for now i guess
	if(unique)
		return random_unique_name()
	return random_unique_name()

/datum/species/jelly/get_species_description()
	return ""//"TODO: RIP in peace Skrem"

/datum/species/jelly/get_species_lore()
	return list(
		""//"TODO: RIP in peace Skrem"
	)

/datum/species/jelly/get_butt_sprite()
	return BUTT_SPRITE_SLIME

/datum/species/jelly/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = "splotch",
		SPECIES_PERK_NAME = "Unstable Form",
		SPECIES_PERK_DESC = "[plural_form] are made entirely of jelly, losing enough will result in them cannibalizing their own limbs to survive.",
	),
	list(
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = "hand-sparkles",
		SPECIES_PERK_NAME = "Regenerate Limbs",
		SPECIES_PERK_DESC = "Being made entirely of jelly means [plural_form] can reform lost limbs from nothing assuming they have enough extra to spare.",
	))

	return to_add

// Slimes have both NOBLOOD and an exotic bloodtype set, so they need to be handled uniquely here.
/datum/species/jelly/create_pref_blood_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "tint",
		SPECIES_PERK_NAME = "Jelly Blood",
		SPECIES_PERK_DESC = "[plural_form] don't have blood, but instead have toxic [initial(exotic_blood.name)]! This means they will heal from toxin damage but get hurt by toxin healing. \
			Jelly is extremely important, and having low jelly will make medical treatment very difficult.",
	))

	return to_add

/datum/action/innate/regenerate_limbs
	name = "Regenerate Limbs"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "slimeheal"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"

/datum/action/innate/regenerate_limbs/IsAvailable(feedback = FALSE)
	if(..())
		var/mob/living/carbon/human/H = owner
		var/list/limbs_to_heal = H.get_missing_limbs()
		if(limbs_to_heal.len < 1)
			return 0
		if(H.blood_volume >= BLOOD_VOLUME_OKAY(H) + REGEN_BLOOD_REQUIREMENT)
			return 1
		return 0

/datum/action/innate/regenerate_limbs/Activate()
	var/mob/living/carbon/human/H = owner
	var/list/limbs_to_heal = H.get_missing_limbs()
	if(limbs_to_heal.len < 1)
		to_chat(H, span_notice("You feel intact enough as it is."))
		return
	to_chat(H, span_notice("You focus intently on your missing [limbs_to_heal.len >= 2 ? "limbs" : "limb"]..."))
	if(H.blood_volume >= REGEN_BLOOD_REQUIREMENT*limbs_to_heal.len + BLOOD_VOLUME_OKAY(H))
		H.regenerate_limbs()
		H.blood_volume -= REGEN_BLOOD_REQUIREMENT*limbs_to_heal.len
		to_chat(H, span_notice("...and after a moment you finish reforming!"))
		return
	else if(H.blood_volume >= REGEN_BLOOD_REQUIREMENT)//We can partially heal some limbs
		while(H.blood_volume >= BLOOD_VOLUME_OKAY(H) + REGEN_BLOOD_REQUIREMENT)
			var/healed_limb = pick(limbs_to_heal)
			H.regenerate_limb(healed_limb)
			limbs_to_heal -= healed_limb
			H.blood_volume -= REGEN_BLOOD_REQUIREMENT
		to_chat(H, span_warning("...but there is not enough of you to fix everything! You must attain more mass to heal completely!"))
		return
	to_chat(H, span_warning("...but there is not enough of you to go around! You must attain more mass to heal!"))

////////////////////////////////////////////////////////SLIMEPEOPLE///////////////////////////////////////////////////////////////////

//Slime people are able to split like slimes, retaining a single mind that can swap between bodies.

/datum/species/jelly/slime
	name = "Slimeperson"
	plural_form = "Slimepeople"
	id = SPECIES_SLIMEPERSON
	default_color = "00FFFF"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,NOBLOOD)
	say_mod = "says"
	hair_color = "mutcolor"
	hair_alpha = 150
	ignored_by = list(/mob/living/simple_animal/slime)
	
	species_abilities = list(
		/datum/action/innate/regenerate_limbs,
		/datum/action/innate/split_body,
		/datum/action/innate/swap_body
		)
	var/list/mob/living/carbon/bodies

/datum/species/jelly/slime/on_species_loss(mob/living/carbon/C)
	bodies -= C // This means that the other bodies maintain a link
	// so if someone mindswapped into them, they'd still be shared.
	bodies = null
	C.blood_volume = min(C.blood_volume, BLOOD_VOLUME_NORMAL(C))
	..()

/datum/species/jelly/slime/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	if(ishuman(C))
		if(!bodies || !bodies.len)
			bodies = list(C)
		else
			bodies |= C


//If you're cloned you get your body pool back
/datum/species/jelly/slime/copy_properties_from(datum/species/jelly/slime/old_species)
	bodies = old_species.bodies

/datum/species/jelly/slime/spec_life(mob/living/carbon/human/H)
	if(H.blood_volume >= BLOOD_VOLUME_SLIME_SPLIT)
		if(prob(5))
			to_chat(H, span_notice("You feel very bloated!"))
	else if(H.nutrition >= NUTRITION_LEVEL_WELL_FED)
		H.blood_volume += 3
		H.adjust_nutrition(-2.5)
	return ..()

/datum/action/innate/split_body
	name = "Split Body"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "slimesplit"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"

/datum/action/innate/split_body/IsAvailable(feedback = FALSE)
	if(..())
		var/mob/living/carbon/human/H = owner
		if(H.blood_volume >= BLOOD_VOLUME_SLIME_SPLIT)
			return 1
		return 0

/datum/action/innate/split_body/Activate()
	var/mob/living/carbon/human/H = owner
	if(!isslimeperson(H))
		return
	CHECK_DNA_AND_SPECIES(H)
	H.visible_message("<span class='notice'>[owner] gains a look of \
		concentration while standing perfectly still.</span>",
		"<span class='notice'>You focus intently on moving your body while \
		standing perfectly still...</span>")

	H.notransform = TRUE

	if(do_after(owner, 6 SECONDS, owner, FALSE))
		if(H.blood_volume >= BLOOD_VOLUME_SLIME_SPLIT)
			make_dupe()
		else
			to_chat(H, span_warning("...but there is not enough of you to go around! You must attain more mass to split!"))
	else
		to_chat(H, span_warning("...but fail to stand perfectly still!"))

	H.notransform = FALSE

/datum/action/innate/split_body/proc/make_dupe()
	var/mob/living/carbon/human/H = owner
	CHECK_DNA_AND_SPECIES(H)

	var/mob/living/carbon/human/spare = new /mob/living/carbon/human(H.loc)

	spare.underwear = "Nude"
	H.dna.transfer_identity(spare, transfer_SE=1)
	spare.dna.features["mcolor"] = pick("#FFFFFF","#7F7F7F", "#7FFF7F", "#7F7FFF", "#FF7F7F", "#7FFFFF", "#FF7FFF", "#FFFF7F")
	spare.dna.update_uf_block(DNA_MUTANT_COLOR_BLOCK)
	spare.real_name = spare.dna.real_name
	spare.name = spare.dna.real_name
	spare.updateappearance(mutcolor_update=1)
	spare.domutcheck()
	spare.Move(get_step(H.loc, pick(NORTH,SOUTH,EAST,WEST)))

	H.blood_volume *= 0.45
	H.notransform = 0

	var/datum/species/jelly/slime/origin_datum = H.dna.species
	origin_datum.bodies |= spare

	var/datum/species/jelly/slime/spare_datum = spare.dna.species
	spare_datum.bodies = origin_datum.bodies

	H.transfer_trait_datums(spare)
	H.mind.transfer_to(spare)
	spare.visible_message("<span class='warning'>[H] distorts as a new body \
		\"steps out\" of [H.p_them()].</span>",
		"<span class='notice'>...and after a moment of disorentation, \
		you're besides yourself!</span>")


/datum/action/innate/swap_body
	name = "Swap Body"
	check_flags = NONE
	button_icon_state = "slimeswap"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"

/datum/action/innate/swap_body/Activate()
	if(!isslimeperson(owner))
		to_chat(owner, span_warning("You are not a slimeperson."))
		Remove(owner)
	else
		ui_interact(owner)

/datum/action/innate/swap_body/ui_host(mob/user)
	return owner

/datum/action/innate/swap_body/ui_state(mob/user)
	return GLOB.not_incapacitated_state

/datum/action/innate/swap_body/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SlimeBodySwapper", name)
		ui.open()

/datum/action/innate/swap_body/ui_data(mob/user)
	var/mob/living/carbon/human/H = owner
	if(!isslimeperson(H))
		return

	var/datum/species/jelly/slime/SS = H.dna.species

	var/list/data = list()
	data["bodies"] = list()
	for(var/b in SS.bodies)
		var/mob/living/carbon/human/body = b
		if(!body || QDELETED(body) || !isslimeperson(body))
			SS.bodies -= b
			continue

		var/list/L = list()
		// HTML colors need a # prefix
		L["htmlcolor"] = body.dna.features["mcolor"]
		L["area"] = get_area_name(body, TRUE)
		var/stat = "error"
		switch(body.stat)
			if(CONSCIOUS)
				stat = "Conscious"
			//yogs start
			if(SOFT_CRIT)
				stat = "Barely Conscious"
			//yogs end
			if(UNCONSCIOUS)
				stat = "Unconscious"
			if(DEAD)
				stat = "Dead"
		var/occupied
		if(body == H)
			occupied = "owner"
		else if(body.mind && body.mind.active)
			occupied = "stranger"
		else
			occupied = "available"

		L["status"] = stat
		L["exoticblood"] = body.blood_volume
		L["name"] = body.name
		L["ref"] = "[REF(body)]"
		L["occupied"] = occupied
		var/button
		if(occupied == "owner")
			button = "selected"
		else if(occupied == "stranger")
			button = "danger"
		else if(can_swap(body))
			button = null
		else
			button = "disabled"

		L["swap_button_state"] = button
		L["swappable"] = (occupied == "available") && can_swap(body)

		data["bodies"] += list(L)

	return data

/datum/action/innate/swap_body/ui_act(action, params)
	if(..())
		return
	var/mob/living/carbon/human/H = owner
	if(!isslimeperson(owner))
		return
	if(!H.mind || !H.mind.active)
		return
	switch(action)
		if("swap")
			var/datum/species/jelly/slime/SS = H.dna.species
			var/mob/living/carbon/human/selected = locate(params["ref"]) in SS.bodies
			if(!can_swap(selected))
				return
			// SStgui.close_uis(src) // yogs - don't.
			swap_to_dupe(H.mind, selected)

/datum/action/innate/swap_body/proc/can_swap(mob/living/carbon/human/dupe)
	var/mob/living/carbon/human/H = owner
	if(!isslimeperson(H))
		return FALSE
	var/datum/species/jelly/slime/SS = H.dna.species

	if(QDELETED(dupe)) 					//Is there a body?
		SS.bodies -= dupe
		return FALSE

	if(!isslimeperson(dupe)) 			//Is it a slimeperson?
		SS.bodies -= dupe
		return FALSE

	if(H.stat != CONSCIOUS) 			//Are we alive and awake?
		return FALSE

	if(dupe.stat != CONSCIOUS) 			//Is it alive and awake?
		return FALSE

	if(dupe.mind && dupe.mind.active) 	//Is it unoccupied?
		return FALSE

	if(!(dupe in SS.bodies))			//Do we actually own it?
		return FALSE

	return TRUE

/datum/action/innate/swap_body/proc/swap_to_dupe(datum/mind/M, mob/living/carbon/human/dupe)
	if(!can_swap(dupe)) //sanity check
		return
	if(M.current.stat == CONSCIOUS)
		M.current.visible_message("<span class='notice'>[M.current] \
			stops moving and starts staring vacantly into space.</span>",
			span_notice("You stop moving this body..."))
	else
		to_chat(M.current, span_notice("You abandon this body..."))
	M.current.transfer_trait_datums(dupe)
	M.transfer_to(dupe)
	dupe.visible_message("<span class='notice'>[dupe] blinks and looks \
		around.</span>",
		span_notice("...and move this one instead."))


///////////////////////////////////LUMINESCENTS//////////////////////////////////////////

//Luminescents are able to consume and use slime extracts, without them decaying.

/datum/species/jelly/luminescent
	name = "Luminescent"
	plural_form = null
	id = SPECIES_LUMINESCENT
	say_mod = "says"
	var/glow_intensity = LUMINESCENT_DEFAULT_GLOW

	species_abilities = list(
		/datum/action/innate/regenerate_limbs,
		/datum/action/innate/integrate_extract,
		/datum/action/innate/use_extract,
		/datum/action/innate/use_extract/major
		)

	var/obj/item/slime_extract/current_extract
	var/extract_cooldown = 0

	/// Internal dummy used to glow (very cool)
	var/obj/effect/dummy/lighting_obj/moblight/species/glow

/datum/species/jelly/luminescent/Destroy(force, ...)
	. = ..()
	QDEL_NULL(glow)

/datum/species/jelly/luminescent/on_species_loss(mob/living/carbon/C)
	..()
	if(current_extract)
		current_extract.forceMove(C.drop_location())
		current_extract = null
	QDEL_NULL(glow)

/datum/species/jelly/luminescent/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	glow = C.mob_light(light_type = /obj/effect/dummy/lighting_obj/moblight/species)
	update_glow(C)

/datum/species/jelly/luminescent/proc/update_slime_actions(mob/living/carbon/C)
	for(var/datum/action/ability as anything in C.actions)
		ability.build_all_button_icons()

/datum/species/jelly/luminescent/proc/update_glow(mob/living/carbon/C, intensity)
	if(intensity)
		glow_intensity = intensity
	glow.set_light_range_power_color(glow_intensity, glow_intensity, C.dna.features["mcolor"])

/datum/action/innate/integrate_extract
	name = "Integrate Extract"
	desc = "Eat a slime extract to use its properties."
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "slimeconsume"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	var/datum/species/jelly/luminescent/species

/datum/action/innate/integrate_extract/link_to(Target)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/humie = target
		if(humie?.dna?.species)
			species = humie.dna.species

/datum/action/innate/integrate_extract/update_button_name(atom/movable/screen/movable/action_button/button, force = FALSE)
	var/datum/species/jelly/luminescent/species = target
	if(!istype(species) || !species.current_extract)
		name = "Integrate Extract"
		desc = "Eat a slime extract to use its properties."
	else
		name = "Eject Extract"
		desc = "Eject your current slime extract."

	return ..()

/datum/action/innate/integrate_extract/apply_button_icon(atom/movable/screen/movable/action_button/current_button, force)
	var/datum/species/jelly/luminescent/species = target
	if(!istype(species) || !species.current_extract)
		button_icon_state = "slimeconsume"
	else
		button_icon_state = "slimeeject"

	return ..()

/datum/action/innate/integrate_extract/Activate()
	var/mob/living/carbon/human/H = owner
	if(!is_species(H, /datum/species/jelly/luminescent) || !species)
		return
	CHECK_DNA_AND_SPECIES(H)

	if(species.current_extract)
		var/obj/item/slime_extract/S = species.current_extract
		if(!H.put_in_active_hand(S))
			S.forceMove(H.drop_location())
		species.current_extract = null
		to_chat(H, span_notice("You eject [S]."))
		species.update_slime_actions(H)
	else
		var/obj/item/I = H.get_active_held_item()
		if(istype(I, /obj/item/slime_extract))
			var/obj/item/slime_extract/S = I
			if(!S.Uses)
				to_chat(H, span_warning("[I] is spent! You cannot integrate it."))
				return
			if(!H.temporarilyRemoveItemFromInventory(S))
				return
			S.forceMove(H)
			species.current_extract = S
			to_chat(H, span_notice("You consume [I], and you feel it pulse within you..."))
			species.update_slime_actions(H)
		else
			to_chat(H, span_warning("You need to hold an unused slime extract in your active hand!"))

/datum/action/innate/use_extract
	name = "Extract Minor Activation"
	desc = "Pulse the slime extract with energized jelly to activate it."
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "slimeuse1"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	var/activation_type = SLIME_ACTIVATE_MINOR
	var/datum/species/jelly/luminescent/species

/datum/action/innate/use_extract/New(_species)
	..()
	species = _species

/datum/action/innate/use_extract/IsAvailable(feedback = FALSE)
	if(..())
		if(species && species.current_extract && (world.time > species.extract_cooldown))
			return TRUE
		return FALSE

/datum/action/innate/use_extract/apply_button_icon(atom/movable/screen/movable/action_button/current_button, force)
	..(current_button, TRUE)
	if(species && species.current_extract)
		current_button.add_overlay(mutable_appearance(species.current_extract.icon, species.current_extract.icon_state))

/datum/action/innate/use_extract/Activate()
	var/mob/living/carbon/human/H = owner
	if(!is_species(H, /datum/species/jelly/luminescent) || !species || H.incapacitated())
		return
	CHECK_DNA_AND_SPECIES(H)

	if(species.current_extract)
		species.extract_cooldown = world.time + 100
		var/cooldown = species.current_extract.activate(H, species, activation_type)
		species.extract_cooldown = world.time + cooldown

/datum/action/innate/use_extract/major
	name = "Extract Major Activation"
	desc = "Pulse the slime extract with plasma jelly to activate it."
	button_icon_state = "slimeuse2"
	activation_type = SLIME_ACTIVATE_MAJOR

///////////////////////////////////STARGAZERS//////////////////////////////////////////

//Stargazers are the telepathic branch of jellypeople, able to project psychic messages and to link minds with willing participants.

/datum/species/jelly/stargazer
	name = "Stargazer"
	plural_form = null
	id = SPECIES_STARGAZER
	species_abilities = list(
		/datum/action/innate/regenerate_limbs,
		/datum/action/cooldown/spell/touch/link_minds,
		/datum/action/innate/project_thought
		)

/datum/action/cooldown/spell/touch/link_minds
	name = "Link Minds"
	desc = "Link someone's mind to your Slime Link, allowing them to communicate telepathically with other linked minds."
	button_icon_state = "mindlink"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"
	spell_requirements = NONE
	invocation_type = INVOCATION_NONE
	var/list/datum/action/speech_abilities = list()

/datum/action/cooldown/spell/touch/link_minds/Grant(mob/grant_to)
	. = ..()
	var/datum/action/innate/slime_speech/action = new(grant_to)
	action.Grant(grant_to)
	action.linkage = src
	speech_abilities += action

/datum/action/cooldown/spell/touch/link_minds/Remove(mob/living/remove_from)
	for(var/datum/action/ability as anything in speech_abilities)
		ability.Remove(ability.owner)
		qdel(ability)
	return ..()

/datum/action/cooldown/spell/touch/link_minds/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/target, mob/living/carbon/caster)
	if(!isliving(target))
		return
	var/mob/living/victim = target

	to_chat(caster, span_notice("You begin linking [victim]'s mind to yours..."))
	to_chat(victim, span_warning("You feel a foreign presence within your mind..."))

	if(!do_after(caster, 5 SECONDS, victim))
		return
	
	for(var/datum/action/ability as anything in victim.actions)
		if(istype(ability, /datum/action/innate/slime_speech))
			var/datum/action/innate/slime_speech/speaker = ability
			if(speaker.linkage == src)
				speech_abilities -= speaker
				speaker.Remove(victim)
				qdel(speaker)
				to_chat(caster, span_notice("You release [victim] from your Slime Link."))
				to_chat(victim, span_notice("You are no longer connected to [caster.real_name]'s Slime Link."))
				return TRUE
	
	var/datum/action/innate/slime_speech/action = new(victim)
	action.Grant(victim)
	action.linkage = src
	speech_abilities += action
	to_chat(caster, span_notice("You connect [victim]'s mind to your slime link!"))
	to_chat(victim, span_notice("You are now connected to [caster.real_name]'s Slime Link."))
	return TRUE

/datum/action/innate/slime_speech
	name = "Slimelink"
	desc = "Send a psychic message to everyone connected to your slime link."
	button_icon_state = "link_speech"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	var/datum/action/cooldown/spell/touch/link_minds/linkage

/datum/action/innate/slime_speech/Activate()
	var/mob/living/carbon/human/H = owner
	if(!linkage)
		to_chat(H, span_warning("The link seems to have been severed..."))
		Remove(H)
		return

	var/message = sanitize(input("Message:", "Slime Telepathy") as text|null)

	if(QDELETED(H) || H.stat == DEAD)
		return

	if(!linkage)
		to_chat(H, span_warning("The link seems to have been severed..."))
		Remove(H)
		return

	if(message)
		var/msg = "<i><font color=#008CA2>\[[linkage.owner.real_name]'s Slime Link\] <b>[H]:</b> [message]</font></i>"
		log_directed_talk(H, linkage.owner, msg, LOG_SAY, "slime link")
		for(var/X in linkage.speech_abilities)
			var/datum/action/innate/linked_speech = X
			if(!linked_speech || !istype(linked_speech))
				continue
			to_chat(linked_speech.owner, msg)

		for(var/X in GLOB.dead_mob_list)
			var/mob/M = X
			var/link = FOLLOW_LINK(M, H)
			to_chat(M, "[link] [msg]")

/datum/action/innate/project_thought
	name = "Send Thought"
	desc = "Send a private psychic message to someone you can see."
	button_icon_state = "send_mind"
	button_icon = 'icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	overlay_icon_state = "bg_alien_border"

/datum/action/innate/project_thought/Activate()
	var/mob/living/carbon/human/H = owner
	if(H.stat == DEAD)
		return
	if(!is_species(H, /datum/species/jelly/stargazer))
		return
	CHECK_DNA_AND_SPECIES(H)

	var/list/options = list()
	for(var/mob/living/Ms in oview(H))
		options += Ms
	var/mob/living/M = input("Select who to send your message to:","Send thought to?",null) as null|mob in options
	if(!M)
		return
	if(M.can_block_magic(MAGIC_RESISTANCE_MIND, charge_cost = 0))
		to_chat(H, span_notice("As you try to communicate with [M], you're suddenly stopped by a vision of a massive tinfoil wall that streches beyond visible range. It seems you've been foiled."))
		return
	var/msg = sanitize(input("Message:", "Telepathy") as text|null)
	if(msg)
		if(M.can_block_magic(MAGIC_RESISTANCE_MIND, charge_cost = 0))
			to_chat(H, span_notice("As you try to communicate with [M], you're suddenly stopped by a vision of a massive tinfoil wall that streches beyond visible range. It seems you've been foiled."))
			return
		log_directed_talk(H, M, msg, LOG_SAY, "slime telepathy")
		to_chat(M, "[span_notice("You hear an alien voice in your head... ")]<font color=#008CA2>[msg]</font>")
		to_chat(H, span_notice("You telepathically said: \"[msg]\" to [M]"))
		for(var/dead in GLOB.dead_mob_list)
			if(!isobserver(dead))
				continue
			var/follow_link_user = FOLLOW_LINK(dead, H)
			var/follow_link_target = FOLLOW_LINK(dead, M)
			to_chat(dead, "[follow_link_user] [span_name("[H]")] [span_alertalien("Slime Telepathy --> ")] [follow_link_target] [span_name("[M]")] [span_noticealien("[msg]")]")
