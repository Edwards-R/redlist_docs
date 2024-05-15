--A selection of queries which got complex enough to warrant noting

-- Count social wasps
SELECT count(*)
FROM all_irec_formatted i
JOIN processed p on i.id = p.id
JOIN nomenclature.binomial b on p.nik = b.tik
JOIN nomenclature.full f on b.r_tik = f.s_id
WHERE (
	f.g_id = 6 -- Vespula
	OR f.g_id = 108 -- Vespa
	OR f.g_id = 111 -- Dolichovespula
);

-- Count non-social wasps
SELECT count(*)
FROM all_irec_formatted i
JOIN processed p on i.id = p.id
JOIN nomenclature.binomial b on p.nik = b.tik
JOIN nomenclature.full f on b.r_tik = f.s_id
WHERE f.sf_id != 6 -- Not Formicidea (ants)
AND f.f_id != 14 -- Not Apidae: iso. Else & Edwards: 2018 (i.e. not bees)
AND f.g_id != 6 -- Not Vespula
AND f.g_id != 108 -- Not Vespa
AND f.g_id != 111 -- Not Dolichovespula

-- Count ants
SELECT count(*)
FROM all_irec_formatted i
JOIN processed p on i.id = p.id
JOIN nomenclature.binomial b on p.nik = b.tik
JOIN nomenclature.full f on b.r_tik = f.s_id
WHERE f.sf_id = 6 -- Formicidea

-- View verifiers by # records verified
SELECT count(*), verifier
FROM all_irec_formatted i
JOIN processed p on i.id = p.id
JOIN nomenclature.binomial b on p.nik = b.tik
JOIN nomenclature.full f on b.r_tik = f.s_id
WHERE verifier IS NOT NULL
GROUP BY verifier
ORDER BY count(*) DESC