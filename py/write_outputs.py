import shutil # Shell Utils
import sqlite3
import os
import pandas
import csv

from lib.markdown import *

# Open the sqlite database
con = sqlite3.connect("redlist_data.sqlite")
cur = con.cursor()

# Start by assembling the markdown
try:
    shutil.rmtree("out")
except FileNotFoundError:
    print("Directory does not exist")

os.makedirs("out")

write_markdown_ant(cur)
write_markdown_bee(cur)
write_markdown_wasp(cur)

# Grab the Excel version. Going to use Pandas to do this
query = r"""SELECT superfamily Superfamily, family Family, m.binomial 'Scientific Name', NULL TVK,
    IIF(m.binomial like '%agg:%', 'Species aggregate', 'Species') Rank,
    wrc.status 'Red List Status',
    replace(support_formatted,'',char(10)) 'Red List Supporting Criteria',
    IIF(a.synanthropy IS NOT NULL, 'true', 'false') 'Synanthropically Present', 'false' Endemic, 'Non-genuine' 'Category Change',
    nr.moderated 'National Rarity', 1 'Generational Time', a2.value '% Population Change', mcp.'all' 'Extent of Occurrence',
    ta.'all' 'Area of Occupancy', h.combined 'Hectad',
    IIF((b1_used = 'Yes' OR b2_used = 'Yes') AND b2_support IS NOT NULL,'true','false') 'Continuing Decline',
    IIF(bd.b_locations = 'Fragmented', 'true', 'false') 'Severely Fragmented',
    IIF(h.england > 0, 'true', 'false') 'Presence England',
    IIF(h.scotland > 0, 'true', 'false') 'Presence Scotland',
    IIF(h.wales > 0, 'true', 'false') 'Presence Wales',
    v.statistical || IIF(v.ecological IS NOT NULL, char(10) || char(10) ||v.ecological,'') Rationale
    FROM assessment a
    LEFT OUTER JOIN nomenclature m ON a.nik = m.nik
    LEFT OUTER JOIN wider_review wrc ON a.nik = wrc.nik /*Swap to nik from nik expected. Using WRC as it is the last step in assessment */
    LEFT OUTER JOIN internal_review ir ON a.nik = ir.nik /* Swap back to nik. I hate this. Too 'smart' for my own good */
    LEFT OUTER JOIN national_rarity nr ON a.nik = nr.nik
    LEFT OUTER JOIN a2_stat_picked a2 ON a.nik = a2.nik
    LEFT OUTER JOIN mcp ON a.nik = mcp.nik
    LEFT OUTER JOIN tetrad_area ta on a.nik = ta.nik
    LEFT OUTER JOIN regional_hectad_count h ON a.nik = h.nik
    LEFT OUTER JOIN bd_summary bd ON a.nik = bd.nik
    LEFT OUTER JOIN narrative v ON a.nik = v.nik
    WHERE wrc.status IS NOT NULL
    AND wrc.status != 'ERROR'
    ORDER BY superfamily, family, m.binomial"""
spreadsheet_data = pandas.read_sql_query(query, con)
spreadsheet_data.to_csv('out/assessment_summary.csv', index = False, quoting=csv.QUOTE_NONNUMERIC)
# Can't write to xlsx directly, have to do that step externally