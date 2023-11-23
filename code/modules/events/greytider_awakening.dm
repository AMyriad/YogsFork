/datum/round_event_control/greytider
	name = "Greytide Awakening"
	typepath = /datum/round_event/greytider
	max_occurrences = 1
	min_players = 20

/datum/round_event/greytider
	fakeable = FALSE

/datum/round_event/greytider/start()
	for(var/mob/living/carbon/human/H in shuffle(GLOB.player_list))
		if(!H.client || !(ROLE_GREYTIDER in H.client.prefs.be_special))
			continue
		if(H.stat == DEAD)
			continue
		if(!SSjob.GetJob(H.mind.assigned_role) || (H.mind.assigned_role in GLOB.nonhuman_positions))
			continue
		if(H.mind.has_antag_datum(/datum/antagonist))
			continue
		if(!H.getorgan(/obj/item/organ/brain))
			continue
		H.gain_trauma(/datum/brain_trauma/special/greytider)
		announce_to_ghosts(H)
		break
