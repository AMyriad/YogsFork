/datum/guardian_ability/major/healing
	name = "Healing"
	desc = "Allows the guardian to heal anything, living or inanimate, by touch."
	cost = 4
	has_mode = TRUE
	mode_on_msg = "<span class='danger'><B>You switch to healing mode.</span></B>"
	mode_off_msg = "<span class='danger'><B>You switch to combat mode.</span></B>"
	arrow_weight = 1.1
	var/healuser = TRUE

/datum/guardian_ability/major/healing/Apply()
	var/datum/atom_hud/medsensor = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	medsensor.show_to(guardian)

/datum/guardian_ability/major/healing/Remove()
	var/datum/atom_hud/medsensor = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	medsensor.hide_from(guardian)

/datum/guardian_ability/major/healing/Attack(atom/target)
	if (mode)
		var/list/guardians = guardian.summoner?.current?.hasparasites()
		if (target == guardian)
			to_chat(guardian, span_bolddanger("You can't heal yourself!"))
			return TRUE
		if ((target == guardian.summoner?.current || guardians.Find(target)) && !healuser)
			to_chat(guardian, span_bolddanger("You can't heal your user!"))
			return TRUE
		if (isliving(target))
			var/mob/living/L = target
			guardian.do_attack_animation(L)
			L.adjustBruteLoss(-(master_stats.potential * 1.5), forced = TRUE)
			L.adjustFireLoss(-(master_stats.potential * 1.5), forced = TRUE)
			L.adjustOxyLoss(-(master_stats.potential * 1.5), forced = TRUE)
			L.adjustToxLoss(-(master_stats.potential * 1.5), forced = TRUE)
			var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal(get_turf(L))
			if (guardian.namedatum)
				H.color = guardian.namedatum.color
			if (L == guardian.summoner?.current)
				guardian.update_health_hud()
				guardian.med_hud_set_health()
				guardian.med_hud_set_status()
			return TRUE
		else if (target.uses_integrity)
			guardian.do_attack_animation(target)
			target.update_integrity(min(target.get_integrity() + (target.max_integrity * 0.1), target.max_integrity))
			var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal(get_turf(target))
			target.update_appearance(UPDATE_ICON)
			if (guardian.namedatum)
				H.color = guardian.namedatum.color
			guardian.changeNext_move(CLICK_CD_MELEE)
			return TRUE

/datum/guardian_ability/major/healing/limited
	name = "Limited Healing"
	desc = "Allows the guardian to heal anything with the exception of its user"
	cost = 2
	healuser = FALSE
