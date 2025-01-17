-- I am not proud of this code. But I need this done now and it does.
-- Don't use this in the future. Stick it into a control language and parameterise & loop properly

-- Look in 'views' for the output tables for Filemaker

-- Make the table up that the future queries will rely upon

CREATE SCHEMA IF NOT EXISTS venerable;

SET SCHEMA 'venerable';

-- Full 30 years
CREATE TABLE simple_unique_record AS (
    -- Group then remove duplication from the data the following way
    WITH dedup AS (
        SELECT r_nik, easting, northing, accuracy, datum, lower_date, upper_date
        FROM redlist_recalc.sur_mat

        UNION

        SELECT r_nik, easting, northing, accuracy, datum, lower_date, upper_date
        FROM bwars_redlist.c_cc_sur_mat
    )

    SELECT *
    FROM dedup
    GROUP BY r_nik, easting, northing, accuracy, datum, lower_date, upper_date
);

-- Make the slices
CREATE OR REPLACE VIEW slice_1
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date < '2002-01-01'::date;

CREATE OR REPLACE VIEW slice_2
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date < '2012-01-01'::date AND dat.lower_date >= '2002-01-01'::date;

CREATE OR REPLACE VIEW slice_3
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date < '2022-01-01'::date AND dat.lower_date >= '2012-01-01'::date;

CREATE OR REPLACE VIEW slice_2a
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date < '2007-01-01'::date AND dat.lower_date >= '2002-01-01'::date;

CREATE OR REPLACE VIEW slice_2b
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date >= '2007-01-01'::date AND dat.lower_date < '2012-01-01'::date;

CREATE OR REPLACE VIEW slice_3a
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date >= '2012-01-01'::date AND dat.lower_date < '2017-01-01'::date;

CREATE OR REPLACE VIEW slice_3b
AS
SELECT dat.r_nik,
dat.easting,
dat.northing,
dat.accuracy,
dat.datum,
dat.lower_date,
dat.upper_date
FROM simple_unique_record dat
WHERE dat.lower_date >= '2017-01-01'::date AND dat.lower_date < '2022-01-01'::date;

-- Make the per-slice stats tables
-- Slice 1
CREATE TABLE slice_1_stats AS WITH raw AS (
	SELECT *
	FROM slice_1
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 2
CREATE TABLE slice_2_stats AS WITH raw AS (
	SELECT *
	FROM slice_2
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 3
CREATE TABLE slice_3_stats AS WITH raw AS (
	SELECT *
	FROM slice_3
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 2a
CREATE TABLE slice_2a_stats AS WITH raw AS (
	SELECT *
	FROM slice_2a
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 2b
CREATE TABLE slice_2b_stats AS WITH raw AS (
	SELECT *
	FROM slice_2b
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 3a
CREATE TABLE slice_3a_stats AS WITH raw AS (
	SELECT *
	FROM slice_3a
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Slice 3b
CREATE TABLE slice_3b_stats AS WITH raw AS (
	SELECT *
	FROM slice_3b
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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

-- Everything stats
CREATE TABLE everything_stats AS WITH raw AS (
	SELECT *
	FROM simple_unique_record
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
		public.ST_AREA(
			public.ST_BUFFER(
				public.ST_UNION(
					public.ST_MAKEENVELOPE(
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
	public.ST_AREA(
		public.ST_CONVEXHULL(
			public.ST_COLLECT(
				public.ST_MAKEENVELOPE(
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


-- Make view for export to Filemaker, skip if you can

-- MCP
CREATE OR REPLACE VIEW mcp AS
WITH taxa AS (
	SELECT DISTINCT r_nik
	FROM simple_unique_record
)

SELECT taxa.r_nik,
COALESCE(pall.mcp, 0) pall,
COALESCE(p1.mcp, 0) p1,
COALESCE(p2.mcp, 0) p2,
COALESCE(p3.mcp, 0) p3,
COALESCE(p2a.mcp, 0) p2a,
COALESCE(p2b.mcp, 0) p2b,
COALESCE(p3a.mcp, 0) p3a,
COALESCE(p3b.mcp, 0) p3b
FROM taxa
LEFT OUTER JOIN everything_stats pall ON taxa.r_nik = pall.r_nik
LEFT OUTER JOIN slice_1_stats p1 ON taxa.r_nik = p1.r_nik
LEFT OUTER JOIN slice_2_stats p2 ON taxa.r_nik = p2.r_nik
LEFT OUTER JOIN slice_3_stats p3 ON taxa.r_nik = p3.r_nik
LEFT OUTER JOIN slice_2a_stats p2a ON taxa.r_nik = p2a.r_nik
LEFT OUTER JOIN slice_2b_stats p2b ON taxa.r_nik = p2b.r_nik
LEFT OUTER JOIN slice_3a_stats p3a ON taxa.r_nik = p3a.r_nik
LEFT OUTER JOIN slice_3b_stats p3b ON taxa.r_nik = p3b.r_nik;


-- Number of Records
CREATE OR REPLACE VIEW num_records AS
WITH taxa AS (
	SELECT DISTINCT r_nik
	FROM simple_unique_record
)

SELECT taxa.r_nik,
COALESCE(pall.num_records, 0) pall,
COALESCE(p1.num_records, 0) p1,
COALESCE(p2.num_records, 0) p2,
COALESCE(p3.num_records, 0) p3,
COALESCE(p2a.num_records, 0) p2a,
COALESCE(p2b.num_records, 0) p2b,
COALESCE(p3a.num_records, 0) p3a,
COALESCE(p3b.num_records, 0) p3b
FROM taxa
LEFT OUTER JOIN everything_stats pall ON taxa.r_nik = pall.r_nik
LEFT OUTER JOIN slice_1_stats p1 ON taxa.r_nik = p1.r_nik
LEFT OUTER JOIN slice_2_stats p2 ON taxa.r_nik = p2.r_nik
LEFT OUTER JOIN slice_3_stats p3 ON taxa.r_nik = p3.r_nik
LEFT OUTER JOIN slice_2a_stats p2a ON taxa.r_nik = p2a.r_nik
LEFT OUTER JOIN slice_2b_stats p2b ON taxa.r_nik = p2b.r_nik
LEFT OUTER JOIN slice_3a_stats p3a ON taxa.r_nik = p3a.r_nik
LEFT OUTER JOIN slice_3b_stats p3b ON taxa.r_nik = p3b.r_nik;


-- Tetrad
-- Note converting num tetrads into sq km (x4)
CREATE OR REPLACE VIEW tetrad AS
WITH taxa AS (
	SELECT DISTINCT r_nik
	FROM simple_unique_record
)

SELECT taxa.r_nik,
COALESCE(pall.tetrad*4, 0) pall,
COALESCE(p1.tetrad*4, 0) p1,
COALESCE(p2.tetrad*4, 0) p2,
COALESCE(p3.tetrad*4, 0) p3,
COALESCE(p2a.tetrad*4, 0) p2a,
COALESCE(p2b.tetrad*4, 0) p2b,
COALESCE(p3a.tetrad*4, 0) p3a,
COALESCE(p3b.tetrad*4, 0) p3b
FROM taxa
LEFT OUTER JOIN everything_stats pall ON taxa.r_nik = pall.r_nik
LEFT OUTER JOIN slice_1_stats p1 ON taxa.r_nik = p1.r_nik
LEFT OUTER JOIN slice_2_stats p2 ON taxa.r_nik = p2.r_nik
LEFT OUTER JOIN slice_3_stats p3 ON taxa.r_nik = p3.r_nik
LEFT OUTER JOIN slice_2a_stats p2a ON taxa.r_nik = p2a.r_nik
LEFT OUTER JOIN slice_2b_stats p2b ON taxa.r_nik = p2b.r_nik
LEFT OUTER JOIN slice_3a_stats p3a ON taxa.r_nik = p3a.r_nik
LEFT OUTER JOIN slice_3b_stats p3b ON taxa.r_nik = p3b.r_nik;