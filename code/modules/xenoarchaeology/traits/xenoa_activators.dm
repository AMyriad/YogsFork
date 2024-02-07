/////- ACTIVATOR TRAITS -/////
// Only used to generate charge, activating the artifact's effects.
// Flavor-wise, the player sees this as the artifact's material/material properties.

///============
/// Default/Impact - On-use/interact or throw.
///============
/datum/xenoartifact_trait/activator/impact
	desc = "Sturdy"
	label_desc = "Sturdy: The material is sturdy. The amount of force applied seems to directly correlate to the size of the reaction."
	charge = 25
	signals = list(COMSIG_PARENT_ATTACKBY, COMSIG_MOVABLE_IMPACT, COMSIG_ITEM_ATTACK_SELF, COMSIG_ITEM_AFTERATTACK)
	flags = BLUESPACE_TRAIT | PLASMA_TRAIT | URANIUM_TRAIT
	weight = 30

/datum/xenoartifact_trait/activator/impact/pass_input(datum/source, obj/item/thing, mob/user, atom/target)
	var/obj/item/xenoartifact/X = source
	charge = charge*((thing?.force || 10)*0.1)
	X.default_activate(charge, user, target)

///============
/// Burn - Responds to heat.
///============
/datum/xenoartifact_trait/activator/burn
	desc = "Flammable"
	label_desc = "Flammable: The material is flammable, and seems to react when ignited."
	charge = 25
	signals = list(COMSIG_PARENT_ATTACKBY)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/burn/on_init(obj/item/xenoartifact/X)
	..()
	X.max_range += 1

/datum/xenoartifact_trait/activator/burn/pass_input(datum/source, obj/item/thing, mob/user, atom/target, params) // Xenoa item handles this, see process proc there
	var/obj/item/xenoartifact/X = source
	if(X.process_type != PROCESS_TYPE_LIT && thing.ignition_effect(X, user))
		X.visible_message("<span class='danger'>The [X.name] sparks on.</span>")
		X.process_type = PROCESS_TYPE_LIT
		sleep(1.8 SECONDS) //Give them a chance to escape
		START_PROCESSING(SSobj, X)
		log_game("[key_name_admin(user)] lit [X] at [world.time] using [thing]. [X] located at [AREACOORD(X)].")

///============
/// Timed - Activates on a timer. Timer is turned on when used, has a chance to turn off.
///============
/datum/xenoartifact_trait/activator/timed
	label_name = "Timed"
	label_desc = "Timed: The material produces a resonance pattern similar to quartz, causing it to produce a reaction every so often."
	charge = 25
	blacklist_traits = list(/datum/xenoartifact_trait/minor/capacitive)
	signals = list(COMSIG_PARENT_ATTACKBY, COMSIG_MOVABLE_IMPACT, COMSIG_ITEM_ATTACK_SELF, COMSIG_ITEM_AFTERATTACK)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/timed/on_init(obj/item/xenoartifact/X)
	..()
	X.max_range += 1
	X.malfunction_mod = 0.5

/datum/xenoartifact_trait/activator/timed/on_item(obj/item/xenoartifact/X, atom/user, atom/item)
	if(istype(item, /obj/item/clothing/neck/stethoscope))
		to_chat(user, "<span class='info'>The [X.name] ticks deep from within.\n</span>")
		return TRUE
	return ..()

/datum/xenoartifact_trait/activator/timed/pass_input(datum/source, obj/item/thing, mob/user, atom/target, params)
	var/obj/item/xenoartifact/X = source
	X.process_type = PROCESS_TYPE_TICK
	START_PROCESSING(SSobj, X)
	log_game("[key_name_admin(user)] set time on [X] at [world.time] using [thing]. [X] located at [AREACOORD(X)].")

///============
/// Signal - Responds to respective signals sent through signallers.
///============
/datum/xenoartifact_trait/activator/signal
	label_name = "Signal"
	label_desc = "Signal: The material receives radio frequencies and reacts when a matching code is delivered."
	charge = 25
	signals = list(XENOA_SIGNAL)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/signal/on_init(obj/item/xenoartifact/X)
	..()
	X.code = rand(1, 100) //Random code is shared by all signaller traits
	X.frequency = FREQ_SIGNALER
	X.set_frequency(X.frequency)
	X.max_range += 1

/datum/xenoartifact_trait/activator/signal/on_item(obj/item/xenoartifact/X, atom/user, atom/item)
	if(istype(item, /obj/item/analyzer))
		to_chat(user, "<span class='info'>The [item.name] displays a signal-input code of [X.code], and frequency [X.frequency].</span>")
		return TRUE
	return ..()

/datum/xenoartifact_trait/activator/signal/pass_input(datum/source, obj/item/thing, mob/user, atom/target, params)
	var/obj/item/xenoartifact/X = source
	X.default_activate(charge, user, target)
	log_game("[key_name_admin(user)] signalled [X] at [world.time]. [X] located at [AREACOORD(X)].")

///============
/// Battery - Activates when interacted with a power cell, drawing power from said cell.
///============
/datum/xenoartifact_trait/activator/battery
	desc = "Charged"
	label_desc = "Charged: The material has a natural power draw. Supplying any current to this will cause a reaction."
	charge = 25
	signals = list(COMSIG_PARENT_ATTACKBY)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/battery/on_item(obj/item/xenoartifact/X, atom/user, atom/item)
	if(istype(item, /obj/item/multitool))
		to_chat(user, "<span class='info'>The [item.name] displays a draw of [X.charge_req].</span>")
		return TRUE
	return ..()

/datum/xenoartifact_trait/activator/battery/pass_input(datum/source, obj/item/stock_parts/cell/thing, mob/user, atom/target, params)
	var/obj/item/xenoartifact/X = source
	if(!istype(thing))
		return
	if(thing.use(X.charge_req*10))
		X.default_activate(charge, user, user)

///============
/// Weighted - Activates when picked up.
///============
/datum/xenoartifact_trait/activator/weighted
	desc = "Weighted"
	label_desc = "Weighted: The material is weighted and produces a reaction when picked up."
	charge = 25
	signals = list(COMSIG_ITEM_PICKUP)
	blacklist_traits = list(/datum/xenoartifact_trait/minor/dense, /datum/xenoartifact_trait/minor/anchor, /datum/xenoartifact_trait/major/distablizer)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/weighted/pass_input(datum/source, obj/item/thing, mob/living/carbon/user, mob/living/carbon/human/target)
	var/obj/item/clothing/gloves/artifact_pinchers/P
	//Grab ref to gloves for check
	if(istype(user))
		P = user.get_item_by_slot(ITEM_SLOT_GLOVES)
		if(istype(P) && P?.safety) //This trait is a special tism
			return
	var/obj/item/xenoartifact/X = source
	X.default_activate(charge, user, user)

///============
/// Pitch - Activates when thrown. Credit to EvilDragon#4532
///============
/datum/xenoartifact_trait/activator/pitch
	label_name = "Pitched"
	label_desc = "Pitched: The material is aerodynamic and activates when thrown."
	charge = 25
	blacklist_traits = (/datum/xenoartifact_trait/minor/dense)
	signals = list(COMSIG_MOVABLE_IMPACT)
	flags = BLUESPACE_TRAIT | URANIUM_TRAIT

/datum/xenoartifact_trait/activator/pitch/pass_input(datum/source, obj/item/thing, mob/user, atom/target)
	var/obj/item/xenoartifact/X = source
	X.default_activate(charge, user, target)

///============
/// Honk - Activates when honked or used by a clown.
///============
/datum/xenoartifact_trait/activator/honk
	desc = "Honked"
	label_desc = "Honked: The material is squishy & humorous. Perhaps the clown would know how to use it?"
	charge = 25
	signals = list(COMSIG_PARENT_ATTACKBY, COMSIG_MOVABLE_IMPACT, COMSIG_ITEM_ATTACK_SELF, COMSIG_ITEM_AFTERATTACK)
	weight = 25

/datum/xenoartifact_trait/activator/honk/pass_input(datum/source, obj/item/thing, mob/user, atom/target)
	var/obj/item/xenoartifact/X = source
	//Make sure we're being silly before we activate it - isclown( ) refers to the simplemob
	if(!(istype(thing, /obj/item/bikehorn) || istype(thing, /obj/item/bikehorn/golden) || isclown(target) || HAS_TRAIT(user, TRAIT_CLUMSY) || HAS_TRAIT(target, TRAIT_CLUMSY)))
		return
	charge = charge*((thing?.force || 10)*0.1)
	X.default_activate(charge, user, target)
