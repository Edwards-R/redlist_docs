CREATE MATERIALIZED VIEW redlist_recalc.sur_mat 
AS
WITH full_data AS (
        SELECT b.r_nik,
        efc.easting,
        efc.northing,
        efc.accuracy,
        efc.datum,
        efc.lower_date,
        efc.upper_date
        FROM essex_field_club_20240723 efc
            JOIN nomenclature.binomial b ON efc.nik = b.nik
        -- Limit to intended date range and to GB (EPSG 27700) only
        WHERE efc.lower_date >= '1992-01-01'::date AND efc.upper_date <= '2021-12-31'::date AND datum = 27700
    UNION
        SELECT bwars_redlist.r_nik,
        bwars_redlist.easting,
        bwars_redlist.northing,
        bwars_redlist.accuracy,
        bwars_redlist.datum,
        bwars_redlist.lower_date,
        bwars_redlist.upper_date
        FROM redlist_recalc.bwars_redlist
        -- Limit to intended date range and to GB (EPSG 27700) only
        WHERE bwars_redlist.lower_date >= '1992-01-01'::date AND bwars_redlist.upper_date <= '2021-12-31'::date AND datum = 27700
    )
SELECT full_data.r_nik,
full_data.easting,
full_data.northing,
full_data.accuracy,
full_data.datum,
full_data.lower_date,
full_data.upper_date
FROM full_data
GROUP BY full_data.r_nik, full_data.easting, full_data.northing, full_data.accuracy, full_data.datum, full_data.lower_date, full_data.upper_date;

