/area/debug/holodeck
	name = "HOLODECK AREAS"
	icon_state = "Holodeck"

	static_lighting = FALSE
	base_lighting_alpha = 255

	flags_1 = NONE

	/// The holodeck computer that the area is being hosted by, which we use for power and such
	var/obj/machinery/computer/holodeck/linked

/*
	Power tracking: Use the holodeck computer's power grid
	Asserts are to avoid the inevitable infinite loops
*/
/area/debug/holodeck/powered(chan)
	if(!requires_power)
		return TRUE
	if(always_unpowered)
		return FALSE
	if(!linked)
		return FALSE
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/debug/holodeck))
	return A.powered(chan)

/area/debug/holodeck/usage(chan)
	if(!linked)
		return FALSE
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/debug/holodeck))
	return A.usage(chan)

/area/debug/holodeck/addStaticPower(value, powerchannel)
	if(!linked)
		return
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/debug/holodeck))
	return A.addStaticPower(value,powerchannel)

/area/debug/holodeck/use_power(amount, chan)
	if(!linked)
		return FALSE
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/debug/holodeck))
	return A.use_power(amount,chan)

/*
	This is the holodeck. It is intended to allow you to
	blow off steam by doing stupid things like laying down, throwing
	spheres at holes, or bludgeoning people.
*/
/area/debug/holodeck/main // The actual area holodeck rooms on the station use
	name = "\improper Recreational Holodeck"
	blob_allowed = TRUE
	valid_territory = TRUE
