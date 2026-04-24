## THIS WILL ONLY WORK FOR LC TAXA

import sqlite3

from lib.narrative.RedListStatus import RedListStatus # Enumerated Red List statuses 
from lib.narrative.a2 import ProcessA
from lib.narrative.bd import ProcessBD
from lib.narrative.helper import *

# DB Connection
con = sqlite3.connect("redlist_data.sqlite")

## Get all names
names = GetList(RedListStatus.LC, con)

## Boilerplate text for C and E
other_tests = f'No information was available on population size to inform assessments against Criteria C and D1; nor were any life-history models available to inform an assessment against Criterion E.'

with open("out/narratives.csv", "w") as outFile:
    for name in names:
        outFile.write(f'{name[0]}, "{ProcessA(name[0], con)}. {(ProcessBD(name[0], con))} {other_tests}"\n')

## For each name:


## Get the A, B, and D processed
#print(f'{ProcessA(163, con)}. {(ProcessBD(163, con))} {other_tests}')

