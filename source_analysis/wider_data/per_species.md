# Per Species
Per-species investigation of the effects of utilising iRecord data.

## What data to use?
Following on from the 'wider plan', this should leave a core pool of data which is determined to be 'trustworthy'. At a guess, this will be de-duplicated data 

## Groupings
In order to assess the impacts of including this data on taxa it is neccessary to gain an understanding of the dataset's inherent biases first. This methodology lays out how we have grouped the BWARS data for examination of bias, so that the same overall process may be followed for the iRecord data.

Taxa selected for 

### Taxon groupings
- Bombus
- Other bees
- Social wasps
- Other wasps
- Ants

### Rarity
- Common
- Rarer

### Restriction
Localised range 

### Other restrictions
- No nomenclatural confusion within past 60 years
- Identifiable from non-specimen vouchers

## Background taxa

|Taxon group|Rarity|Range restriction|Species|Reason|
|---|---|---|---|---|
|Bombus|Common|No|Bombus pascuorum|Most common Bombus|
|Bombus|Rarer|No|Bombus monticola|Common enough to have data and reliably identifiable from photos (though risk of misidentification is noted)|
|Bombus|Common|Yes|Bombus humilis|Very restricted in range. Range is well known and understood|
|Other bees|Common|No|Andrea haemorrhoa|One of the commonest solitary bees. Chosen over Osmia bicornis due to A. haemorrhoa requiring slightly more skill to identify and an expected better spread of data.|
|Other bees|Rarer|No|Halictus tumulorum|Easily distinguishable from photographs that show requisite features.|
|Other bees|Common|Yes|Andrena hattorfiana|Distinctive, highly restricted.|
|Social wasp|Common|No|Vespula germanica|Common, does require consideration of V. vulgaris to avoid confusion|
|Social wasp|Rarer|No|Dolichovespula norwegica|Best option out of a very limited selection.|
|Social wasp|Common|Yes|Vespa crabro|Very very distinctive, verifiers should identify this with no problem. A few unusual yet confirmed records present in Scotland, but overall  restricted to southern GB|
|Other wasp|Common|No|Ectemius continuous| Distinctive and has reasonable geographic coverage|
|Other wasp|Rarer|No|Ammophila sabulosa|Reaches into Scotland, though only just. Large enough to be identifiable from photos.|
|Other wasp|Common|Yes|Gorytes laticinctus|Spreading from southern England. Very obvious and well recorded, particularly through photos|
|Ant|Common|No|Myrmica ruginodis|Most common ant in BWARS data|
|Ant|Rarer|No|Lasius fuliginosus|Whole country range, very distinctive in photos and easily seen & recorded|
|Ant|Common|Yes|Formica sanguinea| Identifiable from photos, if the photo shows the character. Very distinct population separation.|

## Identification of low-record candidates
One option is to attempt to use iRecord data to bolster a taxon out of 'Data Deficient' status, where the deficiency in data is *not* a result of nomenclatural confusion. Data Deficient is the *worst* possible status a taxon may be assessed as, therefore it logically follows that at least some effort should focus around the elimination of as much Data Deficient result as possible, without compromising the integrity of the result. Even so, some taxa *will* still be Data Deficient after this process.

### Process of Selection
 - Identify taxa with `DD` status where the cause is not due to confusion
 - Identify the number of eligible records per taxon in the 'suitable for use' iRecord subset
 - Re-run appropriate analysis, incorporating the iRecord data

## Impact on Critically Endangered taxa
Another option for the use of extra data is to examine whether the inclusion of more data removes taxa from the Critically Endangered status. Particular care needs to be taken *if* a decision is made to use a population estimate threat criterion that the inclusion of extra data is explicitly mentioned. There are not expected to be many taxa which arrive at this threat status, based on preliminary investigation.

### Process of Selection
 - Identify taxa with `CR` status
 - Identify the number of eligible records per taxon in the 'suitable for use' iRecord subset
 - Re-run appropriate analysis, incorporating the iRecord data

## Impact on other Threat Statuses
Of lesser concern than `CR` taxa, the process of re-examination may be used on lesser threat categories. As a non-threat category, `NT` should be disregarded from this stage.

### Process of Selection
 - Identify taxa with `VU` or `EN` status
 - Identify the number of eligible records per taxon in the 'suitable for use' iRecord subset
 - Re-run appropriate analysis, incorporating the iRecord data

## Population Estimation
It has been mentioned that it is *required* to use criteria which rely on population size. *Assuming* that a satisfactory ruling can be found to convert observed records of a population to a Red List compatible 'size of reproductive population' metric, it *may* be possible to assess a taxon based on population-defined criteria.

In such a case, extra data may be useful in reaching a final population count so as to not fall foul of the **guidance** to avoid a `worse case scenario` assessment.

### Process of Selection
 - Identify taxa which the expert & population equation place as potential candidates for assessment under population-based criteria
 - Identify the number of eligible records per taxon in the 'suitable for use' iRecord subset
 - Re-run population equation using the newly available data
 - Check for additional recorder bias effects within each dataset to ensure that status is not over-inflated by simple low recording effort

## Budget

|Item|Days|Explanation|
|---|---|---|
|Rerun of statistics, including selected iRecord data|1|Rerunning all non-CEH statistics using current 'Redlist' data plus iRecord data deemed of sufficient quality. Will need to re-use existing scripts in a different use-case, and so will require the running of quality control metrics and analysis to ensure success|
|Core team induction|3|As is done with the main Redlist dataset, the core team will require time to be informed of the various biases, problems, observations etc that the introduction of iRecord data has caused. Any left over time is rolled into the data analysis stage|
|Data analysis by core team|6|Analysis must follow the same protocol as the actual Redlist in order to be comaprable. This covers two days of the core data team|
|Writeup|7|A summary of lessons learned from each [background taxon](#background-taxa), the effectiveness on the inclusion of iRecord DD taxa, CR taxa, and other Threat Status taxa as applicable, plus the viability of using record volume as a proxy for Red List-compatible population metrics| 
|Writeup review|3| A review of the write up to the steering group. Covers one day each for the core team with no travel included|
|**Total**|**20**|4