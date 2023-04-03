roms := pokezelda.gbc pokezelda_debug.gbc

rom_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/misc.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o \
lib/mobile/main.o

pokezelda_obj         := $(rom_obj:.o=.o)
pokezelda_debug_obj   := $(rom_obj:.o=_debug.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all crystal crystal_debug clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: crystal
crystal:         pokezelda.gbc
crystal_debug:   pokezelda_debug.gbc

clean: tidy
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" -o -name "*.sgb.tilemap" \) -delete
	find gfx/pokemon -mindepth 1 ! -path "gfx/pokemon/unown/*" \( -name "bitmask.asm" -o -name "frames.asm" -o -name "front.animated.tilemap" -o -name "front.dimensions" \) -delete

tidy:
	$(RM) $(roms) $(pokezelda_obj) $(pokezelda_debug_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -L -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokezelda_obj):         RGBASMFLAGS +=
$(pokezelda_debug_obj):   RGBASMFLAGS += -D _DEBUG

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for shared objects objects
$(foreach obj, $(pokezelda_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))
$(foreach obj, $(pokezelda_debug_obj), $(eval $(call DEP,$(obj),$(obj:_debug.o=.asm))))

endif


pokezelda_opt         = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0
pokezelda_debug_opt   = -Cjv -t PM_CRYSTAL -i BYTE -n 0 -k 01 -l 0x33 -m 0x10 -r 3 -p 0

pokezelda_base         = us
pokezelda_debug_base   = dbg

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -n $*.sym -m $*.map -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $($*_opt) $@
	tools/stadium --base $($*_base) $@


### LZ compression rules

# Delete this line if you don't care about matching and just want optimal compression.
include gfx/lz.mk

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
gfx/pokemon/%/bitmask.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pokemon/%/frames.asm: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions
	tools/pokemon_animation -f $^ > $@


### Terrible hacks to match animations. Delete these rules if you don't care about matching.

# Dewgong has an unused tile id in its last frame. The tile itself is missing.
gfx/pokemon/dewgong/frames.asm: gfx/pokemon/dewgong/front.animated.tilemap gfx/pokemon/dewgong/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$4d" >> $@

# Lugia has two unused tile ids in its last frame. The tiles themselves are missing.
gfx/pokemon/lugia/frames.asm: gfx/pokemon/lugia/front.animated.tilemap gfx/pokemon/lugia/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$5e, \$$59" >> $@

# Girafarig has a redundant tile after the end. It is used in two frames, so it must be injected into the generated graphics.
# This is more involved, so it's hacked into pokemon_animation_graphics.
gfx/pokemon/girafarig/front.animated.2bpp: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -o $@ $^
gfx/pokemon/girafarig/front.animated.tilemap: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -t $@ $^


### Misc file-specific graphics rules

gfx/pokemon/%/back.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/pokemon/egg/unused_front.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h
gfx/player/kris.2bpp: rgbgfx += -h
gfx/player/kris_back.2bpp: rgbgfx += -h

gfx/trainer_card/chris_card.2bpp: rgbgfx += -h
gfx/trainer_card/kris_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin ; tr < $< -d '\000' > $@


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@
