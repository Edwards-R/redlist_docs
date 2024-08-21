WITH raw AS (
	SELECT *
	FROM redlist_original.sur_mat
),

taxa AS (
	SELECT DISTINCT(r_nik) r_nik
	FROM raw
),

tetrad AS (
	SELECT r_nik,
	(FLOOR(easting/2000)*2000)::int easting,
	(FLOOR(northing/2000)*2000)::int northing
	FROM raw
	GROUP BY r_nik, FLOOR(easting/2000)*2000, FLOOR(northing/2000)*2000
),

poly_tetrad AS (
	SELECT r_nik, ST_MAKEENVELOPE(easting, northing, easting+2000, northing+2000, 27700) poly
	FROM tetrad
),

england AS (
	SELECT r_nik, COUNT(*)
	FROM poly_tetrad
	WHERE ST_INTERSECTS(poly, (SELECT geom FROM country_block_outlines WHERE region = 'England')) IS TRUE
	GROUP BY r_nik
),

scotland AS (
	SELECT r_nik, COUNT(*)
	FROM poly_tetrad
	WHERE ST_INTERSECTS(poly, (SELECT geom FROM country_block_outlines WHERE region = 'Scotland')) IS TRUE
	GROUP BY r_nik
),

wales AS (
	SELECT r_nik, COUNT(*)
	FROM poly_tetrad
	WHERE ST_INTERSECTS(poly, (SELECT geom FROM country_block_outlines WHERE region = 'Wales')) IS TRUE
	GROUP BY r_nik
)

SELECT taxa.r_nik,
COALESCE(england.count, 0)*4 england,
COALESCE(scotland.count, 0)*4 scotland,
COALESCE(wales.count, 0)*4 wales
FROM taxa
LEFT OUTER JOIN england ON taxa.r_nik = england.r_nik
LEFT OUTER JOIN scotland ON taxa.r_nik = scotland.r_nik
LEFT OUTER JOIN wales ON taxa.r_nik = wales.r_nik