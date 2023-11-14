newgroup: MACRO
;\1: group id
	const_skip
MAPGROUP_\1 EQU const_value
CURRENT_NUM_MAPGROUP_MAPS EQUS "NUM_\1_MAPS"
__map_value__ = 1
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
MAP_\1 EQU __map_value__
__map_value__ += 1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

endgroup: MACRO
{CURRENT_NUM_MAPGROUP_MAPS} EQU __map_value__ - 1
PURGE CURRENT_NUM_MAPGROUP_MAPS
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup OLIVINE                                              ;  1
	map_const OLIVINE_POKECENTER_1F,                        7,  5 ;  1
	map_const OLIVINE_GYM,                                  7, 10 ;  2
	map_const OLIVINE_PHARMACY_SPEECH_HOUSE,                6,  5 ;  3
	map_const OLIVINE_PUNISHMENT_SPEECH_HOUSE,              6,  5 ;  4
	map_const OLIVINE_GOOD_ROD_HOUSE,                       6,  5 ;  5
	map_const OLIVINE_CAFE,                                 6,  5 ;  6
	map_const OLIVINE_MART,                                 8,  5 ;  7
	map_const ROUTE_38_ECRUTEAK_GATE,                       7,  5 ;  8
	map_const ROUTE_39_BARN,                                6,  5 ;  9
	map_const ROUTE_39_FARMHOUSE,                           6,  5 ; 10
	map_const ROUTE_38,                                    19, 11 ; 11
	map_const ROUTE_39,                                    11, 19 ; 12
	map_const OLIVINE_CITY,                                20, 18 ; 13
	endgroup

	newgroup MAHOGANY                                             ;  2
	map_const MAHOGANY_RED_GYARADOS_SPEECH_HOUSE,           6,  5 ;  1
	map_const MAHOGANY_GYM,                                 7, 10 ;  2
	map_const MAHOGANY_POKECENTER_1F,                       7,  5 ;  3
	map_const ROUTE_42_ECRUTEAK_GATE,                       7,  5 ;  4
	map_const ROUTE_42,                                    30, 10 ;  5
	map_const ROUTE_44,                                    30,  9 ;  6
	map_const MAHOGANY_TOWN,                               10,  9 ;  7
	endgroup

	newgroup DUNGEONS                                             ;  3
	map_const SPROUT_TOWER_1F,                             10,  9 ;  1
	map_const SPROUT_TOWER_2F,                             10,  9 ;  2
	map_const SPROUT_TOWER_3F,                             10,  9 ;  3
	map_const TIN_TOWER_1F,                                10,  9 ;  4
	map_const TIN_TOWER_2F,                                10,  9 ;  5
	map_const TIN_TOWER_3F,                                10,  9 ;  6
	map_const TIN_TOWER_4F,                                10,  9 ;  7
	map_const TIN_TOWER_5F,                                10, 10 ;  8
	map_const TIN_TOWER_6F,                                10,  9 ;  9
	map_const TIN_TOWER_7F,                                10, 10 ; 10
	map_const TIN_TOWER_8F,                                10,  9 ; 11
	map_const TIN_TOWER_9F,                                10,  9 ; 12
	map_const BURNED_TOWER_1F,                             10,  9 ; 13
	map_const BURNED_TOWER_B1F,                            10,  9 ; 14
	map_const NATIONAL_PARK,                               22, 27 ; 15
	map_const NATIONAL_PARK_BUG_CONTEST,                   22, 27 ; 16
	map_const RADIO_TOWER_1F,                              11,  5 ; 17
	map_const RADIO_TOWER_2F,                              11,  5 ; 18
	map_const RADIO_TOWER_3F,                              12,  5 ; 19
	map_const RADIO_TOWER_4F,                              12,  5 ; 20
	map_const RADIO_TOWER_5F,                              12,  5 ; 21
	map_const RUINS_OF_ALPH_OUTSIDE,                       12, 19 ; 22
	map_const RUINS_OF_ALPH_HO_OH_CHAMBER,                  4,  6 ; 23
	map_const RUINS_OF_ALPH_KABUTO_CHAMBER,                 4,  6 ; 24
	map_const RUINS_OF_ALPH_OMANYTE_CHAMBER,                4,  6 ; 25
	map_const RUINS_OF_ALPH_AERODACTYL_CHAMBER,             4,  6 ; 26
	map_const RUINS_OF_ALPH_INNER_CHAMBER,                 10, 18 ; 27
	map_const RUINS_OF_ALPH_RESEARCH_CENTER,                6,  5 ; 28
	map_const RUINS_OF_ALPH_HO_OH_ITEM_ROOM,                4,  6 ; 29
	map_const RUINS_OF_ALPH_KABUTO_ITEM_ROOM,               4,  6 ; 30
	map_const RUINS_OF_ALPH_OMANYTE_ITEM_ROOM,              4,  6 ; 31
	map_const RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM,           4,  6 ; 32
	map_const RUINS_OF_ALPH_HO_OH_WORD_ROOM,               10, 12 ; 33
	map_const RUINS_OF_ALPH_KABUTO_WORD_ROOM,              10,  7 ; 34
	map_const RUINS_OF_ALPH_OMANYTE_WORD_ROOM,             10,  8 ; 35
	map_const RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,          10,  7 ; 36
	map_const UNION_CAVE_1F,                               10, 18 ; 37
	map_const UNION_CAVE_B1F,                              10, 18 ; 38
	map_const UNION_CAVE_B2F,                              10, 18 ; 39
	map_const SLOWPOKE_WELL_B1F,                           10,  9 ; 40
	map_const SLOWPOKE_WELL_B2F,                           10,  9 ; 41
	map_const OLIVINE_LIGHTHOUSE_1F,                       10,  9 ; 42
	map_const OLIVINE_LIGHTHOUSE_2F,                       10,  9 ; 43
	map_const OLIVINE_LIGHTHOUSE_3F,                       10,  9 ; 44
	map_const OLIVINE_LIGHTHOUSE_4F,                       10,  9 ; 45
	map_const OLIVINE_LIGHTHOUSE_5F,                       10,  9 ; 46
	map_const OLIVINE_LIGHTHOUSE_6F,                       10,  9 ; 47
	map_const MAHOGANY_MART_1F,                             6,  5 ; 48
	map_const TEAM_ROCKET_BASE_B1F,                        15,  9 ; 49
	map_const TEAM_ROCKET_BASE_B2F,                        15,  9 ; 50
	map_const TEAM_ROCKET_BASE_B3F,                        15,  9 ; 51
	map_const ILEX_FOREST,                                 17, 26 ; 52
	map_const GOLDENROD_UNDERGROUND,                       15, 19 ; 53
	map_const GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 16, 18 ; 54
	map_const GOLDENROD_DEPT_STORE_B1F,                    10,  9 ; 55
	map_const GOLDENROD_UNDERGROUND_WAREHOUSE,             10,  9 ; 56
	map_const MOUNT_MORTAR_1F_OUTSIDE,                     20, 18 ; 57
	map_const MOUNT_MORTAR_1F_INSIDE,                      20, 27 ; 58
	map_const MOUNT_MORTAR_2F_INSIDE,                      20, 18 ; 59
	map_const MOUNT_MORTAR_B1F,                            20, 18 ; 60
	map_const ICE_PATH_1F,                                 20, 18 ; 61
	map_const ICE_PATH_B1F,                                10, 18 ; 62
	map_const ICE_PATH_B2F_MAHOGANY_SIDE,                  10,  9 ; 63
	map_const ICE_PATH_B2F_BLACKTHORN_SIDE,                 5,  9 ; 64
	map_const ICE_PATH_B3F,                                10,  9 ; 65
	map_const WHIRL_ISLAND_NW,                              5,  9 ; 66
	map_const WHIRL_ISLAND_NE,                             10,  9 ; 67
	map_const WHIRL_ISLAND_SW,                             10,  9 ; 68
	map_const WHIRL_ISLAND_CAVE,                            5,  9 ; 69
	map_const WHIRL_ISLAND_SE,                              5,  9 ; 70
	map_const WHIRL_ISLAND_B1F,                            20, 18 ; 71
	map_const WHIRL_ISLAND_B2F,                            10, 18 ; 72
	map_const WHIRL_ISLAND_LUGIA_CHAMBER,                  10,  9 ; 73
	map_const SILVER_CAVE_ROOM_1,                          10, 18 ; 74
	map_const SILVER_CAVE_ROOM_2,                          15, 18 ; 75
	map_const SILVER_CAVE_ROOM_3,                          10, 18 ; 76
	map_const SILVER_CAVE_ITEM_ROOMS,                      10,  9 ; 77
	map_const DARK_CAVE_VIOLET_ENTRANCE,                   20, 18 ; 78
	map_const DARK_CAVE_BLACKTHORN_ENTRANCE,               15, 18 ; 79
	map_const DRAGONS_DEN_1F,                               5,  9 ; 80
	map_const DRAGONS_DEN_B1F,                             20, 18 ; 81
	map_const DRAGON_SHRINE,                                7,  7 ; 82
	map_const TOHJO_FALLS,                                 15,  9 ; 83
	map_const DIGLETTS_CAVE,                               20, 18 ; 84
	map_const MOUNT_MOON,                                  23, 15 ; 85
	map_const UNDERGROUND_PATH,                             3, 20 ; 86
	map_const UNDERGROUND_PATH_WEST_EAST,                  25,  4 ; NEW
	map_const ROCK_TUNNEL_1F,                              15, 18 ; 87
	map_const ROCK_TUNNEL_B1F,                             15, 18 ; 88
	map_const SAFARI_ZONE_FUCHSIA_GATE,                    15, 19 ; 89
	map_const SAFARI_ZONE,                                 19, 17 ; 90
	map_const SAFARI_ZONE_REST_HOUSE,                       6,  5 ; NEW
	map_const VICTORY_ROAD_CHAMBER,                        12, 11 ; NEW
	map_const VICTORY_ROAD_1F,                             12, 11 ; NEW
	map_const VICTORY_ROAD_2F,                             19, 11 ; NEW
	map_const VICTORY_ROAD_3F,                             17, 11 ; NEW
	map_const SEAFOAM_ISLANDS_1F,                          15,  9 ; NEW
	map_const SEAFOAM_ISLANDS_B1F,                         15, 10 ; NEW
	map_const SEAFOAM_ISLANDS_B2F,                         15,  9 ; NEW
	map_const SEAFOAM_ISLANDS_B3F,                         17, 12 ; NEW
	map_const SEAFOAM_ISLANDS_B4F,                         15, 11 ; NEW
	map_const CERULEAN_CAVE_1F,                            17, 11 ; NEW
	map_const CERULEAN_CAVE_2F,                            17, 11 ; NEW
	map_const CERULEAN_CAVE_B1F,                           17, 11 ; NEW
	endgroup

	newgroup ECRUTEAK                                             ;  4
	map_const ECRUTEAK_TIN_TOWER_ENTRANCE,                 12, 10 ;  1
	map_const WISE_TRIOS_ROOM,                              7,  5 ;  2
	map_const ECRUTEAK_POKECENTER_1F,                       7,  5 ;  3
	map_const ECRUTEAK_LUGIA_SPEECH_HOUSE,                  6,  5 ;  4
	map_const DANCE_THEATRE,                                8,  8 ;  5
	map_const ECRUTEAK_MART,                                8,  5 ;  6
	map_const ECRUTEAK_GYM,                                 7, 10 ;  7
	map_const ECRUTEAK_ITEMFINDER_HOUSE,                    6,  5 ;  8
	map_const ECRUTEAK_CITY,                               21, 19 ;  9
	endgroup

	newgroup BLACKTHORN                                           ;  5
	map_const BLACKTHORN_GYM_1F,                            7, 10 ;  1
	map_const BLACKTHORN_GYM_2F,                            7, 10 ;  2
	map_const BLACKTHORN_DRAGON_SPEECH_HOUSE,               6,  5 ;  3
	map_const BLACKTHORN_EMYS_HOUSE,                        6,  5 ;  4
	map_const BLACKTHORN_MART,                              8,  5 ;  5
	map_const BLACKTHORN_POKECENTER_1F,                     7,  5 ;  6
	map_const MOVE_DELETERS_HOUSE,                          6,  5 ;  7
	map_const ROUTE_45,                                    10, 45 ;  8
	map_const ROUTE_46,                                    11, 17 ;  9
	map_const BLACKTHORN_CITY,                             20, 18 ; 10
	endgroup

	newgroup CINNABAR                                             ;  6
	map_const CINNABAR_POKECENTER_1F,                       7,  5 ;  1
	map_const FUCHSIA_CITY_FISHER_HOUSE,                    6,  5 ;  2
	map_const SEAFOAM_GYM,                                 18, 12 ;  3
	map_const ROUTE_19,                                    10, 27 ;  4
	map_const ROUTE_20,                                    50,  9 ;  5
	map_const ROUTE_21,                                    10, 45 ;  6
	map_const CINNABAR_ISLAND,                             10,  9 ;  7
	map_const SUMMER_BEACH_HOUSE,                           9,  5 ;  NEW
	endgroup

	newgroup CERULEAN                                             ;  7
	map_const CERULEAN_GYM_BADGE_SPEECH_HOUSE,              6,  5 ;  1
	map_const CERULEAN_POLICE_STATION,                      6,  5 ;  2
	map_const CERULEAN_TRADE_SPEECH_HOUSE,                  6,  5 ;  3
	map_const CERULEAN_POKECENTER_1F,                       7,  5 ;  4
	map_const CERULEAN_GYM,                                 7,  9 ;  5
	map_const CERULEAN_MART,                                8,  5 ;  6
	map_const ROUTE_10_POKECENTER_1F,                       7,  5 ;  7
	map_const POWER_PLANT,                                 16, 16 ;  8
	map_const BILLS_HOUSE,                                  6,  5 ;  9
	map_const ROUTE_4_EAST,                                34,  9 ; 10
	map_const ROUTE_4_POKECENTER_1F,                        7,  5 ; NEW
	map_const ROUTE_9,                                     30, 14 ; 11
	map_const ROUTE_10,	                               10, 25 ; 12
	map_const ROUTE_24,                                    10, 18 ; 13
	map_const ROUTE_25,                                    30, 10 ; 14
	map_const CERULEAN_CITY,                               20, 18 ; 15
	map_const CERULEAN_BIKE_SHOP,                           6,  5 ; NEW
	endgroup

	newgroup AZALEA                                               ;  8
	map_const AZALEA_POKECENTER_1F,                         7,  5 ;  1
	map_const CHARCOAL_KILN,                                6,  5 ;  2
	map_const AZALEA_MART,                                  8,  5 ;  3
	map_const KURTS_HOUSE,                                 10,  5 ;  4
	map_const AZALEA_GYM,                                   7, 10 ;  5
	map_const ROUTE_33,                                    11, 10 ;  6
	map_const AZALEA_TOWN,                                 19, 11 ;  7
	endgroup

	newgroup LAKE_OF_RAGE                                         ;  9
	map_const LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,              6,  5 ;  1
	map_const LAKE_OF_RAGE_MAGIKARP_HOUSE,                  6,  5 ;  2
	map_const ROUTE_43_MAHOGANY_GATE,                       7,  5 ;  3
	map_const ROUTE_43_GATE,                                7,  5 ;  4
	map_const ROUTE_43,                                    12, 27 ;  5
	map_const LAKE_OF_RAGE,                                21, 19 ;  6
	endgroup

	newgroup VIOLET                                               ; 10
	map_const ROUTE_32,                                    12, 45 ;  1
	map_const ROUTE_35,                                    11, 18 ;  2
	map_const ROUTE_36,                                    30,  9 ;  3
	map_const ROUTE_37,                                    10,  9 ;  4
	map_const VIOLET_CITY,                                 20, 19 ;  5
	map_const VIOLET_MART,                                  8,  5 ;  6
	map_const VIOLET_GYM,                                   7,  9 ;  7
	map_const EARLS_POKEMON_ACADEMY,                        6,  9 ;  8
	map_const VIOLET_NICKNAME_SPEECH_HOUSE,                 6,  5 ;  9
	map_const VIOLET_POKECENTER_1F,                         7,  5 ; 10
	map_const VIOLET_KYLES_HOUSE,                           6,  5 ; 11
	map_const ROUTE_32_RUINS_OF_ALPH_GATE,                  7,  5 ; 12
	map_const ROUTE_32_POKECENTER_1F,                       7,  5 ; 13
	map_const ROUTE_35_GOLDENROD_GATE,                      7,  5 ; 14
	map_const ROUTE_35_NATIONAL_PARK_GATE,                  6,  5 ; 15
	map_const ROUTE_36_RUINS_OF_ALPH_GATE,                  7,  5 ; 16
	map_const ROUTE_36_NATIONAL_PARK_GATE,                  7,  5 ; 17
	endgroup

	newgroup GOLDENROD                                            ; 11
	map_const ROUTE_34,                                    11, 27 ;  1
	map_const GOLDENROD_CITY,                              20, 18 ;  2
	map_const GOLDENROD_GYM,                               12, 11 ;  3
	map_const GOLDENROD_BIKE_SHOP,                          6,  5 ;  4
	map_const GOLDENROD_HAPPINESS_RATER,                    6,  5 ;  5
	map_const BILLS_FAMILYS_HOUSE,                          6,  5 ;  6
	map_const GOLDENROD_MAGNET_TRAIN_STATION,              12, 10 ;  7
	map_const GOLDENROD_FLOWER_SHOP,                        6,  5 ;  8
	map_const GOLDENROD_PP_SPEECH_HOUSE,                    6,  5 ;  9
	map_const GOLDENROD_NAME_RATER,                         6,  5 ; 10
	map_const GOLDENROD_DEPT_STORE_1F,                     10,  5 ; 11
	map_const GOLDENROD_DEPT_STORE_2F,                     10,  5 ; 12
	map_const GOLDENROD_DEPT_STORE_3F,                     10,  5 ; 13
	map_const GOLDENROD_DEPT_STORE_4F,                     10,  5 ; 14
	map_const GOLDENROD_DEPT_STORE_5F,                     10,  5 ; 15
	map_const GOLDENROD_DEPT_STORE_6F,                     10,  5 ; 16
	map_const GOLDENROD_DEPT_STORE_ELEVATOR,                4,  3 ; 17
	map_const GOLDENROD_DEPT_STORE_ROOF,                    8,  6 ; 18
	map_const GOLDENROD_GAME_CORNER,                       12,  8 ; 19
	map_const GOLDENROD_POKECENTER_1F,                      7,  5 ; 20
	map_const ILEX_FOREST_AZALEA_GATE,                      7,  5 ; 21
	map_const ROUTE_34_ILEX_FOREST_GATE,                    7,  5 ; 22
	map_const DAY_CARE,                                     6,  5 ; 23
	endgroup

	newgroup VERMILION                                            ; 12
	map_const ROUTE_11_GATE,                                7,  5 ;  NEW
	map_const ROUTE_11,                                    29, 11 ;  2
	map_const VERMILION_CITY,                              20, 18 ;  3
	map_const VERMILION_FISHING_SPEECH_HOUSE,               6,  5 ;  4
	map_const VERMILION_POKECENTER_1F,                      7,  5 ;  5
	map_const POKEMON_FAN_CLUB,                             7,  5 ;  6
	map_const VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,          6,  5 ;  7
	map_const VERMILION_MART,                               8,  5 ;  8
	map_const VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE,         6,  5 ;  9
	map_const VERMILION_GYM,                                7, 11 ; 10
	map_const ROUTE_6_SAFFRON_GATE,                         7,  5 ; 11
	map_const ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            6,  5 ; 12
	endgroup

	newgroup PALLET                                               ; 13
	map_const ROUTE_1,                                     10, 18 ;  1
	map_const PALLET_TOWN,                                 10,  9 ;  2
	map_const REDS_HOUSE_1F,                                6,  5 ;  3
	map_const REDS_HOUSE_2F,                                6,  5 ;  4
	map_const BLUES_HOUSE,                                  6,  5 ;  5
	map_const OAKS_LAB,                                     7,  7 ;  6
	endgroup

	newgroup PEWTER                                               ; 14
	map_const ROUTE_3,                                     35,  9 ;  1
	map_const PEWTER_CITY,                                 20, 18 ;  2
	map_const ROUTE_4,                                     11,  9 ;  NEW
	map_const PEWTER_NIDORAN_SPEECH_HOUSE,                  6,  5 ;  3
	map_const PEWTER_GYM,                                   7,  8 ;  4
	map_const PEWTER_MART,                                  8,  5 ;  5
	map_const PEWTER_POKECENTER_1F,                         7,  5 ;  6
	map_const PEWTER_SNOOZE_SPEECH_HOUSE,                   6,  5 ;  7
	map_const PEWTER_MUSEUM_1F,                            12,  5 ;  NEW
	map_const PEWTER_MUSEUM_2F,                             9,  5 ;  NEW
	map_const PEWTER_MUSEUM_B1F,                           12,  5 ;  NEW
	endgroup

	newgroup FAST_SHIP                                            ; 15
	map_const OLIVINE_PORT,                                10, 18 ;  1
	map_const VERMILION_PORT,                              10, 18 ;  2
	map_const FAST_SHIP_1F,                                18, 10 ;  3
	map_const FAST_SHIP_CABINS_NNW_NNE_NE,                 13, 13 ;  4
	map_const FAST_SHIP_CABINS_SW_SSW_NW,                  13, 13 ;  5
	map_const FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,      13, 14 ;  6
	map_const FAST_SHIP_B1F,                               16,  8 ;  7
	map_const OLIVINE_PORT_PASSAGE,                        10,  9 ;  8
	map_const VERMILION_PORT_PASSAGE,                      10,  9 ;  9
	map_const MOUNT_MOON_SQUARE,                           15,  9 ; 10
	map_const MOUNT_MOON_GIFT_SHOP,                         6,  5 ; 11
	map_const TIN_TOWER_ROOF,                              10,  9 ; 12
	endgroup

	newgroup INDIGO                                               ; 16
	map_const ROUTE_23,                                    12, 23 ;  1
	map_const INDIGO_PLATEAU_POKECENTER_1F,                11,  9 ;  2
	map_const WILLS_ROOM,                                   7, 10 ;  3
	map_const KOGAS_ROOM,                                   7, 10 ;  4
	map_const BRUNOS_ROOM,                                  7, 10 ;  5
	map_const KARENS_ROOM,                                  7, 10 ;  6
	map_const LANCES_ROOM,                                  5, 12 ;  7
	map_const HALL_OF_FAME,                                 7,  8 ;  8
	endgroup

	newgroup FUCHSIA                                              ; 17
	map_const ROUTE_13,                                    30,  9 ;  1
	map_const ROUTE_14,                                    10, 27 ;  2
	map_const ROUTE_15,                                    30, 15 ;  3
	map_const ROUTE_18,                                    25, 15 ;  4
	map_const FUCHSIA_CITY,                                20, 19 ;  5
	map_const FUCHSIA_MART,                                 8,  5 ;  6
	map_const SAFARI_ZONE_MAIN_OFFICE,                      8,  5 ;  7
	map_const FUCHSIA_GYM,                                  7, 10 ;  8
	map_const BILLS_BROTHERS_HOUSE,                         6,  5 ;  9
	map_const FUCHSIA_POKECENTER_1F,                        7,  5 ; 10
	map_const SAFARI_ZONE_WARDENS_HOME,                     7,  5 ; 11
	map_const ROUTE_15_FUCHSIA_GATE,                        7,  5 ; 12
	endgroup

	newgroup LAVENDER                                             ; 18
	map_const ROUTE_8,                                     28,  9 ;  1
	map_const ROUTE_12,                                    11, 54 ;  2
	map_const ROUTE_10_SOUTH,                              10, 11 ;  3
	map_const LAVENDER_TOWN,                               10,  9 ;  4
	map_const LAVENDER_POKECENTER_1F,                       7,  5 ;  5
	map_const MR_FUJIS_HOUSE,                               7,  5 ;  6
	map_const LAVENDER_SPEECH_HOUSE,                        6,  5 ;  7
	map_const LAVENDER_NAME_RATER,                          6,  5 ;  8
	map_const LAVENDER_MART,                                8,  5 ;  9
	map_const SOUL_HOUSE,                                   7,  5 ; 10
	map_const LAV_RADIO_TOWER_1F,                          12,  5 ; 11
	map_const ROUTE_8_SAFFRON_GATE,                         7,  5 ; 12
	map_const ROUTE_12_SUPER_ROD_HOUSE,                     6,  5 ; 13
	map_const ROUTE_12_GATE,                                7,  5 ; NEW
	map_const ROUTE_8_UNDERGROUND_PATH_ENTRANCE,            6,  5 ; NEW
	map_const VIRIDIAN_FOREST,                             19, 29 ; NEW
	endgroup

	newgroup SILVER                                               ; 19
	map_const ROUTE_28,                                    20,  9 ;  1
	map_const SILVER_CAVE_OUTSIDE,                         20, 18 ;  2
	map_const SILVER_CAVE_POKECENTER_1F,                    7,  5 ;  3
	map_const ROUTE_28_STEEL_WING_HOUSE,                    6,  5 ;  4
	endgroup

	newgroup CABLE_CLUB                                           ; 20
	map_const POKECENTER_2F,                                10, 5 ;  1
	map_const TRADE_CENTER,                                 7,  5 ;  2
	map_const COLOSSEUM,                                    7,  5 ;  3
	map_const TIME_CAPSULE,                                 7,  5 ;  4
	endgroup

	newgroup CELADON                                              ; 21
	map_const ROUTE_7,                                      9, 18 ;  1
	map_const ROUTE_16,                                    22, 10 ;  2
	map_const ROUTE_17,                                    10, 72 ;  3
	map_const CELADON_CITY,                                25, 20 ;  4
	map_const CELADON_DEPT_STORE_1F,                       10,  5 ;  5
	map_const CELADON_DEPT_STORE_2F,                       10,  5 ;  6
	map_const CELADON_DEPT_STORE_3F,                       10,  5 ;  7
	map_const CELADON_DEPT_STORE_4F,                       10,  5 ;  8
	map_const CELADON_DEPT_STORE_5F,                       10,  5 ;  9
	map_const CELADON_DEPT_STORE_6F,                       10,  5 ; 10
	map_const CELADON_DEPT_STORE_ELEVATOR,                  4,  3 ; 11
	map_const CELADON_MANSION_1F,                           7,  8 ; 12
	map_const CELADON_MANSION_2F,                           7,  8 ; 13
	map_const CELADON_MANSION_3F,                           7,  8 ; 14
	map_const CELADON_MANSION_ROOF,                         4,  7 ; 15
	map_const CELADON_MANSION_ROOF_HOUSE,                   6,  5 ; 16
	map_const CELADON_POKECENTER_1F,                        7,  5 ; 17
	map_const CELADON_GAME_CORNER,                         12,  8 ; 18
	map_const CELADON_GAME_CORNER_PRIZE_ROOM,               5,  4 ; 19
	map_const CELADON_GYM,                                  7, 10 ; 20
	map_const CELADON_CAFE,                                 8,  5 ; 21
	map_const ROUTE_16_FUCHSIA_SPEECH_HOUSE,                6,  5 ; 22
	map_const ROUTE_16_GATE,                                7,  5 ; 23
	map_const ROUTE_16_GATE_2,                              7,  5 ; NEW
	map_const ROUTE_7_SAFFRON_GATE,                         7,  5 ; 24
	map_const ROUTE_17_ROUTE_18_GATE,                       7,  5 ; 25
	map_const CELADON_HOTEL,                                7,  5 ; NEW
	map_const CELADON_CHIEF_HOUSE,                          6,  5 ; NEW
	endgroup

	newgroup CIANWOOD                                             ; 22
	map_const ROUTE_40,                                    10, 18 ;  1
	map_const ROUTE_41,                                    25, 27 ;  2
	map_const CIANWOOD_CITY,                               15, 27 ;  3
	map_const MANIAS_HOUSE,                                 6,  5 ;  4
	map_const CIANWOOD_GYM,                                 7, 10 ;  5
	map_const CIANWOOD_POKECENTER_1F,                       7,  5 ;  6
	map_const CIANWOOD_PHARMACY,                            6,  5 ;  7
	map_const CIANWOOD_PHOTO_STUDIO,                        6,  5 ;  8
	map_const CIANWOOD_LUGIA_SPEECH_HOUSE,                  6,  5 ;  9
	map_const POKE_SEERS_HOUSE,                             6,  5 ; 10
	map_const BATTLE_TOWER_1F,                             10,  6 ; 11
	map_const BATTLE_TOWER_BATTLE_ROOM,                     6,  5 ; 12
	map_const BATTLE_TOWER_ELEVATOR,                        4,  3 ; 13
	map_const BATTLE_TOWER_HALLWAY,                        11,  2 ; 14
	map_const ROUTE_40_BATTLE_TOWER_GATE,                   7,  5 ; 15
	map_const BATTLE_TOWER_OUTSIDE,                        12, 14 ; 16
	endgroup

	newgroup VIRIDIAN                                             ; 23
	map_const ROUTE_2,                                     12, 36 ;  1
	map_const VIRIDIAN_NORTH_GATE,                          7,  5 ; NEW
	map_const VIRIDIAN_SOUTH_GATE,                          7,  5 ; NEW
	map_const ROUTE_22,                                    20,  9 ;  2
	map_const VIRIDIAN_CITY,                               20, 18 ;  3
	map_const VIRIDIAN_GYM,                                 7, 10 ;  4
	map_const VIRIDIAN_NICKNAME_SPEECH_HOUSE,               6,  5 ;  5
	map_const TRAINER_HOUSE_1F,                             7,  8 ;  6
	map_const TRAINER_HOUSE_B1F,                            7,  9 ;  7
	map_const VIRIDIAN_MART,                                8,  5 ;  8
	map_const VIRIDIAN_POKECENTER_1F,                       7,  5 ;  9
	map_const ROUTE_2_NUGGET_HOUSE,                         6,  5 ; 10
	map_const ROUTE_2_GATE,                                 7,  5 ; 11
	map_const VICTORY_ROAD_GATE,                           12,  9 ; 12
	endgroup

	newgroup NEW_BARK                                             ; 24
	map_const ROUTE_26,                                    11, 54 ;  1
	map_const ROUTE_27,                                    40,  9 ;  2
	map_const ROUTE_29,                                    30, 11 ;  3
	map_const NEW_BARK_TOWN,                               10, 10 ;  4
	map_const ELMS_LAB,                                     7,  7 ;  5
	map_const PLAYERS_HOUSE_1F,                             7,  5 ;  6
	map_const PLAYERS_HOUSE_2F,                             6,  4 ;  7
	map_const PLAYERS_NEIGHBORS_HOUSE,                      6,  5 ;  8
	map_const ELMS_HOUSE,                                   6,  5 ;  9
	map_const ROUTE_26_HEAL_HOUSE,                          6,  5 ; 10
	map_const DAY_OF_WEEK_SIBLINGS_HOUSE,                   6,  5 ; 11
	map_const ROUTE_27_SANDSTORM_HOUSE,                     6,  5 ; 12
	map_const ROUTE_29_ROUTE_46_GATE,                       7,  5 ; 13
	endgroup

	newgroup SAFFRON                                              ; 25
	map_const ROUTE_5,                                     14, 18 ;  1
	map_const ROUTE_6,                                     15, 18 ;  1
	map_const SAFFRON_CITY,                                23, 18 ;  2
	map_const FIGHTING_DOJO,                                7,  7 ;  3
	map_const SAFFRON_GYM,                                 12, 10 ;  4
	map_const SAFFRON_MART,                                 8,  5 ;  5
	map_const SAFFRON_POKECENTER_1F,                        7,  5 ;  6
	map_const MR_PSYCHICS_HOUSE,                            6,  5 ;  7
	map_const SAFFRON_MAGNET_TRAIN_STATION,                12, 10 ;  8
	map_const SILPH_CO_1F,                                 15,  9 ;  9
	map_const COPYCATS_HOUSE_1F,                            6,  5 ; 10
	map_const COPYCATS_HOUSE_2F,                            6,  5 ; 11
	map_const ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            6,  5 ; 12
	map_const ROUTE_5_SAFFRON_GATE,                         7,  5 ; 13
	map_const ROUTE_5_CLEANSE_TAG_HOUSE,                    6,  5 ; 14
	map_const ROUTE_7_UNDERGROUND_PATH_ENTRANCE,            6,  5 ; NEW
	map_const SILPH_CO_ELEVATOR,                            4,  3 ; NEW
	map_const SILPH_CO_RD,                                 15,  9 ; NEW
	endgroup

	newgroup CHERRYGROVE                                          ; 26
	map_const ROUTE_30,                                    12, 27 ;  1
	map_const ROUTE_31,                                    21,  9 ;  2
	map_const CHERRYGROVE_CITY,                            20,  9 ;  3
	map_const CHERRYGROVE_MART,                             8,  5 ;  4
	map_const CHERRYGROVE_POKECENTER_1F,                    7,  5 ;  5
	map_const CHERRYGROVE_GYM_SPEECH_HOUSE,                 6,  5 ;  6
	map_const GUIDE_GENTS_HOUSE,                            6,  5 ;  7
	map_const CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,           6,  5 ;  8
	map_const ROUTE_30_BERRY_HOUSE,                         6,  5 ;  9
	map_const MR_POKEMONS_HOUSE,                            6,  5 ; 10
	map_const ROUTE_31_VIOLET_GATE,                         7,  5 ; 11
	endgroup

NUM_MAP_GROUPS EQU const_value ; 26
