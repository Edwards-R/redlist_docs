# Web Building Guide

## Filemaker Export
For each major group (ant/bee/wasp), export `binomial::binoimial`, `full_jeykll` in `.mer` format. Make sure to check for `utf-8` formatting.

Place the three files into `web_build/source`

## Prep
Run `pdm run web_build/build.py` to build the pages

## Move
From the root Red List project, run `mv -v web_build/out/ docs/`