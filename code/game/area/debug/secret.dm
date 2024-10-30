/area/debug/secret
	name = "Secret Areas"
	icon_state = "secret"

	base_lighting_alpha = 255

	requires_power = FALSE

	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = NOTELEPORT
	show_on_sensors = FALSE
	hidden = TRUE

/area/debug/secret/pocket_dimension // Used by a guardian/holoparasite ability
	name = "\improper Pocket Dimension"
	ambience_index = AMBIENCE_SPACE
	base_lighting_alpha = 255
	unique = FALSE
	parallax_movedir = EAST

/area/debug/secret/ai_multicam
	name = "\improper AI Multicam Viewing"
	icon_state = "ai_camera_room"
	safe = TRUE

/// Area used in conjuction with the cordon turf to create a fully functioning world border
/area/debug/secret/cordon
	name = "\improper CORDON"
	icon_state = "cordon"
	static_lighting = FALSE


/area/debug/secret/cordon/Entered(atom/movable/arrived, area/old_area)
	. = ..()
	for(var/mob/living/enterer as anything in arrived.get_all_contents_type(/mob/living))
		to_chat(enterer, span_userdanger("This was a bad idea..."))
		enterer.dust(TRUE, FALSE, TRUE)
