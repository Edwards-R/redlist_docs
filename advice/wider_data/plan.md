# 1. Plan for using wider data
This is a **draft** plan for *a* way to integrate wider data into the Red List process in a *reasonably* cost-effective way, without destroying data quality.

Look at proportion of records to species/sub sp
Separate records based on correct 
Examine various trends:
- Common for background
  - Osmia bicornis
  - Bombus pascuorum
- Can ignore ants, Mike Fox has included these?
- North/south divide
- Ask Mike Fox how he looked at ant data
- Maintain separation of iRecord and BWARS datasets
- Separate BWARS into higher taxa - avoid the nomenclatural confusion
- Separate iRecord into higher taxa
- BWARS data call

Perspective is 'There are 300,000 records in iRecord and BWARS isn't using any of them'

## 2. Need to investigate 

a) Are there 300,000 unique to-species records in iRecord, using the BWARS scientific standard data de-duplication routine

b) What does 'reliable' mean in the iRecord dataset

c) How reliable is the iRecord dataset

d) What is the spread of reliability in the iRecord dataset

e) How many unique, reliable records are there in the iRecord dataset

f) How many of the unique, reliable records in iRecord are present in the BWARS dataset

g) How many unique, reliable records in iRecord are considered wrong by BWARS

h) What is the general accuracy of verification, in iRecord, of the iRecord verifiers with a high capability for physical specimen identification

## 3. Breakdown of data

- How many bee/wasp/ant records total?
- General taxonomic distribution of records in iRecord
  - Species vs non-species
  - Different taxonomic areas
  - Most common
  - Over time
- General taxonomic distribution of records in BWARS
  - Species vs non-species
  - Different taxonomic areas
  - Most common
- General difficulty-of-identification ranking distribution of records?
- Verified
- Verified by people with known high capability for physical specimen identification vs not
- Verified by category (plausible, considered correct, correct etc)
- Verified by people using the 'BWARS' scheme, by category (this will be a subset of 'known high capability for physical specimen identification')
  - (BWARS)Considered correct = I trust the source and haven't looked at the individual record
  - (BWARS)Correct = I trust the record and have looked at the individual record
- Number of records under 3 point system and not 5 point system, per year
- Number of records vs de-duplicated records based on what/when/where (BWARS scientific standard) *only*
- Number of BWARS-scheme-accepted records (BWARS considered correct, BWARS correct), de-duplicated by what/where/when. *explain better*
- Number of records present in iRecord that are marked incorrect in BWARS

- Peer review of most capable & prolific verifiers
  - The only way I can think of doing this is to have independent people examine records, on iRecord, which have been verified be select people. The examiner then marks down whether they agree or disagree with the determination.
  - This is probably only statistically possible on 'accepted' records as they're the only ones which have been looked at by the verifier
  - If there's a desire to look at 'considered correct' records then that's a whole extra topic as we'd have to identify a shortlist of candidates for error. That's a ***huge*** project by itself and I haven't a clue how anyone could even start on that. How do you find an error that's unfindable and nestled amongst valid data?

## 4. Peer review of most capable & prolific verifiers
Easy one first - how much time do you want to spend? We don't know the volume of data to start with, but basic statistics says that a large enough % sample is the best way to start examining this simply. Options to do this, and potentially examine in greater detail, are:

- *X%* random sample
- *X%* random sample per year
- Subset the percentage by verifier
- Subset the percentage by taxa

Of these, we really want to test individual verifiers, so I'd suggest subsetting by verifier.

Different verifiers will have different levels of real-world experience, so broad subsetting is probably a good idea. Ants are the real stand-out category here that would likely do best from being differentiated. *Bombus* are an overwhelming proportion of bee records and should also be subsetted.

Verifiers will gain experience over time. Experience in
  - The verification system of iRecord
  - Their own physical specimen capability
  - Their own photographic identification capability

Broad subsets by time might be useful. The most important time period is probably the past 1-5 years, depending on data volume. Higher data volume/year means fewer years need to be examined to achieve a representable sample. This time period is the most important as it's the most likely to be usable given iRecord's changed to date. Even if the result of this entire exercise is 'we don't have a way to use this data', we can take the lessons learned and put them towards being able to use the data in the future.

Picking a number, I would say that 5% sample is the lowest we'd want to go. From there, work out which verifiers we will examine, which I suspect will be 2 or 3 people with enough of a data volume to start on. After that, I'd suggest working backwards from 2023 data, year by year, for as much as the budget allows. The premise is that
 - The modern data has the greatest number of corrections and benefits from the iRecord system
 - The modern data has the greatest knowledge and experience applied to it and so is the most likely to be correct
 - Even if the data turn out to be unusable at this point, they should have the fewest errors
 - Even if the data turn out to be unusable, the better understanding we have of the *current* errors, the better chance we have of fixing them and getting future usable data out.

The method is going to be as brutally simple as having a person look through a series of iRecord records and compare their own id to the id provided in an external document. As such, it depends heavily on what filters iRecord can provide. At the very worst, I can make a spreadsheet that has a record, link to the iRecord page, the provided assessment, and the peer reviewer's assessment. Because of restrictions in iRecord (only one person can verify a record), there is no way to do this process entirely internally to iRecord.

### 4.1 Time recommendations

2 days data & project prep
  - Data pre-processing
  - Assessment format
  - Investigation into classifications
  - Liason with iRecord team
  - Output format

? days investigating
  - Depends in method of investigation & budget

3 days project write up
  - Breakdown of data
  - Documentation of processes
  - Final documentation

## 5. Data breakdown and investigation

Harder to pin down a cost/time without knowing exactly what level of *reporting* is desired. Planning and documentation probably comes in at 4 days. Drawing up the data assessment in purely numerical terms is probably 5 days work to go through things carefully and cleanly, with testing of code. Creating adequate code documentation, workflows, glossary, diagrams etc will be about 7 days extra work. This can be shortened to 4 days if skipping diagrams, or further if the process doesn't need documentation (which I advise against if this is to be repeatable). However, these are *provisional* values as I don't have a copy of the data to analyse in front of me or a list of exactly what needs to be examined. These provisional costs are also dependent on the following:

### 5.1 Data pre-processing
All data from iRecord needs to be passed through the BWARS checker so that it can be compared to the BWARS database. Specifically, this covers the what/where/when of a record. This step is *mandatory* to any sort of data processing or analysis and, outside of a few specific circumstances, shouldn't be *too* outlandishly hard based on prior attempts to integrate iRecord data.

### 5.2 Nomenclature issues
The first complication involves issues of nomenclatural confusion. iRecord is using the UKSI, which is a second normal form system. Effectively, it is not possible to guarantee a precise translation of iRecord's nomenclature to a taxonomic type. BWARS using an Understanding system, which is able to guarantee precise translation to a type. Conversion of UKSI data to Understandings is doable, though the most time consuming part of data conversion. If any names which have the potential to refer to multiple types are omitted, data processing becomes significantly faster.

### 5.3 Codebase
Code will be predominantly written in postgres and delivered via a github respository. Documentation will be in markdown format.

### 5.4 Cost
Assuming the previous:

4 days planning & documentation

5 days assessment

7 days full writeup / 4 days short writeup

## 6 Examination of impact of iRecord data for specific taxa
*See [per-species](./per_species.md) for this section*

**Costings for 6. are not included in 5.4**