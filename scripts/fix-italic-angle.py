#!/usr/bin/env python3

# Italic angle is not used in the .glyphs source (because it's a pixel font!)
# but Google Fonts requires post.italicAngle to be set on italic fonts.

from fontTools.ttLib import TTFont
from sys import argv

if argv[1].endswith('-Italic.ttf'):
	f = TTFont(argv[1])
	f['post'].italicAngle = -16
	f.save(argv[1])