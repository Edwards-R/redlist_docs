-- Change the field selected to change the model
-- e.g. 'X.num_records' to 'X.tetrad'

WITH taxa AS (
	SELECT DISTINCT r_nik
	FROM redlist_original.sur_mat
)

SELECT taxa.r_nik,
COALESCE(p1.num_records, 0) p1,
COALESCE(p2.num_records, 0) p2,
COALESCE(p3.num_records, 0) p3,
COALESCE(p2a.num_records, 0) p2a,
COALESCE(p2b.num_records, 0) p2b,
COALESCE(p3a.num_records, 0) p3a,
COALESCE(p3b.num_records, 0) p3b
FROM taxa
LEFT OUTER JOIN redlist_original.processed_1 p1 ON taxa.r_nik = p1.r_nik
LEFT OUTER JOIN redlist_original.processed_2 p2 ON taxa.r_nik = p2.r_nik
LEFT OUTER JOIN redlist_original.processed_3 p3 ON taxa.r_nik = p3.r_nik
LEFT OUTER JOIN redlist_original.processed_2a p2a ON taxa.r_nik = p2a.r_nik
LEFT OUTER JOIN redlist_original.processed_2b p2b ON taxa.r_nik = p2b.r_nik
LEFT OUTER JOIN redlist_original.processed_3a p3a ON taxa.r_nik = p3a.r_nik
LEFT OUTER JOIN redlist_original.processed_3b p3b ON taxa.r_nik = p3b.r_nik;