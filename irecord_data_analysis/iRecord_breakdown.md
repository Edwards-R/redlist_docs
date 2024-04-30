# iRecord data breakdown

## Data processing
The following sections revolve around the intake of iRecord data to BWARS-standard format. There is no reference at all made to any verification status or verifier at this point.

### Pre-Checker
How many records were pushed to the Checker
|Included|Records|Percentage|
|---|---:|---:|
|Total|437,553|100%|
|Yes|399,105|91.2%|
|No|38,448|8.8%|

### Checker pass rate
How many records passed the Checker
|Pass|Records|Percentage|
|---|---:|---:|
|All|399,105|100%|
|Yes|341,687|85.6%|
|No|57,418|14.4%|

### Checker failure reason
> Records may fail on multiple attributes

By far the most common cause of failure is the inability to assign a binomial to an Understanding (14.1%). This failure is directly equivalent to an inability to confidently assign the record to a Type, making the record impossible to use without further analysis.

|Reason|Records|Percentage|
|---|---:|---:|
|Multiple potential Understandings|56,302|14.1%|
|No Gridref/VC match found|131|0.0%|
|Species has no match|236|0.1%|
|Spatial resolution too low|154|0.0%|
|Subgrid present|785|0.2%|

## Simple Unique Record
A common problem in biological recording is the re-entry of data, leading to multiple copies of the same record. `Simple unique record` is a data processing stage designed to condense such records to one record i.e. pure occurrence. The low replication level in iRecord indicates that it is functioning primarily as a primary source of data. This is opposed to BWARS, which is very firmly acting as a tertiary source.

Given the nature of this investigation, converting the iRecord data to full simple unique record format would be an extraordinary amount of work. Collisions (records which match on what/where/when) would need to be individually examined and differences in other attributes resolved to identify if these truly are the same record. Given the low (3.5%) rate of collision in the iRecord dataset, it is reasonable to compare BWARS's simple unique record data directly to iRecord data in terms of data volume.

|Scheme|Raw records|Simple unique record|Compression|
|---|---:|---:|---:|
|BWARS|1,135,135|834,568|26.5%|
|iRecord|341,687|329,796|3.5%|

## iRecord verification status

### Verification status 1
Verification status 1 is of no use to BWARS as it does not provide sufficient information to use a record in a scientific context.

### Verification status 2 breakdown
The low number of 'incorrect' records is due to the difficulty in making a definitive 'no' answer. Records are far more likely to fall into 'plausible' category as accurately identifying incorrect data points, especially in the absence of critical information, is very hard to do.

Records typically pass through one of two streams. The first stream is where the verifier trusts the originator of a dataset to be accurate. This dataset will then be assigned `Considered correct`. The second stream is where a verifier examines and assesses individual records one-by-one. This scenario is the only one whereby a record can reach `Correct`. There is no way to know whether a rejected record (`Plausible` or `Unable to verify`) was sourced from bulk-processing or individual examination.

From examination of the ratio of `Considered correct` to `Plausible` and `Unable to verify` data, it seems that verifiers do not attempt to verify non-photographic data unless they have prior connection to the originator which they can use as a basis for assessment. As such, records marked as `Plausible`, `Unable to verify`, and `Incorrect` stem from the assessment of individual records.

|Status|Records|Percentage|
|---|---:|---:|
|Correct|102,835|25.8%
|Considered correct|124,711|31.2%
|Plausible|6,435|1.6%
|Unable to verify|2,275|0.6%
|Incorrect|598|0.1%
|Not reviewed|103,316|25.9%
|*Status not used*|58,935|14.8%

## Threshold for use
The criteria for acceptance into the BWARS database is that `a record must have been identified by a person known to be capable of identifying that taxa`. In the absence of checking individual determiner names, the only way to extract such information from the iRecord dataset is to use the verification status `Correct`. This is the only status which requires that the verifier has seen the individual record in question, and agrees that the record is valid. There will still be some level of error, but the level should, if all is proceeding correctly, be comparable to the level of accuracy found in BWARS.

### Correct: simple unique record
The compression rate for simple unique records on this subset of data is still low enough to not be a concern in forming comparisons to the BWARS database.

|Raw records|Simple unique records|Compression|
|:---:|:---:|:---:|
|91,207|88,990|2.4%|

## Scheme overlap
There are 52,441 records which are directly found in both the BWARS database and iRecord. The 10 most common Understandings between the two are:

|Understanding|Records:|
|---|---|
|Bombus pascuorum: iso. Cameron et al: 2007|4,824
|Colletes hederae: iso. Schmidt & Westrich: 1993|3,780
|Bombus lapidarius: iso. Cameron et al: 2007|3,133
|Bombus hypnorum: iso. Cameron et al: 2007|2,255
|Bombus pratorum: iso. Cameron et al: 2007|2,062
|Bombus hortorum: iso. Cameron et al: 2007|1,284
|Vespula vulgaris: iso. Archer: 1989|976
|Anthophora plumipes: iso. Amiet et al: 2007|973
|Andrena haemorrhoa: iso. Amiet et al: 2010|927
|Vespa crabro: iso. Archer: 1989|828|

### Verification status of overlap
Attempting to obtain exact figures for overlap is impossible without fully converting the iRecord dataset to simple unique record. None the less, it is possible to get an appropriate estimate (within compression + 3%).

This section examines the percentage overlap, of all processed iRecord records, to the BWARS simple unique record dataset. Note that some inflation of numbers is expected to happen here as including the verification status from the iRecord data will diminish the power of the simple unique record routine to condense data.

The results suggest that BWARS is managing to source iRecord data from far more non-photographic recorders than photographic recorders. This result is in line with expectations, as non-photographic recorders tend to be far higher in skill than photographic recorders.

|Verification status|Records|Percentage|
|---|---:|---:|
|Correct|9,889|19.7%|
|Verified, other than correct|26,874| 53.5%|
|Not verified| 13,506|26.9%|

### Shortlist of available records
At this point, the total pool of available records for immediate harvest in iRecord sits at ~79,101 records. This figure is from the simple unique record (correct) dataset figure of 88,990, minus the overlap in correct records of 9,889.

## Identification difficulty
This section examines the breakdown of 'id difficulty', as created by Mike Edwards. The data used for this were created for use in iRecord in 2013. This list has not been updated to Understandings, though the names have been converted using the Checker. The vast majority of nomenclature changes that cannot be automatically converted can be safely assigned to the highest difficulty. The assignment is based on the number of splits occurring that require highly detailed knowledge to identify being far greater than the number of simple 'new colonist' taxa.

In the case of sub-specialisations (e.g. '3 not males'), the additional information has been removed and the difficulty rating condensed to the major rank (in this case, 3). There are only two Understandings where this has been applied and the impact is expected to be minimal.

|Difficulty|Number of Understandings|
|---|:---:|
|1|18|
|2|47|
|3|53|
|4|188|
|5|323|
|6|1|
|NA|2|
|NULL|55|

`NA` results are a product of the non-use of Understandings. `NULL` results are an indication of numenclatural instability. Both classifications will be ignored from here on, as their results will be misleading.

### Scheme difficulty comparison
The main take away from this analysis is that iRecord data has a far higher weighting towards the 'easy to identify' taxa. Note that the iRecord dataset used here is 'all records which pass the Checker', so there is no subsetting to photo-identification records. The weighting reinforces the idea that iRecord and BWARS are capturing data from different sources. BWARS is capturing more 'advanced' users' data, whilst iRecord is capturing more 'beginner' data.

|Difficulty|BWARS|iRecord|
|---|---:|---:|
|1|168,351|159,339|
|2|113,421|47,747|
|3|139,463|54,923|
|4|237,295|56,003|
|5|108,159|15,511|
|6|2|0|

## Scheme difficulty comparison as 'number of records per group'
The below table converts the scheme difficulty comparison table so that the values displayed are the number of records per member of each difficulty group according to the formula:

`number of records in difficulty group / number of understandings in difficulty group`

The result highlights the paucity of data on the very hard-to-identify taxa.

|Difficulty|BWARS|iRecord|
|---|---:|---:|
|1|9,353|8,852
|2|2,413|1,016
|3|2,631|1,036
|4|1,262|298
|5|335|48
|6|2|0

### iRecord difficulty distribution by verification status 2
Due to space constraints, abbreviations have been used for iRecord's `verification status 2` attribute. The abbreviations are as follows:

|Abbreviation|Full|
|---|---|
|C|Correct|
|CC|Considered correct|
|P|Plausible|
|U|Unable to verify|

There is a lot of information contained in this result. On speaking with verifiers, there is considerable bias towards using `Plausible` over `Unable to verify` when a record is plausible but cannot be verified.  Considering this, it is clear that difficulty 3 & 4 taxa are considerably harder to verify

|Difficulty|All|C|CC|P|U|
|---|---:|---:|---:|---:|---:|
|1|159,339|40,702|51,147|911|469
|2|47,747|16,755|14,205|505|274
|3|54,923|13,579|15,572|1,109|309
|4|56,003|14,188|17,295|1,483|611
|5|15,511|3,099|5,423|629|173
|6|0|0|0|0|0 

## iRecord Verifiers & Rules
There are 252,671 verified records with a verifier's name against them in iRecord. Of these, 127,198 (50.3%) have been verified by one person. A further 80,430 records (31.8%) have been verified by a different person. The exact ruleset that these two people have been using has, according to conversation with them, varied over time. This variance has also included adherence to a 'BWARS accepted' verification score system. The BWARS rules differ slightly from the iRecord ruleset for `correct` and `considered correct` as follows:

### iRecord

|Status|Explanation|
|---|---|
|*Correct*|The verifier is able to confirm that the species has been identified correctly, usually on the basis of photo/s within iRecord (or specimen/s outside iRecord)|
|*Considered correct*|The verifier has not seen photo/s or specimen/s but has a high degree of confidence that the record is likely to be correct, based on difficulty of ID, date, location and recorder skills/experience etc.|

### BWARS
|Status|Explanation|
|---|---|
|*Correct*|The verifier has examined the individual record and is confident that the determination is correct|
|*Considered correct*|The verifier has *not* examined the individual record, but trusts the origin of the record enough to accept the record|

### Custom rules
There are also situations in which the verifier simply makes up their own rules. The third most prolific verifier in the system (8,583 records, 3.4%) is such a person.

## Verification status breakdown
The range of approaches to verification in iRecord causes significant challenge to their ability to be peer reviewed. It is at this point that 'invisible' errors - those which cannot be found without repeating the verification of the entire dataset - come to the front. Finding [incorrect Correct](./glossary.md#incorrect-correct-error) records which have photos is only possible to do through human examination of individual records.

## Misapplication of Correct
Under iRecord rules, records which are placed as `Correct` should have photos attached. Under BWARS rules, a photo *can*, under very specific circumstances, be marked as `Correct` without a photo. However, these records are very few and far between, applying to very few taxa. These taxa are ones which exhibit distinctive behavioural patterns in the absence of potential confusions and should be readily identifiable from the data.

This table shows the number of records marked as `Correct`, followed by the subset of these without accompanying photos.

|||
|---|---:|
|Correct|106,579|
|Correct with no images|11,425|

### Multi-record processing
Further examination of the 'Correct with no images' data paints a picture of misapplication of both the BWARS and iRecord scoring rulesets. It appears fairly common, on a verifier-by-verifier level, to apply the Verification Status 2 ranks (Correct, Considered Corrrect, Plausible, Unable to verify, Incorrect) as pure confidence ranks based on any set of characteristics. `Correct` has also been used as a status for processing records without examination of individual records, as evidenced by multiple records existing with identical timestamps in the `verified_on` attribute. There are a minimum of 738 occurrences of multi-record verifications which can be confidently found (matching `verified_on` attribute with >2 records), for a total of 9,317 records.

### Most common misapplied taxa
The following are the 10 most common taxa to be verifier as `Correct`, without being part of multi-record processing. The table has been subsetted as follows:

- Removal of verifiers known to have not followed either the BWARS *or* iRecord scoring protocols (2 verifiers)
- Removal of non OSGR records (to restrict to GB data as much as possible without requiring geospatial searching)
- Verification status 2 of `Correct`
- No images attached to record
- Verification not previously identified as being part of a multi-record processing step (threshold of 2)

|Taxon|# records|
|---|---:|
|Colletes hederae|197
|Vespa crabro|112
|Bombus pascuorum|100
|Bombus terrestris|89
|Bombus hypnorum|85
|Bombus lapidarius|58
|Bombus pratorum|46
|Apis mellifera|44
|Anthophora plumipes|42
|Bombus lucorum|29

### Causes of error
The major cause of misapplied `Correct` records is non-adherence to rules. From the 104,340 `Correct` GB records, 10,700 did not have images. Of these 10,700 records, the breakdown is:

|Group|# records|
|---|---:|
|Multi-record processing|8,764|
|Verifier used custom ruleset|575|
|Unknown reason/potential BWARS rulest|1,377|

> NB: Records may fail on multiple accounts, combinations may not match the total

## Verification Status 1 vs Verification Status 2
Two different sets of verification statuses exist within iRecord. These are referred to in the data as `verification status 1` and `verification status 2`.