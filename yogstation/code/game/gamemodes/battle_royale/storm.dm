/datum/weather/royale
	telegraph_message = null //don't clutter chat at the start
	weather_message = null
	protected_areas = list(/area/external/shuttle/station/arrival)
	area_type = /area
	weather_overlay = "ash_storm"
	telegraph_overlay = "light_ash"
	weather_color = "#aa69ff" //6527a7
	end_message = null
	telegraph_duration = 10 SECONDS //actually give them a brief moment to react
	end_duration = 1
	immunity_type = NONE
	telegraph_sound = 'yogstation/sound/effects/battleroyale/stormclosing.ogg'
	end_sound = 'yogstation/sound/effects/battleroyale/stormalert.ogg'
	weather_duration = INFINITY
	weather_duration_lower = INFINITY
	weather_duration_upper = INFINITY
	var/list/areasToWeather = list()//if you want a specific area targeted
	var/list/areaTypesToWeather = list()//if you want an entire area type targeted
	var/list/areaIgnore = list()//if you want areaTypesToWeather to ignore something specific, because mappers can't be consistent with that type of area the thing should be

/datum/weather/royale/weather_act(mob/living/L)
	L.adjustFireLoss(GLOB.stormdamage, TRUE, TRUE)

/datum/weather/royale/New()
	.=..()
	if(areaTypesToWeather.len)//so multiple entire area types can be used instead of relying on selecting specific areas
		for(var/A in areaTypesToWeather)
			var/list/areas = get_areas(A)
			for(var/B in areas)
				var/area/place = B
				if(areaIgnore.len && (place.type in areaIgnore))
					continue
				areasToWeather |= place.type

	if(areasToWeather.len)
		protected_areas = get_areas(/area)
		for(var/A in protected_areas)
			var/area/B = A
			if(B.type in areasToWeather)
				protected_areas -= B

// ROYALE WEATHER TYPES
/datum/weather/royale/start
	name = "royale start" //roundstart wave, just hits solars, toxins test area, space, and any shuttles
	areasToWeather = list(/area/station/science/toxins/testing_site)
	areaTypesToWeather = list(/area/station/external_power, /area/space, /area/asteroid, /area/external/mining/icemoon, /area/external/shuttle)
	areaIgnore = list(/area/external/shuttle/station/supply)//but not the supply shuttle just yet

/datum/weather/royale/maint
	name = "royale maint" //First wave, hits maintenance
	telegraph_message = span_narsiesmall("<i>The storm is closing, get away from maintenance!</i>")
	areaTypesToWeather = list(/area/station/maintenance, /area/debug/procedural_gen/maintenance)

/datum/weather/royale/security
	name = "royale security" //North wave, takes out security, EVA, and vault
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from security, EVA, and the vault!</i>")
	areasToWeather = list(/area/station/command/heads/hos)
	areaTypesToWeather = list(/area/station/security, /area/station/ai_monitored/general)
	areaIgnore = list(/area/station/security/post) //ignore all department security offices

/datum/weather/royale/science
	name = "royale science" //takes out science
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from science!</i>")
	areasToWeather = list(/area/station/command/heads/rd, /area/station/security/post/science)
	areaTypesToWeather = list(/area/station/science, /area/station/ai_monitored/ai)

/datum/weather/royale/engineering
	name = "royale engineering" //takes out engineering and storage areas (f.ex. aux tool storage)
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from engineering and storage!</i>")
	areasToWeather = list(/area/station/command/heads/ce, /area/station/security/post/engineering)
	areaTypesToWeather = list(/area/station/engineering, /area/station/public/storage)

/datum/weather/royale/service
	name = "royale service" //takes out service and fitness/locker/recreational areas
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from service and recreational areas!</i>")
	areasToWeather = list(/area/station/security/post/service, /area/station/security/post/arrivals, /area/station/security/post/departures)
	areaTypesToWeather = list(/area/station/service, /area/debug/holodeck, /area/station/public/misc)

/datum/weather/royale/medbay
	name = "royale medbay" //takes out medbay
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from medbay!</i>")
	areasToWeather = list(/area/station/command/heads/cmo, /area/station/security/post/medical)
	areaTypesToWeather = list(/area/station/medical)

/datum/weather/royale/cargo
	name = "royale cargo" //takes out arrivals and cargo (shuttle included)
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from cargo and any vacant rooms!</i>")
	areasToWeather = list(/area/station/security/post/supply)
	areaTypesToWeather = list(/area/station/supply, /area/station/public/vacant, /area/external/shuttle)

/datum/weather/royale/bridge
	name = "royale the bridge"
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get away from the bridge!</i>")
	areasToWeather = list(/area/station/command/heads/captain, /area/station/command/heads/hop)
	areaTypesToWeather = list(/area/station/command)
	areaIgnore = list(/area/station/command/heads/rd, /area/station/command/heads/ce, /area/station/command/heads/cmo, /area/station/command/heads/hos) // me guess overlap bad? -AMyriad

/datum/weather/royale/hallway
	name = "royale hallway"
	telegraph_duration = 30 SECONDS //hallway's a bit bigger
	telegraph_message = span_narsiesmall("<i>The storm is closing in, get out of the hallways!</i>")
	areaTypesToWeather = list(/area/station/public/hallway)

/datum/weather/royale/hallway/telegraph() //message changes depending on which one is left
	if(GLOB.final_zone) 
		telegraph_message = span_narsiesmall("<i>The storm is closing in, it all ends in [GLOB.final_zone]!</i>")
	. = ..()

/datum/weather/royale/final
	name = "royale centre" //final wave, takes out the centre ring.
	telegraph_duration = 30 SECONDS //the zone annihilates people, give some time for them to "make their final stand"
	telegraph_message = span_narsiesmall("<i>The eye of the storm is closing, make your final stand!</i>")
