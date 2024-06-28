# Data Reliability

- Methods used in Red List require precision *or* enough standardised, directed sampling effort (not data)
  - The MCP is designed for standardised, directed sampling effort. Outliers will therefore be wrong, as we can statistically ignore them. But MCP doesn't work here because
    - Outliers are not wrong but a potential effect of opportunistic survey
    - Data volume is insufficient to use MCP for many taxa
    - The most affected by the low-volume problem are those where the assessment is the most critical

- The experience required to reach accurate species-level determinations for the taxon group is estimated at 5 years study for a recorder with prior experience of biological identification
  - Also requires a reference collection for many taxa
  - Microscope is required for a great many taxa
  - Experienced recorders are still getting nomenclature incorrect ~20 years after changes have been made.

- Usually these problems would be addressed by the use of a statistical analysis method to 'smooth' away outliers
  - This method assumes that outliers are incorrect
  - Outliers in biological recording analysis are often the most important
  - In the Red List, outliers tell us about potential expansion
  - Removing outliers therefore means that threat statuses have a significantly higher risk of being over-estimated
---
Data reliability is a core aspect of the BWARS dataset. Specifically, that the occurrence data (what/where/when) is accurate. In this situation, accuracy means that:

- The determiner has the skillset to reliably (though not perfectly) identify the taxon in question
- The determiner has a low determination error rate
- The provided location is reasonable, given our current understanding of where the taxon resides
- The provided date (or date range) is reasonable, given our current understanding of when the taxon can be detected (e.g. flight period)


The hardest part to correcting an incorrect record is to first of all *notice* that a record is incorrect. Until this project, the predominant way in which data were peer-reviewed was through the BWARS maps. Accordingly, this method could only detect spatial outliers. Occasionally a recipient of the BWARS dataset would identify other outliers - notably when attempting to make a regional atlas - but the vast majority of 'incorrect record' notifications arose through the BWARS maps.

There are two main problems with the use of maps as the main source of quality control:

- The maps are not updated live, and must be manually pushed to the server. Until recently, BWARS did not have the capability to produce their own maps. This has now been rectified, but the path of data to the website maps remains manual and prone to additional lag between data updates
- Maps can only address spatial inconsistency, not determination or temporal issues

Efforts are being made to address the deficit, such as highlighting records which are either out-of-season or out-of-range, but these metrics are imprecise and, currently, lacking in a verifier-friendly user interface.

## Why does quality matter so much?
There are, very broadly speaking, two ways to analyse occurence data in regards to quality. The first is to assume that every record is correct, the other is to assume that every record is potentially incorrect.

Why would anyone ever use the first option? Because there is no way to implement the second option that does not remove outliers. The vast majority of outliers which are readily identifiable, post data-cleaning, are typically entirely correct records. The most prevalent cause of these outliers is taxon movement in response to changing conditions. Additionally, outliers maybe simply be the result of very low data volume/sampling effort/sampling ability. Accordingly, the removal of outliers from a post data-cleaning dataset typically results in the removal of more correct data than incorrect data. In terms of extractable information on spatial occupancy trends, which form the majority of usable Red List criteria for aculeate hymenoptera, removing outliers results in a far less accurate view of the status of a given taxon.

As a result of the difficulty in removing outliers without removing valid information, the only option is to treat every record as valid. Accordingly, great importance is placed upon cleaning the dataset as much as possible. Data quality is *especially* important when working with taxa with low data volume, as it can take very few incorrect records to provoke significant confusion as to a taxon's status. Ten incorrect records amongst the 43,995 records of *Bombus pascuorum*: iso. Cameron et al: 2007 are not likely to be noticed. Ten incorrect records of *Bethylus dendrophilus*: iso. Perkins: 1976 represents a doubling of the entire BWARS dataset.

## Assessing a determiner's capability
There are no 'official' statistics on the time taken to reach any given level of quality in recording aculeate hymenoptera. However, general opinion is that it takes 5 years of study to reach a level of general competency at identifying a reasonable selection of the simpler groups. Even then, many recorders do not keep up to date with the latest nomenclatural changes, instead relying on their extant knowledge and regular, unmodified, keys. Without Understandings being mainstream, one of the greatest skills of a verifier is knowing which interpretation to assign to an uncertain binomial. One such example of skills is identifying whether post-split components are present, or only pre-split. If a recorder has determined *Lasius platythorax* as well as *Lasius niger*, in the same year, the recorder is aware of the split. Accordingly, these binomials are most likely to be *Lasius platythorax*: iso. Seifert: 1992 and *Lasius niger*: iso. Seifert: 1992, respectively.

Post-determination conversion of binomials to Understandings is imprecise. However, in the absence of Understandings being used, assigning by proxy remains the only practical way to upgrade a determination to an Understanding. In rare cases the determiner may respond to a query, but the process of asking, clarifying, and explaining takes too long to be applied to every incoming record.
