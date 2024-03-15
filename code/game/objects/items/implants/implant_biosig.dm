/// BIOSIGNALLERS
/// Used for team-based antags, letting them know when their comrades are KIA
/obj/item/implant/biosig
	name = "broken biosignaller implant"
	desc = "As the name implies, this one doesn't do much."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio
	var/team_remaining = 0

/obj/item/implant/biosig/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.listening = FALSE
	radio.recalculateChannels()
	team_remaining += 1

/obj/item/implant/biosig/activate(cause)
	if(!imp_in)
		return FALSE

	// A message from command for the surviving team members. Changes depending on how many remain.
	var/default_endmessage = ""
	var/lastman_endmessage = ""
	var/alldead_endmessage = ""
	var/endmsg = ""

	// Less than two people? (1) Last man standing. Less than one people? (0) Failure message.
		if(team_remaining >= 3)
			endmsg = default_endmessage
		else if(team_remaining >= 2)
			endmsg = lastman_endmessage
		else
			endmsg = alldead_endmessage

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = ""

	//Biosignaller Implant broadcasts, ""
	name = "Biosignaller Implant"

/obj/item/implant/biosig/on_mob_death(mob/living/L, gibbed)
	team_remaining -= 1
	if(gibbed)
		activate("gibbed") // Will use default message.
	else
		activate("death")


/// ERT BIOSIGNALLER ///
/obj/item/implant/biosig/ert
	name = "cerulean biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."

/obj/item/implant/biosig/ert/Initialize(mapload)
	radio.keyslot = new/obj/item/encryptionkey/headset_cent // Should broadcast exclusively on the centcom channel.

/obj/item/implant/biosig/ert/activate(cause)

	default_endmessage = "Dispatch notified, proceed with caution."
	lastman_endmessage = "One unit remaining. You're the last one, proceed with extreme caution."
	alldead_endmessage = "All emergency response teams KIA. Transmitting final readings to local blackbox..."

	message = "TEAM ALERT: [mobname]'s lifesig//N&#@$¤#§>..." // Default message for unexpected causes.
	if(cause == "death")
		message = "TEAM ALERT: [mobname]'s lifesigns lost in [turf.name]! [endmsg]"

	radio.talk_into(src, message, RADIO_CHANNEL_CENTCOM) // We (src) say a thing (message) into this radio (RADIO_CHANNEL_)

/obj/item/implant/biosig/ert/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>ERT Biosignaller Implant<BR>
		<b>Life:</b>Activates upon death<BR>
		<b>Important Notes:</b>Broadcasts a message to other squad members over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
		<b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a blue, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosig/ert // Testing/admin purposes; shouldn't be obtainable.
	imp_type = /obj/item/implant/biosig/ert


/// NUKE OP BIOSIGNALLER ///
/obj/item/implant/biosig/gorlex
	name = "crimson biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."

/obj/item/implant/biosig/gorlex/Initialize(mapload)
	radio.keyslot = new/obj/item/encryptionkey/syndicate // Should broadcast exclusively on the syndicate channel.

/obj/item/implant/biosig/gorlex/activate(cause)

	default_endmessage = pick(
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
		"GET DAT FUKKEN DISK.")

	lastman_endmessage = pick(
		"YOU'RE THE LAST ONE. COMPLETE THE MISSION.",
		"ONE OPERATIVE REMAINS. IT'S ALL ON YOU.",
		"YOU'RE THE LAST MAN STANDING. DO WHAT MUST BE DONE.",
		"YOU'RE ALL THAT'S LEFT. DELIVER THE PAYLOAD AT ALL COSTS.")

	alldead_endmessage = pick(
		"ALL OPERATIVES KILLED IN ACTION. SHUNTING [pick("DATA","ASSESSMENT","FINAL READINGS")] TO PRIVATE NETWORK...",
		"ALL VITAL SIGNS LOST. SHUNTING [pick("DATA","ASSESSMENT","FINAL READINGS")] TO PRIVATE NETWORK...",
		"LAST BIOSIGNATURE LOST. SHUNTING [pick("DATA","ASSESSMENT","FINAL READINGS")] TO PRIVATE NETWORK...")

	message = "OPERATIVE NOTICE: AGENT [uppertext(mobname)] EXPLO//N&#@$¤#§>..."
	if(cause == "death")
		message = "OPERATIVE NOTICE: AGENT [uppertext(mobname)] EXPLOSIVE IMPLANT TRIGGERED IN [uppertext(turf.name)]. [endmsg]"

	radio.talk_into(src, message, RADIO_CHANNEL_SYNDICATE)
	qdel(src) // Probably deleted when gibbing but just to be safe

/obj/item/implant/biosig/gorlex/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed")
	else
		activate("death")

/obj/item/implant/biosig/gorlex/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Gorlex Marauder Biosignaller Implant<BR>
		<b>Life:</b>Activates upon death<BR>
		<b>Important Notes:</b>Broadcasts a message to other operatives over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    	<b>Function:</b>Contains a miniature radio connected to a bioscanner encased in a black, EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosig/gorlex // Testing/admin purposes; shouldn't be obtainable.
	imp_type = /obj/item/implant/biosig/gorlex
