//A reference to this list is passed into area sound managers, and it's modified in a manner that preserves that reference in ash_storm.dm
GLOBAL_LIST_EMPTY(ash_storm_sounds)
GLOBAL_LIST_EMPTY(acid_rain_sounds) // Yog

#define STARTUP_STAGE 1
#define MAIN_STAGE 2
#define WIND_DOWN_STAGE 3
#define END_STAGE 4
