#define BIOSIGNAL_STRING_NUKIE "strings/biosignal/nukie.txt"

/obj/item/implant/biosignaller/gorlex
	name = "gorlex marauder biosignaller implant"
	desc = "Monitors host vital signs and transmits an encrypted radio message upon death."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio

/obj/item/implant/biosignaller/gorlex/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new /obj/item/encryptionkey/syndicate //Should broadcast exclusively on the syndicate channel.
	radio.listening = FALSE
	radio.recalculateChannels()

var/list/gorlex_biosignal = world.file2list(BIOSIGNAL_STRING_NUKIE) //A message from command to encourage the surviving team members.

/obj/item/implant/biosignaller/gorlex/activate(cause)
	if(!imp_in)
		return FALSE

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = "OPERATIVE NOTICE: AGENT [mobname] TERMI//N&#@$¤#§>..." // Default message for unexpected causes.
	if(cause == "death")
			message = "OPERATIVE NOTICE: AGENT [mobname] MICROEXPLOSIVE DETONATED IN [turf.name]. [gorlex_biosignal]" 

  
	name = "[mobname]'s Biosignaller"
	radio.talk_into(src, message, RADIO_CHANNEL_SYNDICATE)
	qdel(src) //Deleted after use, wouldn't want to leave anything behind

/obj/item/implant/biosignaller/gorlex/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed") // Will use default message.
	else
		activate("death")

/obj/item/implant/biosignaller/gorlex/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Gorlex Marauder Biosignaller Implant<BR>
		<b>Life:</b>Until death<BR>
		<b>Important Notes:</b>Broadcasts a message to other operatives over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
    <b>Function:</b>Contains a miniature radio connected to a bioscanner encased in an EMP-resistant shell. Broadcasts the death and last known position of the user over an encrypted radio channel.<BR>"}

/obj/item/implanter/biosignaller/gorlex
	imp_type = /obj/item/implant/biosignaller/gorlex
