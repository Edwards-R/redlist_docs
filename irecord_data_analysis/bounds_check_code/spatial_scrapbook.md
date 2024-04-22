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
|Mike F*|3,195|217|6.79%|
|Dave Jones|2,300|86|3.74%|
|Stephen Boulton|1,855|69|3.72%|
|Ben Hargreaves|1,781|79|4.4%|
|Ryan Clark|1,212|19|1.6%|
|James Power|1,044|0|0.0%|

James's verifications will also be on primarily Sussex data which, being in the south, isn't that interesting range-wise.

## Is northward range causing the errors?
Are there more range errors as the northing goes up?

>Ants won't be part of this to anywhere near the same extent and so are mainly removed. Mike Fox's verification are removed as a shortcut to 'most ant records'.

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

This is from a survey run by 'Anand Prasad', Matt Smith is down as determiner on a couple of these.

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