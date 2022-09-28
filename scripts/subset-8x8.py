#!/usr/bin/env python3

'''
Player Sans Mono is based on an 8x8 pixel grid, but with accented characters
the grid is actually 8x13. This script builds subset fonts containing only
glyphs that fit within an 8x8 grid on all fonts.

Subsetting the fonts to 8x8 mainly removes accented letters, so you'll lose
support for most European languages besides English, but you'll still have 
the basic alphabet, numerals, punctuation, and symbols.

Usage:
python scripts/subset-8x8.py

Check language support:
pip install hyperglot
hyperglot fonts/ttf/8x8-subset/PlayerSansMono-Regular.ttf

'''

from fontTools.ttLib.ttFont import TTFont
from fontTools.subset import Subsetter, Options
from glob import glob
from subprocess import run

def main():
    fonts = glob('fonts/ttf/*.ttf')
    outputDir = '8x8-subset'

    run(['rm', '-rf', f'fonts/ttf/{outputDir}'])
    run(['mkdir', f'fonts/ttf/{outputDir}'])

    for fontPath in fonts:
        print(f"Subsetting {fontPath}")

        font = TTFont(fontPath)
        fontPathParts = fontPath.split('/')
        fontPathSubset = f"{'/'.join(fontPathParts[:-1])}/{outputDir}/{fontPathParts[-1]}"

        # For some reason glyphs aren't decompiling before we access them. Bug?
        font.ensureDecompiled()

        # Make lists of glyph names to keep and remove
        keepGlyphs = []
        removeGlyphs = []
        for gname, g in font['glyf'].glyphs.items():
            g.recalcBounds(font['glyf'])
            if g.yMin >= 0 and g.yMax < 64:
                keepGlyphs.append(gname)
            else:
                removeGlyphs.append(gname)

        print(f"Keeping {len(keepGlyphs)}/{len(font['glyf'].glyphs)} glyphs")

        subsetter = Subsetter(Options(
            # Override defaults, which are oriented towards generating subsets for web fonts
            passthrough_tables=True, # Keep tables that fontTools doesn't know
            notdef_outline=True, # Don't erase the .notdef glyph outlines
            glyph_names=True, # Keep glyph names as-is
        ))
        subsetter.populate(glyphs=keepGlyphs)
        subsetter.subset(font)

        print(f'Saving to {fontPathSubset}')
        font.save(fontPathSubset)
        print()

if __name__ == '__main__':
    main()