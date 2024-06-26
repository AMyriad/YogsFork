/// Drugginess / "high" effect, makes your screen rainbow
/datum/status_effect/drugginess
	id = "drugged"
	alert_type = /atom/movable/screen/alert/status_effect/high
	remove_on_fullheal = TRUE

/datum/status_effect/drugginess/on_creation(mob/living/new_owner, duration = 10 SECONDS)
	src.duration = duration
	return ..()

/datum/status_effect/drugginess/on_apply()
	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(remove_drugginess))

	SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, id, /datum/mood_event/high)
	owner.overlay_fullscreen(id, /atom/movable/screen/fullscreen/high)
	owner.grant_language(/datum/language/beachbum, TRUE, TRUE, id)
	return TRUE

/datum/status_effect/drugginess/on_remove()
	UnregisterSignal(owner, COMSIG_LIVING_DEATH)

	SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, id)
	owner.clear_fullscreen(id)
	owner.remove_language(/datum/language/beachbum, TRUE, TRUE, id)

/// Removes all of our drugginess (self delete) on signal
/datum/status_effect/drugginess/proc/remove_drugginess(datum/source, admin_revive)
	SIGNAL_HANDLER

	qdel(src)

/// The status effect for "drugginess"
/atom/movable/screen/alert/status_effect/high
	name = "High"
	desc = "Whoa man, you're tripping balls! Careful you don't get addicted... if you aren't already."
	icon_state = "high"
