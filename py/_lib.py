## A collection of functions to help with 


import os

# Prepare the 'markdown' Filemaker export to remove the worst of the Filemaker weirdness etc
def markdown_prep():
    with open("filemaker_data/markdown.mer", "r") as file:
        markdown_data = file.read()

    markdown_data = markdown_data.replace("", "\n") ## Filemaker stupid newline
    markdown_data = markdown_data.replace("^2", "²") ## Replace ^2 with superscript single character since we have to deal with Excel

    with open("filemaker_data/markdown.mer", "w") as file:
        file.write(markdown_data)

# Normalise the names of various attributes in the sqlite database
def normalise_tables(cur):
    # Now we need to normalise between tik and nik
    # 'nik' is now the accepted name used in the BWARS database, so move to this

    ## Assessment
    query = "ALTER TABLE assessment RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## Assessment acceptance
    query = "ALTER TABLE assessment_acceptance RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## Buffer Union Summary
    query = "ALTER TABLE bus RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## frescalo_10
    query = "ALTER TABLE frescalo_10 RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## internal_review
    query = "ALTER TABLE internal_review RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## mcp
    query = "ALTER TABLE mcp RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## narrative. Got more to do this time
    query = "ALTER TABLE narrative RENAME COLUMN tik TO nik"
    cur.execute(query)
    query = "ALTER TABLE narrative RENAME COLUMN picked to ecological"
    cur.execute(query)
    query = "ALTER TABLE narrative RENAME COLUMN narrative TO statistical"
    cur.execute(query)

    ## national_rarity
    query = "ALTER TABLE national_rarity RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## nomenclature
    query = "ALTER TABLE nomenclature RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## occupancy_10
    query = "ALTER TABLE occupancy_10 RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## record_count
    query = "ALTER TABLE record_count RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## regional_hectad_count
    query = "ALTER TABLE regional_hectad_count RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## summary
    query = "ALTER TABLE summary RENAME COLUMN tik TO nik"
    cur.execute(query)

    ## tetrad_area
    query = "ALTER TABLE tetrad_area RENAME COLUMN tik TO nik"
    cur.execute(query)

# Queries to wrangle data into format once present in the database
def data_wrangle(cur):
    ## Turn 'synanthropy' from a blank string but present into a null
    query = "UPDATE assessment SET synanthropy = NULL WHERE synanthropy = ''"
    cur.execute(query)

def nameify(input):
    out = input.replace(":", "")
    return out

def write_markdown_ant(cur):
    os.makedirs("out/ant")
    with open("out/ant/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Ant
---

# Ant taxa
""")

        query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'ant'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/ant/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Ant
---

""")
            file.write(i[0]) # Write the markdown

def write_markdown_wasp(cur):
    os.makedirs("out/wasp")
    with open("out/wasp/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Wasp
---

# Wasp taxa
""")

    query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'wasp'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/wasp/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Wasp
---

""")
            file.write(i[0]) # Write the markdown

def write_markdown_bee(cur):
    os.makedirs("out/bee")
    with open("out/bee/index.md", "w") as file:
        file.write(r"""---
parent: 1992-2021 GB Aculeate Hymenoptera Red List
title: Bee
---

# Bee taxa
""")

    query = r"""SELECT full_jeykll, n.binomial
    FROM markdown m
    JOIN major_grouping g ON m.nik = g.nik
    JOIN nomenclature n ON m.nik = n.nik
    WHERE g.grouping = 'bee'"""
    result = cur.execute(query)
    for i in result:
        filename = nameify(i[1])
        with open("out/bee/"+filename+".md", "w") as file:
            # Write the Jeykll header
            file.write(r"""---
parent: Bee
---

""")
            file.write(i[0]) # Write the markdown


def sql_addons(cur):
    # Calc the normalised A2 stats so that they can be compared and picked from
    query = r"""CREATE VIEW a2_stats_normalised AS WITH
	raw_values AS (
		-- Record Count
		SELECT rc.nik, 'a2_count' AS model_assessment, aa.raw_a2_count acceptance, ROUND((CAST (slice_3b-slice_3a AS REAL)/slice_3a)*100) value
		FROM record_count rc
		JOIN assessment_acceptance aa ON rc.nik = aa.nik

		UNION
		-- Tetrad Count
		SELECT rc.nik, 'a2_AoO' AS model_assessment, aa.raw_a2_aoo acceptance, ROUND((CAST (slice_3b-slice_3a AS REAL)/slice_3a)*100) value
		FROM tetrad_area rc
		JOIN assessment_acceptance aa ON rc.nik = aa.nik

		UNION

		-- Buffer Union
		SELECT rc.nik, 'A2_dEoO' AS model_assessment, aa.BU_A2_dEoO acceptance, ROUND((CAST (slice_3b-slice_3a AS REAL)/slice_3a)*100) value
		FROM bus rc
		JOIN assessment_acceptance aa ON rc.nik = aa.nik

		UNION

		-- Bayesian
		SELECT rc.nik, 'A2_Bayesian' AS model_assessment, aa.bayesian_a2, round(short_term_change_mean_upper_ci) value
		FROM occupancy_10 rc
		JOIN assessment_acceptance aa ON rc.nik = aa.nik
	)
	
	SELECT row_number() OVER () id, *
	FROM raw_values"""
    cur.execute(query)

    # Now find the greatest negative change as 'a2_stat_picked'
    query = r"""CREATE VIEW a2_stat_picked AS 
        WITH eligible AS (
        SELECT *
        FROM a2_stats_normalised
        WHERE value IS NOT NULL
        AND acceptance = 'Yes'
        ),

        lowest AS (
        SELECT *, min(value)
        FROM eligible
        GROUP BY nik
        )

        SELECT nomenclature.nik nik, binomial, model_assessment, value
        FROM lowest
        JOIN nomenclature ON lowest.nik = nomenclature.nik
        ORDER BY binomial"""
    cur.execute(query)

    # B & D summary
    query = r"""CREATE VIEW bd_summary AS
        SELECT n.nik, n.binomial, wrc.status, mcp."all" c_eoo, t."all" aoo, a.b_locations, raw_b2_support b2_support, aa.raw_b1_eoo b1_used, aa.raw_b2_aoo b2_used, aa.raw_d2 d2_used
        FROM nomenclature n
        JOIN mcp ON n.nik = mcp.nik
        JOIN tetrad_area t on n.nik = t.nik
        JOIN assessment a on n.nik = a.nik
        JOIN wider_review wrc ON n.nik = wrc.nik
        JOIN assessment_acceptance aa ON n.nik = aa.nik"""
    cur.execute(query)

# A bunch of formatting changes
def narrative_prep():
    with open("filemaker_data/narrative.mer", "r") as file:
        markdown_data = file.read()

    markdown_data = markdown_data.replace("", "\n") ## Filemaker stupid newline
    markdown_data = markdown_data.replace("^2", "²") ## Replace ^2 with superscript single character since we have to deal with Excel

    with open("filemaker_data/narrative.mer", "w") as file:
        file.write(markdown_data)
