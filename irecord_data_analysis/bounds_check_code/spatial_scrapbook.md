# Spatial Scrapbook

## Attempt 1
Get the basic data, then find the `bind_year` - the closest year match in the library of spatial polygons that exists.

Use `ST_INTERSECTS`, as this will return `TRUE` if they have *any* point in common.

Yeah this is SLOW. Might need to do some materialized views and indexes. It's taking longer than the entire BWARS database does already.

Yup, time to optimise. I'm still typing and this is no good.

```
CREATE MATERIALIZED VIEW bwars_redlist.range_mat AS(
    SELECT id, r_nik, easting, northing, accuracy, datum,
    lower_date, upper_date, lower_year, upper_year,
    verifier, ver_2,
    checker.find_bound(r_nik, lower_year) bound_year,
    ST_MAKEENVELOPE(easting, northing, easting+accuracy, northing+accuracy, datum) env
    FROM bwars_redlist.limit_test
)
```

Materialized view took 72 seconds to make. Not great, but I've seen worse.

Run with materialized view took 4.824 seconds. Much better. 10,964 failures.
```
SELECT i.*
FROM bwars_redlist.range_mat i
JOIN checker.bounded_annual_buffer_40 bab ON i.r_nik = tik AND bound_year = yr
WHERE ST_INTERSECTS(bab.poly, i.env)!=TRUE
```

Going to convert this to a materialized view so that I can look at the response in QGIS. Put ST_INTERSECTS into the selected variables and re-run to find speed.

```
SELECT i.*, ST_INTERSECTS(bab.poly, i.env) spatial_check
FROM bwars_redlist.range_mat i
JOIN checker.bounded_annual_buffer_40 bab ON i.r_nik = tik AND bound_year = yr
```

Run took 58.906s. Not too shabby. 341,644 returns. Think there's some records being dropped by the strict join? Re-running with `LEFT OUTER JOIN`.

Yup, 40-ish records being missed. Probably due to no data for them. Will have to look into that, but it won't make any difference right now as
- the number is too small to make a stastical difference
- all failures will be examined anyway

Interesting figure - 3.2% spatial failure right now. This doesn't include any figures per verification status.

Moving result to a materialized view `range_checked_mat`. This can be used by QGIS to examine the failures.

## First look

Looking at the number of records which fail the spatial checker per verifiers. Using all verifiers with > 1,000 'Correct' verifications.

>Mike Fox is included in this, but ant results are expected to be very low accuracy due to low input data to the BAB.

### Query
```
SELECT verifier, count(*)
FROM bwars_redlist.range_checked_mat
WHERE spatial_check = FALSE
AND ver_2 = 'Correct'
GROUP BY verifier
ORDER BY count(*) DESC
```

### Results
Well. That's something. BIG difference between Matt and Stuart.
|Verifier|Records|Failures|% rate|
|---|---:|---:|---:|
|Stuart|38,593|991|2.6%|
|Matt|31,287|1,028|3.3%|
|Charlotte|4,792|92|1.9%|
|Mike F*|3,195|217|6.8%|
|Dave Jones|2,300|86|3.7%|
|Stephen Boulton|1,855|69|3.7%|
|Ben Hargreaves|1,781|79|4.4%|
|Ryan Clark|1,212|19|1.6%|
|James Power|1,044|0|0.0%|

James's verifications will also be on primarily Sussex data which, being in the south, isn't that interesting range-wise.

## Is northward range causing the errors?
Are there more range errors as the northing goes up?

>Ants won't be part of this to anywhere near the same extent and so are mainly removed. Mike Fox's verification are removed as a shortcut to 'most ant records'. Anyone that *isn't* Mike Fox and is verifying ants is something be checked very carefully.

### Query
```
SELECT northing, count(*)
FROM bwars_redlist.range_checked_mat
WHERE spatial_check = FALSE
AND ver_2 = 'Correct'
AND verifier != 'Fox, Mike'
GROUP BY northing
ORDER BY northing asc
```

### Results
Maybe?

Errors seem to be more common towards the north, *slightly*. However, this is overshadowed by 'specific events' in the graph. Northing 132,050 has 44 failures. 748,600 has 76 errors, with a large cluster around it.

## Northing 748,600
Run this past Mike.

This is from a survey run by 'Anand Prasad', Matt Smith is down as determiner on a couple of these, as is Murdo. These are quite probably correct, and their 'error' is just due to the low volume of data we get from that area.

>*Post-note*: M. Edwards checked a few of these and didn't identify any errors. This set of failures can be conclusively marked as the effect of new data in a previously very low-volume region.

### Query
```
SELECT id, b.binomial, osgr_to_gridref(easting, northing, accuracy, datum) gridref, lower_date, upper_date,
verifier, ver_2
FROM bwars_redlist.range_checked_mat m
JOIN nomenclature.binomial b on m.r_nik = b.tik
WHERE spatial_check = FALSE
AND ver_2 = 'Correct'
AND verifier != 'Fox, Mike'
AND northing = 748600
```

## Northing 132,050
This spike is just *Apis mellifera* (nik: 646) data. Going to ignore that from now on because we simply don't care about livestock. The error is that BWARS doesn't solicit *A. mellifera* records, so the range checker does not have sufficient information to base analysis on.

## Further exploration

### Query
```
SELECT m.id, b.binomial, i.recorder, i.determiner, osgr_to_gridref(easting, northing, m.accuracy, datum) gridref,
m.lower_date, m.upper_date,
m.verifier, ver_2
FROM bwars_redlist.range_checked_mat m
JOIN nomenclature.binomial b on m.r_nik = b.tik
JOIN bwars_redlist.all_irec_formatted i ON m.id=i.id
WHERE spatial_check = FALSE
AND ver_2 = 'Correct'
AND m.verifier != 'Fox, Mike'
AND northing = 299600
AND r_nik !=646
```

### Findings
*B. vestalis* in Edinburgh in 2017? Photo is not enough to ID. Range checker throws this out definitively.

Perhaps looking at the major events is the wrong way around? Major events seems to be from a recorder simply going somewhere 'new' and recording (or Apis, which we removed from consideration). It would make *sense* that these errors are far more dispersed.

# Impromptue Peer Review
Mike Edwards helped conduct a peer review of selected records. The filter criteria was for
- 'Correct' records
- No Mike Fox verifications (Mike E doesn't want to review ants)
- Sort by random
- Select 10
- Mike Edwards to select from the list of presented records

The questions asked of Mike Edwards, for every record, where:
- Does this record contain the information required for you to definitively identify the subject to the determination provided in the record?
- Does your determination match the determination agreed upon?

Trust in the recorder/determiner was *not* considered sufficient reason for a record to be `Correct`, as per both the iRecord and BWARS guidance. Such records should be `Considered correct`, as their acceptance is based on trust in the supplier's determination capability.

iRecord's scoring system is becoming harder and harder to keep straight. People keep wanting to assign 'trust levels' to the different scores rather than subsetting to 'method of trust'. For example, a record which a verifier knows personally may be verified as `Correct`, despite the record not containing the information required to arrive at a definitive determination. Such records will show as *errors* to quality control as the scoring system has not been followed.

## Results
No counter was kept of the number of incorrect records. However, the variants of 'incorrect' were:

- Record does not contain the information present to support the determination (i.e. verification should be `Considered correct` at best).
- Record determination is incorrect

### Invalid Correct error

A situation where the information contained was insufficient to arrive at a verification status of `Correct` is termed a `Invalid Correct error`.

### Review-determination error
A situation where 
- the verifier accepted a record as `Correct`

and
- the reviewer disagreed with the determination of a record

is termed a `Review-determination error`.

### Rates of errors
The rate of `Invalid Correct error` occurrence was far higher than hoped. Somewhere around 20% on a sample of ~ 40 records. This error will be examined in greater detail where possible i.e. 'record has correct but no photos present', then a random sample examined.

The rate of `Review-determination error` occurrence was also high, though the distinction between this and an `invalid Correct error` was not made until some time into the analysis. Approximately 5% of the sample of 40 records were identified as review-determination errors, though it should be noted that there were searches being performed as part of this that may well have biased the result significantly in favour of finding such errors.

### S falk
Any change in post 2015/2016 bee records? Falk book was published now.

Haven't been able to detect any. Biggest problem is that this time period is in iRecord's major expansion phase, so impossible to tell.

## Incorrect Correct examination
The view `bwars_redlist.wrong_correct_timestamps` can be used to identify and remove verifications which have >2 counts of the same verifier with the same timestamp, to the nearest second. It is presumed that these are records where a verifier has applied `Correct` to a record without examining that record.