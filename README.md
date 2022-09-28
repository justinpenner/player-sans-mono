![Player Sans Mono sample image](assets/player-sans-mono.png)


Player Sans Mono
================

[![][Fontbakery]](https://justinpenner.github.io/player-sans-mono/fontbakery/fontbakery-report.html)
[![][Universal]](https://justinpenner.github.io/player-sans-mono/fontbakery/fontbakery-report.html)
[![][GF Profile]](https://justinpenner.github.io/player-sans-mono/fontbakery/fontbakery-report.html)
[![][Outline Correctness]](https://justinpenner.github.io/player-sans-mono/fontbakery/fontbakery-report.html)
[![][Shaping]](https://justinpenner.github.io/player-sans-mono/fontbakery/fontbakery-report.html)

[Fontbakery]: https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fjustinpenner%2Fplayer-sans-mono%2Fgh-pages%2Fbadges%2Foverall.json
[GF Profile]: https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fjustinpenner%2Fplayer-sans-mono%2Fgh-pages%2Fbadges%2FGoogleFonts.json
[Outline Correctness]: https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fjustinpenner%2Fplayer-sans-mono%2Fgh-pages%2Fbadges%2FOutlineCorrectnessChecks.json
[Shaping]: https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fjustinpenner%2Fplayer-sans-mono%2Fgh-pages%2Fbadges%2FShapingChecks.json
[Universal]: https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fjustinpenner%2Fplayer-sans-mono%2Fgh-pages%2Fbadges%2FUniversal.json

An open-source/libre typeface family designed for video game developers.

Features
--------

- Monospaced 8×8 (Latin English) and 8×13 (Latin Extended) character sets
- Light, Classic, Italic and Bold styles
- Extensive set of font formats (`.otf`/`.ttf`/`.woff`/`.woff2`)
- Source files (`.glyphs` and `.ufo` format) so you can contribute or make your own edits

Changelog
---------

**21 August 2021. Version 0.001**

- Initial release

**25 September 2022. Version 1.000**

- Updated sources, repo structure, and build process to work with Google Fonts platform and pass all QA tests in [FontBakery](https://github.com/googlefonts/fontbakery).
- Added build scripts so that anyone can build the fonts with open-source tooling, instead of using the proprietary Glyphs app.
- Added builds and build scripts for the BMFont bitmap font format, commonly used in video game engines.


Usage/Installation
------------------

This package includes `.ttf` desktop fonts which you can install on your system and import into many game engines. Web fonts are also included in `.woff2` format for use on the web and in browser-based game engines.

Converting to bitmap font formats
---------------------------------

Some game engines require bitmap fonts, typically in the BMFont format. The BMFont format comes in a variety of forms, usually a `.png` image (or a sequence of images) and a data file (`.txt`, `.xml`, `.bin`, or `.json`).

You can generate these files via the original [BMFont for Windows](https://www.angelcode.com/products/bmfont/) by AngelCode, but it doesn't always give perfect pixel-for-pixel results when converting pixel fonts. Instead, I would recommend the cross-platform command line tool [fontbm](https://github.com/vladimirgamalyan/fontbm), which has been 100% accurate in my tests so far.

Future
------

- More build formats for more game engine support
- Build scripts
- Extend character set further
- Proportional-width styles

License
-------

This Font Software is licensed under the SIL Open Font License, Version 1.1. This license is in this repo OFL.txt and is also available with a FAQ at: https://scripts.sil.org/OFL.

Questions and contributions
---------------------------

Email: justin@justinpenner.ca
Repo: https://github.com/justinpenner/player-sans-mono/
