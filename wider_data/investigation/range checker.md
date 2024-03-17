# BWARS Range Checker
This document offers a brief outline of the higher-level processes underlying the BWARS range checker. The range checker is not designed, nor capable, or replacing an experienced human. What it *does* do is highlight some more unusual aspects of records to draw human attention.

## Overall system
Knowing whether an occurrence record is 'expected' or not is a very complex task. The subject taxa are known to shift their expected distributions between years, primarily in response to climate variation. As such, it is impractical to define a single boundary which all records are expected to adhere to.

As an example, *Philanthus triangulum: iso. Richards: 1980* has significantly expanded northwards over the past 40 years. As such, comparing a record from 40 years ago to the current known distribution has a high probability of accepting incorrect records. The same is true for temporal distribution, the impacts of which has been the subject of many research papers. In general, a taxon can be expected to move +/- 2 weeks, depending on the climate of that cycle.

However, attempting to restrict checks to a per-year basis for most taxa will result in an incredibly threadbare result. The following shows the distribution of all accepted records of *Vespula rufa: iso. Archer: 1989*, which was selected at random

![*Vespula rufa: iso. Archer: 1989* all years](../../diagrams/range_checker/v%20rufa%20all.svg)

Selecting, at random, 2018's data results in the following map

![*Vespula rufa: iso. Archer: 1989* 2018](../../diagrams/range_checker/v%20rufa%202018.svg)

Quite clearly, the 2018 data likely does not represent the 'true' distribution of *Vespula rufa: iso. Archer: 1989* in 2018. This lack of representation is quite simply the result of low data volume and is common throughout the BWARS dataset.

## Year bounding
The solution BWARS has applied to this attempts to strike a balance between precision and data volume. When given a year `Y` and taxon `T`, the database calculates the number of records within one year either side of `Y` for that taxon `T`. This range is `Y +1 -1`. If the number of records of `T` in `Y +1 -1` is fewer than 200, the range of `Y` is expanded until it is e.g. `Y +1 -2`, `Y +2 -2` etc.

For *Vespula rufa: iso. Archer: 1989* in 2018, the bounds for `Y` are 2012 and 2022 resulting in 202 records total. This results in the map

![*Vespula rufa: iso. Archer: 1989* 2015-2020](../../diagrams/range_checker/v%20rufa%20bounded.svg)

The same bounded date range is used to calculate the absolute minimum and maximum recorded day of year (DoY) of records within range. For *Vespula rufa: iso. Archer: 1989*, this gives a minimum expected DoY of 86 (March 27th) and a maximum DoY of 295 (October 22nd).

## Buffering
To add space for expansion and/or uncertainty driven by low sampling volume to the spatial distribution, a buffer of 40 km is applied to the result. This distance represents a generic 'expected distribution radius' i.e. the range in which it would not be at all surprising to find the taxon.

![*Vespula rufa: iso. Archer: 1989* 2015-2020](../../diagrams/range_checker/v%20rufa%20buffered.svg)

Ideally, a similar statistical method would be applied to the temporal bounding. However, initial testing did not reveal a satisfactory result in the time available.