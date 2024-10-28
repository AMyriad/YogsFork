GLOBAL_DATUM_INIT(keycard_events, /datum/events, new)

#define KEYCARD_RED_ALERT "Red Alert"
#define KEYCARD_EMERGENCY_MAINTENANCE_ACCESS "Emergency Maintenance Access"
#define KEYCARD_BSA_UNLOCK "Bluespace Artillery Unlock"

/obj/machinery/keycard_auth
	name = "Keycard Authentication Device"
	desc = "This device is used to trigger station functions, which require more than one ID card to authenticate."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 6
	power_channel = AREA_USAGE_ENVIRON
	req_access = list(ACCESS_KEYCARD_AUTH)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/datum/callback/ev
	var/event = ""
	var/obj/machinery/keycard_auth/event_source
	var/mob/triggerer = null
	var/waiting = 0
	var/triggerer_id = null

/obj/machinery/keycard_auth/Initialize(mapload)
	. = ..()
	ev = GLOB.keycard_events.addEvent("triggerEvent", CALLBACK(src, PROC_REF(triggerEvent)))

/obj/machinery/keycard_auth/Destroy()
	GLOB.keycard_events.clearEvent("triggerEvent", ev)
	QDEL_NULL(ev)
	return ..()

/obj/machinery/keycard_auth/ui_state(mob/user)
	return GLOB.physical_state

/obj/machinery/keycard_auth/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "KeycardAuth", name)
		ui.open()

/obj/machinery/keycard_auth/ui_data()
	var/list/data = list()
	data["waiting"] = waiting
	data["auth_required"] = event_source ? event_source.event : 0
	data["red_alert"] = (SSsecurity_level.get_current_level_as_number() >= SEC_LEVEL_RED) ? 1 : 0
	data["emergency_maint"] = GLOB.emergency_access
	data["bsa_unlock"] = GLOB.bsa_unlock
	return data

/obj/machinery/keycard_auth/ui_status(mob/user)
	if(isanimal(user))
		var/mob/living/simple_animal/A = user
		if(!A.dextrous)
			to_chat(user, span_warning("You are too primitive to use this device!"))
			return UI_CLOSE
	if(isdrone(user))
		to_chat(user, span_warning("You are unable to interface with this device!"))
		return UI_CLOSE
	return ..()

/obj/machinery/keycard_auth/ui_act(action, params)
	if(..() || waiting || !allowed(usr))
		return
	if(!check_access(usr.get_active_held_item()))
		to_chat(usr, span_warning("You need to swipe your ID!"))
		return
	switch(action)
		if("red_alert")
			if(!event_source)
				sendEvent(KEYCARD_RED_ALERT)
				. = TRUE
		if("emergency_maint")
			if(!event_source)
				sendEvent(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS)
				. = TRUE
		if("auth_swipe")
			if(event_source)
				event_source.trigger_event(usr)
				event_source = null
				. = TRUE
		if("bsa_unlock")
			if(!event_source)
				sendEvent(KEYCARD_BSA_UNLOCK)
				. = TRUE

/obj/machinery/keycard_auth/proc/sendEvent(event_type)
	triggerer_id = usr.get_active_held_item()
	triggerer = usr
	event = event_type
	waiting = 1
	GLOB.keycard_events.fireEvent("triggerEvent", src)
	addtimer(CALLBACK(src, PROC_REF(eventSent)), 20)

/obj/machinery/keycard_auth/proc/eventSent()
	triggerer = null
	event = ""
	waiting = 0
	triggerer_id = null

/obj/machinery/keycard_auth/proc/triggerEvent(source)
	icon_state = "auth_on"
	event_source = source
	addtimer(CALLBACK(src, PROC_REF(eventTriggered)), 20)

/obj/machinery/keycard_auth/proc/eventTriggered()
	icon_state = "auth_off"
	event_source = null

/obj/machinery/keycard_auth/proc/trigger_event(mob/confirmer)
	var/confirmer_id = confirmer.get_active_held_item() //we already know this has access to complete the action, so we don't bother checking if it's got required access
	if(confirmer_id == triggerer_id)
		return
	else if(confirmer == triggerer) //good luck juggling two IDs while doing this lmao
		SSachievements.unlock_achievement(/datum/achievement/keycard_auth, confirmer.client)

	log_game("[key_name(triggerer)] triggered and [key_name(confirmer)] confirmed event [event]")
	message_admins("[ADMIN_LOOKUPFLW(triggerer)] triggered and [ADMIN_LOOKUPFLW(confirmer)] confirmed event [event]")

	var/area/A1 = get_area(triggerer)
	deadchat_broadcast(" triggered [event] at [span_name("[A1.name]")].", span_name("[triggerer]"), triggerer)

	var/area/A2 = get_area(confirmer)
	deadchat_broadcast(" confirmed [event] at [span_name("[A2.name]")].", span_name("[confirmer]"), confirmer)
	switch(event)
		if(KEYCARD_RED_ALERT)
			SSsecurity_level.set_level(SEC_LEVEL_RED)
		if(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS)
			make_maint_all_access()
		if(KEYCARD_BSA_UNLOCK)
			toggle_bluespace_artillery()

GLOBAL_VAR_INIT(emergency_access, FALSE)
/proc/make_maint_all_access()
	for(var/area/station/maintenance/area in GLOB.areas)
		for (var/list/zlevel_turfs as anything in area.get_zlevel_turf_lists())
			for(var/turf/area_turf as anything in zlevel_turfs)
				for(var/obj/machinery/door/airlock/airlock in area_turf)
					airlock.emergency = TRUE
					airlock.update_icon(ALL, 0)
	minor_announce("Access restrictions on maintenance and external airlocks have been lifted.", "Attention! Station-wide emergency declared!",1)
	GLOB.emergency_access = TRUE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "enabled"))

/proc/revoke_maint_all_access()
	for(var/area/station/maintenance/area in GLOB.areas)
		for (var/list/zlevel_turfs as anything in area.get_zlevel_turf_lists())
			for(var/turf/area_turf as anything in zlevel_turfs)
				for(var/obj/machinery/door/airlock/airlock in area_turf)
					airlock.emergency = FALSE
					airlock.update_icon(ALL, 0)
	minor_announce("Access restrictions in maintenance areas have been restored.", "Attention! Station-wide emergency rescinded:")
	GLOB.emergency_access = FALSE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "disabled"))

/proc/toggle_bluespace_artillery()
	GLOB.bsa_unlock = !GLOB.bsa_unlock
	minor_announce("Bluespace Artillery firing protocols have been [GLOB.bsa_unlock? "unlocked" : "locked"].", "Weapons Systems Update:")
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("bluespace artillery", GLOB.bsa_unlock? "unlocked" : "locked"))

#undef KEYCARD_RED_ALERT
#undef KEYCARD_EMERGENCY_MAINTENANCE_ACCESS
#undef KEYCARD_BSA_UNLOCK
