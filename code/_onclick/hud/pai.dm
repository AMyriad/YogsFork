#define PAI_MISSING_SOFTWARE_MESSAGE span_warning("You must download the required software to use this.")

/atom/movable/screen/pai
	icon = 'icons/mob/screen_pai.dmi'
	var/required_software

/atom/movable/screen/pai/Click()
	if(isobserver(usr) || usr.incapacitated())
		return FALSE
	var/mob/living/silicon/pai/pAI = usr
	if(required_software && !pAI.software.Find(required_software))
		to_chat(pAI, PAI_MISSING_SOFTWARE_MESSAGE)
		return FALSE
	return TRUE

/atom/movable/screen/pai/software
	name = "Software Interface"
	icon_state = "pai"

/atom/movable/screen/pai/software/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.paiInterface()

/atom/movable/screen/pai/shell
	name = "Toggle Holoform"
	icon_state = "pai_holoform"

/atom/movable/screen/pai/shell/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	if(pAI.holoform)
		pAI.fold_in(0)
	else
		pAI.fold_out()

/atom/movable/screen/pai/chassis
	name = "Holochassis Appearance Composite"
	icon_state = "pai_chassis"

/atom/movable/screen/pai/chassis/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.choose_chassis()

/atom/movable/screen/pai/rest
	name = "Rest"
	icon_state = "pai_rest"

/atom/movable/screen/pai/rest/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.lay_down()

/atom/movable/screen/pai/light
	name = "Toggle Integrated Lights"
	icon_state = "light"

/atom/movable/screen/pai/light/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.toggle_integrated_light()

/atom/movable/screen/pai/newscaster
	name = "pAI Newscaster"
	icon_state = "newscaster"
	required_software = "newscaster"

/atom/movable/screen/pai/newscaster/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.newscaster.ui_interact(usr)

/atom/movable/screen/pai/host_monitor
	name = "Host Health Scan"
	icon_state = "host_monitor"
	required_software = "host scan"

/atom/movable/screen/pai/host_monitor/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	if(iscarbon(pAI.card.loc))
		pAI.hostscan.attack(pAI.card.loc, pAI)
	else
		to_chat(src, "You are not being carried by anyone!")
		return 0

/atom/movable/screen/pai/crew_manifest
	name = "Crew Manifest"
	icon_state = "manifest"
	required_software = "crew manifest"

/atom/movable/screen/pai/crew_manifest/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.ai_roster()

/atom/movable/screen/pai/state_laws
	name = "Law Manager"
	icon_state = "state_laws"

/atom/movable/screen/pai/state_laws/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.checklaws()

/atom/movable/screen/pai/modpc
	name = "Messenger"
	icon_state = "pda_send"
	required_software = "digital messenger"
	var/mob/living/silicon/pai/pAI

/atom/movable/screen/pai/modpc/Click()
	. = ..()
	if(!.) // this works for some reason.
		return
	pAI.modularInterface?.interact(pAI)

/atom/movable/screen/pai/image_take
	name = "Take Image"
	icon_state = "take_picture"
	required_software = "photography module"

/atom/movable/screen/pai/image_take/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.aicamera.toggle_camera_mode(usr)

/atom/movable/screen/pai/image_view
	name = "View Images"
	icon_state = "view_images"
	required_software = "photography module"

/atom/movable/screen/pai/image_view/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.aicamera.viewpictures(usr)

/atom/movable/screen/pai/radio
	name = "radio"
	icon = 'icons/mob/screen_cyborg.dmi'
	icon_state = "radio"

/atom/movable/screen/pai/radio/Click()
	if(!..())
		return
	var/mob/living/silicon/pai/pAI = usr
	pAI.radio.interact(usr)

/datum/hud/pai/New(mob/living/silicon/pai/owner)
	..()
	var/atom/movable/screen/using
	var/mob/living/silicon/pai/mypai = mymob

// Software menu
	using = new /atom/movable/screen/pai/software(src)
	using.screen_loc = ui_pai_software
	static_inventory += using

// Holoform
	using = new /atom/movable/screen/pai/shell(src)
	using.screen_loc = ui_pai_shell
	static_inventory += using

// Chassis Select Menu
	using = new /atom/movable/screen/pai/chassis(src)
	using.screen_loc = ui_pai_chassis
	static_inventory += using

// Rest
	using = new /atom/movable/screen/pai/rest(src)
	using.screen_loc = ui_pai_rest
	static_inventory += using

// Integrated Light
	using = new /atom/movable/screen/pai/light(src)
	using.screen_loc = ui_pai_light
	static_inventory += using

// Newscaster
	using = new /atom/movable/screen/pai/newscaster(src)
	using.screen_loc = ui_pai_newscaster
	static_inventory += using

// Language menu
	using = new /atom/movable/screen/language_menu(src)
	using.screen_loc = ui_borg_language_menu
	static_inventory += using

// Host Monitor
	using = new /atom/movable/screen/pai/host_monitor(src)
	using.screen_loc = ui_pai_host_monitor
	static_inventory += using

// Crew Manifest
	using = new /atom/movable/screen/pai/crew_manifest(src)
	using.screen_loc = ui_pai_crew_manifest
	static_inventory += using

// Laws
	using = new /atom/movable/screen/pai/state_laws(src)
	using.screen_loc = ui_pai_state_laws
	static_inventory += using

// Modular Interface
	using = new /atom/movable/screen/pai/modpc(src)
	using.screen_loc = ui_pai_pda_send
	static_inventory += using
	mypai.interfaceButton = using
	var/atom/movable/screen/pai/modpc/tabletbutton = using
	tabletbutton.pAI = mypai

// Take image
	using = new /atom/movable/screen/pai/image_take(src)
	using.screen_loc = ui_pai_take_picture
	static_inventory += using

// View images
	using = new /atom/movable/screen/pai/image_view(src)
	using.screen_loc = ui_pai_view_images
	static_inventory += using

// Radio
	using = new /atom/movable/screen/pai/radio(src)
	using.screen_loc = ui_borg_radio
	static_inventory += using

	update_software_buttons()

/datum/hud/pai/proc/update_software_buttons()
	var/mob/living/silicon/pai/owner = mymob
	for(var/atom/movable/screen/pai/button in static_inventory)
		if(button.required_software)
			button.color = owner.software.Find(button.required_software) ? null : "#808080"

#undef PAI_MISSING_SOFTWARE_MESSAGE
