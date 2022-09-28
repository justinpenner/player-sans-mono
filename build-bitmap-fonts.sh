#! /bin/bash

# Check if fontbm is installed
if [ ! -f "fontbm/fontbm" ]
then
	echo "fontbm executable must be located at fontbm/fontbm"
	echo "To install on macOS:"
	echo ""
	echo "brew install freetype"
	echo "git clone https://github.com/vladimirgamalyan/fontbm.git"
	echo "cd fontbm"
	echo "cmake ."
	echo "make"
	echo "cd .."
	echo ""
	echo "Windows/Linux instructions at https://github.com/vladimirgamalyan/fontbm"
	exit
fi

# Create folder if needed
if [ ! -d "fonts/bitmap" ]
then
	mkdir "fonts/bitmap"
fi

echo ""
ttfs=$(ls fonts/ttf/*.ttf)
for ttf in $ttfs
do
	output=$(basename $ttf .ttf)

	# fontbm needs a list of characters
	chars=$(python3 "scripts/fontbm-get-charset.py" $ttf)

	echo "Building bitmap font from $ttf"
	./fontbm/fontbm --font-file $ttf --output "fonts/bitmap/$output" \
	--font-size 8 --spacing-horiz 1 --spacing-vert 1 --chars $chars \
	--color 255,255,255 --background-color 0,0,0 \
	--texture-crop-width
	# For more output formats, add: --data-format [txt|xml|bin|json|cbor]

	echo "Saved to fonts/bitmap/$output.*"
	echo ""
done