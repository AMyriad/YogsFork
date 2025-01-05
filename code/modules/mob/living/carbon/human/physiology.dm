//Stores several modifiers in a way that isn't cleared by changing species

/datum/physiology
	var/brute_mod = 1   	// % of brute damage taken from all sources
	var/burn_mod = 1    	// % of burn damage taken from all sources
	var/tox_mod = 1     	// % of toxin damage taken from all sources
	var/oxy_mod = 1     	// % of oxygen damage taken from all sources
	var/clone_mod = 1   	// % of clone damage taken from all sources
	var/stamina_mod = 1 	// % of stamina damage taken from all sources
	var/brain_mod = 1   	// % of brain damage taken from all sources

	var/pressure_mod = 1	// % of brute damage taken from low or high pressure (stacks with brute_mod)
	var/temp_mod = 1		// % of temperature change actually taken
	var/heat_mod = 1    	// % of burn damage taken from heat (stacks with burn_mod)
	var/cold_mod = 1    	// % of burn damage taken from cold (stacks with burn_mod)

	var/damage_resistance = 0 // %damage reduction from all sources

	var/siemens_coeff = 1 	// resistance to shocks
	var/emp_mod = 1			// resistance to EMPs

	var/stun_mod = 1      	// % stun modifier
	var/bleed_mod = 1     	// % bleeding modifier
	var/datum/armor/armor 	// internal armor datum

	var/hunger_mod = 1		//% of hunger rate taken per tick.

	var/do_after_speed = 1 //Speed mod for do_after. Lower is better. If temporarily adjusting, please only modify using *= and /=, so you don't interrupt other calculations.
	var/force_multiplier = 1 //multiplies how much damage is done with melee weapons

	var/punchdamagehigh_bonus = 0		//Increased maximum punch damage 
	var/punchdamagelow_bonus = 0		//Increased minimum punch damage
	var/punchstunchance_bonus = 0	//Increased stun threshhold on punches so we don't get knockdown hands

	var/crawl_speed = 0		// Movement speed modifier when crawling

/datum/physiology/New()
	armor = new
