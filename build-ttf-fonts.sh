#!/bin/bash

echo "Generating static TTF fonts"

# Remove any previous builds
rm fonts/ttf/*.ttf fonts/ttf/*.ttx

# Build static instances (TTF)
fontmake -g sources/PlayerSansMono.glyphs -o ttf --output-dir fonts/ttf/ \
-i -f --filter DecomposeTransformedComponentsFilter

# Remove intermediary files leftover from fontmake
rm -rf instance_ufo/

# Keep master UFOs for editing on non-macOS systems
mv master_ufo sources/ufo

echo "Post processing"

ttfs=$(ls fonts/ttf/*.ttf)
for ttf in $ttfs
do
	# Add Google Fonts gasp and prep table settings for optimal rendering of unhinted fonts
	gftools fix-nonhinting $ttf $ttf

	# Italic angle is undesirable in the source .glyphs file, but we need to add it to built fonts
	python scripts/fix-italic-angle.py $ttf

	# Add meta table (recommended by Google Fonts)
	ttx -o $ttf -m $ttf sources/patch.ttx
done

# Remove leftover files from gftools
rm fonts/ttf/*backup*.ttf

echo "QA check"

# FontBakery check
fontbakery check-googlefonts --ghmarkdown qa.md -j -l INFO fonts/ttf/*

say "Build complete"