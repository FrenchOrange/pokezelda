EvolutionGuy:
	ld hl, EvoGuyWhichMonText
	call PrintText

	ld b, PARTY_LENGTH
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld hl, EvoGuyLetMeSeeText
	call PrintText
	ld a, [wCurPartySpecies]
	call EvoLookUpTable
	ld hl, EvoGuyHopeThatHelpsText
	call PrintText
	ret

.cancel
	ld hl, EvoGuyUnderstoodText
	call PrintText
	ret

.egg
	ld hl, EvoGuyEggText
	call PrintText
	ret

.no_mon
	ret

EvoLookUpTable:
	cp BULBASAUR
	jp z, .level_up

	cp IVYSAUR
	jp z, .level_up

	cp VENUSAUR
	jp z, .no_more_evo

	cp CHARMANDER
	jp z, .level_up

	cp CHARMELEON
	jp z, .level_up

	cp CHARIZARD
	jp z, .no_more_evo

	cp SQUIRTLE
	jp z, .level_up

	cp WARTORTLE
	jp z, .level_up

	cp BLASTOISE
	jp z, .no_more_evo

	cp CATERPIE
	jp z, .level_up

	cp METAPOD
	jp z, .level_up

	cp BUTTERFREE
	jp z, .no_more_evo

	cp WEEDLE
	jp z, .level_up

	cp KAKUNA
	jp z, .level_up

	cp BEEDRILL
	jp z, .no_more_evo

	cp PIDGEY
	jp z, .level_up

	cp PIDGEOTTO
	jp z, .level_up

	cp PIDGEOT
	jp z, .no_more_evo

	cp RATTATA
	jp z, .level_up

	cp RATICATE
	jp z, .no_more_evo

	cp SPEAROW
	jp z, .level_up

	cp FEAROW
	jp z, .no_more_evo

	cp EKANS
	jp z, .level_up

	cp ARBOK
	jp z, .no_more_evo

	cp PIKACHU
	jp z, .stone

	cp RAICHU
	jp z, .no_more_evo

	cp SANDSHREW
	jp z, .level_up

	cp SANDSLASH
	jp z, .no_more_evo

	cp NIDORAN_F
	jp z, .level_up

	cp NIDORINA
	jp z, .stone

	cp NIDOQUEEN
	jp z, .no_more_evo

	cp NIDORAN_M
	jp z, .level_up

	cp NIDORINO
	jp z, .stone

	cp NIDOKING
	jp z, .no_more_evo

	cp CLEFAIRY
	jp z, .stone

	cp CLEFABLE
	jp z, .no_more_evo

	cp VULPIX
	jp z, .stone

	cp NINETALES
	jp z, .no_more_evo

	cp JIGGLYPUFF
	jp z, .stone

	cp WIGGLYTUFF
	jp z, .no_more_evo

	cp ZUBAT
	jp z, .level_up

	cp GOLBAT
	jp z, .happiness

	cp ODDISH
	jp z, .level_up

	cp GLOOM
	jp z, .gloom

	cp VILEPLUME
	jp z, .no_more_evo

	cp PARAS
	jp z, .level_up

	cp PARASECT
	jp z, .no_more_evo

	cp VENONAT
	jp z, .level_up

	cp VENOMOTH
	jp z, .no_more_evo

	cp DIGLETT
	jp z, .level_up

	cp DUGTRIO
	jp z, .no_more_evo

	cp MEOWTH
	jp z, .level_up

	cp PERSIAN
	jp z, .no_more_evo

	cp PSYDUCK
	jp z, .level_up

	cp GOLDUCK
	jp z, .no_more_evo

	cp MANKEY
	jp z, .level_up

	cp PRIMEAPE
	jp z, .no_more_evo

	cp GROWLITHE
	jp z, .stone

	cp ARCANINE
	jp z, .no_more_evo

	cp POLIWAG
	jp z, .level_up

	cp POLIWHIRL
	jp z, .poliwhirl

	cp POLIWRATH
	jp z, .no_more_evo

	cp ABRA
	jp z, .level_up

	cp KADABRA
	jp z, .trade

	cp ALAKAZAM
	jp z, .no_more_evo

	cp MACHOP
	jp z, .level_up

	cp MACHOKE
	jp z, .trade

	cp MACHAMP
	jp z, .no_more_evo

	cp BELLSPROUT
	jp z, .level_up

	cp WEEPINBELL
	jp z, .stone

	cp VICTREEBEL
	jp z, .no_more_evo

	cp TENTACOOL
	jp z, .level_up

	cp TENTACRUEL
	jp z, .no_more_evo

	cp GEODUDE
	jp z, .level_up

	cp GRAVELER
	jp z, .trade

	cp GOLEM
	jp z, .no_more_evo

	cp PONYTA
	jp z, .level_up

	cp RAPIDASH
	jp z, .no_more_evo

	cp SLOWPOKE
	jp z, .slowpoke

	cp SLOWBRO
	jp z, .no_more_evo

	cp MAGNEMITE
	jp z, .level_up

	cp MAGNETON
	jp z, .no_more_evo

	cp FARFETCH_D
	jp z, .no_evo

	cp DODUO
	jp z, .level_up

	cp DODRIO
	jp z, .no_more_evo

	cp SEEL
	jp z, .level_up

	cp DEWGONG
	jp z, .no_more_evo

	cp GRIMER
	jp z, .level_up

	cp MUK
	jp z, .no_more_evo

	cp SHELLDER
	jp z, .stone

	cp CLOYSTER
	jp z, .no_more_evo

	cp GASTLY
	jp z, .level_up

	cp HAUNTER
	jp z, .trade

	cp GENGAR
	jp z, .no_more_evo

	cp ONIX
	jp z, .item_trade

	cp DROWZEE
	jp z, .level_up

	cp HYPNO
	jp z, .no_more_evo

	cp KRABBY
	jp z, .level_up

	cp KINGLER
	jp z, .no_more_evo

	cp VOLTORB
	jp z, .level_up

	cp ELECTRODE
	jp z, .no_more_evo

	cp EXEGGCUTE
	jp z, .stone

	cp EXEGGUTOR
	jp z, .no_more_evo

	cp CUBONE
	jp z, .level_up

	cp MAROWAK
	jp z, .no_more_evo

	cp HITMONLEE
	jp z, .no_more_evo

	cp HITMONCHAN
	jp z, .no_more_evo

	cp LICKITUNG
	jp z, .no_evo

	cp KOFFING
	jp z, .level_up

	cp WEEZING
	jp z, .no_more_evo

	cp RHYHORN
	jp z, .level_up

	cp RHYDON
	jp z, .no_more_evo

	cp CHANSEY
	jp z, .happiness

	cp TANGELA
	jp z, .no_evo

	cp KANGASKHAN
	jp z, .no_evo

	cp HORSEA
	jp z, .level_up

	cp SEADRA
	jp z, .item_trade

	cp GOLDEEN
	jp z, .level_up

	cp SEAKING
	jp z, .no_more_evo

	cp STARYU
	jp z, .stone

	cp STARMIE
	jp z, .no_more_evo

	cp MR__MIME
	jp z, .no_evo

	cp SCYTHER
	jp z, .item_trade

	cp JYNX
	jp z, .no_more_evo

	cp ELECTABUZZ
	jp z, .no_more_evo

	cp MAGMAR
	jp z, .no_more_evo

	cp PINSIR
	jp z, .no_evo

	cp TAUROS
	jp z, .no_evo

	cp MAGIKARP
	jp z, .level_up

	cp GYARADOS
	jp z, .no_more_evo

	cp LAPRAS
	jp z, .no_evo

	cp DITTO
	jp z, .no_evo

	cp EEVEE
	jp z, .eevee

	cp VAPOREON
	jp z, .no_more_evo

	cp JOLTEON
	jp z, .no_more_evo

	cp FLAREON
	jp z, .no_more_evo

	cp PORYGON
	jp z, .item_trade

	cp OMANYTE
	jp z, .level_up

	cp OMASTAR
	jp z, .no_more_evo

	cp KABUTO
	jp z, .level_up

	cp KABUTOPS
	jp z, .no_more_evo

	cp AERODACTYL
	jp z, .no_evo

	cp SNORLAX
	jp z, .no_evo

	cp ARTICUNO
	jp z, .no_evo

	cp ZAPDOS
	jp z, .no_evo

	cp MOLTRES
	jp z, .no_evo

	cp DRATINI
	jp z, .level_up

	cp DRAGONAIR
	jp z, .level_up

	cp DRAGONITE
	jp z, .no_more_evo

	cp MEWTWO
	jp z, .no_evo

	cp MEW
	jp z, .no_evo

	cp CHIKORITA
	jp z, .level_up

	cp BAYLEEF
	jp z, .level_up

	cp MEGANIUM
	jp z, .no_more_evo

	cp CYNDAQUIL
	jp z, .level_up

	cp QUILAVA
	jp z, .level_up

	cp TYPHLOSION
	jp z, .no_more_evo

	cp TOTODILE
	jp z, .level_up

	cp CROCONAW
	jp z, .level_up

	cp FERALIGATR
	jp z, .no_more_evo

	cp SENTRET
	jp z, .level_up

	cp FURRET
	jp z, .no_more_evo

	cp HOOTHOOT
	jp z, .level_up

	cp NOCTOWL
	jp z, .no_more_evo

	cp LEDYBA
	jp z, .level_up

	cp LEDIAN
	jp z, .no_more_evo

	cp SPINARAK
	jp z, .level_up

	cp ARIADOS
	jp z, .no_more_evo

	cp CROBAT
	jp z, .no_more_evo

	cp CHINCHOU
	jp z, .level_up

	cp LANTURN
	jp z, .no_more_evo

	cp PICHU
	jp z, .level_up

	cp CLEFFA
	jp z, .level_up

	cp IGGLYBUFF
	jp z, .level_up

	cp TOGEPI
	jp z, .happiness

	cp TOGETIC
	jp z, .no_more_evo

	cp NATU
	jp z, .level_up

	cp XATU
	jp z, .no_more_evo

	cp MAREEP
	jp z, .level_up

	cp FLAAFFY
	jp z, .level_up

	cp AMPHAROS
	jp z, .no_more_evo

	cp BELLOSSOM
	jp z, .no_more_evo

	cp MARILL
	jp z, .level_up

	cp AZUMARILL
	jp z, .no_more_evo

	cp SUDOWOODO
	jp z, .no_evo

	cp POLITOED
	jp z, .no_more_evo

	cp HOPPIP
	jp z, .level_up

	cp SKIPLOOM
	jp z, .level_up

	cp JUMPLUFF
	jp z, .no_more_evo

	cp AIPOM
	jp z, .no_evo

	cp SUNKERN
	jp z, .stone

	cp SUNFLORA
	jp z, .no_more_evo

	cp YANMA
	jp z, .no_evo

	cp WOOPER
	jp z, .level_up

	cp QUAGSIRE
	jp z, .no_more_evo

	cp ESPEON
	jp z, .no_more_evo

	cp UMBREON
	jp z, .no_more_evo

	cp MURKROW
	jp z, .no_evo

	cp SLOWKING
	jp z, .no_more_evo

	cp MISDREAVUS
	jp z, .no_evo

	cp UNOWN
	jp z, .no_evo

	cp WOBBUFFET
	jp z, .no_evo

	cp GIRAFARIG
	jp z, .no_evo

	cp PINECO
	jp z, .level_up

	cp FORRETRESS
	jp z, .no_more_evo

	cp DUNSPARCE
	jp z, .no_evo

	cp GLIGAR
	jp z, .no_evo

	cp STEELIX
	jp z, .no_more_evo

	cp SNUBBULL
	jp z, .level_up

	cp GRANBULL
	jp z, .no_more_evo

	cp QWILFISH
	jp z, .no_evo

	cp SCIZOR
	jp z, .no_more_evo

	cp SHUCKLE
	jp z, .no_evo

	cp HERACROSS
	jp z, .no_evo

	cp SNEASEL
	jp z, .no_evo

	cp TEDDIURSA
	jp z, .level_up

	cp URSARING
	jp z, .no_more_evo

	cp SLUGMA
	jp z, .level_up

	cp MAGCARGO
	jp z, .no_more_evo

	cp SWINUB
	jp z, .level_up

	cp PILOSWINE
	jp z, .no_more_evo

	cp CORSOLA
	jp z, .no_evo

	cp REMORAID
	jp z, .level_up

	cp OCTILLERY
	jp z, .no_more_evo

	cp DELIBIRD
	jp z, .no_evo

	cp MANTINE
	jp z, .no_evo

	cp SKARMORY
	jp z, .no_evo

	cp HOUNDOUR
	jp z, .level_up

	cp HOUNDOOM
	jp z, .no_more_evo

	cp KINGDRA
	jp z, .no_more_evo

	cp PHANPY
	jp z, .level_up

	cp DONPHAN
	jp z, .no_more_evo

	cp PORYGON2
	jp z, .no_more_evo

	cp STANTLER
	jp z, .no_evo

	cp SMEARGLE
	jp z, .no_evo

	cp TYROGUE
	jp z, .tyrogue

	cp HITMONTOP
	jp z, .no_more_evo

	cp SMOOCHUM
	jp z, .level_up

	cp ELEKID
	jp z, .level_up

	cp MAGBY
	jp z, .level_up

	cp MILTANK
	jp z, .no_evo

	cp BLISSEY
	jp z, .no_more_evo

	cp RAIKOU
	jp z, .no_evo

	cp ENTEI
	jp z, .no_evo

	cp SUICUNE
	jp z, .no_evo

	cp LARVITAR
	jp z, .level_up

	cp PUPITAR
	jp z, .level_up

	cp TYRANITAR
	jp z, .no_more_evo

	cp LUGIA
	jp z, .no_evo

	cp HO_OH
	jp z, .no_evo

	cp CELEBI
	jp z, .no_evo
	ret

.level_up
	ld hl, EvoGuyLevelUpEvoText
	call PrintText
	ret

.stone
	ld hl, EvoGuyStoneEvoText
	call PrintText
	ret

.trade
	ld hl, EvoGuyTradeEvoText
	call PrintText
	ret

.item_trade
	ld hl, EvoGuyItemTradeEvoText
	call PrintText
	ret

.happiness
	ld hl, EvoGuyHappinessEvoText
	call PrintText
	ret

.gloom
	ld hl, EvoGuyGloomEvoText
	call PrintText
	ret

.poliwhirl
	ld hl, EvoGuyPoliwhirlEvoText
	call PrintText
	ret

.slowpoke
	ld hl, EvoGuySlowpokeText
	call PrintText
	ret

.eevee
	ld hl, EvoGuyEeveeEvoText
	call PrintText
	ret

.tyrogue
	ld hl, EvoGuyTyrogueEvoText
	call PrintText
	ret

.no_more_evo
	ld hl, EvoGuyNoMoreEvoText
	call PrintText
	ret

.no_evo
	ld hl, EvoGuyNoEvoText
	call PrintText
	ret

EvoGuyWhichMonText::
	text "Wonderful! So,"
	line "which #MON"
	cont "would you like to"
	cont "know more about?"
	prompt

EvoGuyUnderstoodText::
	text "Understood! See"
	line "you soon!"
	done

EvoGuyHopeThatHelpsText::
	text "Hope that helps!"
	done

EvoGuyLetMeSeeText::
	text "Ah, @"
	text_ram wStringBuffer1
	text "!"

	line "Hmm… Let me see."
	prompt

EvoGuyLevelUpEvoText::
	text "It seems to evolve"
	line "after reaching a"
	cont "certain level."
	prompt

EvoGuyStoneEvoText::
	text "It seems to evolve"
	line "after touching a"
	cont "special stone."
	prompt

EvoGuyTradeEvoText::
	text "It seems to evolve"
	line "after being traded"
	cont "with someone else."
	prompt

EvoGuyItemTradeEvoText::
	text "It seems to evolve"
	line "after being traded"
	cont "with someone else."

	para "Though it appears"
	line "a specific item is"
	cont "else needed."
	prompt

EvoGuyHappinessEvoText::
	text "It seems to evolve"
	line "after being happy"
	cont "enough."
	prompt

EvoGuyGloomEvoText::
	text "It seems to evolve"
	line "after touching a"
	cont "special stone."

	para "Two of them are"
	line "said to work on"
	cont "this #MON."
	prompt

EvoGuyPoliwhirlEvoText::
	text "It seems to evolve"
	line "either from a"
	cont "special stone, or"

	para "after being traded"
	line "with an item."
	prompt

EvoGuySlowpokeText::
	text "It seems to evolve"
	line "either from"
	cont "leveling up, or"

	para "after being traded"
	line "with an item."
	prompt

EvoGuyEeveeEvoText::
	text "It can evolve into"
	line "many different"
	cont "#MON!"

	para "It looks like"
	line "special stones and"
	cont "happiness are the"
	cont "way to go."
	prompt

EvoGuyTyrogueEvoText::
	text "It can evolve into"
	line "three different"
	cont "#MON based on"
	cont "its stats."

	para "It appears that"
	line "ATTACK and DEFENSE"
	cont "are the ones you"
	cont "should look after."
	prompt

EvoGuyNoMoreEvoText::
	text "It doesn't look"
	line "like it can evolve"
	cont "any further."
	prompt

EvoGuyNoEvoText::
	text "This #MON isn't"
	line "known to evolve"
	cont "into anything."
	prompt

EvoGuyEggText::
	text "Hey, that's an EGG!"

	para "I can't help you"
	line "out with those,"
	cont "I'm no PROF.ELM."

	para "Get back to me"
	line "after it hatches."
	prompt
