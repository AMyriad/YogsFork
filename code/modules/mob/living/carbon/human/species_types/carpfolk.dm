/datum/species/carpfolk // FISH PEOPLE. Distant cousins of space carp who never left the seas, piloting a water-based robot body from their integrated fishbowl. Wicked.
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
	pressuremod = 0.9 // chassis is pretty durable
	tempmod = 0.7 // water has high specific heat, makes a great coolant
	coldmod = 1.35 // wouldn't go well if all that water freezed up though
	siemens_coeff = 1.75 // but it makes one hell of a conductor
	species_gibs = "robotic"
	/*attack_sound = 'sound/items/trayhit1.ogg'
	screamsound = 'goon/sound/robot_scream.ogg'
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
	var/carpfolk = "[pick(GLOB.carpfolk_names) the (pick(First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth, Ninth, Tenth, Eleventh, Twelfth)]"
	return carpfolk_name

/datum/species/ipc/on_species_gain(mob/living/carbon/C) // Let's make that IPC actually robotic.
	. = ..()
	C.particles = new /particles/smoke/ipc()
	var/obj/item/organ/appendix/A = C.getorganslot(ORGAN_SLOT_APPENDIX) // Easiest way to remove it.
	if(A)
		A.Remove(C)
		QDEL_NULL(A)
	if(ishuman(C) && !change_screen)
		change_screen = new
		change_screen.Grant(C)
	for(var/obj/item/bodypart/O in C.bodyparts)
		O.render_like_organic = TRUE // Makes limbs render like organic limbs instead of augmented limbs, check bodyparts.dm
		var/chassis = C.dna.features["ipc_chassis"]
		var/datum/sprite_accessory/ipc_chassis/chassis_of_choice = GLOB.ipc_chassis_list[chassis]
		C.dna.species.limbs_id = chassis_of_choice.limbs_id
		if(chassis_of_choice.color_src == MUTCOLORS && !(MUTCOLORS in C.dna.species.species_traits)) // If it's a colorable(Greyscale) chassis, we use MUTCOLORS.
			C.dna.species.species_traits += MUTCOLORS
		else if(MUTCOLORS in C.dna.species.species_traits)
			C.dna.species.species_traits -= MUTCOLORS

/datum/species/ipc/proc/handle_speech(datum/source, list/speech_args)
	speech_args[SPEECH_SPANS] |= SPAN_ROBOT

/datum/species/carpfolk/after_equip_job(datum/job/J, mob/living/carbon/human/H)
	H.grant_language(/datum/language/deep)

/datum/species/ipc/proc/post_death(mob/living/carbon/C)
	if(C.stat < DEAD)
		return
	C.dna.features["ipc_screen"] = null //Turns off screen on death
	C.update_body()

/datum/species/ipc/get_species_description()
	return "IPCs, or Integrated Posibrain Chassis, are a series of constructed bipedal humanoids which vaguely represent humans in their figure. \
		IPCs were made by several human corporations after the second generation of cyborg units was created. As sapient, yet robotic individuals, \
		their existence is alarming to several humans who distrust silicon lifeforms that are not bound by laws."

/datum/species/ipc/get_species_lore()
	return list(
		"WIP",
	)

/datum/species/ipc/create_pref_unique_perks()
	var/list/to_add = list()

	// TODO

	return to_add


/datum/action/innate/change_screen/Activate()
	var/screen_choice = tgui_input_list(usr, "Which screen do you want to use?", "Screen Change", GLOB.ipc_screens_list)
	var/color_choice = input(usr, "Which color do you want your screen to be?", "Color Change") as null | color
	if(!screen_choice)
		return
	if(!color_choice)
		return
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/H = owner
	H.dna.features["ipc_screen"] = screen_choice
	H.eye_color = sanitize_hexcolor(color_choice)
	H.update_body()


/particles/smoke/ipc // exact same smoke visual, but no offset
	position = list(0, 0, 0)
	spawning = 0

/datum/species/ipc/spec_life(mob/living/carbon/human/H)
	. = ..()

	if(H.particles)
		var/particles/P = H.particles
		if(P.spawning)
			P.spawning = H.bodytemperature > BODYTEMP_HEAT_DAMAGE_LIMIT ? 4 : 0

	if(H.oxyloss)
		H.setOxyLoss(0)
		H.losebreath = 0
	if(H.health <= HEALTH_THRESHOLD_FULLCRIT && H.stat != DEAD && !HAS_TRAIT(H, TRAIT_NOHARDCRIT)) // So they die eventually instead of being stuck in crit limbo.
		if(H.mind?.has_martialart(MARTIALART_ULTRAVIOLENCE))
			H.death() // YOU'RE GETTING RUSTY, MACHINE!!
			return .
		H.adjustFireLoss(2) // someone forgor IPCs don't have damage reduction
		if(prob(5))
			to_chat(H, "<span class='warning'>Alert: Internal temperature regulation systems offline; thermal damage sustained. Shutdown imminent.</span>")
			H.visible_message("[H]'s cooling system fans stutter and stall. There is a faint, yet rapid beeping coming from inside their chassis.")


/datum/species/ipc/eat_text(fullness, eatverb, obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	if(C == user)
		user.visible_message(span_notice("[user] shoves \the [O] down their port."), span_notice("You shove [O] down your input port."))
	else
		C.visible_message(span_danger("[user] forces [O] down [C] port!"), \
									span_userdanger("[user] forces [O] down [C]'s port!"))

/datum/species/ipc/force_eat_text(fullness, obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	C.visible_message(span_danger("[user] attempts to shove [O] down [C]'s port!"), \
										span_userdanger("[user] attempts to shove [O] down [C]'s port!"))

/datum/species/ipc/drink_text(obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	if(C == user)
		user.visible_message(span_notice("[user] pours some of [O] into their port."), span_notice("You pour some of [O] down your input port."))
	else
		C.visible_message(span_danger("[user] pours some of [O] into [C]'s port."), span_userdanger("[user] pours some of [O]'s into [C]'s port."))

/datum/species/ipc/force_drink_text(obj/O, mob/living/carbon/C, mob/user)
	. = TRUE
	C.visible_message(span_danger("[user] attempts to pour [O] down [C]'s port!"), \
										span_userdanger("[user] attempts to pour [O] down [C]'s port!"))
