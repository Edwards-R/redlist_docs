# Instructions on outputs
> Never ever ever do this in Filemaker again. It worked, but I hate life now.

## Export data from Filemaker
Search by `used = yes` and `ant`/`bee`/`wasp`. Export the `markdown` attribute as a csv

## Clean up CSV
Remove all `newline "` from the CSV
Top-and-tail the two remaining `"` characters
Replace `` with `newline`

## Rename
Change from `.csv` to `.md`

## Run mdsplit
`python3 mdsplit.py x.csv`