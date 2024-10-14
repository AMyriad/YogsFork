/obj/item/implant/biosignaller
	name = "[variant] biosignaller implant"
	desc = "Monitors host vitals and transmits an encrypted radio message upon death."
	actions_types = null
	verb_say = "broadcasts"

	/// The "ID" of each individual subtype, determines the implant's name and message text
	var/variant
	/// The little men with a little radio inside this thing
	var/obj/item/radio/radio
	/// The tiny encryption key the little men stole
	var/list/encryption_key
	/// The radio channel define we'll be yelling into
	var/radio_channel
	/// Tracks how many comrades are still left alive
	var/team_remaining = 0


/obj/item/implant/biosignaller/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = radio_channel
	radio.listening = FALSE
	radio.recalculateChannels()
	GLOB.team_remaining += 1

/obj/item/implant/biosignaller/Destroy()
	GLOB.team_remaining -= 1
    return ..()

/obj/item/implant/biosignaller/activate(cause)
	if(!imp_in)
		return FALSE

	/// Implant user's location
	var/area/area = get_area(imp_in)
	/// Name of the implant user
	var/username = imp_in.name
	/// What is to be said
	var/message // Default message for unexpected causes
	if(cause == "death")
		message = 

	var/shout_text

	var/default_shout = ""
	var/lastone_shout = ""
	var/alldead_shout = ""

	switch(team_remaining)
		if(3 to INFINITY)
			shout_text = default_shout
		if(2)
			shout_text = lastone_shout
		if(-INFINITY to 1)
			shout_text = alldead_shout

	switch(variant)
		if("ERT")
			default_shout = "Proceed with caution."
			lastone_shout = "One unit remaining, finish the mission."
			alldead_shout = "All emergency response teams KIA. Recording Transmitting final readings to local blackbox..."
			message = "ALERT: [username] vitals lost in [area.name]! [shout_text]"

		if("gorlex")
			default_shout = pick(
				"UPHOLD THE MISSION.",
				"CONTINUE YOUR MISSION.",
				"FAILURE IS NOT AN OPTION.",
				"SUCCEED OR DIE TRYING.",
				"LEARN FROM THAT MISTAKE.",
				"COME BACK SUCCESSFUL OR COME BACK IN PIECES.",
				"DO NOT LOSE SIGHT OF THE OBJECTIVE.",
				"DEFEAT DOES NOT GUARANTEE YOUR FAMILY'S SAFETY.",
				"SEE TO IT THAT THE DEED IS DONE.",
				"NO TIME TO MOURN. KEEP AT IT.",
				"LET NO SACRIFICE BE IN VAIN.",
				"THEY WILL NOT HOLD BACK. SHOW THEM NO MERCY.",
				"DO NOT HESITATE. RIP AND TEAR UNTIL IT IS DONE.",
				"THERE IS NO ROOM FOR ERROR. FINISH THE JOB.",
				"THAT'S ONE LESS SHARE OF THE PAY.",
				"GO HARD OR GO HOME DEAD.",
				"GET DAT FUKKEN DISK."
				)
			lastone_shout = pick(
				"YOU'RE THE LAST ONE. COMPLETE THE MISSION.",
				"ONE OPERATIVE REMAINS. IT'S ALL ON YOU.",
				"YOU'RE THE LAST ONE STANDING. DO WHAT MUST BE DONE.",
				"ALL YOUR FRIENDS ARE DEAD. GOOD LUCK.",
				"YOU'RE ALL THAT'S LEFT. DELIVER THE PAYLOAD AT ALL COSTS."
				)
			alldead_shout = pick(
				"ALL OPERATIVES KILLED IN ACTION. SHUNTING DATA TO PRIVATE NETWORK...",
				"ALL VITAL SIGNS LOST. SHUNTING FINAL READINGS TO PRIVATE NETWORK...",
				"LAST BIOSIGNATURE HAS EXPIRED. SHUNTING ASSESSMENT TO PRIVATE NETWORK..."
			)	
			message = "NOTICE: OPERATIVE [uppertext(username)] EXPLOSIVE IMPLANT TRIGGERED IN [uppertext(area.name)]. [shout_text]"


	name = "\improper Biosignaller Implant"
	radio.talk_into(src, message, [radio_channel])
	qdel(src) // Implodes after use

/obj/item/implant/biosignaller/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed") // Will use default message
	else
		activate("death")


	//- ERT VARIANT -//
/obj/item/implant/biosignaller/ert
	variant = "ERT"
	encryption_key = new/obj/item/encryptionkey/headset_cent
	radio_channel = RADIO_CHANNEL_CENTCOM

/obj/item/implant/biosignaller/ert/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>ERT Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to other squad members over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a blue, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosignaller/ert
	imp_type = /obj/item/implant/biosignaller/ert

	//- GORLEX MARAUDER VARIANT -//
/obj/item/implant/biosignaller/gorlex
	variant = "gorlex"
	encryption_key = new/obj/item/encryptionkey/syndicate
	radio_channel = RADIO_CHANNEL_SYNDICATE

/obj/item/implant/biosignaller/gorlex/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Gorlex Marauder Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to other operatives over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a black, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosignaller/gorlex
	imp_type = /obj/item/implant/biosignaller/gorlex
