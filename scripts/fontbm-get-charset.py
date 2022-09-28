#!/usr/bin/env python3

'''
fontbm requires a range and/or list of Unicode codepoints, and there doesn't 
seem to be any option to just include all characters in the font. So we have
to generate a list here to use in the build script.
'''

from fontTools.ttLib.ttFont import TTFont
from sys import argv

def main():
    font = TTFont(argv[1])

    # For some reason glyphs aren't decompiling before we access them. Bug?
    font.ensureDecompiled()

    chars = font['cmap'].getBestCmap().keys()
    print(','.join([str(c) for c in chars]))

if __name__ == '__main__':
    main()