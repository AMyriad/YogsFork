/area/station/engineering
	name = "ENGINEERING AREAS"
	icon_state = "eng"
	minimap_color = "#f7de02"
	airlock_wires = /datum/wires/airlock/engineering

	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

	lighting_colour_tube = "#ffce93"
	lighting_colour_bulb = "#ffbc6f"


/area/station/engineering/main
	name = "\improper Engineering Bay"
	icon_state = "eng_main"

/area/station/engineering/main/upper
	name = "\improper Upper Engineering Bay"
	icon_state = "eng_main_up"

/area/station/engineering/main/lower
	name = "\improper Lower Engineering Bay"
	icon_state = "eng_main_low"

/area/station/engineering/foyer
	name = "\improper Engineering Foyer"
	icon_state = "eng_foyer"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/engineering/production_bay
	name = "\improper Engineering Production Bay"
	icon_state = "eng_production"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/engineering/smes
	name = "\improper Engineering SMES Chamber"
	icon_state = "eng_smes"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/gravity_generator
	name = "\improper Gravity Generator"
	icon_state = "eng_gravity_gen"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "The gravitons generated here could throw off your warp's destination and possibly throw you into deep space."

/area/station/engineering/supermatter
	name = "\improper Supermatter Engine"
	icon_state = "eng_sm"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/tech_storage
	name = "\improper Tech Storage"
	icon_state = "eng_tech_storage"

/area/station/engineering/construction
	name = "\improper Construction Area"
	icon_state = "eng_construction"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/engineering/aux_base
	name = "\improper Auxiliary Base Construction"
	icon_state = "eng_aux_base"


//-- Atmospherics --//

/area/station/engineering/atmospherics
	name = "ATMOSPHERICS AREAS"
	icon_state = "eng_atmos"
	minimap_color = "#207df7"

/area/station/engineering/atmospherics/foyer
	name = "\improper Atmospherics Foyer"
	icon_state = "eng_atmos_foyer"

/area/station/engineering/atmospherics/equipment
	name = "\improper Atmospherics Equipment Storage"
	icon_state = "eng_atmos_equip"

/area/station/engineering/atmospherics/mixing
	name = "\improper Atmospherics Mixing Room"
	icon_state = "eng_atmos_mixing"

/area/station/engineering/atmospherics/distro
	name = "\improper Atmospherics Distribution"
	icon_state = "eng_atmos_distro"

/area/station/engineering/atmospherics/incinerator
	name = "\improper Incinerator"
	icon_state = "eng_atmos_incin"

// For when HFR/atmos engine is in a separate area than the incinerator
/area/station/engineering/atmospherics/engine
	name = "\improper Atmospherics Engine Room"
	icon_state = "eng_atmos_engine"


//-- Telecomms --//

/area/station/engineering/telecomms
	name = "TELECOMMS AREAS"
	icon_state = "eng_tcomms"
	minimap_color = "#00fff6"
	ambientsounds = list('sound/ambience/ambisin2.ogg',
						'sound/ambience/signal.ogg',
						'sound/ambience/signal.ogg',
						'sound/ambience/ambigen10.ogg',
						'sound/ambience/ambitech.ogg',
						'sound/ambience/ambitech2.ogg',
						'sound/ambience/ambitech3.ogg',
						'sound/ambience/ambimystery.ogg')
	clockwork_warp_allowed = FALSE
	clockwork_warp_fail = "For safety reasons, warping here is disallowed; the radio and bluespace noise could cause catastrophic results."

/area/station/engineering/telecomms/servers
	name = "\improper Telecomms Server Room"
	icon_state = "eng_tcomms_server"

/area/station/engineering/telecomms/control
	name = "\improper Telecomms Control Room"
	icon_state = "eng_tcomms_ctrl"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/engineering/telecomms/workshop
	name = "\improper Telecomms Hardware Workshop"
	icon_state = "eng_tcomms_work"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/engineering/telecomms/foyer
	name = "\improper Telecomms Foyer"
	icon_state = "eng_tcomms_foyer"
	sound_environment = SOUND_AREA_STANDARD_STATION
