# Temporal Range Checking
Thd temporal checking system works in a similar way to the spatial range checking. The first step is to identify a pool of 'similar as possible' records of the given taxon and year. From this pool, the minimum and maximum day of year (0-366) is identified. Incoming records of the given taxon and year are then checked to see whether they extend past these bounds, which would indicate a *potential* error in determination.

The term 'day of year' is frequently abbreviated to 'doy', especially in code snippets and explanations found online. Should there be a need to relate day of year back to a given Julian calendar date, NASA provide a useful calendar tool to help do that: https://www.esrl.noaa.gov/gmd/grad/neubrew/Calendar.jsp

The data used in this section is only that which has passed the Checker. Automated bounds checking on a per-species level require exact-to-type precision in order to not fall foul of nomenclatural confusion. This precision is supplied by Understandings assigned by the Checker.

## Sources of major error
Ants are known to fail temporal range checks repeatedly, as their phenology leads to far greater year-round observations than most other aculeate hymenoptera.

Human intervention is the other source of major error, for example where phenology is intervened with. Stem nesters are at particular risk from intervention, where nests are reared out under altered conditions to identify the specimen.

For this section, the only data which can be used is that which has passed the Checker. Bounds identification requires accurate true-to-type nomenclature, which is provided by Understandings assigned in the Checker.

## Impact of tolerance
Give that the temporal check is 'cutoff' check, there is minimal ability to adapt to records which are 'almost' within the time period. In the BWARS database, a 'tolerance' value can be applied to the outlier checking to ease the strain of checking large volumes of data. The following table examines the impact of various tolerances on the number of flagged records.

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
A breakdown of temporal rejections, using various grouping metrics. This section uses a tolerance of 2 days, which is the same value used in BWARS import routines. In the absence of any statistical examination and experimentation of bounds checking, experience will have to suffice to provide a 'reasonable bound'. 2 days tolerance has proven to be a reasonable compromise between false positive/negative results during BWARS data entry.

Records must have their lower and upper dates be within the tolerance of one another in order for temporal range checking to work. Practically, this requirement removes records where the variance between the recorded lower and upper dates (e.g. month-only, year-only records) is greater than the permitted variance in checking. See table for example.

|Tolerance|Lower doy|Upper doy|Acceptable|
|---|:---:|:---:|:---:|
|2|113|113|Y|
|2|187|189|Y|
|2|201|209|N|
|1|165|167|N|
|2|1|366|N

### Breakdown of rejections per Understanding, all records
A breakdown of where temporal rejections occur, per Understanding

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
A breakdown of where temporal rejections occur, per Understanding, using only `Correct` verification status 2 records.

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
A breakdown of where temporal rejections occur, per Understanding, using only `Considered correct` verification status 2 records.

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

## Rates of rejection
A comparison of % rejection between various verification 2 statuses. We can see that photo-verifying incoming data drastically increases accuracy, but that data from experienced sources is yet drastically better still. 

|Grouping|All|Rejections|% rejection|
|---|---:|---:|---:|
|Correct|85,845|1,022|1.2|
|Considered correct|98,154|572|0.6|
|Plausible|4,714|150|3.2|
|Considered correct**|98,154|507|0.5|
|Not reviewed|82,349|1,217|1.5|
|Verified, other than C/CC|6,595|257|3.9|

** 'Considered correct' with the two main verifiers who used 'verification status 2' as confidence-based removed.

Comparison to BWARS is not possible at this point, since using BWARS data to check itself results in a perfect (meaningless) score.

## Discussion

### Human disturbance
Of the most common rejected Understandings, *Vespa crabro*, *Vespa vulgaris*, and *Vespula germanica* all hibernate in places which humans regularly disturb. Wood piles, chimneys etc. A quick sampling of records strongly suggests a pattern of disturbance, with many correspondants writing that they encountered the specimen through disturbing it whilst hibernating.

### *Bombus lapidarius*
*Bombus lapidarius* has been the subject of a previous project which looked at date of emergence. The project found that a great many people are misidentifying this taxon, which explains the large number of 'too-early' records. Many 'out of bounds' records in this sector are out by > 40 days compared to those in BWARS. Either BWARS data is highly insufficient, or the verifications of this taxon are incorrect. Examination of the BWARS records over multiple years provides a high degree of continuity, suggesting significant misidentification. The timings provided by the BWARS data also match up to those expected by ecologists, whilst the timings provided by iRecord data contradict expectations.

### *Bombus pratorum*/*pascuorum*
Conversations with Mike Edwards suggests that the majority of rejected records of these two taxa are the result of misidentification.

### *Bombus sylvarum*
A lot of suspicious rejected records. Mike Edwards's comment was that this would be unusual to find on Hawthorne flowers in mid February, as claimed by a subsample of records.

### Does verification work?
Yes. The 'verified other than correct/considered correct' data runs a rejection rate of 3.9% against that of verified data at 1.2%. Incoming data sits at 1.5%, though this value is highly affected by the presence of large volumes of data destined for 'Considered correct' i.e. acceptance based on the verifier's trust in the recorder. As such, photographic verification provides a greater than 0.3% decrease in rejections than suggested by pure figures.

### Further investigation
The main avenue which entomologists would like to explore are the potential 'confusion' taxa which are leading to the out-of-bounds records. Knowing the potential confusions for photographic recording will aid future verifiers avoid such situations, leading to higher quality data output.

## Conclusion
Far more temporal rejections than expected were encountered. The degree of tolerance for the day of year (doy) made a significant impact on the number of rejections. However, even unsuitable tolerances e.g. 21 days resulted in far more rejections than expected.

A value of '2 days' was selected for the tolerance in further exploration, as it is the value which has been used for BWARS. Note that a rejection cannot be considered an error until it has been checked by a human.

Examination of the Understandings present in rejections provides a good amount of insight into causes. Vespids make up a significant proportion of the most common rejections, with the likely reason that these are 'disturbances' of behaviour e.g. interruption of hibernation. Other taxa are far more concerning, especially given the lack of probability that the verifiers would get the identification incorrect given physical specimens.

'Considered correct' data has a lower volume of rejection in both absolute and percentage terms than 'Correct' data. 'Unverified' data has a higher volume of rejection than both 'Correct' and 'Considered correct'.

Further examination is required to delve further into this scenario. Enough information has been gathered, however, to provide a reasonable picture of the state of the data to the Red List core team. Verification is resulting in fewer temporal rejections, but the exact size of the resulting data/rejection rate is unknowable without a before & after comparison.