/datum/brain_trauma/special/greytider
    name = "Obsessive Compulsive Kleptomania"
    desc = "Patient suffers from impulsive desires to steal and vandalize."
    scan_desc = "manic intrusive thoughts"
    gain_text = "If you see this message, make a github issue report. The trauma initialized wrong."
    lose_text = span_warning("The voices in your head fall silent.")
    can_gain = TRUE
    random_gain = FALSE
    resilience = TRAUMA_RESILIENCE_SURGERY
    var/datum/mind/greytidermind
    var/datum/antagonist/greytider/antagonist

/datum/brain_trauma/special/greytider/on_gain()
    equip_recipes()
	

	//setup, linking, etc//
//	if(!greytider)//admins didn't set one
//		obsession = find_obsession()
//		if(!obsession)//we didn't find one
//			lose_text = ""
//			qdel(src)
//			return
//	greytidermind = obsession.mind
   if(owner.current)
        give_pinpointer()
        equip_brother()
    gain_text = span_warning("You hear a sickening, raspy voice in your head. It wants one small task of you...")
    owner.mind.add_antag_datum(/datum/antagonist/greytider)
    antagonist = owner.mind.has_antag_datum(/datum/antagonist/greytider)
    antagonist.trauma = src
    RegisterSignal(greytider, COMSIG_MOB_EYECONTACT, PROC_REF(stare))
    ..()
	//antag stuff//
	antagonist.forge_objectives(greytider.mind)
	antagonist.greet()
