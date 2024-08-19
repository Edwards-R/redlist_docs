CREATE OR REPLACE VIEW redlist_original.slice_1
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date < '2002-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_2
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date < '2012-01-01'::date AND dat.lower_date >= '2002-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_3
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date < '2022-01-01'::date AND dat.lower_date >= '2012-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_2a
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date < '2007-01-01'::date AND dat.lower_date >= '2002-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_2b
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date >= '2007-01-01'::date AND dat.lower_date < '2012-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_3a
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date >= '2012-01-01'::date AND dat.lower_date < '2017-01-01'::date;

CREATE OR REPLACE VIEW redlist_original.slice_3b
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM redlist_original.sur_mat dat
WHERE dat.lower_date >= '2017-01-01'::date AND dat.lower_date < '2022-01-01'::date;

