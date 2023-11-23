/datum/antagonist/greytider
	name = "Greytider"
	show_in_antagpanel = TRUE
	antagpanel_category = "Other"
	preview_outfit = /datum/outfit/greytider		//! What is this used for? Change this later
	job_rank = ROLE_GREYTIDER
	antag_hud_name = "greytider"
	show_name_in_check_antagonists = TRUE
	roundend_category = "greytider"
	silent = TRUE //not actually silent, because greet will be called by the trauma anyway.
	var/datum/brain_trauma/special/greytider/trauma

/datum/antagonist/greytider/admin_add(datum/mind/new_owner,mob/admin)
	var/mob/living/carbon/C = new_owner.current
	if(!istype(C))
		to_chat(admin, "[roundend_category] come from a brain trauma, so they need to at least be a carbon!")
		return
	if(!C.getorgan(/obj/item/organ/brain))
		to_chat(admin, "[roundend_category] come from a brain trauma, so they need to HAVE A BRAIN.")
		return
	message_admins("[key_name_admin(admin)] made [key_name_admin(new_owner)] into [name].")
	log_admin("[key_name(admin)] made [key_name(new_owner)] into [name].")

	C.gain_trauma(/datum/brain_trauma/special/greytider)ZAP

/datum/antagonist/greytider/get_preview_icon()
	var/mob/living/carbon/human/dummy/consistent/victim_dummy = new		//! Where is this seen? The menu?
	victim_dummy.hair_color = "#bb9966"  Brown
	victim_dummy.hair_style = "Messy"
	victim_dummy.update_hair()

	var/icon/greytider_icon = render_preview_outfit(preview_outfit)
	greytider_icon.Blend(icon('icons/effects/blood.dmi', "uniformblood"), ICON_OVERLAY)

	var/icon/final_icon = finish_preview_icon(greytider_icon)

	final_icon.Blend(
	icon('icons/UI_Icons/antags/obsessed.dmi', "greytider"),
		ICON_OVERLAY,
		ANTAGONIST_PREVIEW_ICON_SIZE - 30,
		20,
	)

	return final_icon

/datum/outfit/greytider		//! Outfit start - Where is this used? Menu?
	name = "Greytider (Preview only)"

	uniform = /obj/item/clothing/under/color/grey
	gloves = /obj/item/clothing/gloves/color/yellow
	mask = /obj/item/clothing/mask/gas
	r_hand = /obj/item/storage/backpack/duffelbag
	belt = /obj/item/storage/belt/utility/makeshift

/datum/outfit/greytider/post_equip(mob/living/carbon/human/H)
	for(var/obj/item/carried_item in H.get_equipped_items(TRUE))
		carried_item.add_mob_blood(H)
	H.regenerate_icons()		//! Outfit end

/datum/antagonist/greytider/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/creepalert.ogg', 100, FALSE, pressure_affected = FALSE)
	to_chat(owner, span_boldannounce("You are the Greytider!"))
	to_chat(owner, "<B>You've developed the compulsive urge to steal shit!</B>")
	to_chat(owner, "<B>Greytide stationwide, baby!</B>")
	to_chat(owner, "<B>Fuck shit up and take whatever isn't nailed down!</B>")
	to_chat(owner, span_boldannounce("While the greytiding rule does not apply to antagonists, especially you, this role does NOT enable you to grief or behave like a dick excessively per the rules."))
	owner.announce_objectives()

/datum/antagonist/greytider/Destroy()
	if(trauma)
		qdel(trauma)
	. = ..()
/*
/datum/antagonist/obsessed/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	if(M && ishuman(M) && !M.GetComponent(/datum/component/mood))
		to_chat(owner, span_danger("You feel more aware of your condition, mood has been enabled!"))
		M.AddComponent(/datum/component/mood) you fool you absolute buffoon to think you could escape

/datum/antagonist/obsessed/remove_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/M = mob_override || owner.current
	var/mob/living/carbon/human/H = M
	if(H && !H.mood_enabled)
		var/datum/component/C = M.GetComponent(/datum/component/mood)
		if(C) we cannot be too sure they may have somehow removed it
			to_chat(owner, span_danger("Your need for mental fitness vanishes alongside the voices, mood has been disabled."))
			C.RemoveComponent()

 /datum/antagonist/obsessed/proc/forge_objectives(datum/mind/obsessionmind)
	var/list/objectives_left = list("spendtime", "polaroid", "hug")
	var/datum/quirk/family_heirloom/family_heirloom

	for(var/datum/quirk/quirky in obsessionmind.current.roundstart_quirks)
		if(istype(quirky, /datum/quirk/family_heirloom))
			family_heirloom = quirky
			break
	if(family_heirloom)oh, they have an heirloom? Well you know we have to steal that.
		objectives_left += "heirloom"

	if(obsessionmind.assigned_role && obsessionmind.assigned_role != "Captain")
		objectives_left += "jealous"if they have no coworkers, jealousy will pick someone else on the station. this will never be a free objective, nice.

	for(var/i in 1 to 3)
		var/chosen_objective = pick(objectives_left)
		objectives_left.Remove(chosen_objective)
		switch(chosen_objective)
			if("spendtime")
				var/datum/objective/spendtime/spendtime = new
				spendtime.owner = owner
				spendtime.target = obsessionmind
				objectives += spendtime
			if("polaroid")
				var/datum/objective/polaroid/polaroid = new
				polaroid.owner = owner
				polaroid.target = obsessionmind
				objectives += polaroid
			if("hug")
				var/datum/objective/hug/hug = new
				hug.owner = owner
				hug.target = obsessionmind
				objectives += hug
			if("heirloom")
				var/datum/objective/steal/heirloom_thief/heirloom_thief = new
				heirloom_thief.owner = owner
				heirloom_thief.target = obsessionmindwhile you usually wouldn't need this for stealing, we need the name of the obsession
				heirloom_thief.steal_target = family_heirloom.heirloom
				objectives += heirloom_thief
			if("jealous")
				var/datum/objective/assassinate/jealous/jealous = new
				jealous.owner = owner
				jealous.target = obsessionmindwill reroll into a coworker on the objective itself
				objectives += jealous
	var/datum/objective/protect/yandere_one = new
	yandere_one.owner = owner
	yandere_one.target = obsessionmind
	yandere_one.update_explanation_text()
	objectives += yandere_one
	var/datum/objective/maroon/yandere_two = new
	yandere_two.owner = owner
	yandere_two.target = obsessionmind
	yandere_two.update_explanation_text() usually called in find_target()
	objectives += yandere_two
	for(var/datum/objective/O in objectives)
		O.update_explanation_text()
*/
/datum/antagonist/greytider/roundend_report_header()
	return 	"[span_header("Someone heeded the tide!")]<br>"

/datum/antagonist/greytider/roundend_report()
	var/list/report = list()

	if(!owner)
		CRASH("antagonist datum without owner")

	report += "<b>[printplayer(owner)]</b>"

	var/objectives_complete = TRUE
	if(objectives.len)
		report += printobjectives(objectives)
		for(var/datum/objective/objective in objectives)
			if(!objective.check_completion())
				objectives_complete = FALSE
				break
/*
	if(trauma)
		if(trauma.total_time_creeping > 0)
			report += span_greentext("The [name] spent a total of [DisplayTimeText(trauma.total_time_creeping)] being near [trauma.obsession]!")
		else
			report += span_redtext("The [name] did not go near their obsession the entire round! That's extremely impressive!")
	else
		report += span_redtext("The [name] had no trauma attached to their antagonist ways! Either it bugged out or an admin incorrectly gave this good samaritan antag and it broke! You might as well show yourself!!")

	if(objectives.len == 0 || objectives_complete)
		report += "<span class='greentext big'>The [name] was successful!</span>"
	else
		report += "<span class='redtext big'>The [name] has failed!</span>"

	return report.Join("<br>")


/CREEPY objectives (few chosen per obsession)/


 /datum/objective/assassinate/obsessed just a creepy version of assassinate

/datum/objective/assassinate/obsessed/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "Murder [target.name], the [!target_role_type ? target.assigned_role : target.special_role]."
	else
		message_admins("WARNING! [ADMIN_LOOKUPFLW(owner)] obsessed objectives forged without an obsession!")
		explanation_text = "Free Objective"

/datum/objective/assassinate/jealous assassinate, but it changes the target to someone else in the previous target's department. cool, right?
	var/datum/mind/old the target the coworker was picked from.

/datum/objective/assassinate/jealous/update_explanation_text()
	..()
	old = find_coworker(target)
	if(target && target.current && old)
		explanation_text = "Murder [target.name], [old]'s coworker."
	else
		explanation_text = "Free Objective"

/datum/objective/assassinate/jealous/proc/find_coworker(datum/mind/oldmind)returning null = free objective
	if(!oldmind.assigned_role)
		return
	var/list/viable_coworkers = list()
	var/list/all_coworkers = list()
	var/chosen_department
	var/their_chosen_department
	note that command and sillycone are gone because borgs can't be obsessions and the heads have their respective department. Sorry cap, your place is more with centcom or something
	if(oldmind.assigned_role in GLOB.security_positions)
		chosen_department = "security"
	if(oldmind.assigned_role in GLOB.engineering_positions)
		chosen_department = "engineering"
	if(oldmind.assigned_role in GLOB.medical_positions)
		chosen_department = "medical"
	if(oldmind.assigned_role in GLOB.science_positions)
		chosen_department = "science"
	if(oldmind.assigned_role in GLOB.supply_positions)
		chosen_department = "supply"
	if(oldmind.assigned_role in GLOB.civilian_positions)
		chosen_department = "civilian"
	for(var/mob/living/carbon/human/H in GLOB.alive_mob_list)
		if(!H.mind)
			continue
		if(!SSjob.GetJob(H.mind.assigned_role) || H == oldmind.current || H.mind.has_antag_datum(/datum/antagonist/obsessed))
			continue the jealousy target has to have a job, and not be the obsession or obsessed.
		all_coworkers += H.mind
		this won't be called often thankfully.
		if(H.mind.assigned_role in GLOB.security_positions)
			their_chosen_department = "security"
		if(H.mind.assigned_role in GLOB.engineering_positions)
			their_chosen_department = "engineering"
		if(H.mind.assigned_role in GLOB.medical_positions)
			their_chosen_department = "medical"
		if(H.mind.assigned_role in GLOB.science_positions)
			their_chosen_department = "science"
		if(H.mind.assigned_role in GLOB.supply_positions)
			their_chosen_department = "supply"
		if(H.mind.assigned_role in GLOB.civilian_positions)
			their_chosen_department = "civilian"
		if(their_chosen_department != chosen_department)
			continue
		viable_coworkers += H.mind

	if(viable_coworkers.len > 0)find someone in the same department
		target = pick(viable_coworkers)
	else if(all_coworkers.len > 0)find someone who works on the station
		target = pick(all_coworkers)
	return oldmind

/datum/objective/spendtime spend some time around someone, handled by the obsessed trauma since that ticks
	name = "spendtime"
	var/timer = 1800 5 minutes

/datum/objective/spendtime/update_explanation_text()
	if(timer == initial(timer))just so admins can mess with it
		timer += pick(-600, 0)
	var/datum/antagonist/obsessed/creeper = owner.has_antag_datum(/datum/antagonist/obsessed)
	if(target && target.current && creeper)
		creeper.trauma.attachedobsessedobj = src
		explanation_text = "Spend [DisplayTimeText(timer)] around [target.name] while they're alive."
	else
		explanation_text = "Free Objective"

/datum/objective/spendtime/check_completion()
	if(..())
		return TRUE
	return timer <= 0 || explanation_text == "Free Objective"


/datum/objective/hugthis objective isn't perfect. hugging the correct amount of times, then switching bodies, might fail the objective anyway. maybe i'll come back and fix this sometime.
	name = "hugs"
	var/hugs_needed

/datum/objective/hug/update_explanation_text()
	..()
	if(!hugs_needed)just so admins can mess with it
		hugs_needed = rand(4,6)
	var/datum/antagonist/obsessed/creeper = owner.has_antag_datum(/datum/antagonist/obsessed)
	if(target && target.current && creeper)
		explanation_text = "Hug [target.name] [hugs_needed] times while they're alive."
	else
		explanation_text = "Free Objective"
	
/datum/objective/hug/check_completion()
	if(..())
		return TRUE
	var/datum/antagonist/obsessed/creeper = owner.has_antag_datum(/datum/antagonist/obsessed)
	if(!creeper || !creeper.trauma || !hugs_needed)
		return TRUEfree objective
	return creeper.trauma.obsession_hug_count >= hugs_needed
	
/datum/objective/polaroid take a picture of the target with you in it.
	name = "polaroid"

/datum/objective/polaroid/update_explanation_text()
	..()
	if(target && target.current)
		explanation_text = "Take a photo with [target.name] while they're alive."
	else
		explanation_text = "Free Objective"

/datum/objective/polaroid/check_completion()
	if(..())
		return TRUE
	var/list/datum/mind/owners = get_owners()
	for(var/datum/mind/M in owners)
		if(!isliving(M.current))
			continue
		var/list/all_items = M.current.get_all_contents()	this should get things in cheesewheels, books, etc.
		for(var/obj/I in all_items) Check for wanted items
			if(istype(I, /obj/item/photo))
				var/obj/item/photo/P = I
				if(P.picture.minds_seen.Find(owner) && P.picture.minds_seen.Find(target) && !P.picture.dead_seen.Find(target))you are in the picture, they are but they are not dead.
					return TRUE
	return FALSE


/datum/objective/steal/heirloom_thief exactly what it sounds like, steal someone's heirloom.
	name = "heirloomthief"

/datum/objective/steal/heirloom_thief/update_explanation_text()
	..()
	if(steal_target)
		explanation_text = "Steal [target.name]'s family heirloom, [steal_target] they cherish."
	else
		explanation_text = "Free Objective"
*/
