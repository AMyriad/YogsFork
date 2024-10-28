/area/station/ai_monitored
	name = "AI Monitored Areas"
	icon_state = ""

	minimap_color = "#f7de02"
	airlock_wires = /datum/wires/airlock/ai

	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_AREA_STANDARD_STATION

	lights_always_start_on = TRUE
	lighting_colour_tube = "#ffce93"
	lighting_colour_bulb = "#ffbc6f"

	clockwork_warp_allowed = FALSE

	var/list/obj/machinery/camera/motioncameras = list()
	var/list/datum/weakref/motionTargets = list()

/area/station/ai_monitored/Initialize(mapload)
	. = ..()
	if(mapload)
		for (var/obj/machinery/camera/M in src)
			if(M.isMotion())
				motioncameras.Add(M)
				M.area_motion = src

/area/station/ai_monitored/Entered(atom/movable/O) //Only need to use one camera
	..()
	if (ismob(O) && motioncameras.len)
		for(var/X in motioncameras)
			var/obj/machinery/camera/cam = X
			cam.newTarget(O)
			return

/area/station/ai_monitored/Exited(atom/movable/O)
	..()
	if (ismob(O) && motioncameras.len)
		for(var/X in motioncameras)
			var/obj/machinery/camera/cam = X
			cam.lostTargetRef(WEAKREF(O))
			return

//-- Non-AI/General AI Monitored Areas --//

/area/station/ai_monitored/general
	name = "General AI Monitored Areas"
	icon_state = ""
	airlock_wires = /datum/wires/airlock/command

/area/station/ai_monitored/general/vault
	name = "\improper Vault"
	icon_state = "nuke_storage"
	minimap_color = "#a2a2a2"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/ai_monitored/general/armory
	name = "\improper Armory"
	icon_state = "armory"
	minimap_color = "#b12527"
	airlock_wires = /datum/wires/airlock/security

/area/station/ai_monitored/general/eva
	name = "\improper EVA Storage"
	icon_state = "eva"
	minimap_color = "#c8c0ff"


//-- AI Areas --//

/area/station/ai_monitored/ai
	name = "AI Areas"
	icon_state = "ai"
	minimap_color = "#00fff6"
	ambience_index = AMBIENCE_AI
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/ai_monitored/ai/core
	name = "\improper AI Core"
	icon_state = "ai_chamber"

/area/station/ai_monitored/ai/antechamber
	name = "\improper AI Satellite Antechamber"
	icon_state = "ai"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/ai_monitored/ai/sat_maintenance
	name = "\improper AI Satellite Maintenance"
	icon_state = "storage"

/area/station/ai_monitored/ai/sat_teleporter
	name = "\improper AI Satellite Teleporter"
	icon_state = "ai"

/area/station/ai_monitored/ai/sat_walkway
	name = "\improper AI Satellite Walkway"
	icon_state = "ai"

/area/station/ai_monitored/ai/upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"

/area/station/ai_monitored/ai/upload_access
	name = "\improper AI Upload Access"
	icon_state = "ai_foyer"

/area/station/ai_monitored/ai/core_secondary
	name = "\improper AI Secondary Core"
	icon_state = "ai"
