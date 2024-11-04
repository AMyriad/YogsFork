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

/area/debug/secret/hilberts_hotel
	name = "\improper Hilbert's Hotel Room"
	icon_state = "hilberts_hotel"
	unique = FALSE
	ambientsounds = list('sound/ambience/servicebell.ogg')
	var/roomnumber = 0
	var/obj/item/hilbertshotel/parentSphere
	var/datum/turf_reservation/reservation
	var/turf/storageTurf

/area/debug/secret/hilberts_hotel/Entered(atom/movable/AM)
	. = ..()
	if(istype(AM, /obj/item/hilbertshotel))
		relocate(AM)
	var/list/obj/item/hilbertshotel/hotels = AM.get_all_contents(/obj/item/hilbertshotel)
	for(var/obj/item/hilbertshotel/H in hotels)
		if(parentSphere == H)
			relocate(H)

/area/debug/secret/hilberts_hotel/proc/relocate(obj/item/hilbertshotel/H)
	if(prob(0.135685)) //Because screw you
		qdel(H)
		return
	var/turf/targetturf = find_safe_turf()
	if(!targetturf)
		if(GLOB.blobstart.len > 0)
			targetturf = get_turf(pick(GLOB.blobstart))
		else
			CRASH("Unable to find a blobstart landmark")
	var/turf/T = get_turf(H)
	var/area/A = T.loc
	log_game("[H] entered itself. Moving it to [loc_name(targetturf)].")
	message_admins("[H] entered itself. Moving it to [ADMIN_VERBOSEJMP(targetturf)].")
	for(var/mob/M in A)
		to_chat(M, span_danger("[H] almost implodes in upon itself, but quickly rebounds, shooting off into a random point in space!"))
	H.forceMove(targetturf)

/area/debug/secret/hilberts_hotel/Exited(atom/movable/AM)
	. = ..()
	if(ismob(AM))
		var/mob/M = AM
		if(M.mind)
			var/stillPopulated = FALSE
			var/list/currentLivingMobs = get_all_contents(/mob/living) //Got to catch anyone hiding in anything
			for(var/mob/living/L in currentLivingMobs) //Check to see if theres any sentient mobs left.
				if(L.mind)
					stillPopulated = TRUE
					break
			if(!stillPopulated)
				storeRoom()

/area/debug/secret/hilberts_hotel/proc/storeRoom()
	var/roomSize = reservation.width*reservation.height
	var/storage[roomSize]
	var/turfNumber = 1
	var/obj/item/abstracthotelstorage/storageObj = new(storageTurf)
	storageObj.roomNumber = roomnumber
	storageObj.parentSphere = parentSphere
	storageObj.name = "Room [roomnumber] Storage"
	var/turf/bottomLeft = reservation.bottom_left_turfs[1]
	for(var/i=0, i<parentSphere.hotelRoomTemp.width, i++)
		for(var/j=0, j<parentSphere.hotelRoomTemp.height, j++)
			var/list/turfContents = list()
			for(var/atom/movable/A in locate(bottomLeft.x + i, bottomLeft.y + j, bottomLeft.z))
				if(ismob(A) && !isliving(A))
					continue //Don't want to store ghosts
				turfContents += A
				A.forceMove(storageObj)
			storage[turfNumber] = turfContents
			turfNumber++
	parentSphere.storedRooms["[roomnumber]"] = storage
	parentSphere.activeRooms -= "[roomnumber]"
	qdel(reservation)

/area/debug/secret/hilberts_storage
	name = "\improper Hilbert's Hotel Storage Room"
	icon_state = "hilberts_storage"
