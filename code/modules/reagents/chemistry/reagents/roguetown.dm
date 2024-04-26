/datum/reagent/miasmagas
	name = "miasmagas"
	description = "."
	color = "#801E28" // rgb: 128, 30, 40
	taste_description = "ugly"
	metabolization_rate = 1

/datum/reagent/miasmagas/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, RTRAIT_NOSTINK))
		M.add_nausea(15)
		M.add_stress(/datum/stressevent/miasmagas)
	. = ..()

/datum/reagent/toxin/sickness
	name = "Rot of Flesh"
	description = "Magically induced plauge, if you are reading this ingame contact a dev"
	silent_toxin = TRUE
	reagent_state = LIQUID
	color = "#FA6464"
	metabolization_rate = 0.1
	overdose_threshold = 30
	toxpwr = 0

/datum/reagent/toxin/sickness/on_mob_life(mob/living/carbon/M)
	if(prob(70))
		switch(pick(1, 2, 3))
			if(1)
				to_chat(M, "<span class='danger'>My eyes ache with</span>")
				M.blur_eyes(3)
			if(2)
				M.emote("cough")
			if(3)
				to_chat(M, "<span class='danger'>Rotten skin falls off my body</span>")
				M.adjustBruteLoss(2)
			
	..()
