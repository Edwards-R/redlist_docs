# Spatial Scrapbook
This documentation is primarily intended for myself and will not be part of the final written work. In here are various code snippets, ideas, comments to myself on things that worked, things that didn't, where I went wrong etc. There is far less emphasis on standard formatting or continuity, but there is still non-Red List information worth keeping in here.

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
>> Future note: Mike Fox didn't follow iRecord or BWARS rules so be cautious anyway!

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

### How many wrong corrects are ver_status_1 only?

Only 95? Weird

Oh no, that's cos of the preselections. Lets find out how multi-record verification is being used.

## Multi-record verifications

> ***This doesn't work***. Remember that we got annoyed at non-standard timestamps? Yeah. Those timestamps are minute only and not controlled by the database but something else. So they're useless for this purpose
```
CREATE VIEW bwars_redlist.all_multi AS
WITH counts AS (
    SELECT all_irec_formatted.verifier,
        all_irec_formatted.verified_on,
    count(*) AS count
    FROM bwars_redlist.all_irec_formatted
    GROUP BY all_irec_formatted.verifier, all_irec_formatted.verified_on
    ORDER BY (count(*)) DESC
)
SELECT counts.verifier,
counts.verified_on
FROM counts
WHERE counts.count > 2;
```

24,774 'multi-record' occurrences

Well. Uh no. Looks like this whole thing doesn't work. Ben Hargreaves has never used multi-record verification and yet is 'found' by this system as being a prevalent user of them.

Yup, `verified_on` is not being passed back as a timestamp of individual records. That's... weird.

## DoY checking

Example query
```
WITH vars AS (
SELECT
	2 tolerance -- DoY tolerance permitted
),

rejection AS 
(SELECT id, r_nik
FROM vars, bwars_redlist.for_doy_check dc
JOIN checker.doy_range dr ON dc.bound_year = dr.yr AND dc.r_nik = dr.tik
WHERE (dc.lower_doy < (dr.lower_doy - tolerance)
OR dc.upper_doy > (dr.upper_doy + tolerance))
 AND r_nik != 646 -- Ignore Apis
 AND (dc.upper_doy - dc.lower_doy) < tolerance -- Allow 2*tolerance* days between min and max dates
)

SELECT b.binomial, count(*)
FROM rejection r
JOIN nomenclature.binomial b ON r.r_nik = b.tik
JOIN bwars_redlist.all_irec_formatted irec ON r.id = irec.id
GROUP BY b.binomial
ORDER BY count DESC
```

This is a complex one. DoY tolerance checking is *very* basic and clunky. Going to need to have a tolerance involved, but can't be too generous. 4 is I think reasonable? These are min/max after all, not anything smoothed. Might as well do a breakdown per tolerance, would be helpful to the Record Cleaner plans. BWARS uses 2 though, should we keep that?

## Rates of error

```
-- Find all records that are 'Correct' and non-Apis
-- Query is larger than it 'needs' to be to keep things as comparable to the more complex one as possible,

WITH vars AS (
SELECT
	2 tolerance -- DoY tolerance permitted
),

rejection AS 
(SELECT id, r_nik
FROM vars, bwars_redlist.for_doy_check dc
JOIN checker.doy_range dr ON dc.bound_year = dr.yr AND dc.r_nik = dr.tik
WHERE r_nik != 646 -- Ignore Apis

)

SELECT count(*)
FROM rejection r
JOIN nomenclature.binomial b ON r.r_nik = b.tik
JOIN bwars_redlist.all_irec_formatted irec ON r.id = irec.id
WHERE verification_status_2='Correct'
ORDER BY count DESC
```

# Spatial range checking
## Base query
```
WITH dat AS(
	SELECT r_nik nik, count(*)
	FROM bwars_redlist.range_checked_mat
	WHERE spatial_check = FALSE
	AND r_nik != 646 -- Ignore Apis
	GROUP BY r_nik
)

SELECT binomial, count
FROM dat d
JOIN nomenclature.binomial b on d.nik = b.tik
ORDER BY count desc
```

## Magnitude test
This query looks at the mean distance from the edge of the 40km buffer, as well as the std deviation, on a per-Understanding basis. An average value of '10' would mean that records are, on average, only 10 m outside of the 40 km buffer. A value of 40,000 means that they are 40 km away from the buffer i.e. *somewhere* around 80 km from the nearest known record.

**This is highly experimental. I did it in 3 minutes and am literally looking at this for the first time ever right now**

```
SELECT b.binomial, round(avg(st_distance(poly, env))) avg, ROUND(stddev(st_distance(poly, env))) stdev, count(*)
FROM bwars_redlist.range_checked_mat i
LEFT JOIN checker.bounded_annual_buffer_40 bab ON i.r_nik = bab.tik AND i.bound_year = bab.yr
JOIN nomenclature.binomial b on i.r_nik = b.tik
WHERE spatial_check = FALSE
AND ver_2 = 'Correct'
AND r_nik != 646 -- No Apis
GROUP BY b.binomial
ORDER BY avg DESC
```

### What about 15 most common out of range?
>**Instructions for use**
> 
> This is a complex one that's being used 'live' so trying to avoid mis-steps
>
> - Make sure to assign any ver_status_2 criteria to *both* sides of the query. Only using one will result in garbage out.
> - Make sure to assign ANY subselections to both sides in fact, otherwise garbage. Stuff like 'not Apis' or 'Not non-compliant verifiers' will need to go to both
```
WITH sample AS(
	SELECT r_nik nik, count(*)
	FROM bwars_redlist.range_checked_mat m
	WHERE r_nik != 646
	GROUP BY r_nik
	ORDER BY count DESC
	LIMIT 15
)

SELECT binomial, round(avg(st_distance(poly, env))) avg, ROUND(stddev(st_distance(poly, env))) stdev, count(*)
FROM bwars_redlist.range_checked_mat i
LEFT JOIN checker.bounded_annual_buffer_40 bab ON i.r_nik = bab.tik AND i.bound_year = bab.yr
JOIN nomenclature.binomial b on i.r_nik = b.tik
JOIN sample s ON i.r_nik = s.nik
WHERE spatial_check = FALSE
AND r_nik != 646 -- No Apis
GROUP BY binomial
ORDER BY avg DESC
```

### Magnitude correct only
Sorted by mean, descending

|Understanding|Mean (m)|Std Dev (m)|Num records|
|---|---:|---:|---:|
|Anthophora plumipes: iso. Amiet et al: 2007|53682|41923|161
|Bombus jonellus: iso. Cameron et al: 2007|41942|35035|40
|Bombus vestalis: iso. Cameron et al: 2007|35597|29224|43
|Andrena clarkella: iso. Perkins: 1919|27428|20256|40
|Nomada goodeniana: iso. Perkins: 1919|25827|26793|46
|Anthidium manicatum: iso. Amiet et al: 2004|23801|21174|49
|Andrena fulva: iso. Perkins: 1919|23520|22257|92
|Andrena nigroaenea: iso. Perkins: 1919|20919|21646|43
|Vespa crabro: iso. Archer: 1989|18302|17994|122
|Andrena bicolor: iso. Amiet et al: 2010|17815|14336|46
|Nomada marshamella: iso. Perkins: 1919|16497|16512|43
|Bombus hypnorum: iso. Cameron et al: 2007|16406|17802|37
|Andrena cineraria: iso. Perkins: 1919|15663|10894|44
|Osmia bicornis: iso. Amiet et al: 2004|12571|14528|56
|Bombus hortorum: iso. Cameron et al: 2007|12028|24870|54

### Magnitude considered correct only
Sorted by mean, descending

|Understanding|Mean (m)|Std Dev (m)|Num records|
|---|---:|---:|---:|
|Anthophora plumipes: iso. Amiet et al: 2007|38099|32458|84
|Bombus muscorum: iso. Cameron et al: 2007|35672|23252|22
|Anthidium manicatum: iso. Amiet et al: 2004|25351|25668|17
|Bombus monticola: iso. Cameron et al: 2007|24364|24454|22
|Bombus pratorum: iso. Cameron et al: 2007|21069|24612|25
|Andrena fulva: iso. Perkins: 1919|20193|22970|22
|Osmia bicornis: iso. Amiet et al: 2004|18114|15281|20
|Vespula vulgaris: iso. Archer: 1989|15798|22918|25
|Bombus hypnorum: iso. Cameron et al: 2007|15400|26099|37
|Vespa crabro: iso. Archer: 1989|15023|15781|90
|Bombus lapidarius: iso. Cameron et al: 2007|14907|21734|28
|Bombus pascuorum: iso. Cameron et al: 2007|13885|17573|27
|Andrena cineraria: iso. Perkins: 1919|13881|11593|22
|Bombus hortorum: iso. Cameron et al: 2007|13136|16114|22
|Bombus vestalis: iso. Cameron et al: 2007|11919|15824|19

### Magnitude per verifier (unsorted)
Looking for a pattern in the records that a verifier verifies. **This includes incorrect/plausible/impossible to tell**

|Verifier|Mean (m)|Std Dev (m)|Num records|
|---|---:|---:|---:|
|support, iRecord|137552|113297|20
|Boyes, Clare|58556|87437|7
|Comont, Richard|42865|2602|2
|Roberts, Stuart|37334|51155|2660
|Smith, Matt|36192|59361|1734
|*NULL*|34246|44971|3777
|Power, James|34115||1
|Fox, Mike|30433|49457|565
|Jones, Nigel|27952|20811|4
|Northey, Alex|25304|16433|3
|Cartwright, R A|21927|34161|91
|Jones, Dave|21562|28499|88
|Hargreaves, Ben|20556|31376|281
|boulton, stephen|20433|19040|79
|Vincett, Janice|18137|7449|5

### Magnitude per verifier (C & CC)
Mike Fox's ant records turning up where expected. Ben has been very cautious *and* modern-only, so the info there is cleaner than the long-term verifiers. There's likely some decent amount of range expansion to be captured from iRecord if we can figure out *how to find it and not the wrong data*.
|Verifier|Mean (m)|Std Dev (m)|Num records|
|---|---:|---:|---:|
|Roberts, Stuart|31038|36253|1740
|Smith, Matt|25814|32631|1021
|Fox, Mike|24185|28570|399
|Hargreaves, Ben|17918|24851|251
|Jones, Dave|21550|28668|86
|Rankin, Charlotte|14759|17911|83
|boulton, stephen|20433|19040|79
|Cartwright, R A|17804|29385|77
|Clark, Ryan|3602|2492|21
|Nicholls, David|6065|8571|16
|McCartney, Karen|17377|32442|11
|Madgwick, Tony|8561|8644|7
|Boyes, Clare|65511|93637|6
|Vincett, Janice|15595|631|2
|Higgott, Mike|3694|1971|2
|Comont, Richard|42864|2601|2
|Timms, Sue|12343|15843|2
|Ely, Bill|14451|*NULL*|1

## Magnitude per species
1/6th 'highly suspicious' rate?

- Nope, not that high on most taxa
- Seems like a per-taxa thing

Look at where the cliff drops off on individual species graphs
- Statisticians laughed and said 'good luck, we're trying to work that out in our own fields' when asked about outlier identification