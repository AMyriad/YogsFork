///// ---- YOG SORT TYPES ---- /////
/* These are the defines that disposal sorting segments (/disposalpipe/sorting/mail) use to sort packages.
	For consistency's sake, please keep these arranged in the order: Command > Security > Engineering > Medical > Supply > Science > Service/General
	Please try tomake the strings for any new sort types as close to the name of the define as possible
	Defines are used in flavor_misc.dm - with helpers used for mapping in mail_sort_helpers.dm
*/


/// The default sortType. Meant for garbage, untagged, or other unsorted things. Never use this anywhere. Parcels will also never get this. 
#define SORT_TYPE_WASTE "waste"
/// The default sortType for untagged parcels. Given to parcels - and only parcels - so they return to Delivery instead of going straight to recycling.
#define SORT_TYPE_UNSORTED "unsorted"

//---  COMMAND  ---//

/// Leads to the Conference Room in the Bridge, or its equivalent in a map.
#define SORT_TYPE_BRIDGE "bridge"
/// Leads to the Captain's Office.
#define SORT_TYPE_CAPTAIN "captain"


//---  SECURITY  ---//

/// Leads to the Security Office, where Security Office-rs work from.
#define SORT_TYPE_SECURITY "security"
/// Leads to the Warden's Office.
#define SORT_TYPE_WARDEN "warden"
/// Leads to the Detective's Office.
#define SORT_TYPE_DETECTIVE "detective"
/// Leads to the Head of Security's office.
#define SORT_TYPE_HOS "hos"


//---  ENGINEERING  ---//

/// Leads to the Engineering Foyer, where Engineers work from.
#define SORT_TYPE_ENGINEERING "engineering"
/// Leads to the Atmospherics, where Atmospheric technicians work from.
#define SORT_TYPE_ATMOSPHERICS "atmospherics"
/// Leads to Telecommunications, where Network Admin works from.
#define SORT_TYPE_TELECOMMS "telecomms"
/// Leads to the Chief Engineer's office.
#define SORT_TYPE_CE "ce"


//---  MEDICAL  ---//

/// Leads to the Medbay or Medbay Storage room, where Medical Doctors work from.
#define SORT_TYPE_MEDICAL "medical"
/// Leads to the Chemistry Lab, where Chemists work from.
#define SORT_TYPE_CHEMISTRY "chemistry"
/// Leads to the Virology Lab, where the Virologist works from.
#define SORT_TYPE_VIROLOGY "virology"
/// Leads to the Chief Medical Officer's office.
#define SORT_TYPE_CMO "cmo"


//---  SUPPLY  ---//

/// Leads to the Cargo Office, hey that's where we are!
#define SORT_TYPE_CARGO "cargo"

/// Leads to the Quartermaster's office.
#define SORT_TYPE_QM "qm"


//---  SCIENCE  ---//

/// Leads to Research and Development, where Scientists research tech and print equipment.
#define SORT_TYPE_SCIENCE "science"
/// Leads to the Toxins Lab, where Scientists work from.
#define SORT_TYPE_TOXINS "toxins"
/// Leads to the Experimentation Lab, where Scientists work from.
#define SORT_TYPE_EXPERIMENTATION "experimentation"
/// Leads to the Genetics Lab, where Geneticists work from.
#define SORT_TYPE_GENETICS "genetics"
/// Leads to Robotics, where Roboticists work from.
#define SORT_TYPE_ROBOTICS "robotics"
/// Leads to the Xenobiology Lab, where Scientists work from.
#define SORT_TYPE_XENOBIOLOGY "xenobiology"
/// Leads to the Research Director's office.
#define SORT_TYPE_RD "rd"


//---  SERVICE/GENERAL  ---//

/// Leads to the Dormitories, a public space the crew often visits.
#define SORT_TYPE_DORMS "dorms"
/// Leads to the Theatre, where Clown and Mime prank from.
#define SORT_TYPE_THEATRE "theatre"
/// Leads to the Library, where Curator works from.
#define SORT_TYPE_LIBRARY "library"
/// Leads to the Bar, where the Bartender works from.
#define SORT_TYPE_BAR "bar"
/// Leads to the Kitchen, where Chefs work from.
#define SORT_TYPE_KITCHEN "kitchen"
/// Leads to Hydroponics, where Botanists work from.
#define SORT_TYPE_HYDROPONICS "hydroponics"
/// Leads to the Law Office, where Lawyers work from.
#define SORT_TYPE_LAWYER "lawyer"
/// Leads to the Janitor's Closet, where Janitors works from.
#define SORT_TYPE_JANITOR "janitor"
/// Leads to the Head of Personnel's office in the Bridge.
#define SORT_TYPE_HOP "hop"
