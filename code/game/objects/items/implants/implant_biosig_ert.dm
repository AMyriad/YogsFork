/obj/item/implant/biosig_ert
	name = "ERT biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio
	var/ert_msg = "Dispatch notified, proceed with caution."
	var/team_remaining = 0

/obj/item/implant/biosig_ert/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new/obj/item/encryptionkey/headset_cent // Should broadcast exclusively on the centcom channel.
	radio.listening = FALSE
	radio.recalculateChannels()
	GLOB.ert_biosigs += (src, team_remaining)

/obj/item/implant/biosig_ert/Destroy()
	. = ..()
	GLOB.ert_biosigs -= (src, team_remaining)

/obj/item/implant/biosig_ert/activate(cause)
	if(!imp_in)
		return FALSE

	switch(team_remaining)
		if(3)
			ert_msg = "Two units remaining, proceed with caution."
		if(2)
			ert_msg = "One unit remaining. You're the last one, proceed with extreme caution."
		if(1)
			ert_msg = "All response teams KIA, transmitting final readings to data network..."

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = "TEAM ALERT: [mobname]'s lifesig//N&#@$¤#§>..." // Default message for unexpected causes.
	if(cause == "death")
		message = "TEAM ALERT: [mobname]'s lifesigns stopped in [turf.name]! [ert_msg]"

	name = "Biosignaller Implant"
	radio.talk_into(src, message, RADIO_CHANNEL_CENTCOM)
	qdel(src) //remove this before PRing

/obj/item/implant/biosig_ert/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed") // Will use default message.
	else
		activate("death")

/obj/item/implant/biosig_ert/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>ERT Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to other squad members over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a blue, EMP-resistant shell. \
					Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosig_ert // Testing/admin purposes; shouldn't be obtainable.
	imp_type = /obj/item/implant/biosig_ert
