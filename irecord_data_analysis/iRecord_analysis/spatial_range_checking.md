# Spatial Range Checking
This checking system works in a similar way to the temporal range checking. The first step is to identify a pool of 'similar as possible' records of the given taxon and year. The spatial distribution of this pool of records is then plotted, followed by a 40 km buffer.

The data used in this section is only that which has passed the Checker. Automated bounds checking on a per-species level require exact-to-type precision in order to not fall foul of nomenclatural confusion. This precision is supplied by Understandings assigned by the Checker.

Note that this routine does not evaluate any magnitude of rejection. For a Red List, magnitude of rejection is an incredibly important metric for the purpose of spatial threat categories. Two records which are extremely out of known range will likely have far more impact on spatially based threat categories than a hundred 'just outside' records. As the number of known records gets smaller and smaller, it becomes even more imperative to only use trusted data given the greater impact each individual records posesses.

>An attempt at examining this 'magnitude of rejection' was made during this project. The method looks at the distance from a given record to the edge of the 40km envelope. This distance is then combined with others in any applicable groupings to establish metrics, or individual records can be examined.

## Sources of major error
The buffer represents the generalised expected potential colonisation front of the taxon. Due to the lack of information on taxon-specific colonisation fronts it was not possible to create bespoke distances. The 40 km buffer region has been used in prior work succesfully, including the BWARS import routine, and as such the distance has been used in this project as well.

However, as with all generalisations, there are likely taxa to which the 40 km radius is more applicable to than others. As before, the lack of strong comparable evidence makes the construction of an autecologically-based taxon-specific metric impractical.

BWARS does not seek or process data pertaining to *Apis* as such records are considered agricultural rather than ecological in nature. As such, all records of *Apis* are removed from this analysis.

## Breakdown of rejections per Understanding, all records
A breakdown of where rejections occur, per Understanding.

|Understanding|# rejections|
|---|---:|
|Anthophora plumipes: iso. Amiet et al: 2007|	388
|Vespa crabro: iso. Archer: 1989|	327
|Vespula vulgaris: iso. Archer: 1989|	297
|Osmia bicornis: iso. Amiet et al: 2004|	270
|Bombus hypnorum: iso. Cameron et al: 2007|	259
|Andrena fulva: iso. Perkins: 1919|	241
|Lasius flavus: iso. Bolton & Collingwood: 1975|	216
|Anthidium manicatum: iso. Amiet et al: 2004|	209
|Colletes hederae: iso. Schmidt & Westrich: 1993|	191
|Vespula germanica: iso. Archer: 1989|	187
|Bombus muscorum: iso. Cameron et al: 2007|	178
|Andrena clarkella: iso. Perkins: 1919|	173
|Bombus pascuorum: iso. Cameron et al: 2007|	163
|Andrena haemorrhoa: iso. Amiet et al: 2010|	155
|Bombus humilis: iso. Cameron et al: 2007|	152

## Breakdown per Understanding, `Correct` only
As above section, but using only `Correct` verification status 2 records. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

|Understanding|# rejections|
|---|---:|
|Anthophora plumipes: iso. Amiet et al: 2007|	161
|Vespa crabro: iso. Archer: 1989|	122
|Andrena fulva: iso. Perkins: 1919|	92
|Osmia bicornis: iso. Amiet et al: 2004|	56
|Bombus hortorum: iso. Cameron et al: 2007|	54
|Anthidium manicatum: iso. Amiet et al: 2004|	49
|Andrena bicolor: iso. Amiet et al: 2010|	46
|Nomada goodeniana: iso. Perkins: 1919|	46
|Andrena cineraria: iso. Perkins: 1919|	44
|Bombus vestalis: iso. Cameron et al: 2007|	43
|Andrena nigroaenea: iso. Perkins: 1919|	43
|Nomada marshamella: iso. Perkins: 1919|	43
|Bombus jonellus: iso. Cameron et al: 2007|	40
|Andrena clarkella: iso. Perkins: 1919|	40
|Bombus hypnorum: iso. Cameron et al: 2007|	37

## Breakdown per Understanding, `Considered correct` only
As above section, but using only `Considered correct` verification status 2 records. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

|Understanding|# rejections|
|---|---:|
|Vespa crabro: iso. Archer: 1989|	90
|Anthophora plumipes: iso. Amiet et al: 2007|	84
|Bombus hypnorum: iso. Cameron et al: 2007|	37
|Bombus lapidarius: iso. Cameron et al: 2007|	28
|Bombus pascuorum: iso. Cameron et al: 2007|	27
|Bombus pratorum: iso. Cameron et al: 2007|	25
|Vespula vulgaris: iso. Archer: 1989|	25
|Andrena fulva: iso. Perkins: 1919|	22
|Bombus hortorum: iso. Cameron et al: 2007|	22
|Andrena cineraria: iso. Perkins: 1919|	22
|Bombus muscorum: iso. Cameron et al: 2007|	22
|Bombus monticola: iso. Cameron et al: 2007|	22
|Osmia bicornis: iso. Amiet et al: 2004|	20
|Bombus vestalis: iso. Cameron et al: 2007|	19
|Anthidium manicatum: iso. Amiet et al: 2004|	17

## Rates of rejection
A comparison of % error between various verification 2 statuses. Verifiers known to have not followed the iRecord or BWARS guidance have been removed from this step.

|Grouping|All|Errors|% error|
|---|---:|---:|---:|
|Correct|91,207|1,999|2.2
|Considered correct|105,568|1,157|1.1
|Plausible|4,797|367|7.7
|Incorrect|559|74|13.2
|Unable to verify|1,916|277|14.5
|Not reviewed|88,442|3,765|4.3

## Magnitude of rejection
>This is an experimental metric which has been developed during this analysis to fulfill a need.

Magnitude of rejection is calculated as the distance between a record and the edge of the relevant year-matched 40 km buffer for that taxon.

## Discussion
### Expansion potential
The spatial ranges of numerous taxa have expanded over the duration covered by iRecord and BWARS.

### *Bombus hypnorum*
This taxon is one which underwent colonisation followed by significant, rapid expansion. The presence of this taxon near the top of the 'Considered correct' rejections list is entirely expected, though records will still need examination to the degree of magnitude involved in the rejection.