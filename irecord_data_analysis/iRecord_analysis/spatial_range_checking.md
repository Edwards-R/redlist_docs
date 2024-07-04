## Spatial Range Checking
The spatial checking system works in a similar way to temporal range checking. The first step, in both spatial and temporal systems, is to identify a pool of 'similar as possible' records of the given taxon and year. The spatial distribution of this pool of records is then plotted, followed by a 40 km buffer.

The data used in this section are only those which have passed the Checker. Automated bounds checking on a per-species level require exact-to-type precision in order to not fall foul of nomenclatural confusion. This precision is supplied by Understandings assigned by the Checker.

Note that this routine does not evaluate any magnitude of rejection. For a Red List, magnitude of rejection is an incredibly important metric for the purpose of spatial threat categories. Two records which are extremely out of known range will likely have far more impact on spatially based threat categories than a hundred 'just outside' records. As the number of known records gets smaller and smaller, it becomes even more imperative to only use trusted data given the greater impact each individual records possesses.

>An attempt at examining this 'magnitude of rejection' was made during this project. The method looks at the distance from a given record to the edge of the 40km envelope. This distance is then combined with others in any applicable groupings to establish metrics, or individual records can be examined. Bear in mind that this *is* a first attempt to use this particular metric, even if the foundation is fundamental geometry.

### Sources of major error
The 40 km buffer used represents the generalised expected potential colonisation front of the taxon. Due to the lack of information on taxon-specific colonisation fronts it was not possible to create bespoke distances. The 40 km buffer region has been used in prior work successfully, including the BWARS import routine, and as such the distance has been used in this project as well.

However, as with all generalisations, there are likely taxa to which the 40 km radius is more applicable to than others. As before, the lack of strong comparable evidence makes the construction of an autecologically-based taxon-specific metric impractical.

BWARS does not seek or process data pertaining to *Apis* as such records are considered agricultural rather than ecological in nature. As such, all records of *Apis* are removed from this analysis.

### Breakdown of rejections per Understanding
This section breaks down the rejections from the routine to examine the distribution of Understandings in combination with different verification status 2.

#### Breakdown of rejections per Understanding, all records
A breakdown of where rejections occur, per Understanding.

| Understanding                                   | # rejections |
| ----------------------------------------------- | -----------: |
| Anthophora plumipes: iso. Amiet et al: 2007     |          388 |
| Vespa crabro: iso. Archer: 1989                 |          327 |
| Vespula vulgaris: iso. Archer: 1989             |          297 |
| Osmia bicornis: iso. Amiet et al: 2004          |          270 |
| Bombus hypnorum: iso. Cameron et al: 2007       |          259 |
| Andrena fulva: iso. Perkins: 1919               |          241 |
| Lasius flavus: iso. Bolton & Collingwood: 1975  |          216 |
| Anthidium manicatum: iso. Amiet et al: 2004     |          209 |
| Colletes hederae: iso. Schmidt & Westrich: 1993 |          191 |
| Vespula germanica: iso. Archer: 1989            |          187 |
| Bombus muscorum: iso. Cameron et al: 2007       |          178 |
| Andrena clarkella: iso. Perkins: 1919           |          173 |
| Bombus pascuorum: iso. Cameron et al: 2007      |          163 |
| Andrena haemorrhoa: iso. Amiet et al: 2010      |          155 |
| Bombus humilis: iso. Cameron et al: 2007        |          152 |

#### Breakdown per Understanding, `Correct` only
Using only `Correct` verification status 2 records. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

| Understanding                               | # rejections |
| ------------------------------------------- | -----------: |
| Anthophora plumipes: iso. Amiet et al: 2007 |          161 |
| Vespa crabro: iso. Archer: 1989             |          122 |
| Andrena fulva: iso. Perkins: 1919           |           92 |
| Osmia bicornis: iso. Amiet et al: 2004      |           56 |
| Bombus hortorum: iso. Cameron et al: 2007   |           54 |
| Anthidium manicatum: iso. Amiet et al: 2004 |           49 |
| Andrena bicolor: iso. Amiet et al: 2010     |           46 |
| Nomada goodeniana: iso. Perkins: 1919       |           46 |
| Andrena cineraria: iso. Perkins: 1919       |           44 |
| Bombus vestalis: iso. Cameron et al: 2007   |           43 |
| Andrena nigroaenea: iso. Perkins: 1919      |           43 |
| Nomada marshamella: iso. Perkins: 1919      |           43 |
| Bombus jonellus: iso. Cameron et al: 2007   |           40 |
| Andrena clarkella: iso. Perkins: 1919       |           40 |
| Bombus hypnorum: iso. Cameron et al: 2007   |           37 |

#### Breakdown per Understanding, `Considered correct` only
Using only `Considered correct` verification status 2 records. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

| Understanding                               | # rejections |
| ------------------------------------------- | -----------: |
| Vespa crabro: iso. Archer: 1989             |           90 |
| Anthophora plumipes: iso. Amiet et al: 2007 |           84 |
| Bombus hypnorum: iso. Cameron et al: 2007   |           37 |
| Bombus lapidarius: iso. Cameron et al: 2007 |           28 |
| Bombus pascuorum: iso. Cameron et al: 2007  |           27 |
| Bombus pratorum: iso. Cameron et al: 2007   |           25 |
| Vespula vulgaris: iso. Archer: 1989         |           25 |
| Andrena fulva: iso. Perkins: 1919           |           22 |
| Bombus hortorum: iso. Cameron et al: 2007   |           22 |
| Andrena cineraria: iso. Perkins: 1919       |           22 |
| Bombus muscorum: iso. Cameron et al: 2007   |           22 |
| Bombus monticola: iso. Cameron et al: 2007  |           22 |
| Osmia bicornis: iso. Amiet et al: 2004      |           20 |
| Bombus vestalis: iso. Cameron et al: 2007   |           19 |
| Anthidium manicatum: iso. Amiet et al: 2004 |           17 |

### Rates of rejection
A comparison of % error between various verification status 2 results. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

| Grouping           |     All | Errors | % error |
| ------------------ | ------: | -----: | ------: |
| Correct            |  91,207 |  1,999 |     2.2 |
| Considered correct | 105,568 |  1,157 |     1.1 |
| Plausible          |   4,797 |    367 |     7.7 |
| Incorrect          |     559 |     74 |    13.2 |
| Unable to verify   |   1,916 |    277 |    14.5 |
| Not reviewed       |  88,442 |  3,765 |     4.3 |

### Magnitude of rejection
>This is an experimental metric which has been developed during this analysis. Take care interpreting the result as there has been minimal time to review and fully interpret the results. Conclusions drawn from this section are deliberately vague and restricted to only statements with high confidence.

Magnitude of rejection is calculated as the direct distance between a record and the edge of the relevant year-matched 40 km buffer for that taxon. The sections below examine the mean magnitude for a given taxon, as well as the standard deviation for that taxon. Take care when interpreting these figures, as the number of records makes a significant impact on the reliability of these other metrics.

#### Magnitude, correct only
The 15 most common rejected Understandings for the `Correct` verification status 2 status. Sorted by mean, descending

| Understanding                               | Mean (m) | Std Dev (m) | Num records |
| ------------------------------------------- | -------: | ----------: | ----------: |
| Anthophora plumipes: iso. Amiet et al: 2007 |   53,682 |      41,923 |         161 |
| Bombus jonellus: iso. Cameron et al: 2007   |   41,942 |      35,035 |          40 |
| Bombus vestalis: iso. Cameron et al: 2007   |   35,597 |      29,224 |          43 |
| Andrena clarkella: iso. Perkins: 1919       |   27,428 |      20,256 |          40 |
| Nomada goodeniana: iso. Perkins: 1919       |   25,827 |      26,793 |          46 |
| Anthidium manicatum: iso. Amiet et al: 2004 |   23,801 |      21,174 |          49 |
| Andrena fulva: iso. Perkins: 1919           |   23,520 |      22,257 |          92 |
| Andrena nigroaenea: iso. Perkins: 1919      |   20,919 |      21,646 |          43 |
| Vespa crabro: iso. Archer: 1989             |   18,302 |      17,994 |         122 |
| Andrena bicolor: iso. Amiet et al: 2010     |   17,815 |      14,336 |          46 |
| Nomada marshamella: iso. Perkins: 1919      |   16,497 |      16,512 |          43 |
| Bombus hypnorum: iso. Cameron et al: 2007   |   16,406 |      17,802 |          37 |
| Andrena cineraria: iso. Perkins: 1919       |   15,663 |      10,894 |          44 |
| Osmia bicornis: iso. Amiet et al: 2004      |   12,571 |      14,528 |          56 |
| Bombus hortorum: iso. Cameron et al: 2007   |   12,028 |      24,870 |          54 |

#### Magnitude, considered correct only
The 15 most common rejected Understandings for the `Considered correct` verification status 2 status. Sorted by mean, descending

| Understanding                               | Mean (m) | Std Dev (m) | Num records |
| ------------------------------------------- | -------: | ----------: | ----------: |
| Anthophora plumipes: iso. Amiet et al: 2007 |   38,099 |      32,458 |          84 |
| Bombus muscorum: iso. Cameron et al: 2007   |   35,672 |      23,252 |          22 |
| Anthidium manicatum: iso. Amiet et al: 2004 |   25,351 |      25,668 |          17 |
| Bombus monticola: iso. Cameron et al: 2007  |   24,364 |      24,454 |          22 |
| Bombus pratorum: iso. Cameron et al: 2007   |   21,069 |      24,612 |          25 |
| Andrena fulva: iso. Perkins: 1919           |   20,193 |      22,970 |          22 |
| Osmia bicornis: iso. Amiet et al: 2004      |   18,114 |      15,281 |          20 |
| Vespula vulgaris: iso. Archer: 1989         |   15,798 |      22,918 |          25 |
| Bombus hypnorum: iso. Cameron et al: 2007   |   15,400 |      26,099 |          37 |
| Vespa crabro: iso. Archer: 1989             |   15,023 |      15,781 |          90 |
| Bombus lapidarius: iso. Cameron et al: 2007 |   14,907 |      21,734 |          28 |
| Bombus pascuorum: iso. Cameron et al: 2007  |   13,885 |      17,573 |          27 |
| Andrena cineraria: iso. Perkins: 1919       |   13,881 |      11,593 |          22 |
| Bombus hortorum: iso. Cameron et al: 2007   |   13,136 |      16,114 |          22 |
| Bombus vestalis: iso. Cameron et al: 2007   |   11,919 |      15,824 |          19 |

#### Spatial magnitude per verification status 2
A breakdown of rejections, grouped by their verification status 2

| Understanding      | Mean (m) | Std Dev (m) | Num records |
| ------------------ | -------: | ----------: | ----------: |
| Correct            |   28,179 |      34,162 |       2,295 |
| Considered correct |   24,409 |      31,712 |       1,511 |
| Plausible          |   38,488 |      52,770 |         389 |
| Unable to verify   |   95,041 |     116,600 |         341 |
| Incorrect          |   95,704 |     110,405 |         103 |
| Not reviewed       |   34,081 |      44,687 |        3765 |
| NULL               |   34,852 |      50,341 |        1110 |

### Discussion
#### Expansion potential
The spatial ranges of numerous taxa have expanded over the duration covered by iRecord and BWARS, with many species now entering geographic ranges where recorder coverage is poor. If gaps in recorder coverage are larger than, or even approaching, the 40 km buffer range, then it is possible for expansions of a taxon to go undetected until the taxon passes back into the range of a recorder. There appear to be signs of this happening in the BWARS data that iRecord data could address, but entomologists have repeatedly expressed concerns and displeasure at the amount of error also contained in iRecord data.

#### Major sources of rejection
Two major clusters of spatial rejections were identifed. One such cluster was, bar one record, a cluster of *Apis mellifera* records. Since records of *Apis* are considered records of livestock, BWARS does not source much of this data. In turn, the lack of data leads to many rejections of *Apis* records. To solve this, *Apis* was removed from consideration.

The second main cluster of rejection was from the Isle of Mull (an island to the west of Scotland). BWARS records from this area are very few and far between, which resulted in a large void in the 40 km buffer. An entomologist has been submitting data from within this void to iRecord, in excellent volume and with commendable caution, which resulted in a large cluster of rejected records. This cluster was considered a 'true' rejection - though not an error - and left in the analysis to avoid creating bias.

#### *Bombus hypnorum*
This taxon is one which underwent colonisation followed by significant, rapid expansion. The presence of this taxon near the top of the `Considered correct` rejections list is entirely expected, though records will still need examination to the degree of magnitude involved in the rejection.

#### *Anthophora plumipes*
An awkward species. Thought to have expanded rapidly over the past few years, there are still significant identification problems with two common bumblebees that led consulted entomologists to express concern and uncertainty over data quality.

#### Lack of general theme
In the temporal range checker there is a general theme of 'disturbed/interrupted behaviour' which explains a large number of the most common rejections. In the spatial set there is no such obvious, demonstrated, theme that covers any large group of taxa.

#### 'Correct' vs 'Considered correct'
On all examined metrics, `Considered correct` data has performed better than `Correct` data. Such a result mirrors all other checks performed on this dataset, though it is still impossible to say whether this subset of data *is* better, or whether this increase in quality metric is an artefact of increased recorder coverage.

#### Does verification work
Yes. Verifying data produces a higher quality result than the input. It is suspected that removing the records destined for `Considered correct` would only enhance the impact shown by photo verification. The exact impact of verification cannot be determined without a before & after comparison however, which would require a separate project.

#### Magnitude of rejection
As a first attempt, magnitude of rejection's strength in finding incorrect records cannot be established until a human re-examines the suspect records. As a technique for finding potentially impactful new data in a high-uncertainty area, magnitude seems very promising. Given the importance of maintaining clean data, especially in scarcer taxa, ways to separate range expansion from misidentification or errors in data entry are always worth exploring.

#### Further investigation
Magnitude of rejection provides the potential to investigate the appropriate size of the currently static 40 km buffer. Magnitude of rejection also provides a means to target human re-verification (or verification) to the size of rejection. Larger magnitudes should act as indicators to the verifier to be even more cautious of a given record.

Magnitude of rejection also provides a means to track the impact of different sized buffers, leading to a statistically backed per-taxon buffer size. In turn, accurate buffers will lead to more accurate data entry as well as more accurate buffer-union metrics for the Red List.

Many tests performed in this project require an A:B experiment to be performed to assess the 'true' impact of verification, as human intervention and re-verification is the only currently acceptable way to improve accuracy.

### Conclusion
Many rejections were encountered, although without an immediately obvious overlying 'theme' to the rejections that would explain the majority of data. The 40 km figure used for buffers was untestable still, as tests require human opinion to re-verify data.

`Considered correct` data has a lower volume of rejection in both absolute and percentage terms than `Correct` data.

In both `Correct` and `Considered correct` statuses, there was a significant overlap in the Understandings with the majority of rejections. It is uncertain whether this overlap is the result of poor BWARS data volume, or reflects general difficulty in identification.

