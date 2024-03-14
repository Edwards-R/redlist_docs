# Investigation of the BWARS dataset
This file documents various investigations into the provenance of the BWARS dataset. Note that this is *not* the same as the **Red List dataset**. The BWARS dataset is a contributor to the Red List dataset and is being analysed here to examine the dataflow over time. The specific metric of interest is

> *How quickly does data go from collection to presence in the BWARS database?*

## Data inclusion process
In order for a record to be present in the BWARS database, a number of actions have to be taken. In order, these are:

- Collection of raw material e.g.
    - Surveys
    - Opportunistic observations
    - Field books
    - Trapping
- Identification, to species level, of collected data
- Digitisation of data
- Supply of data to BWARS
- BWARS processing of data using tools
- Upload to the database
- De-duplication of data
- Range checking
- Addition to the BWARS dataset

These steps represent a very large time investment. Starting at the beginning:

### Data collection & identification
Collection, identification, and digitisation of data are often separated by months by the pattern of work in Entomology. The 'field season', which is where the organisms are adult and identifiable, is typically filled with sample/data collection. Only once this period has drawn to a close does identification and, hopefully, digitisation of data occur. BWARS is *entirely* reliant on the **donation** of data. It does not employ, contract, nor demand data. As a result, we cannot specify or mandate data pathways or completion dates. Everything is performed at the good will and time scale of the people providing that data.

### Arrival at BWARS
Once the data arrives with BWARS, we currently rely on two volunteers (though primarily one) to process the entire incoming data volume. The processing is performed using a custom application that converts the what, where, and when to a standardised format. Binomials are translated, as accurately as possible, to binomial understandings. Grid references are checked for validity and very basic verification (i.e. terrestrial Great Britain). Dates are converted to ISO 8601 format (YYYY-MM-DD) in a primarily autonomous manner, though the operator does need to interfere from time-to-time, especially to convert single-field range dates (e.g. `21/5/20 - 26/5/20`) to lower and upper bounded dates (e.g. *Lower*: `2020-05-21` *Upper*: `2020-05-26`). Other data fields are cleaned to remove standard string errors, such unknown (non UTF-8) characters, leading and trailing spaces etc. Once this is performed, all records which pass a series of checks are exported to a document. This document is then supplied to the BWARS database admin.

### Entry to the database
Upon supply of data, the database admin then has to upload the supplied file to the database. Incoming data is de-duplicated on the basis of what/where/when + recorder name. This step is not perfect and relies overly on BWARS being a pure occurrence database, but removes the vast bulk of replication. Incoming datasets are also checked for self-replication, though this is currently not resolved automatically and requires manual intervention.

From here, the data go through a series of checks designed to establish whether or not a particular data point falls within expected temporal (flight period) and spatial (distribution) range. Records which pass these tests are then passed through to the main database. Records which fail require further examination by experts to ascertain whether the record is genuine or a mistake. This process of further examination generally consists of a series of email exchanges, again often taking weeks to find answers.

This is the end of the process.

## Red List data sourcing (goes in other doc not here)
- Paid Claire
- Put out call for data
- Weren't concerned about replication, completeness, presence of 'other' taxa