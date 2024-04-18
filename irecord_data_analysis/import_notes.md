# Import notes
This document outlines the processing of the iRecord dataset of ||through the BWARS Checker. The Checker is responsible for checking the `core` attributes of a record:

- What
- Where
- When

Once data is processed through the checker, it will be reunited via relational database using the `id` as primary key. Doing so allows the original data to be maintained whilst enabling Understandings.

The following is a transcription of actions/problems as-encountered and is fairly rough. At the end of each run is a summary which details findings.

Data have been filtered to:
`OSGB` projection
Species rank

## Feedback
A place to put feedback

- Timestamp format is annoying to use. It's not YYYY-MM-DD HH:MM:SS, so attempting to sort on it just doesn't work.
- Significant cause for caution here. Applications will read this timestamp in whatever setting is their 'default' - which could well be Americanised dates!
- Attempting to export 'all' data resulted in a timeout on the connection. I had to break it up into multiple chunks to get the data out. I suspect this is because the export function is running a `SELECT` rather than `COPY` based on what I've ended up doing with the BWARS database. `SELECT` took 100x longer than `COPY` and used *far* less resources to implement.
- The notifications prompting to download the file place the newest at the bottom. Took me a second to realise that the page had gotten longer and the new requests were off the page. Putting the newest at the top of the list would probably help in comprehension.
- There seems to be a mix of Linux and Windows new lines inside the actual data, which is preventing easy import to postgres?
- Attribute names should to be `snake_case` to make data handling far easier than needing to encapsulate almost every variable name
- CSV format settings should be present on the download page. They're default standards, but having someone actually follow the rules is a surprise by itself!
- Some words used as attributes are reserved words in databases, especially `order`. No easy way out, but worth noting.

|||
|---|---|
|Delimiter|`,`|
|Quote|`"`|
|Escape|`"`|
|Null||

## Run 1
- All iRecord data
- OSGB format datum outputs
- Species only

> Original data selection should have excluded the 'insufficient spatial precision' dataset from calculation. As such, records which failed based on this attribute have been isolated from other errors during analysis to avoid bias.

Input: 398,952 records

All data pre-processed and then processed. Took a few hours, so was left overnight.

*Andrena fulva* was manually assigned as a known & automatable failure of the Checker (7,838 records). The failure is beacuse the Checker is performing substring matching on the input name, and *Andrena fulva* is a substring of *Andrena fulvago*.

|Result||
|---|---|
|Passed|341,688|
|Failed|57,264|

|Reason for failure||
|---|---|
|Multiple potential species| 56,293|
|No grid ref/VC match found| 131|
|Sub-grid OSGB|785|
|Species not present in Checker|236|

### Discussion
Firstly, records may fail on multiple attributes. As such, the sum of reasons for failure will not always add up to the total of failures. By *far* the highest source of error was nomenclature.

The Checker is not capable of handing subgrid (i.e. AA0000X) grid references. So few such records reach BWARS that development of this functionality was simply not considered important. The usage of tetrad grid references in the age of handheld GPS devices is very uncommon in Aculeate recording.

Gridref/VC match not found relates to records which are placed in the sea. The Checker has a list of all grid references for terrestrial GB, CI, and IE to which it compares every record. If the grid reference (at 10km or 1km resolution, whichever is present and finer) does not exist in this list then the check fails. There are a few cases where this failure is incorrect, but very few. Out of the ~400,000 records presented to the Checker, 131 failures is around what is expected for a false negative (i.e. 'Test says it's wrong, but it is in fact correct') in this metric.

The species not present in the Checker are:
|Input taxon|Notes|
|---|---|
|Technomyrmex albipes|Tramp species|
|Hylaeus dilatatus [Genus inferred]|Incorrectly formed name|
|Nomada glabella sensu Stöckhert nec Thomson, 1870|Non-standard|
|Formica picea [Genus inferred]|Incorrectly formed name|
|Vespa orientalis|Assumed misident?|
|Linepithema iniquum|Tramp ant group|
|Sceliphron caementarium|New arrival tramp species|
|Megachile parietina|Assumed misident|
|Anteon jurineanum sensu lato|Unknown taxon, potentially so old as to have not been included in BWARS Understandings|
|Messor capitatus|Harvester ant, tramp, never established|
|Plagiolepis alluaudi|Tramp ant|
|Bombus ruderatus subsp. perniger|BWARS does not use subspecies|
|Holopyga fastuosa subsp. generosa|BWARS does not use subspecies|

6 of the 13 species are 'epithet' species - those which have accompanying non-standardised extra information other than genus & species. These are impossible to handle in any reasonable manner by automated systems.

Of the 56,293 records which had multiple potential species matches, 56,112 of these *only* failed on this attribute. Moving to an Understandings-based system would result in the inclusion of those 56,112 records.

Using binomial nomenclature, the failure rate of the iRecord dataset was 16.8%. Using Understanding nomenclature, the failure rate of the iRecord dataset would be 0.4%.