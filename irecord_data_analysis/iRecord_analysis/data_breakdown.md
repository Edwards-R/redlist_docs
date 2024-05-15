## Data Breakdown
A documentation of examination into the iRecord data, breaking the data set down into various sub-categories in a bid to develop greater understanding of the information contained.

### Importing iRecord data
This section examines the number of records in the incoming iRecord dataset, the number of records which failed to pass the Checker, as well as their reasons for failure.

#### Pre-Checker
How many records were pushed to the Checker
|Included|Records|Percentage|
|---|---:|---:|
|Total|437,553|100%|
|Yes|399,105|91.2%|
|No|38,448|8.8%|

#### Checker pass rate
How many records passed the Checker
|Pass|Records|Percentage|
|---|---:|---:|
|All|399,105|100%|
|Yes|341,687|85.6%|
|No|57,418|14.4%|

#### Checker failure reason
> Records may fail on multiple attributes

By far the most common cause of failure is the inability to assign a binomial to an Understanding (14.1%). This failure is directly equivalent to an inability to confidently assign the record to a Type. Inability to resolve a binomial to type is only resolvable through specific, highly skilled, human intervention - typically reserved for taxonomists with a specific goal in mind.

|Reason|Records|Percentage|
|---|---:|---:|
|Multiple potential Understandings|56,302|14.1%|
|No Gridref/VC match found|131|0.0%|
|Species has no match|236|0.1%|
|Spatial resolution too low|154|0.0%|
|Subgrid present|785|0.2%|

### Simple Unique Record
A common problem in biological recording is the re-entry of data, leading to multiple copies of the same record. `Simple unique record` is a data processing stage designed to condense such records by removing duplication based on the attributes of What, Where, and When. Simple Unique Record has been used in multiple major research projects and is now considered the default export from the BWARS database.

The level of self-replication contained within a dataset is measured by 'compression' - the amount of records 'compressed' by the simple unique record procedure. A high compression indicates a high level of replication, which is undesirable. The low replication level in iRecord indicates that the scheme is functioning primarily as a primary source of data. Meanwhile BWARS is very firmly acting as a tertiary source.

Given the nature of the Red List investigation, converting the iRecord data to full simple unique record format would be an extraordinary amount of work. Collisions (records which match on what/where/when) would need to be individually examined and differences in other attributes resolved to identify if these truly are the same record. Given the low (3.5%) rate of collision in the iRecord dataset, it is reasonable to compare BWARS's simple unique record data directly to iRecord data in terms of data volume.

|Scheme|Raw records|Simple unique record|Compression|
|---|---:|---:|---:|
|BWARS|1,135,135|834,568|26.5%|
|iRecord|341,687|329,796|3.5%|

### iRecord verification status

#### Verification status 1
Verification status 1 is of no use to the Red List project as it does not provide sufficient information to use a record in a scientific context.

#### Verification status 2
Verification status 2 contains the most precise categorisation of the two available statuses. Statuses in verification status 2 are not sorted by reliability. A `Correct` record is *not* less trustworthy than a `Considered correct` record. The verification statuses under verification status 2, as well as a short explanation, are:

|Status|Explanation|
|---|---|
|Correct| The verifier is able to confirm that the species has been identified correctly, usually on the basis of photo/s within iRecord (or specimen/s outside iRecord)
|Considered correct| The verifier has not seen photo/s or specimen/s but has a high degree of confidence that the record is likely to be correct, based on difficulty of ID, date, location and recorder skills/experience etc.
|Unable to verify| The verifier has a high degree of confidence that the record is likely to be incorrect based on difficulty of ID, date, location and recorder skills/experience (and where no photo/s or specimen/s are available); or photos are available but do not show enough detail to confirm the identification; and/or the record is not sufficiently well documented to confirm (e.g. location is vague)
|Incorrect| The verifier is able to confirm that the species has not been identified correctly, or the record is erroneous in other respects, on the basis of photo/s or specimen/s, or on information from the recorder
|Plausible| The record is plausible based on species, date and location, but there is not enough supporting evidence for the possibility of misidentification to be ruled out, and the record remains within the "Unconfirmed" category
|Not reviewed| The record is in the system but has either not been looked at, or a verification decision not yet been reached (all records start off in this category)

#### Verification status 2 breakdown

The low number of `Incorrect` records is due to the difficulty in making a definitive 'no' answer. Records are far more likely to fall into 'plausible' category as accurately identifying incorrect data points, especially in the absence of critical information, is very hard to do. Verifiers are also reluctant to assign data to `Incorrect` through fear of discouraging newcomers.

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

### Threshold for use
The criteria for acceptance into the BWARS database is that `a record must have been identified by a person known to be capable of identifying that taxa`. The current import stream for BWARS relies on a verifier approaching BWARS to donate their data, upon which experienced entomologists will examine the incoming data to look for potential problems or errors. The submitter may be asked to provide specimens or vouchers for particular records, especially those with significant potential for confusion. The experienced entomologist will then run through the key and specimen alongside the submitter, as well as provide assistance on other specimens as requested. In this way BWARS maintains high data quality whilst also providing a way to provide targeted help and tutoring to entomologists.

In the absence of checking individual determiner names, the only way to extract such information from the iRecord dataset is to use the verification status `Correct`. This is the only status which requires that the verifier has seen the individual record in question, and agrees that the record is valid. There will still be some level of error, but the level should, if all is proceeding correctly, be comparable to the level of accuracy found in BWARS.

#### Correct: simple unique record
The compression rate for simple unique records on this subset of data is still low enough to not be a concern in forming comparisons to the BWARS database.

|Raw records|Simple unique records|Compression|
|:---:|:---:|:---:|
|91,207|88,990|2.4%|

### Scheme overlap
There are 52,441 (15.9% of iRecord) records which are directly found in both the BWARS database and iRecord. The 10 most common Understandings between the two are:

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

#### iRecord and BWARS userbase comparison
BWARS data is almost exclusively from people who have spent significant time and effort to develop their identification skills. Where the data is not from this source, it has invariably passed through such a source before it will be accepted. Of these sources, a large amount of the records from from users who perform contracted surveys. Samples of which include development work and nature reserve assessments.

Accuracy in aculeate hymenoptera identification is an *advanced* skill, as one of the requirements for accuracy is understanding the limitations of your knowledge. Such a level of skill development does not happen without significant time investment, which typically manifests as also producing large volumes of data. In turn, these large volumes of data get fed into a recording platform. Said platform can be anywhere from a handwritten fieldbook to dedicated recording platforms such as Recorder and iRecord. Such people are *highly* unlikely to submit photographic vouchers for every single record, simply due to the time and inconvenience that would cause. Their data therefore defaults to `Considered correct`, leading to the majority overlap residing in this particular verification category.

#### Verification status of overlap
Attempting to obtain exact figures for overlap is impossible without fully converting the iRecord dataset to simple unique record. None the less, it is possible to get an appropriate estimate (within compression + 3%).

This section examines the percentage overlap, of all processed iRecord records, to the BWARS simple unique record dataset. Note that some inflation of numbers is expected to happen here as including the verification status from the iRecord data will diminish the power of the simple unique record routine to condense data.

The results suggest that BWARS is managing to source iRecord data from far more non-photographic recorders than photographic recorders. This result is in line with expectations, as non-photographic recorders tend to be far higher in skill than photographic recorders.

|Verification status|Records|Percentage|
|---|---:|---:|
|Correct|9,889|19.7%|
|Verified, other than correct|26,874| 53.5%|
|Not verified| 13,506|26.9%|

#### Shortlist of available records
At this point, the total pool of available records for immediate harvest in iRecord sits at ~79,101 records. This figure is from the simple unique record (`Correct`) dataset figure of 88,990, minus the overlap in correct records of 9,889.

If verfiers which are known to have disobeyed the iRecord/BWARS verification guide are excluded, the pool decreases by approximately 2,600 records to ~76,600 `Correct`, unique, non-overlap records.

### Taxon grouping
A breakdown of the broad-scale taxonomic composition of the iRecord and BWARS datasets. Only iRecord data which has passed the Checker is used in this section due to the need for precision in nomenclature. The BWARS subset used is the de-duplicated `simple unique record` set.

#### Taxon groupings
|Name|Description|
|---|---|
|Bombus|All non-aggregate species in the genus 'Bombus'|
|Other bee|All non-aggregate species in the family 'Apidae' other than in the genus 'Bombus'|
|Eusocial wasps|All non-aggregate species in the genera Vespa, Vespula, and Dolichovespula|
|Other wasps| All non-aggregate species other then eusocials, bees, or ants|
|Ants|All non-aggregate species of Formicidea|

#### Absolute record count taxonomic composition
A breakdown of each scheme's broad scale taxonomic content, including a subdivision to `Correct` and `Considered correct`. Reported as absolute record counts
|Scheme|Bombus|Other bee|Eusocial wasp|Other Wasp|Ant|
|---|---:|---:|---:|---:|---:|
|BWARS|191,618|340,765|30,523|161,215|48,100|
|iRecord|139,019|141,190|30,512|21,630|9,027|
|iRecord Correct**|29,895|42,829|9,365|3,995|110|
|iRecord Considered correct**|42,389|38,312|8,085|7,636|189|

** Verifiers known to have not followed the iRecord or BWARS verification ruleset removed. This will ***very*** strongly impact ant records.

#### Percentage-based taxonomic composition
A breakdown of each scheme's broad scale taxonomic content, including a subdivision to `Correct` and `Considered correct`. Reported as the percentage of each scheme's total
|Scheme|Bombus|Other bee|Eusocial wasp|Other Wasp|Ant|
|---|---:|---:|---:|---:|---:|
|BWARS|24.8%|44.1%|4.0%|20.9%|6.2%
|iRecord|40.7%|41.4%|8.9%|6.3%|2.6%
|iRecord Correct**|34.7%|49.7%|10.9%|4.6%|0.1%
|iRecord Considered correct**|43.9%|39.7%|8.4%|7.9%|0.2%

** Verifiers known to have not followed the iRecord or BWARS verification ruleset removed. This will ***very*** strongly impact ant records.

### Identification difficulty
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

#### Scheme difficulty comparison
The main take away from this analysis is that iRecord data has a far higher weighting towards the 'easy to identify' taxa. Note that the iRecord dataset used here is 'all records which pass the Checker', so there is no subsetting to photo-identification records. The weighting reinforces the idea that iRecord and BWARS are capturing data from different sources. BWARS is capturing more 'advanced' users' data, whilst iRecord is capturing more 'beginner' data.

Note that *Melecta albifrons* was considered difficulty 5 but, due to the probable extinction of potential confusion taxa, should now be considered difficulty 1. Verifiers have treated this taxon as difficulty 1 and photo-identifiable. Of the 15,511 difficulty 5 records, 1,252 (8.1%) are of *M. albifrons*.

|Difficulty|BWARS|iRecord|
|---|---:|---:|
|1|168,351|159,339|
|2|113,421|47,747|
|3|139,463|54,923|
|4|237,295|56,003|
|5|108,159|15,511|
|6|2|0|

### Scheme difficulty comparison as 'number of records per group'
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
|5**|335|44
|6|2|0

** Without *M. albifrons* data

#### iRecord difficulty distribution by verification status 2
Due to space constraints, abbreviations have been used for iRecord's verification status 2 attribute. The abbreviations are as follows:

|Abbreviation|Full|
|---|---|
|C|Correct|
|CC|Considered correct|
|P|Plausible|
|U|Unable to verify|

There is a lot of information contained in this result. On speaking with verifiers, there is considerable bias towards using `Plausible` over `Unable to verify` when a record is plausible but cannot be verified.  Considering this, it is clear that difficulty 3 & 4 taxa are considerably harder to verify.

It also seems that non-photographic recorders tend to record more of the common taxa than photographic, which is also expected. Surveys require that *all* taxa are recorded, not just interesting observations.

|Difficulty|All|C|CC|P|U|
|---|---:|---:|---:|---:|---:|
|1|159,339|40,702|51,147|911|469
|2|47,747|16,755|14,205|505|274
|3|54,923|13,579|15,572|1,109|309
|4|56,003|14,188|17,295|1,483|611
|5|15,511|3,099|5,423|629|173
|6|0|0|0|0|0 

Expressed as percentages of 'All'
|Difficulty|All|C|CC|P|U|
|---|---:|---:|---:|---:|---:|
|1|159,339|25.5%|32.1%|0.6%|0.3%
|2|47,747|35.1%|29.8%|1.1%|0.6%
|3|54,923|24.7%|28.4%|2.0%|0.6%
|4|56,003|25.3%|30.9%|2.6%|1.1%
|5|15,511|20.0%|35.0%|4.1%|1.1%


### iRecord Verifiers & Rules
There are 252,671 verified records with a verifier's name against them in iRecord. Of these, 127,198 (50.3%) have been verified by one person. A further 80,430 records (31.8%) have been verified by a different person. The exact ruleset that these two people have been using has, according to conversation with them, varied over time. This variance has also included adherence to a 'BWARS accepted' verification score system. The BWARS rules differ slightly from the iRecord ruleset for `correct` and `considered correct` as follows:

#### iRecord

|Status|Explanation|
|---|---|
|*Correct*|The verifier is able to confirm that the species has been identified correctly, usually on the basis of photo/s within iRecord (or specimen/s outside iRecord)|
|*Considered correct*|The verifier has not seen photo/s or specimen/s but has a high degree of confidence that the record is likely to be correct, based on difficulty of ID, date, location and recorder skills/experience etc.|

#### BWARS
|Status|Explanation|
|---|---|
|*Correct*|The verifier has examined the individual record and is confident that the determination is correct|
|*Considered correct*|The verifier has *not* examined the individual record, but trusts the origin of the record enough to accept the record|

#### Custom rules
There are also situations in which the verifier simply makes up their own rules. The third most prolific verifier in the system (8,583 records, 3.4%) is such a person.

### Verification status breakdown
The range of approaches to verification in iRecord causes significant challenge to their ability to be peer reviewed. It is at this point that 'invisible' errors - those which cannot be found without repeating the verification of the entire dataset - come to the front. Finding [incorrect Correct](./glossary.md#incorrect-correct-error) records which have photos is only possible to do through human examination of individual records.

### Misapplication of Correct
Under iRecord rules, records which are placed as `Correct` should have photos attached. Under BWARS rules, a photo *can*, under very specific circumstances, be marked as `Correct` without a photo. However, these records are very few and far between, applying to very few taxa. These taxa are ones which exhibit distinctive behavioural patterns in the absence of potential confusions and should be readily identifiable from the data.

This table shows the number of records marked as `Correct`, followed by the subset of these without accompanying photos.

|||
|---|---:|
|Correct|106,579|
|Correct with no images|11,425|

#### Multi-record processing
Further examination of the 'Correct with no images' data paints a picture of misapplication of both the BWARS and iRecord scoring rulesets. It appears fairly common, on a verifier-by-verifier level, to apply the Verification Status 2 ranks (Correct, Considered Corrrect, Plausible, Unable to verify, Incorrect) as pure confidence ranks based on any set of characteristics. Unfortunately, there is no way to identify multi-record processings reliably, due to the timestamp only reaching minute resolution. However, 14 situations where the verifier has verified > 60 records-per-minute have been identified. It is considered very unlikely that a verifier can reach a rate of > 1 record verification per second.

### Verification Status 1 vs Verification Status 2
Two different sets of verification statuses exist within iRecord. These are referred to in the data as `verification status 1` and `verification status 2`. There have been issues in the past where records would be verified under `verification status 1` by one processing avenue and `verification status 2` by another avenue, all by the same verifier in the same session.

#### Number of records per year without `verification status 2`
`NULL` records seem to refer to records which are 'incomplete' (`Input still in progress`), as well as a number of what I believe were test records?

Despite the ability to use `verification status 1` being heavily reduced around 2020, someone *still* managed to find a way around that in 2023.

|Year|# records|
|---|---:|
|2010|58
|2011|63
|2012|1089
|2013|16851
|2014|9215
|2015|10323
|2016|5372
|2017|8543
|2018|7894
|2019|858
|2020|38
|2022|51
|2023|1
|NULL|663

#### Broad taxon composition


### Conclusion
An unexpectedly high rate of rejection was encountered when attempting to handle the conversion of binomials to binomial Understandings (14.1%). These rejections are almost entirely (98.0%) on the basis that the binomial cannot be resolved precisely to a type.

iRecord appears to be acting as a mainly primary data source i.e. most records are submitted by the originator of the record rather than a third party. BWARS is the opposite, functioning as a tertiary data source. 15.9% of iRecord data was found to already exist in the BWARS dataset, predominantly (53.5%) from the 'Considered correct' stream. Attempting to condense the iRecord data down to pure occurrence based on what/where/when only results in a 3.5% reduction in records, whilst BWARS has a 26.5% compression rate. The likely explanation is that BWARS acts as a tertiary data source and requests data from people repeatedly, whilst iRecord acts as a primary data source and relies on users to input their data directly. Experienced recorders do share records, particularly of rarities or notable observations, amongst themselves. Such sharing is potentially indirect, for example scraping the record from published material that mentions a particular occurrence.

The largest portion of records with a functional 'verification status 2' are those with `Considered correct` (31.2%), followed by `Unverified` (25.9%), then by `Correct` (25.8%). Whilst the majority of records *appear* to have been verfied in accordance with either the iRecord or BWARS ruleset, there is no way to test the level of adherence. Conversation with verifiers uncovered two notable instances of people whose records in this dataset are *not* in accordance. Instead, their verifications treat verification status 2 as a *measure of confidence* in the record being correct. When assembling the final count of 'harvestable records', these verifiers were specifically excluded from consideration.

The mistaken use of verification status 2 is driven by a mis-match between how the verifier reads the status and how iRecord/BWARS's rules mandate the status to be used.

In total, 52,441 records were found to match between the de-duplicated BWARS dataset and the raw iRecord dataset. This figure represents 15.9% of all of iRecord's data. The overlap is dominated by *Bombus*, with the notable exception of *Colletes hederae*, which was the subject of targeted effort.

Overlap between iRecord and BWARS was predominantly found in the `Considered correct` subset (53.5%), followed by `Unverified` (26.9%). This division is unsurprising and reflects the general difference in submitters between the two datasets.

Comparison of the 'difficulty of identification' between iRecord and BWARS reenforces the idea of this 'experienced identifier' cohort. As 'difficulty of identification' increases, the relative proportion of data between iRecord and BWARS favours BWARS more and more. *Melecta albifrons* data was specifically removed from 'difficulty 5' data due to changes in its circumstances.

Further investigation into difficulty took into account the verification status 2 of records in iRecord. The results here indicate that photographic recorders provide a very different species assemblage to non-photographic, though the difference is less stark than expected. The lack of starkness is most likely a result of outdated/incorrect classification of difficulty, as the table used has never been tested or fully reviewed before. A re-assessment of identification difficulty, tailored to iRecord, would be required to investigate this topic further.

Multi-record processing was very difficult to decisively identify, due to the minute-only resolution of the timestamps. Analysis did very heavily hint at the presence of multi-record verified data in places where it should not be, but no method could decisively identify such occurrences.

Verification status 1 has been almost entirely removed from use since 2020, though it was somehow still used by someone in 2023. The changes that deprecated verification status 1 likely occurred in early-mid 2019.

