# Why perform investigation?
BWARS has imported iRecord data into the dataset on three previous occurrences. Each time this has happened, experienced entomologists have raised significant enough objections to justify the almost immediate removal of the iRecord data. The basis for the rejection of 'iRecord data' has always been on the basis of the presence of a significant contingent of records which fail very simple range checking. Note that these imports were performed *prior* to the development of the BWARS automated range checker for this project. Range checking here was performed by taxon experts and typically concerned a number of records of taxa appearing in unrealistic spatial ranges.

## Why iRecord
It would be very easy to look at the litany of difficulties encountered whilst attempting this import process and come to the conclusion that 'iRecord/BWARS are doing it all wrong'. It is important to stress that *managing ecological data is hard*, but also that the subject taxa cover a highly unique spread of circumstances. Specifically
- public interest in bees has resulted in a large volume of 'bee' data from unknown quality sources
- increased interest in bees has resulted in significant taxonomic and nomenclatural changes within the Red List timespan
- some taxa within the specified grouping, especially ants, are diametric opposites in volume/'ease' of recording to ants

iRecord data is being investigated not because it is one of many and the 'most wrong', but because it is the frontrunner for capturing what BWARS considers 'data of unknown quality'. As such, iRecord represents an opportunity for us to learn what is *possible*, as well as what *can* be done and *how* it should be done. Ideally these lessons will be valuable to future development of data pipelines across other taxa and recording schemes.

## Previous import attempts
Do to the volunteer nature of BWARS, coupled with the very restricting nature of having *one*, still very much learning, person responsible for data management, copious notes of previous attempts simply didn't get taken. Attempts were run until significant problems were encountered, at which point the added data was removed. The following summarises what information can be recollected about each attempt.

### Attempt 1
The first attempt was a blind, rather naive, import of all `correct` and `considered correct` records, verified by people that BWARS trusted the physical specimen identification capability of. Problems were quickly encountered and the attempt abandoned.

### Attempt 2
This attempt followed immediately on the heels of the first attempt. Only `correct` data was used for this attempt, on the basis that it *should* only consist of records which had been individually examined by the 'trusted verifier' The premise of this in turn was that it was suspected that 'batch verification' was causing 'leakage' of poorer-quality data into the 'clean' dataset. If this leakage could be isolated, it would be possible to incorporate at least *some* of the iRecord dataset.

Unfortunately, upon completion, a significant number of erroneous records were still identified by subject experts. This led to a number of questions within BWARS, as the first response was to ask the verifiers 'what is going on here?'. The answers to this question were many, as well as a some flaws being demonstrated in iRecord that led to an explanation of various errors. These were brought to BRC's attention, which led to a degree of fixes over time. Unfortunately, fixing extant data is a *very* time consuming task, not to mentioned that it is impossible to correct a record until it can be identified as incorrect.

### Attempt 3
A number of years after the last conversation between BWARS and BRC, it was decided to attempt to try to integrate iRecord data into BWARS once again. BRC had published a number of bug fixes, as well as polished a lot of rough edges. Once again, the dataset was filtered to records verified by a known and trusted person, then filtered once more to return the subset of `correct` records. The result of this attempt was that:

- It looked like BRC has fixed the bugs in the more recent data
- Old data is still more suspect
- There are still errors happening, and we can't work out how or why

However, with more pressing projects pending there was no time to dedicate to further exploration and the project was shelved once more.

## Data flow between BWARS and iRecord
Data still flows from iRecord to BWARS. Individuals are asked to download their own data, perform some basic checks to ensure the accuracy of the output, and then send the data to join the standard BWARS data flow. From here, the dataset is treated as any other.

## The purpose of this investigation

The higher-level goals of this investigation are to evaluate the following:

- Whether it is possible to include direct iRecord data exports, at any level, in the BWARS database
- Whether it is possible to include direct iRecord data exports, at any level, in the Red List dataset
- The data potential of iRecord under different parameters
- The distribution of data within iRecord
    - over time
    - by taxa
- The presence of suspected flaws/features in the import process
- The photo-verification accuracy of people with high physical specimen identification skills
- How data consumers utilise the iRecord system
- The potential to use the BWARS spatial and temporal mask system to provide verification assistance