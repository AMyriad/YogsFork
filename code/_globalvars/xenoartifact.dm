///Global names for science sellers
GLOBAL_LIST_INIT(xenoa_seller_names, world.file2list("strings/names/artifact_seller.txt"))
GLOBAL_LIST_INIT(xenoa_seller_dialogue, world.file2list("strings/artifact_dialogue.txt"))
GLOBAL_LIST_INIT(xenoa_artifact_names, world.file2list("strings/names/artifact_sentience.txt"))

///Trait types, referenced for generation
GLOBAL_LIST(xenoa_activators)
GLOBAL_LIST(xenoa_minors)
GLOBAL_LIST(xenoa_majors)
GLOBAL_LIST(xenoa_malfs)
GLOBAL_LIST(xenoa_all_traits)

///List of emotes for emote-trait
GLOBAL_LIST_INIT(xenoa_emote, list(/datum/emote/flip, /datum/emote/spin, /datum/emote/living/laugh, 
	/datum/emote/living/scream, /datum/emote/living/tremble, /datum/emote/living/trip,
	/datum/emote/living/smile, /datum/emote/living/pout, /datum/emote/living/gag,
	/datum/emote/living/deathgasp, /datum/emote/living/dance, /datum/emote/living/blush,
	/datum/emote/living/sniff, /datum/emote/living/cough, /datum/emote/living/sneeze, //lol, lmao even
	/datum/emote/living/twitch))


///Blacklist for traits
GLOBAL_LIST(xenoa_bluespace_blacklist)
GLOBAL_LIST(xenoa_plasma_blacklist)
GLOBAL_LIST(xenoa_uranium_blacklist)

///List of emotes for emote-trait
GLOBAL_LIST_INIT(xenoa_emote, list(/datum/emote/flip, /datum/emote/spin, /datum/emote/living/laugh, 
	/datum/emote/living/scream, /datum/emote/living/tremble, /datum/emote/living/whimper,
	/datum/emote/living/smile, /datum/emote/living/pout, /datum/emote/living/gag,
	/datum/emote/living/deathgasp, /datum/emote/living/dance, /datum/emote/living/blush))

///Fill globals
/proc/generate_xenoa_statics()
	GLOB.xenoa_seller_names -= ""
	GLOB.xenoa_seller_dialogue -= ""
	GLOB.xenoa_artifact_names -= ""

	GLOB.xenoa_activators = compile_artifact_weights(/datum/xenoartifact_trait/activator)
	GLOB.xenoa_minors = compile_artifact_weights(/datum/xenoartifact_trait/minor)
	GLOB.xenoa_majors = compile_artifact_weights(/datum/xenoartifact_trait/major)
	GLOB.xenoa_malfs = compile_artifact_weights(/datum/xenoartifact_trait/malfunction)
	GLOB.xenoa_all_traits = compile_artifact_weights(/datum/xenoartifact_trait)

	GLOB.xenoa_bluespace_blacklist = compile_artifact_blacklist(BLUESPACE_TRAIT)
	GLOB.xenoa_plasma_blacklist = compile_artifact_blacklist(PLASMA_TRAIT)
	GLOB.xenoa_uranium_blacklist = compile_artifact_blacklist(URANIUM_TRAIT)
