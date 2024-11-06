/area/station/medical
	name = "MEDICAL AREAS"
	icon_state = "med"
	minimap_color = "#45bbdf"
	airlock_wires = /datum/wires/airlock/medbay

	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION

	lighting_colour_tube = "#e7f8ff"
	lighting_colour_bulb = "#d5f2ff"


/area/station/medical/main
	name = "\improper Medbay Central Hall"
	icon_state = "med_main"

/area/station/medical/main/upper
	name = "\improper Medbay Upper Central Hall"
	icon_state = "med_main_up"

/area/station/medical/main/lower
	name = "\improper Medbay Lower Central Hall"
	icon_state = "med_main_low"

/area/station/medical/lobby
	name = "\improper Medbay Lobby"
	icon_state = "med_lobby"

/area/station/medical/aft
	name = "\improper Medbay Aft Hall"
	icon_state = "med_aft"

/area/station/medical/treatment_center
	name = "\improper Medbay Treatment Center"
	icon_state = "med_treatment"

/area/station/medical/storage
	name = "\improper Medbay Storage"
	icon_state = "med_storage"

/area/station/medical/storage/breakroom
	name = "\improper Medbay Break Room"
	icon_state = "med_breakroom"

/area/station/medical/morgue
	name = "\improper Morgue"
	icon_state = "med_morgue"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/medical/surgery
	name = "\improper Surgery"
	icon_state = "med_surgery"

/area/station/medical/paramedic
	name = "\improper Paramedic Staging Area"
	icon_state = "med_paramedic"

/area/station/medical/psych
	name = "\improper Psychiatrist's Office"
	icon_state = "med_psych"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR


//-- Patient Recovery Wards --//

/area/station/medical/recovery
	name = "RECOVERY WARD AREAS"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/medical/recovery/ward_a
	name = "Recovery Ward A"
	icon_state = "med_ward_a"

/area/station/medical/recovery/ward_b
	name = "Recovery Ward B"
	icon_state = "med_ward_b"

/area/station/medical/recovery/ward_c
	name = "Recovery Ward C"
	icon_state = "med_ward_c"


//-- Genetics --//

/area/station/medical/genetics
	name = "GENETICS AREAS"
	icon_state = "med_gene"
	minimap_color = "#006384"

/area/station/medical/genetics/lab
	name = "\improper Genetics Lab"
	icon_state = "med_gene_lab"

/area/station/medical/genetics/cloning
	name = "\improper Cloning Lab"
	icon_state = "med_gene_cloning"


//-- Chemistry --//

/area/station/medical/chemistry
	name = "CHEMISTRY AREAS"
	minimap_color = "#f5a801"

/area/station/medical/chemistry/lab
	name = "\improper Chemistry Lab"
	icon_state = "med_chem_lab"

/area/station/medical/chemistry/lab/upper
	name = "\improper Upper Chemistry Lab"
	icon_state = "med_chem_lab_up"

/area/station/medical/chemistry/lab/lower
	name = "\improper Lower Chemistry Lab"
	icon_state = "med_chem_lab_low"


//-- Virology --//

/area/station/medical/virology
	name = "VIROLOGY AREAS"
	icon_state = "med_viro"
	minimap_color = "#01f5b3"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	flags_1 = NONE

/area/station/medical/virology/lab
	name = "\improper Virology Lab"
	icon_state = "virology"
