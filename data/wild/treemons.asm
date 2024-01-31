TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_Unused
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City
	assert_table_length NUM_TREEMON_SETS

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_Unused:
TreeMonSet_City:
; common
	db 50, VENONAT,    15
	db 30, VENONAT,    15
	db 10, ABRA,       15
	db  5, ABRA,       15
	db  5, LEDIAN,     18
	db -1
; rare
	db 50, VENONAT,    15
	db 30, MAGNEMITE,  15
	db 10, ABRA,       15
	db  5, ABRA,       15
	db  5, LEDIAN,     18
	db -1

TreeMonSet_Canyon:
; common
	db 40, SPEAROW,    10
	db 15, SPEAROW,    12
	db  5, SPEAROW,    15
	db 20, AIPOM,      10
	db 10, AIPOM,      12
	db 10, AIPOM,      15
	db -1
; rare
	db 30, SPEAROW,    10
	db 20, HERACROSS,  12
	db 15, HERACROSS,  15
	db 15, AIPOM,      10
	db 10, AIPOM,      12
	db 10, AIPOM,      15
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    10
	db 10, EKANS,      12
	db 15, SPEAROW,    15
	db 10, AIPOM,      10
	db 10, AIPOM,      12
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, HERACROSS,  12
	db 15, HERACROSS,  15
	db 10, AIPOM,      10
	db  5, AIPOM,      12
	db  5, AIPOM,      15
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     12
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Kanto:
; common
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   12
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     12
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   12
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     12
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  12
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Forest:
; common
	db 40, HOOTHOOT,   10
	db 25, PINECO,     10
	db 25, PINECO,     12
	db  5, NOCTOWL,    20
	db  5, BUTTERFREE, 15
	db  5, BEEDRILL,   15
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   15
	db  5, METAPOD,    12
	db  5, KAKUNA,     12
	db -1

TreeMonSet_Rock:
	db 45, KRABBY,     15
	db 20, SHUCKLE,    15
	db 10, GEODUDE,    15
	db 10, GEODUDE,    20
	db 10, SLUGMA,     20
	db  5, KINGLER,    30
	db -1
