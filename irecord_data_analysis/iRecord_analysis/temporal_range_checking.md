# Temporal Range Checking
This checking system works in a similar way to the spatial range checking. The first step is to identify a pool of 'similar as possible' records of the given taxon and year. From this pool, the minimum and maximum day of year (0-366) is identified. Incoming records of the given taxon and year are then checked to see whether they extend past these bounds, which would indicate a *potential* error in determination.

The term 'day of year' is frequently abbreviated to 'doy', especially in code.

The data used in this section is only that which has passed the Checker. Automated bounds checking on a per-species level require exact-to-type precision in order to not fall foul of nomenclatural confusion. This precision is supplied by Understandings assigned by the Checker.

## Sources of major error
Ants are known to fail temporal range checks repeatedly, as their phenology leads to far greater year-round observations than other aculeate hymenoptera.

Human intervention is the other source of major error, for example where phenology is intervened with. Stem nesters are at particular risk from intervention, where nests are reared out to identify the specimen.

For this section, the only data which can be used is that which has passed the Checker. Bounds identification requires accurate true-to-type nomenclature, which is provided by Understandings assigned in the Checker.

## Impact of tolerance
Give that the temporal check is 'cutoff' check, it has minimal ability to adapt to records which are 'almost' within the time period. In the BWARS database, a 'tolerance' value can be applied to the outlier checking to ease the strain of checking large volumes of data. The following table examines the impact of various tolerances on the number of flagged records.

|Tolerance|# records|
|---|---:|
|0|5,047|
|1|4,814|
|2|4,576|
|3|4,366|
|4|4,173|
|5|4,019|
|6|3,825|
|7|3,668|
|10|3,235|
|14|2,807|
|21|2,239|

## Breakdown per taxon
This section uses a tolerance of 2 days, which is the same value used in BWARS import routines. In the absence of any statistical examination and experimentation around bounds checking, experience will have to provide a 'reasonable bound'. 2 days tolerance has proven to be a reasonable compromise between false positive/negative results.

Records must have their lower and upper dates be within the tolerance of one another in order for this check to work. Practically, this is removing records where the variance between the recorded lower and upper dates (e.g. month-only, year-only records) is greater than the permitted variance in checking. See table for example.

|Tolerance|Lower doy|Upper doy|Acceptable|
|---|:---:|:---:|:---:|
|2|113|113|Y|
|2|187|189|Y|
|2|201|209|N|
|1|165|167|N|
|2|1|366|N

### Breakdown of rejections per Understanding, all records
A breakdown of where the rejections occur, per Understanding

|Understanding|# rejections|
|---|---:|
|Vespa crabro: iso. Archer: 1989|	362
|Vespula vulgaris: iso. Archer: 1989|	344
|Bombus lapidarius: iso. Cameron et al: 2007|	332
|Bombus pratorum: iso. Cameron et al: 2007|	239
|Bombus hypnorum: iso. Cameron et al: 2007|	148
|Vespula germanica: iso. Archer: 1989|	120
|Bombus pascuorum: iso. Cameron et al: 2007|	86
|Colletes hederae: iso. Schmidt & Westrich: 1993|	84
|Andrena nitida: iso. Perkins: 1919|	66
|Bombus hortorum: iso. Cameron et al: 2007|	62
|Andrena cineraria: iso. Perkins: 1919|	59
|Anthophora plumipes: iso. Amiet et al: 2007|	58
|Dolichovespula media: iso. Archer: 1989|	54
|Bombus humilis: iso. Cameron et al: 2007|	45
|Andrena fulva: iso. Perkins: 1919|	45

## Breakdown per Understanding, `Correct` only
As above section, but using only `Correct` verification status 2 records.

|Understanding|# rejections|
|---|---:|
|Vespa crabro: iso. Archer: 1989|	168
|Bombus lapidarius: iso. Cameron et al: 2007|	117
|Vespula vulgaris: iso. Archer: 1989|	84
|Bombus hypnorum: iso. Cameron et al: 2007|	51
|Bombus pascuorum: iso. Cameron et al: 2007|	38
|Bombus pratorum: iso. Cameron et al: 2007|	35
|Vespula germanica: iso. Archer: 1989|	35
|Anthophora plumipes: iso. Amiet et al: 2007|	26
|Andrena cineraria: iso. Perkins: 1919|	24
|Andrena nitida: iso. Perkins: 1919|	23
|Bombus sylvarum: iso. Cameron et al: 2007|	22
|Bombus hortorum: iso. Cameron et al: 2007|	22
|Osmia cornuta: iso. Amiet et al: 2004|	19
|Andrena fulva: iso. Perkins: 1919|	18
|Bombus vestalis: iso. Cameron et al: 2007|	16

## Breakdown per Understanding, `Considered correct` only
As above section, but using only `Considered correct` verification status 2 records.

|Understanding|# rejections|
|---|---:|
|Bombus lapidarius: iso. Cameron et al: 2007|	92
|Vespula vulgaris: iso. Archer: 1989|	83
|Vespa crabro: iso. Archer: 1989|	52
|Bombus hypnorum: iso. Cameron et al: 2007|	29
|Bombus pratorum: iso. Cameron et al: 2007|	29
|Bombus pascuorum: iso. Cameron et al: 2007|	15
|Anthophora plumipes: iso. Amiet et al: 2007|	15
|Vespula germanica: iso. Archer: 1989|	14
|Bombus hortorum: iso. Cameron et al: 2007|	14
|Colletes hederae: iso. Schmidt & Westrich: 1993|	11
|Lasius flavus: iso. Bolton & Collingwood: 1975|	11
|Bombus sylvarum: iso. Cameron et al: 2007|	10
|Dolichovespula sylvestris: iso. Archer: 1989|	10
|Dolichovespula media: iso. Archer: 1989|	8
|Andrena fulva: iso. Perkins: 1919|	7

## Rates of error
A comparison of % error between 'Correct', 'Considered correct', and 'Plausible'. We can see that photo-verifying incoming data drastically increases the accuracy, but that data from experienced sources is yet drastically better still. 

|Grouping|All|Errors|% error|
|---|---:|---:|---:|
|Correct|85,845|1,022|1.2|
|Considered correct|98,154|572|0.6|
|Plausible|4,714|150|3.2|
|Considered correct**|98,154|507|0.5|

** 'Considered correct' with the two main verifiers who used 'verification status 2' as confidence-based removed.

Comparison to BWARS is not possible at this point, since using BWARS data to check itself results in a perfect (meaningless) score.

## Discussion

### Human disturbance
Of these, *Vespa crabro*, *Vespa vulgaris*, and *Vespula germanica* all hibernate in places which humans regularly disturb. Wood piles, chimneys etc. A quick sampling of records strongly suggests a pattern of disturbance, with many correspondants writing such.

### *Bombus lapidarius*
This taxon has been the subject of a previous project which looked at emergence. The project found that a great many people are misidentifying this taxon, which explains the large number of 'too-early' records.

### *Bombus pratorum*/*pascuorum*
Conversations with Mike Edwards suggests that the majority of these are the result of misidentification.

### *Bombus sylvarum*
A lot of suspicious records. Mike Edwards's comment was that this would be unusual to find on Hawthorne flowers in mid February.

## Conclusion
A *lot* more errors than expected, especially on taxa where errors *shouldn't* be found. Enough errors and warning signs to make me very cautious over using the data as a whole, given that this is the tip of the 'invisible iceberg' of 'wrong-but-can't-find-it' records. The underlying taxon distribution of records is so heavily weighted to very few taxa that attempting to understand rates of error in the less-common taxa very quickly reaches the point where there are not enough records to reach a supportable level of confidence in statistical approaches.

Once again, it seems that photo-verification produces a very different set of results to expert identification, with 'Considered correct' data being higher quality than 'Correct'. The concern with utilising 'Considered correct' data is that records may be 'more' incorrect than those which have been examined by experts. Unfortunately there does not yet exist a tested and understood method to do such.