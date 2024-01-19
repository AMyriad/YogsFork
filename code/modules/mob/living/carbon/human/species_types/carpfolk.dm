/datum/species/carpfolk // FISH PEOPLE. Distant cousins of space carp who never left the seas, piloting a water-based robot body from their integrated fishbowl. Absolutely wicked.
	name = "Carpfolk"
	id = "carpfolk"
	say_mod = "blubs"
	sexes = FALSE // it do be just a fish
	species_traits = list(NOTRANSSTING,NOEYESPRITES,MUTCOLORS,AGENDER,NOHUSK,NO_UNDERWEAR)
	inherent_traits = list(TRAIT_NOBREATH,TRAIT_NOCRITDAMAGE,TRAIT_MEDICALIGNORE,TRAIT_NOCLONE,TRAIT_TOXIMMUNE,TRAIT_NODEFIB,TRAIT_POWERHUNGRY)
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	mutantbrain = /obj/item/organ/brain/fish
	/*mutantheart = /obj/item/organ/heart/cybernetic/ipc //water pump of some kind?
	mutantliver = /obj/item/organ/liver/cybernetic/upgraded/ipc //water filter
	mutantstomach = /obj/item/organ/stomach/cell //water turbine?
	mutantlungs = /obj/item/organ/lungs/ipc //water pump/filter?
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord, /obj/item/organ/cyberimp/chest/cooling_intake)*/
	mutant_bodyparts = list("carpfolk_fishbowl")
	default_features = list("mcolor" = "#7D7D7D","ipc_chassis" = "Morpheus Cyberkinetics(Greyscale)")
	meat = /obj/item/reagent_containers/food/snacks/carpmeat
	skinned_type = /obj/item/stack/sheet/plasteel{amount = 5}
	exotic_blood = /datum/reagent/water
	damage_overlay_type = "synth"
	limbs_id = "synth"
	pressuremod = 0.9 // chassis is pretty durable, and mostly sealed
	tempmod = 0.7 // water has high specific heat, makes a great coolant
	coldmod = 1.35 // wouldn't go well if all that water freezed up though
	heatmod = 1.15 // ditto for heat, but a tropically hot fishbowl is preferable
	siemens_coeff = 1.75 // but it makes one hell of a conductor
	species_gibs = "robotic"
	attack_sound = 'sound/effects/Glasshit.ogg'
	/*screamsound = 'goon/sound/robot_scream.ogg'
	deathsound = 'sound/voice/borg_deathsound.ogg'*/
	special_step_sounds = list('sound/effects/footstep/catwalk1.ogg', 'sound/effects/footstep/catwalk2.ogg', 'sound/effects/footstep/catwalk3.ogg', 'sound/effects/footstep/catwalk4.ogg')
	special_walk_sounds = list('sound/effects/servostep.ogg')
	species_language_holder = /datum/language_holder/carpfolk
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	// Hats need to be 1 up
	offset_features = list(OFFSET_HEAD = list(0,1))

	var/datum/action/innate/change_screen/change_screen

	smells_like = "fish oil and polish"

/datum/species/carpfolk/random_name(unique)
	var/carpfolk = "[pick(GLOB.carpfolk_names)] the [pick('First', 'Second', 'Third', 'Fourth', 'Fifth', 'Sixth', 'Seventh', 'Eighth', 'Ninth', 'Tenth', 'Eleventh', 'Twelfth')]"
	return carpfolk_name

/datum/species/carpfolk/on_species_gain(mob/living/carbon/C)
	. = ..()
	C.particles = new /particles/smoke/ipc()
	var/obj/item/organ/appendix/A = C.getorganslot(ORGAN_SLOT_APPENDIX) // Easiest way to remove it.
	if(A)
		A.Remove(C)
		QDEL_NULL(A)
	for(var/obj/item/bodypart/O in C.bodyparts)
		O.render_like_organic = TRUE // Makes limbs render like organic limbs instead of augmented limbs, check bodyparts.dm
		var/chassis = C.dna.features["ipc_chassis"]
		var/datum/sprite_accessory/ipc_chassis/chassis_of_choice = GLOB.ipc_chassis_list[chassis]
		C.dna.species.limbs_id = chassis_of_choice.limbs_id
		if(chassis_of_choice.color_src == MUTCOLORS && !(MUTCOLORS in C.dna.species.species_traits)) // If it's a colorable(Greyscale) chassis, we use MUTCOLORS.
			C.dna.species.species_traits += MUTCOLORS
		else if(MUTCOLORS in C.dna.species.species_traits)
			C.dna.species.species_traits -= MUTCOLORS


/datum/species/carpfolk/after_equip_job(datum/job/J, mob/living/carbon/human/H)
	H.grant_language(/datum/language/deep)

/datum/species/carpfolk/get_species_description()
	return "d"

/datum/species/ipc/get_species_lore()
	return list(
		"WIP",
	)

/datum/species/ipc/create_pref_unique_perks()
	var/list/to_add = list()

	// TODO

	return to_add



/datum/species/ipc/spec_life(mob/living/carbon/human/H)
	. = ..()

	if(H.particles)
		var/particles/P = H.particles
		if(P.spawning)
			P.spawning = H.bodytemperature > BODYTEMP_HEAT_DAMAGE_LIMIT ? 4 : 0


/datum/species/carpfolk/eat_text(fullness, eatverb, obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	if(C == user)
		user.visible_message(span_notice("[user] inserts \the [O] into their nutrient intake slot."), span_notice("You insert [O] into your nutrient intake slot."))
	else
		C.visible_message(span_danger("[user] inserts [O] into [C] intake slot!"), \
									span_userdanger("[user] inserts [O] into [C]'s intake slot!"))

/datum/species/ipc/force_eat_text(fullness, obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	C.visible_message(span_danger("[user] attempts to force [O] into [C]'s intake slot!"), \
										span_userdanger("[user] attempts to force [O] into [C]'s intake slot!"))

/datum/species/ipc/drink_text(obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	if(C == user)
		user.visible_message(span_notice("[user] pours some of [O] into their nutrient intake slot."), span_notice("You pour some of [O] into your nutrient intake slot."))
	else
		C.visible_message(span_danger("[user] pours some of [O] into [C]'s intake slot."), span_userdanger("[user] pours some of [O]'s into [C]'s intake slot."))

/datum/species/ipc/force_drink_text(obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	C.visible_message(span_danger("[user] attempts to pour [O] into [C]'s intake slot!"), \
										span_userdanger("[user] attempts to pour [O] into [C]'s intake slot!"))
