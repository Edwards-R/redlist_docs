# Request for Quotation
This document is for notes on specific things that need to be done/noted fully for the entire project.

Items which will require significant additional time are demarcated with `{T}`

Items which require further thought/rulings/modifications are marked with `{M}`

## 'Citizen Scientists' and iRecord
It is a misnomer to call iRecord data 'citizen science'. Some portion of it is, quite a lot of it isn't. For example, the POMS data is present on iRecord. This is from material collected as part of a scientific project and identified by Hymettus contractees, who are most certainly not beginner-level identifiers.

## Exclusion of narrative species accounts
Noted

## Channel Islands-only taxa
To be listed and marked as Not Applicable. Also includes taxa which are present in the system for nomenclatural confusion/quality assurance purposes.

## Output in Word format
This can be done, but does not meet the [FAIR standard](https://www.nature.com/articles/s41597-022-01710-x) for documentation. Documentation will be constructed and provided in Markdown format, which *is* FAIR, then exported to Word.

## UKSI
Put simply, Understandings supplant the current (2024-03-01) UKSI. An Understanding should not ever be matched back to a UKSI entry, as to do so is categorically incorrect. It is possible to relate data under any Understanding back to a taxonomic type *precisely*. It is *not* possible to do that for all taxa contained in the UKSI.

The best solution we can make, without causing immediate error, is to connect TVKs were there are no concerns over accuracy. This is still a very poor solution that has a moderate chance of causing future errors. Attempting to coerce a 3NF system into treating a 2NF system as the 'main' branch is never going to end well.

## `{T}`Synonymy
Recent, widespread use synonyms - **Need to add in time for this** or just use the Understandings list - it's what it does.

## `{T}`Vernacular
Highly inadvisable. Vernacular is not at all consistent or reliable. There are disagreements over vernacular, taxonomic splits don't even get recognised in vernacular etc. The inclusion of vernacular is a disastrous pit of potential error that should be utterly avoided at all costs. Let the inventors of vernacular be responsible for translating scientific nomenclature to vernacular, do not try and conduct science with it.

If this approach *is* chosen, it is recommended to produce a separate list that details vernacular in a junior mannor to synonymy rather than to Understandings or even binomials. The same piece of vernacular has been applied to multiple differing interpretations of taxa, which critically limits any applicability to science.

## Non-native taxa
The plan does not cover 'nativeness' at all, as this is a highly debated topic. See [the ruling](../rulings.md#nativeness) for full text.

## `{M}`Endemics
Need to add finding these to the process specs and to the assessment form. As far as we know, we don't have any endemic species.

## `{M}`NA/NE/EX/RE categories
Need a table/rulings on how these are specifically used. There are some taxa that are still on various lists that need striking off as never having actually been present. The 'Chauner Rarities' are one example, where a number of extremely confusing taxa were identified once, by a singular person, in an extremely odd place/time, never to be found again.

## More TVK requirements
More of these. It can sort of be done, but not fully due to limitations of the TVK being 2NF. See [previous statement for more details](#uksi).

## Non-use of a criterion
If a criterion is not used, the criterion must still be displayed (somehow) and marked as 'na'. If every criterion has to be used, despite inapplicability, then it will need attaching to some form of model. This goes against fundamental system design methodology and needs careful consideration to prevent inclusion of a designed null value from causing havoc.

## `{T}` Previous reviews
These will need sourcing in a digital format and their nomenclature modernising before they can be used. Depending on the source format, the Checker should handle the nomenclature fairly easily.

## IUCN Global categories
As far as anyone knows, this doesn't exist

## GB rarity status
Classifications are required for
 - Not enough data to reach a reliable conclusion
 - Not evaluated
 - 101+ hectad

Without these being separated, a blank entry may be interpreted incorrectly

## `{T}``{M}`Generation time
This is dangerous. Ant generation times are specialist knowledge and would likely require significant research to uncover what is known to begin with. We'll need to come up with a ruling for how to arrive at this figure.

Almost every taxon evaluated here has the potential to enter extended dormancy for at least one extra year. There are also taxa which operate on both sub-annual and annual cycles - which is the 'correct' figure to pick? What about taxa that operate on an obligate multi-brood cycle yet exhibit not eusociality?

## % Population change
Not possible. Flat and blunt answer. We ***do not have*** population data, regardless of how desirable it may be to have it. It doesn't exist. End of story.

## 'Flag' fields
There's suddenly a request for a lot of flag fields related to criteria sub-assessment protocols. Is this supposed to be used for this purpose, or so specific other purposes?

## Continuing Decline
Need more information on what constitutes continuing decline. C1 is not possible to reliably and consistently apply to the taxon under an evidentiary Red List assessment, as any assessment utilising C1 results in `DD` due to the lack of evidence to support population estimation.

## Severely Fragmented
We don't have a model that specifically evaluates aculeate Hymenoptera fragmentation, or even data on the dispersal distance for most taxa. When combined with the sporadic, often low volume, survey effort it becomes impossible to construct a model which meets the Red List criteria for 'severely fragmented'. At *best* we would be eyeballing the buffer-union maps on a 30-year basis to look for fragmentation.

## `{M}`Extinction cut off date
Need to add this to rulings.

`This is the date before which the loss of a species would not be recorded in the Assessment (IUCN guidance is that this should normally be no earlier than 1500AD).`

## `{M}` Near Threatened
Need to create a ruling for how Near Threatened is applied

