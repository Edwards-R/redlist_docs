-- Query that looks at the difference in records
-- In documentation terms this is between the 'redlist' and 'combined' datasets

WITH combined AS (
	SELECT DISTINCT(r_nik) FROM (
		SELECT DISTINCT(r_nik)
		FROM redlist_original.num_records
		UNION
		SELECT DISTINCT(r_nik)
		FROM redlist_recalc.num_records
	) c
)

SELECT c.r_nik, b.binomial, o.pall redlist, r.pall combined
FROM combined c
JOIN nomenclature.binomial b on c.r_nik = b.nik
LEFT OUTER JOIN redlist_original.num_records o ON c.r_nik = o.r_nik
LEFT OUTER JOIN redlist_recalc.num_records r ON c.r_nik = r.r_nik