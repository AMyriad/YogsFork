/mob/living/simple_animal/carpfolk_fish
	name = "Fish Placeholder"
	desc = "Examine Placeholder"
	icon = 'icons/mob/carp.dmi'
	icon_state = "base"
	icon_living = "base"
	icon_dead = "base_dead"
	icon_gib = "carp_gib"
	health_doll_icon = "megacarp"
  pass_flags = PASSTABLE | PASSMOB // Slippery bastards
	mob_biotypes = MOB_ORGANIC | MOB_AQUATIC | MOB_BEAST
	butcher_results = list(/obj/item/reagent_containers/food/snacks/carpmeat = 2)
	response_help = "pets"  // Caress the fish
  response_grab = "grips" // OBTAIN the fish
	speed = 0
	maxHealth = 100 // If a brain has 100 health why shouldn't the fish?
	health = 100

	melee_damage_lower = 4
	melee_damage_upper = 7
	attack_vis_effect = ATTACK_EFFECT_BITE
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("blubs")


	faction = list("station","carp")


/mob/living/simple_animal/carpfolk_fish/Initialize(mapload)
	. = ..()
	update_icons()
