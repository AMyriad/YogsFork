//MedBay

/area/station/medical
	name = "Medical Areas"
	icon_state = "medbay3"
	minimap_color = "#45bbdf"
	airlock_wires = /datum/wires/airlock/medbay

	ambience_index = AMBIENCE_MEDICAL
	sound_environment = SOUND_AREA_STANDARD_STATION

	lighting_colour_tube = "#e7f8ff"
	lighting_colour_bulb = "#d5f2ff"

/area/station/medical/main
	name = "\improper Medbay Central Hall"
	icon_state = "medbay"

/area/station/medical/main/upper
	name = "\improper Medbay Upper Central Hall"
	icon_state = "medbay"

/area/station/medical/main/lower
	name = "\improper Medbay Lower Central Hall"
	icon_state = "medbay"

/area/station/medical/lobby
	name = "\improper Medbay Lobby"
	icon_state = "medbay"

/area/station/medical/aft
	name = "\improper Medbay Aft Hall"
	icon_state = "medbay3"

/area/station/medical/treatment_center
	name = "\improper Medbay Treatment Center"
	icon_state = "exam_room"

/area/station/medical/storage
	name = "\improper Medbay Storage"
	icon_state = "medbay2"

/area/station/medical/storage/break_room
	name = "\improper Medbay Break Room"
	icon_state = "medbay2"

/area/station/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/medical/surgery
	name = "\improper Surgery"
	icon_state = "surgery"

/area/station/medical/paramedic
	name = "\improper Paramedic Staging Area"
	icon_state = "emergencystorage"

/area/station/medical/psychiatrist
	name = "\improper Psychiatrist's Office"
	icon_state = "exam_room"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR


//- Genetics -//

/area/station/medical/genetics
	name = "Genetics Areas"
	icon_state = "genetics"
	minimap_color = "#006384"

/area/station/medical/genetics/lab
	name = "\improper Genetics Lab"
	icon_state = "genetics"

/area/station/medical/genetics/cloning
	name = "\improper Cloning Lab"
	icon_state = "cloning"


//- Chemistry -//

/area/station/medical/chemistry
	name = "Chemistry Areas"
	icon_state = "chem"
	minimap_color = "#f5a801"

/area/station/medical/chemistry/lab
	name = "\improper Chemistry Lab"
	icon_state = "chem"

/area/station/medical/chemistry/lab/upper
	name = "\improper Upper Chemistry Lab"
	icon_state = "chem"

/area/station/medical/chemistry/lab/lower
	name = "\improper Lower Chemistry Lab"
	icon_state = "chem"


//- Virology -//

/area/station/medical/virology
	name = "Virology Areas"
	icon_state = "virology"
	minimap_color = "#01f5b3"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	flags_1 = NONE

/area/station/medical/virology/lab
	name = "\improper Virology Lab"
	icon_state = "virology"


//- Patient Recovery Wards -//

/area/station/medical/recovery
	name = "Recovery Ward Areas"
	icon_state = "patients"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/medical/recovery/room_a
	name = "Recovery Ward A"
	icon_state = "patients"

/area/station/medical/recovery/room_b
	name = "Recovery Ward B"
	icon_state = "patients"

/area/station/medical/recovery/room_c
	name = "Recovery Ward C"
	icon_state = "patients"
