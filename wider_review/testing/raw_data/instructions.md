# Instructions on outputs
> Never ever ever do this in Filemaker again. It worked, but I hate life now.

## Export data from Filemaker
Search by `used = yes` and `ant`/`bee`/`wasp`. Export the `full_jeykll` attribute as a csv

## Clean up CSV
Remove all `newline "` from the CSV
Top-and-tail the two remaining `"` characters
Replace `` with `newline`

## Rename
Change from `.csv` to `.md`

## Run mdsplit
`python3 mdsplit.py x.md`

## Make Jeykll indexes
In each group folder (ant/bee/wasp), make a file called `index.md`. Insert the following:

```
---
parent: 1992-2021 GB Aculeate Hymenoptera Red List (DRAFT)
title: *pick one* ant/bee/wasp
---
```

This file acts as the landing point for each category, and allows the sorting of the pages into their groups

## Make the Jeykll Maps
Run the `red_list` branch of the rust_map project. Place the results into `docs/maps`.

### And then remove the indexes
If you copied via Windows, remove the identifiers:
`sudo rm *.Identifier`

## Add in the Jeykll headers
```
---
parent: *pick one* ant/bee/wasp
---
```

Use regex search `^#` for finding the start of each file for insert/replace via VSCode

> Yes this is convoluted as all hell. It would have been better to just make each file in a loop blah blah. This is why design hell exists. This was never intended, stretch goal'd, and way past spec. Don't ever copy this terrible idea, do it properly.