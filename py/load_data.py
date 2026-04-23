## Load up the data from the Filemaker exports into SQLite so that other steps can run
import sqlite3
import pandas
import glob
import os
import shutil # Shell Utils
from pathlib import Path
import csv

from lib.prepare import markdown_prep, narrative_prep, normalise_tables, a2_bd_stats_generator, data_wrangle
#import lib.prepare.py # Preparation library

# Establish database connection & cursor
if os.path.exists("redlist_data.sqlite"):
    os.remove("redlist_data.sqlite")

con = sqlite3.connect("redlist_data.sqlite")
cur = con.cursor()

# Going to do some prep work on the markdown file here to remove the worst of the Filemaker stupid
markdown_prep()
narrative_prep()

# Load up the csv files into sqlite using pandas to be faster
filenames = []
for file in glob.glob("filemaker_data/*.mer"):
    path = Path(file)
    data_in = pandas.read_csv("filemaker_data/" + path.name, na_filter=False)
    data_in.to_sql(path.stem, con)

# Normalise all the attribute names. Most of this is just `tik` -> `nik`
normalise_tables(cur)

## Data is now loaded, do the last bits

# Any addon data wrangling
data_wrangle(cur)

a2_bd_stats_generator(cur)
# Data is now loaded into SQLite and ready for use