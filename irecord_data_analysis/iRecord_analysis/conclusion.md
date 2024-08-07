## Conclusion
Peer review and in depth analysis recommend against the use of iRecord data in a Red List without further verification to bring data up to the same standard as the BWARS dataset/current iRecord guidance. Whilst there is a degree of overlap between the iRecord and BWARS datasets, there is still high quality data which is held in iRecord and not present in BWARS. There are considerable difficulties in identifying the low-quality data, or mistakes in data entry, which preclude the immediate use of the entire iRecord dataset. The Red List process in particular is noted as having specific weakness to small volumes of incorrect data in already small datasets. The timescale of the iRecord dataset also invites skew as the scheme has not yet been recording for 30 years. However, this skew is fairly reliably identifiable and easy to therefore mitigate during interpretation of models.

The iRecord data generally adheres to a standardised format, making it very easy to manipulate, the need to translate binomials to binomial Understandings is a significant barrier to safe utilisation. There are also a number of general data errors e.g. a date of 1st Jan 1970 scatter into the data that require identification and correction (where possible).

Expert advice is that the overall iRecord dataset requires directed attention in order to reach a level where the data would be of sufficient quality for use. The majority of the attention stems from the age of the data and the changes over time that have been made to how verifiers have utilised the iRecord system.

Examination of flight period has identified a higher than expected number of records which are deemed to be highly likely to be inaccurate. Examination of spatial outliers found few records deemed highly likely to be inaccurate.

### Data to use in extended Red List
Given the level of pollution identified between `Correct` and `Considered correct`, the best available action is to treat all `Correct` data as `Considered correct`. Accordingly, the expanded dataset used in the extended Red List will involve:

- All current Red List data
- All iRecord data identified as `Correct` or `Considered correct`
- All additional BWARS submitted data

The iRecord component of the additional data is 155,806 records. This is the total number of records:

- which passed the Checker
- are in either the `Correct` or `Considered correct` verification_status_2 bracket
- are between 1992 and 2021 (inclusive)

### Use of spatial envelopes
The use of the spatial envelope to identify outliers has emerged as a highly efficient method of targeting limited resources in such a way to derive the maximal positive impact on the Red List spatial assessment criteria. Firmer spatial ranges benefit many spatial models, including

  - Minimum Convex Polygon
  - Tetrad count
  - Buffer-Union
  - Alpha Hull