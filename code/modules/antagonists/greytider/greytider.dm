/datum/antagonist/greytider
	name = "Greytider"
	show_in_antagpanel = TRUE
	antagpanel_category = "Other"
	preview_outfit = /datum/outfit/greytider
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
	var/mob/living/carbon/human/dummy/consistent/victim_dummy = new	
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

/datum/outfit/greytider
	name = "Greytider (Preview only)"

	uniform = /obj/item/clothing/under/color/grey
	gloves = /obj/item/clothing/gloves/color/yellow
	mask = /obj/item/clothing/mask/gas
	r_hand = /obj/item/storage/backpack/duffelbag
	belt = /obj/item/storage/belt/utility/makeshift

/datum/outfit/greytider/post_equip(mob/living/carbon/human/H)
	for(var/obj/item/carried_item in H.get_equipped_items(TRUE))
		carried_item.add_mob_blood(H)
	H.regenerate_icons()

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

	if(trauma)
	else
		report += span_redtext("The [name] had no trauma attached to their antagonist ways! Either it bugged out or an admin incorrectly gave this good samaritan antag and it broke! You might as well show yourself!!")

	if(objectives.len == 0 || objectives_complete)
		report += "<span class='greentext big'>The [name] was successful!</span>"
	else
		report += "<span class='redtext big'>The [name] has failed!</span>"

	return report.Join("<br>")
