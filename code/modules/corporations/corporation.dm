GLOBAL_LIST_EMPTY(corporations)

/datum/corporation
	/// Name of the corporation 
	var/name = "The Company"
	/// The name of this faction when shown to the player as their employer.
	var/employer_name = "The Shadow Council"
	/// A short description of this faction, OOC
	var/description = "A highly-secretive organization only rumored to exist.\n\ Quickly, <i>report</i> you saw this to someone before the Shadow Council assassins can silence you!"
	/// The define tied to this faction
	var/key
	/// If this faction has access to codewords
	var/give_codewords = FALSE
	/// variable that controls the backstory themes
	var/faction_theme = PDA_THEME_NTOS
	/// List of all the employees' minds
	var/list/datum/mind/employees = list()
	/// How much are employees paid per round of paydays as a modifier of their nanotrasen wage (nanotrasen is exempt, since that's integrated with budgets already)
	var/paymodifier = 1
	/// Whether we should instantiate it or not (only used on subtypes that are parents, like [/datum/corporation/traitor])
	var/instantiate = TRUE

/datum/corporation/New() // If we don't instantiate, add this corp onto whatever we have already
	if(!instantiate)
		return
	GLOB.corporations += src
	return ..()


/datum/corporation/sol_interplanetary_coalition
	name = "Sol Interplanetary Coalition"
	employer_name = "Central Command"
	description = "The C"
	key = FACTION_SIC
	//faction_theme = THEME_DEFAULT
	paymodifier = 0 // SIC's paying is handled by payday itself

/datum/corporation/independent
	name = "Independent"
	employer_name = "You"
	description = "Not for the faint of heart, working independently means you're on your own. \n\
	You won't have the benefits of allies or discounted items, so be sure you're ready - because your enemies sure as hell will be. \n\
	Your cause is above any company's - to you, this is personal."
	key = FACTION_INDEPENDENT
	//faction_theme = THEME_DEFAULT
	paymodifier = 0 // What are you going to do, pay yourself?

/datum/corporation/ambercove
	name = "Ambercove S&R"
	employer_name = ""
	description = ""
	key = FACTION_AMBERCOVE
	//faction_theme = THEME_AMBERCOVE // Blue and black
	paymodifier = 1.5

/datum/corporation/asp_foundation
	name = "The Asp Foundation"
	employer_name = ""
	description = ""
	key = FACTION_ASP_FOUNDATION
	//faction_theme = THEME_ASP_FOUNDATION // Cyan
	paymodifier = 1.5

/datum/corporation/azimuth
	name = "Azimuth LLC"
	employer_name = ""
	description = "Originally a computer and electronics firm, the VR tech giant has now sent you to the notorious Space Station 13 for your latest assignment."
	key = FACTION_AZIMUTH
	//faction_theme = THEME_AZIMUTH // Yellow, blue, and red
	paymodifier = 1.5

/datum/corporation/carthage_industries
	name = "Carthage Industries"
	employer_name = ""
	description = ""
	key = FACTION_CARTHAGE
	//faction_theme = THEME_CARTHAGE // Orange and purple
	paymodifier = 1.5

/datum/corporation/donk
	name = "Donk Co."
	employer_name = ""
	description = ""
	key = FACTION_DONK
	//faction_theme = THEME_DONK // Yellow, orange, and blue
	paymodifier = 1.2

/datum/corporation/golem_automatics
	name = "Golem Automatics"
	employer_name = ""
	description = ""
	key = FACTION_GOLEM
	//faction_theme = THEME_GOLEM // Grey, yellow, and blue
	paymodifier = 1.5

/datum/corporation/gorlex_marauders
	name = "Gorlex Marauders"
	employer_name = "Delta Command"
	description = ""
	key = FACTION_GORLEX
	//faction_theme = THEME_GORLEX // Red and green
	paymodifier = 1.5

/datum/corporation/haimatsu_technologies
	name = "Haimatsu Technologies"
	employer_name = ""
	description = ""
	key = FACTION_HAIMATSU
	//faction_theme = THEME_HAIMATSU // Dark green and red
	paymodifier = 1.5

/datum/corporation/hephaestus_shipworks
	name = "Hephaestus Shipworks"
	employer_name = ""
	description = ""
	key = FACTION_HEPHAESTUS
	//faction_theme = THEME_HEPHAESTUS // Orange and black
	paymodifier = 1.5

/datum/corporation/konbina
	name = "Konbina Corporation"
	employer_name = ""
	description = ""
	key = FACTION_KONBINA
	//faction_theme = THEME_KONBINA // Red and white
	paymodifier = 1.5

/datum/corporation/licome_mercury
	name = "Licome & Mercury Ltd."
	employer_name = ""
	description = ""
	key = FACTION_LICOME_MERCURY
	//faction_theme = THEME_LICOME_MERCURY // Red and black
	paymodifier = 1.5

/datum/corporation/nanotrasen
	name = "Nanotrasen"
	employer_name = "Operations Command"
	description = ""
	key = FACTION_NANOTRASEN
	//faction_theme = THEME_NANOTRASEN // Dark blue and white
	paymodifier = 2 // Small but very well paid

/datum/corporation/stalverket
	name = "Stålverket AS"
	employer_name = ""
	description = ""
	key = FACTION_STALVERKET
	//faction_theme = THEME_STALVERKET // Gold and yellow
	paymodifier = 1.5

/datum/corporation/transit_alliance
	name = "Transit Alliance"
	employer_name = ""
	description = "For the people, by the kings. This was not the deal, and you've been sent here to remind them of that."
	key = FACTION_TRANSIT_ALLIANCE
	//faction_theme = THEME_TRANSIT_ALLIANCE // Brown and yellow
	paymodifier = 1.5

/datum/corporation/vodykov
	name = "Vodykov Inc."
	employer_name = ""
	description = ""
	key = FACTION_VODYKOV
	//faction_theme = THEME_VODYKOV // Silver
	paymodifier = 1.5
