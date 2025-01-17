# Readme
There is a high probability that people will want to include/exclude various bits and pieces, chop and change data etc. To suit this, every query here should rely on an aliased table as input.

Each query here expects to be given input tables which are filtered to the project geographic and temporal scope. Each table should have:

- What
  - Recommend Understandings use to be safe
- Where
  - Easting
  - Northing
  - Accuracy (or precision)
  - Datum
- When (iso 8601 format date)
  - Lower
  - Upper