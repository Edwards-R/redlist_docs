# iRecord data breakdown

## Data processing
The following sections revolve around the intake of iRecord data to BWARS-standard format. There is no reference at all made to any verification status or verifier at this point.

### Pre-Checker
How many records were pushed to the Checker
|Included|Records|Percentage|
|---|---|---|
|Total|437,553|100%|
|Yes|399,105|91.2%|
|No|38,448|8.8%|

### Checker pass rate
How many records passed the Checker
|Pass|Records|Percentage|
|---|---|---|
|All|399,105|100%|
|Yes|341,687|85.6%|
|No|57,418|14.4%|

### Checker failure reason
> Records may fail on multiple attributes

By far the most common cause of failure is the inability to assign a binomial to an Understanding (14.1%). This failure is directly equivalent to an inability to confidently assign the record to a Type, making the record impossible to use without further analysis.

|Reason|Records|Percentage|
|---|---|---|
|Multiple potential Understandings|56,302|14.1%|
|No Gridref/VC match found|131|0.0%|
|Species has no match|236|0.1%|
|Spatial resolution too low|154|0.0%|
|Subgrid present|785|0.2%|

## Simple Unique Record
A common problem in biological recording is the re-entry of data, leading to multiple copies of the same record. `Simple unique record` is a data processing stage designed to condense such records to one record i.e. pure occurrence. The low replication level in iRecord indicates that it is functioning primarily as a primary source of data. This is opposed to BWARS, which is very firmly acting as a tertiary source.

Given the nature of this investigation, converting the iRecord data to full simple unique record format would be an extraordinary amount of work. Collisions (records which match on what/where/when) would need to be individually examined and differences in other attributes resolved to identify if these truly are the same record. Given the low (3.5%) rate of collision in the iRecord dataset, it is reasonable to compare BWARS's simple unique record data directly to iRecord data in terms of data volume.

|Scheme|Raw records|Simple unique record|Compression|
|---|---|---|---|
|BWARS|1,135,135|834,568|26.5%|
|iRecord|341,687|329,796|3.5%|

## iRecord verification status

### Verification status 1
Verification status 1 is of no use to BWARS as it does not provide sufficient information to use a record in a scientific context.

### Verification status 2 breakdown
The low number of 'incorrect' records is due to the difficulty in making a definitive 'no' answer. Records are far more likely to fall into 'plausible' category as accurately identifying incorrect data points, especially in the absence of critical information, is very hard to do.
|Status|Records|Percentage|
|---|---|---|
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
|---|---|---|
|91,207|88,990|2.4%|

## Scheme overlap
There are 52,441 records which are directly found in both the BWARS database and iRecord. The 10 most common Understandings between the two are:

|Understanding|Records|
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

The results suggest that BWARS is managing to source iRecord data from far more non-photographic records than photographic recorders. This result is in line with expectations, as non-photographic records tend to be far higher in skill than photographic recorders.

|Verification status|Records|Percentage|
|---|---|---|
|Correct|9,889|19.7%|
|Verified, other than correct|26,874| 53.5%|
|Not verified| 13,506|26.9%|

### Shortlist of available records
At this point, the total pool of available records for immediate harvest in iRecord sits at ~79,101 records. This figure is from the simple unique record (correct) dataset figure of 88,990, minus the overlap in correct records of 9,889.