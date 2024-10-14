//Science

/area/station/science
	name = "Science Areas"
	icon_state = "toxlab"
	minimap_color = "#75009b"
	airlock_wires = /datum/wires/airlock/science

	sound_environment = SOUND_AREA_STANDARD_STATION

	lighting_colour_tube = "#f0fbff"
	lighting_colour_bulb = "#e4f7ff"

/area/station/science/main
	name = "\improper Science Hall"
	icon_state = "toxlab"

/area/station/science/main/upper
	name = "\improper Upper Science Hall"
	icon_state = "toxlab"

/area/station/science/main/lower
	name = "\improper Lower Science Hall"
	icon_state = "toxlab"

/area/station/science/research
	name = "\improper Research and Development Lab"
	icon_state = "toxlab"

/area/station/science/toxins
	name = "\improper Toxins Lab"
	icon_state = "toxmix"

/area/station/science/toxins/mix_chamber
	name = "\improper Toxins Mixing Chamber"
	icon_state = "toxmix"
	valid_territory = FALSE

/area/station/science/toxins/storage
	name = "\improper Toxins Storage"
	icon_state = "toxstorage"

/area/station/science/toxins/testing_site
	name = "\improper Toxins Testing Site"
	icon_state = "toxtest"
	valid_territory = FALSE	
	lights_always_start_on = TRUE

/area/station/science/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "toxlab"

/area/station/science/experimentation
	name = "\improper Experimentation Lab"
	icon_state = "toxmisc"

/area/station/science/nanite
	name = "\improper Nanite Lab"
	icon_state = "toxmisc"

/area/station/science/auxiliary
	name = "\improper Auxiliary Testing Lab"
	icon_state = "toxmisc"

/area/station/science/server
	name = "\improper R&D Server Room"
	icon_state = "server"


// Robotics

/area/station/science/robotics
	name = "Robotics Areas"
	icon_state = "medresearch"

/area/station/science/robotics/lab
	name = "\improper Robotics Lab"
	icon_state = "mechbay"

/area/station/science/robotics/mech_bay
	name = "\improper Mech Bay"
	icon_state = "mechbay"
