-- Change the source of raw to pull from a different slice

WITH raw AS (
	SELECT *
	FROM redlist_original.slice_1
),

rec_count AS(
	SELECT r_nik, count(*)
	FROM raw
	GROUP BY r_nik
),

tetrad AS (
	SELECT r_nik,
	(FLOOR(easting/2000)*2000)::int easting,
	(FLOOR(northing/2000)*2000)::int northing
	FROM raw
	GROUP BY r_nik, FLOOR(easting/2000)*2000, FLOOR(northing/2000)*2000
),

tetrad_count AS (
	SELECT r_nik, count(*)
FROM tetrad
GROUP BY r_nik
),

hectad AS (
	SELECT r_nik,
	(FLOOR(easting/10000)*10000)::int easting,
	(FLOOR(northing/10000)*10000)::int northing
	FROM raw
	GROUP BY r_nik, FLOOR(easting/10000)*10000, FLOOR(northing/10000)*10000
),

buffer_union AS (
	SELECT r_nik,
	FLOOR(
		ST_AREA(
			ST_BUFFER(
				ST_UNION(
					ST_MAKEENVELOPE(
						easting,
						northing,
						easting+10000,
						northing+10000,
						27700
					)
				),
				40000
			)
		)*10 ^ -6
	) area
	FROM hectad
	GROUP BY r_nik
),

mcp AS (
	SELECT r_nik,
	ST_AREA(
		ST_CONVEXHULL(
			ST_COLLECT(
				ST_MAKEENVELOPE(
					easting,
					northing,
					easting+10000,
					northing+10000,
					27700
				)
			)
		)
	)*10 ^ -6 area
	FROM hectad
	GROUP BY r_nik
)

SELECT rec_count.r_nik,
rec_count.count num_records,
tetrad_count.count tetrad,
buffer_union.area buffer_union,
mcp.area mcp
FROM rec_count
JOIN tetrad_count ON rec_count.r_nik = tetrad_count.r_nik
JOIN buffer_union ON rec_count.r_nik = buffer_union.r_nik
JOIN mcp ON rec_count.r_nik = mcp.r_nik;

