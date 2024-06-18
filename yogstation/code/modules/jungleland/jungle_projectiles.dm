/obj/projectile/jungle
	icon = 'yogstation/icons/obj/jungle.dmi'

/obj/projectile/jungle/heal_orb
	name = "Orb of healing"
	name = "rejuvenating sap"
	icon_state = "heal_orb"
	damage = -10
	speed = 2
	homing = TRUE
	impact_effect_type = /obj/effect/temp_visual/heal(COLOR_ETHIOPIA_GREEN)
	hitsound = 'sound/magic/staff_healing.ogg'

/obj/projectile/jungle/damage_orb
	name = "Orb of vengeance"
	name = "stinging sap"
	icon_state = "damage_orb"
	damage = 20
	speed = 1
	damage_type = BURN

/obj/projectile/jungle/meduracha_spit
	name = "Glob of toxic goo"
	name = "glob of toxic goo"
	icon_state = "meduracha_spit"
	damage = 20
	speed = 3
	damage_type = TOX
/obj/projectile/jungle/meduracha_spit/on_hit(atom/target, blocked)
	. = ..()
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/H = target 
	var/chance = 100 - H.getarmor(null,BIO)
	if(prob(max(10,chance * 0.75))) // higher chance than toxic water
		H.reagents.add_reagent(/datum/reagent/toxic_metabolities,15)
