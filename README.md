# Sample GNU Make tasks for introducing Gettext style translation management for JavaScript Style Standard

Prerequisites: [po4a][], [Poetry][], and [GNU Make][].

`make -f gettextize.mk` to gettextize from current Markdown
translation to PO file.

`make`to generate translations.

## Licenses

Copyright 2023 gemmaro.

The contents included in the patch file (`patch.diff`) and PO files
(`en.pot` and `ja.po`) are from [Standard][], and licensed under the
MIT License (`LICENSE-standard`).

The sources such as makefiles are also licensed under the MIT License
(`LICENSE`).

[GNU Make]: https://www.gnu.org/software/make/
[Poetry]: https://python-poetry.org/
[Standard]: https://standardjs.com/
[po4a]: https://po4a.org/
