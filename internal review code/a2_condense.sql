-- Runs in SQLite

-- Set up tables
CREATE TABLE "a2_assessment" (
	"id"	INTEGER NOT NULL UNIQUE,
	"nik"	INTEGER NOT NULL,
	"model"	TEXT NOT NULL,
	"assessment"	TEXT NOT NULL,
	"status"	TEXT,
	"support"	TEXT,
	"accepted"	INTEGER,
	"justification"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "a2_support" (
	"id"	INTEGER NOT NULL UNIQUE,
	"assessment"	INTEGER NOT NULL,
	"value"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

-- Convert all the model-assessments to 3NF

-- Record count
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'Raw data' model, 'Record count' assessment, raw_a2_count, raw_a2_count_support, aa_raw_a2_count, aa_raw_a2_count_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Raw AoO
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'Raw data' model, 'AoO' assessment, raw_a2_aoo, raw_a2_aoo_support, aa_raw_a2_AoO, aa_raw_a2_AoO_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Buffer Union dEoO
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'Buffer union' model, 'dEoO' assessment, bu_a2_eoo, bu_a2_eoo_support, aa_BU_A2_dEoO, aa_BU_A2_dEoO_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Bayesian direct
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'Bayesian' model, 'Calcuated' assessment, bayesian_a2, bayesian_a2_support, aa_bayesian_a2, aa_bayesian_a2_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Bayesian expert
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'Bayesian' model, 'Expert' assessment, bayesian_a2_expert, bayesian_a2_expert_support, aa_bayesian_a2_expert, aa_bayesian_a2_expert_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Expert Opinion
INSERT INTO a2_assessment (nik, model, assessment, status, support, accepted, justification)
SELECT tik, 'expert' model, 'internal' assessment, expert_a2, expert_a2_support, aa_expert_a2, aa_expert_a2_reason
FROM raw_support
WHERE final_status_2 != 'NE';

-- Decouple the support

-- b
INSERT INTO a2_support (assessment, value)
SELECT id, 'b'
FROM a2_assessment
WHERE support LIKE '%b%'

-- c
INSERT INTO a2_support (assessment, value)
SELECT id, 'c'
FROM a2_assessment
WHERE support LIKE '%c%'


-- View results
WITH accepts AS(
	SELECT *
	FROM a2_assessment
	WHERE accepted = 'Yes'
),
dat AS (
	SELECT nik, value
	FROM accepts a2
	LEFT OUTER JOIN a2_support a2s ON a2.id = a2s.assessment
	GROUP BY nik, value
),
grouped AS (
SELECT nik, GROUP_CONCAT(value) val
FROM dat
GROUP BY nik
)

SELECT *
FROM grouped;