# iRecord data verification peer review <!-- omit from toc -->

## Introduction
A selection of records which were identified as being out of expected bounds were sent to an experienced verifier and data handler for a second opinion. The two sets of data identified were:

- All records which failed to pass the temporal boundary check process
- All verification status 2 'Correct' records which failed to pass the spatial boundary check process

Note that, in order to reach the boundary checking processes, the data must have passed through the BWARS Checker.

The re-verifier was asked to complete the iRecord verification status, using the BWARS version of the iRecord verification status 2 criteria:

- **Correct**: The verifier is able to confirm that the species has been identified correctly, usually on the basis of photo/s within iRecord (or specimen/s outside iRecord)
- **Considered correct**: The verifier has not seen photo/s or specimen/s (or the photograph is inadequate) but has a high degree of confidence that the record is likely to be correct, based on difficulty of ID, date, location and recorder skills/experience etc.
- **Unable to verify**: The verifier has a high degree of confidence that the record is likely to be incorrect based on difficulty of ID, date, location and recorder skills/experience (and where no photo/s or specimen/s are available); or photos are available but do not show enough detail to confirm the identification; and/or the record is not sufficiently well documented to confirm (e.g. location is vague or the date appears to be incorrect)
- **Incorrect**: The verifier is able to confirm that the species has not been identified correctly, or the record is erroneous in other respects, on the basis of photo/s or specimen/s, or on information from the recorder
- **Plausible**: The record is plausible based on species, date and location, but there is not enough supporting evidence for the possibility of misidentification to be ruled out, and the record remains within the "Unconfirmed" category

## Temporal range checking
1,234 temporal outliers were supplied. Of these, 887 were re-verified and 347 verified for the first time. In the re-verification set, the highest degree of change was in the level of confidence that the verifier was willing to accept. 87 (21%) of the 'Correct' records were downgraded to 'Unable to verify', as were 107 (39%) of the 'Considered correct' records. Of all 188 non-correct data, only 4 records (2%) were moved into one of the 'correct' categories. 'Correct' records were evaluated to be 299 (287 maintained and 12 incoming) against an initial 422, whilst Considered correct records were 153 (152 maintained and 1 incoming) against an initial 276. In summary, of the 'potentially usable' Correct/Considered correct data, totalling 698 records, 452 records (65%) remained post re-verification.

Of the 347 newly verified records, 93 (27%) were accepted to either Correct or Considered correct. Such a low acceptance rate suggests that verifiers may be leaving records unverified rather than verifying them under a 'failing' grade.

## Spatial range checking
Only Correct and Considered Correct records were sent to be re-verified due to the limited time available. Spatial extent checks, though usually done entirely by eye, are more familiar to the discipline than temporal checks. Accordingly, the error rate is expected to be significantly lower.

Of the 983 reviewed records, 981 were intially verified as `Correct`. The post review breakdown of these is as follows:

|Review status|Count|Percentage|
|---|---|---|
|Correct|822|84%|
|Considered correct|86|9%|
|Incorrect|18|2%|
|Plausible|7|1%|
|Unable to verify|48|5%|

All 2 of the `Considered correct` spatial outliers were accepted under review.

In total, 910 (93%) records were accepted as usable after review.

## Post-review discussion
The large number of records being downgraded from `Correct` to `Considered correct` is the direct result of a change in application of verification standards from when the records were first evaluated to now. Historically, the 5 point scoring system was used as a confidence threshold. Records from known and capable recorders could be assigned as `Correct`, regardless of whether or not the record itself contained sufficient information to arrive at the determination. The entire iRecord dataset's `Correct` data must therefore be considered to contain a significant portion of `Considered correct` data.

Temporal outliers resulted in a far higher degree of true error, despite the extremely crude selection method used, than spatial errors. There is likely to be an element of tradition involved here, as all verifiers involved in this project and the iRecord data are used to the 'traditional' method of examining the spatial placement of a record on a map. In contrast, there is not yet a tradition of examining the date of a record in such context.

The high degree of acceptance of spatial outliers suggests that there exists a body of sporadic records which represent true occurrence not represented in the BWARS dataset.

## Expert recommendation
The reviewer's recommendation on the question *'Should iRecord data be used for the current Red List attempt?'* is **no**. There were too many errors encountered for the verifier to be able to recommend the direct use of data. In particular, the history of iRecord, and the different ways in which verifiers have interacted with the system, have created a mixture of different results.

There is significant potential to the idea of using a similar review process, targeted at a specific species, in order to move accepted data into BWARS. However, this represents a significant amount of work that no volunteer is able to provide. Once the Red List is finished, priority taxa can be identified for specific attention in this regard, but the question of time still remains.

## Further discussion
A few further specifically notable errors were observed. Firstly, the presence of data from 1st Jan 1970 for a taxon which was not present in GB at this time. It is strongly suspected that this date is from an epoch-date of 0, in turn likely from a record which did not have a date entered. This lack of date has, somewhere, been interpreted as '0', leading to 1st Jan 1970. Such an situation is not unheard of, indeed being fairly typical. All incoming data should be searched for 1st Jan 1970 and, if found, discarded as being unusable.

Rearing records, as well as disturbance records, were present in low volume. Each of these records need to be converted to year-range records for BWARS purposes as the dates present in the record represent altered phenology. BWARS tracks date for the purpose of identifying flight period, not for tracking recorder activity.