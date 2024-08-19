# A Regional Red List review of the Aculeate Hymenoptera of Great Britain
> Rowan Edwards, Mike Edwards, Ben Hargreaves
>
> 2025

## Summary
Reliable data of all bee, wasp, and ant taxa in GB were sourced and used to generate models. These models were then assessed against IUCN Red List criteria to determine the appropriate threat status (at national level) for each taxon.

## Methodology
The fundamental protocol of this Red List is to utilise multiple models, statistical and otherwise, to evaluate each taxon against Red List Criteria. The models used are:

- Expert opinion
- Raw record count
- Tetrad area
- Minimum Convex Polygon
- 40 km buffered polygon (Buffer-Union)
- Frescalo (Taxon association mitigation)
- Bayesian Occupancy (Bayesian frequency interpretation)

## Sources of data
The data used for this Red List come from two sources: the UK Bees Wasps and Ants Recording Society (BWARS), and the Essex Field Club. Both of these data sources are considered tertiary data sources as they compile data from a range of primary sources. Furthermore, both sources are considered to be *opportunistic occurrence* datasets.

### Essex Field Club
The Essex Field Club hold data on multiple taxa for the 'Essex' general region. This data is held as a commercial interest of the Essex Field Club and is therefore not openly available. There is a degree of overlap with the BWARS dataset, with some contributors submitting to both schemes, as well as open data being sourced to both schemes.

This dataset consists of 85,770 records with an unknown degree of overlap with the BWARS dataset.

### BWARS
The BWARS dataset covers Great Britain, all of Ireland, as well as the Channel Islands.BWARS data is not open sourced and instead relies on a crowd-sourcing license. A significant portion of data is derived from commercial surveys and activities - many of which have financial vested interests. The use of a crowd sourcing license allows BWARS freedom to accept data which cannot be released under open access restrictions.

The BWARS dataset consists of 1,116,599 unique records for Great Britain.

## De-duplication
The combined data set was filtered for duplication on the basis of a match of what, where, and when. No finer-grain de-duplication was attempted due to the size of the combined datasets against the probable impact of doing so. Taxa at such low data volume that the duplication of individual records would matter will be marked as Data Deficient against statistical models that rely on this metric.

## Collection methodology
There is no standardised collection or survey method present in either dataset. Very little structured recording of the vast majority of the taxa in this Red List is performed, especially at a level representative of 'Great Britain'. Both datasets therefore focus on collecting as much reliable data as possible, from as many sources as possible, and as such focus on the 'most common data', which consists of:

- What
- Where
- When

## Citizen Science
BWARS and Hymettus do not consider the moniker 'Citizen Scientist' to have supportable meaning for aculeate hymenoptera recording. There are so few opportunities for 'professional' work that the majority of contributors to the BWARS dataset would be considered 'non-professionals', despite their considerable knowledge of the taxa. Furthermore, professionals *do* contribute large volumes of data to BWARS, as do academics. Accordingly, 'Citizen Science' is devoid of meaningful separation or distinct. Such absence of meaning is particularly present in the most important area of aculeate hymenoptera, which is the ability to accuracy determine taxa at species level. 

## Examples of collection methods
The following sections illustrate a few known collection 'methodologies' for data in the BWARS dataset.

### Roadside opportunity
A utility worker saw an interesting bee whilst on their lunch break. The bee was collected and identified under a microscope that weekend, and the data added to the BWARS database.

### Academic survey
A student collected data as part of a controlled sampling effort in their PhD. With the assistance of experienced taxonomists, this material was identified to species level, then added to the BWARS database.

### Regular walk
An entomologist regularly walks a local nature reserve and collects species-level data across a wide range of invertebrates. This data is then shared with the nature reserve wardens, BWARS, and the NBN.

## Reasons for non-abundance data
In order to achieve an practical and usable abundance dataset, sampling methodologies must be defined, followed, and quality controlled. If one wishes to know how many of a thing there are, one must also know the detectability of the item in question, the detection capability of the sensory equipment (in this case, the recorder), the time spent searching, how targeted the search effort was etc. Aculeate hymenoptera are typically a low-frequency encounter, with the searcher's skill *drastically* affecting the probability of observation.

Given then none of this data is collected, in same cases even collectable, there is no known nor accepted way to translate occurrence data into abundance.

## Data Reliability
Data reliability is a core aspect of the BWARS dataset. Specifically, that the occurrence data (what/where/when) is accurate. In this situation, accuracy means that:

- The determiner has the skill set to reliably (though not perfectly) identify the taxon in question
- The determiner has a low determination error rate
- The provided location is reasonable, given our current understanding of where the taxon resides
- The provided date (or date range) is reasonable, given our current understanding of when the taxon can be detected (e.g. flight period)


The hardest part to correcting an incorrect record is to first of all *notice* that a record is incorrect. Until this project, the predominant way in which data were peer reviewed was through the BWARS maps. Accordingly, this method could only detect spatial outliers. Occasionally a recipient of the BWARS dataset would identify other outliers - notably when attempting to make a regional atlas - but the vast majority of 'incorrect record' notifications arose through the BWARS maps.

There are two main problems with the use of maps as the main source of quality control:

- The maps are not updated live, and must be manually pushed to the server. Until recently, BWARS did not have the capability to produce their own maps. This has now been rectified, but the path of data to the website maps remains manual and prone to additional lag between data updates
- Maps can only address spatial inconsistency, not determination or temporal issues

Efforts are being made to address the deficit, such as highlighting records which are either out-of-season or out-of-range, but these metrics are imprecise and, currently, lacking in a verifier-friendly user interface.

### Why does quality matter so much?
There are, very broadly speaking, two ways to analyse occurrence data in regards to quality. The first is to assume that every record is correct, the other is to assume that every record is potentially incorrect.

Why would anyone ever use the first option? Because there is no way to implement the second option that does not remove outliers. The vast majority of outliers which are readily identifiable, post data-cleaning, are typically entirely correct records. The most prevalent cause of these outliers is taxon movement in response to changing conditions. Additionally, outliers maybe simply be the result of very low data volume/sampling effort/sampling ability. Accordingly, the removal of outliers from a post data-cleaning dataset typically results in the removal of more correct data than incorrect data. In terms of extractable information on spatial occupancy trends, which form the majority of usable Red List criteria for aculeate hymenoptera, removing outliers results in a far less accurate view of the status of a given taxon.

As a result of the difficulty in removing outliers without removing valid information, the only option is to treat every record as valid. Accordingly, great importance is placed upon cleaning the dataset as much as possible. Data quality is *especially* important when working with taxa with low data volume, as it can take very few incorrect records to provoke significant confusion as to a taxon's status. Ten incorrect records amongst the 43,995 records of *Bombus pascuorum*: iso. Cameron et al: 2007 are not likely to be noticed. Ten incorrect records of *Bethylus dendrophilus*: iso. Perkins: 1976 represents a doubling of the entire BWARS dataset.

### Assessing a determiner's capability
There are no 'official' statistics on the time taken to reach any given level of quality in recording aculeate hymenoptera. However, general opinion is that it takes 5 years of study to reach a level of general competency at identifying a reasonable selection of the simpler groups. Even then, many recorders do not keep up to date with the latest nomenclatural changes, instead relying on their extant knowledge and regular, unmodified, keys. Without Understandings being mainstream, one of the greatest skills of a verifier is knowing which interpretation to assign to an uncertain binomial. One such example of skills is identifying whether post-split components are present, or only pre-split. If a recorder has determined *Lasius platythorax* as well as *Lasius niger*, in the same year, the recorder is aware of the split. Accordingly, these binomials are most likely to be *Lasius platythorax*: iso. Seifert: 1992 and *Lasius niger*: iso. Seifert: 1992, respectively.

Post-determination conversion of binomials to Understandings is imprecise. However, in the absence of Understandings being used, assigning by proxy remains the only practical way to upgrade a determination to an Understanding. In rare cases the determiner may respond to a query, but the process of asking, clarifying, and explaining takes too long to be applied to every incoming record.

## Internal Review Overview
The Internal Review is the first point where a taxon is assessed for a threat status. Three people are presented with a spread of information regarding each taxon and must assess the taxon accordingly. This Red List is one of the first attempts to utilise more complex statistical models in entomological datasets, as well as utilising a composite approach to assessment using said models. Accordingly, the section below provides an overview of why this approach was taken.

### The use of models in the Red List
There is no standardised recording or monitoring protocol in place for the vast majority of taxa covered by this Red List. Instead, the vast majority of data collected for the taxon group is opportunistic. The difficulty is then in extracting reliable trend information from this opportunistic dataset, which can then be assessed according to the Red List **guidance**.

The method chosen to perform this process for this Red List assessment is to use multiple models to assess each taxon. These models range from simple record counts, to spatial models, occupancy models, and expert opinion. If multiple models all indicate the same general trend, confidence in that trend increases. If models highly vary, the three experts are asked to posit reasons for this discrepancy. The most common reason for highly varied models is simply the data volume being too low for the more complex models to complete with confidence.

All models are liable to errors. The more complex models in this assessment, Frescalo and Bayesian Occupancy, are especially reliant on the input data falling with certain, not entirely understood, parameters. When these parameters are not fulfilled, the models can diverge strongly from expected parameters. The majority of such divergences will be noticed for the first time when a model significantly deviates from the expectations of the taxon field experts. In such situations, it is the role of the taxon data expert to interrogate the models and raw data in greater detail. The findings are then to be explained to the taxon field experts. All three will then rule as to whether a model is within believable parameters. If the model is found to not be reporting believable parameters, said model is excluded from consideration when assessing the status of that taxon.

### Why use models if they are not trustworthy
>*All models are wrong but some models are useful* - George Box

The principle reason to use statistical models for a Red List is driven by the desire of the Red List assessment categories to utilise numerical values for change. Asking an expert to rule on whether has something decline by 'between 30% and 50%' will tend to get you a very blank look, as the expert tries to work out what those percentages would represent in their experience. Experts tend to be very good at telling you whether something has declined or not, and far less able to attach quantified, numerical amounts to the direction. By utilising multiple models with different assumptions and methods, a greater chance at forming an accurate view of a taxon's conservation trend is achieved.

Models exist to be interpreted rather than blindly believed. A model is *not* the same as reality, and requires interpretation to be applied to reality. Knowing where and how models utilised in this Red List fail has been the subject of considerable effort between the Internal Review Team and the developers of these models. Neither party expects the models to perform flawlessly, given the variation in data supplied per species.

## Wider review
A group of experienced field entomologists, all with significant experience working with the assessment taxa, are asked to review the output of the Internal Review. The responses from this are fed back to the internal team, who then review the responses against the Red List criteria. Any eligible changes are then debated and necessary adjustments made.

## Release
The reviewed Red List is then released for consumption. The idea is that the review is not final, but forms part of a rolling review which taxon-specific projects may feed into.

## Review Criteria
There are many criteria by which a taxon may be assessed, as per the Red List **guidance**. However, there are many issues with attempting to apply the majority of these criteria to the taxa being assessed. For this purpose, this review has adopted a similar process to that taken by the Sawfly review (Musgrove, 2023). Each criterion has been evaluated to determine whether or not there exists the information to utilise that criterion in a scientifically supportable manner.

The following sections borrow from the UK Sawfly review, as the problems encountered within that review are very similar to those encountered in this review.

> For a full list of the assessment process, please consult the full documentation.

### Criterion A
Population size reduction over 10 years is considered roughly appropriate, although mention should be made of the ~20 year fluctuation observed in some taxa. The exact cause of this fluctuation has need been proven, though evidence is pointing to a weather-related pattern.

Criterion A1 requires that a number of subcriteria are fulfilled, i.e. that causes of decline are 'reversible and understood and ceased'. The understanding of declines in this taxonomic group is nowhere close to this advanced, thus criterion A1 is not available for use in this Red List. Criterion A2 is used instead.

Predicted population change (A3) .may be assessed, but only under the basis of expert opinion. No supportable statistical models exist to provide numerical values to predictions of future population change.

No model is known to exist for use with the subject taxa under criterion A4. As such, there is no information to evaluate taxa based on A4, and the criterion is not available for use.

'Direct observation' is an unfulfilled requirement, as the requirement for 'accurate census data' is not met.

There are appropriate indexes of abundance for the taxon. These are given by the number of records for a taxon, as well as the Frescalo and Bayesian occupancy models.

Extent of Occurrence, in both discreet and continuous forms, is available. Continuous is provided by the Minimum Convex Polygon, while discrete is provided by the Buffer Union. Both metrics are generated via GDAL, making use of postGIS.

Area of Occurrence is provided by tetrad-resolution occupancy.

The subject taxa are not directly subject to exploitation. Subcriterion d) is therefore not useable.

Knowledge on the effects of introduced taxa, hybridisation, pathogens, pollutants, competitors and parasites is unknown. Subcriterion e) is therefore not useable.

### Criterion B
Criterion B1 requires the use of continuous extent of occurrence, not discrete. Continuous extent of occurrence is provided by the Minimum Convex Polygon It has been noted by the taxon experts that the foundational reason behind the assessment of B1 is not soundly supportable for the taxa being assessed. The assumption behind B1, that a taxon inhabiting 'many patches or large patches across a landscape or seascape' can have communicability of risk modelled by the Minimum Convex Polygon, is not fulfilled for the subject taxa. Many taxa operate in distinct and highly restricted linear or isolate, non-exchanging populations. Minimum Convex Polygon models fare very poorly with such distributions, drastically over-stating potential 'redundancy' areas. The Minimum Convex Polygon data has been included at the insistence of the governing bodies, but expert advice is that attempting to use such information for assessment will not provide supportable results in a great many cases.

B2 is more reliable than B1, utilising tetrad counts as a metric of change.

Extent of Occurrence for B2 is calculated as *discrete*, via the Buffer-Union model.

Area of Occupancy is provided by tetrad counts.

Area, extent, and/or quality of habitat information may be provided by experts, as there is no usable-resolution data for statistical approaches. Insects occupy very small niches in a wider landscape, at a resolution that no project has yet managed to identify.

'Locations' are difficult to establish for the subject taxa, as the separation between what records show as discrete groupings is more likely to be the result of low sampling volume than true absence. As noted in the Sawfly review (Musgrove, 2023), terrestrial invertebrates occupy very small niches, making the definition of 'location' as a form of territory inapplicable. Instead, the definition of a location based on the probability of a single threat causing substantial impact to the population has been selected:

> The term ‘location’ defines a geographically or ecologically distinct area in which a single threatening event can rapidly affect all individuals of the taxon present - 4.11 'Location (criteria B and D)', Red List **Guidance** March 2024

For assessment under criterion B, a length of 30 years has been deemed relevant. This duration covers up the hole in criterion A, caused by restriction to 10 years trend in the face of ~20 year fluctuations.


Severe fragmentation is difficult to apply, as the size of a 'habitat patch' required for a 'viable population' of the taxa in question is unknown. There are specific taxa where fragmentation may be applied, tending to be taxa where there are remnant populations.

Of the subcriteria for B*X* (b), only (iv) number of mature individuals should be discounted, as data does not exist for counts of mature individuals to meet the requisite Red List standards of data collection.

Extreme fluctuations to meet the criteria set out have not been observed in the subject taxa, rendering this metric inapplicable to the current assessment.


### Criterion C
Criterion C requires a knowledge of the number of mature individuals in a population. This is not known for any taxa in this assessment and hence Criterion C could not be used in the assessment.

Moreover, the 'example' given by the Red List of estimation of an ant population is considered to be wildly implausible. To achieve that level of data, at a scope and resolution suitable for application to generate a national-level population estimate, would consume the entire funding for the taxon group for decades.

Assessment of 'breeding population' in aculeate hymenoptera is made harder by the fact that approximately half of said population - the males - die within a few weeks of emergence. The scope, scale, and speed of this reduction is entirely unknown and entirely dependent on characteristics of the climate for that given life cycle.

### Criterion D
'Criterion D' similarly relies on numbers of mature individuals. Attempting to equate a solitary bee female to, for example, a lion, in terms of absolute numbers, is a totally nonsensical task. Not only do the data for population counts not exist, the entire principle of 'Criterion D' is illogical to the subject taxa. As such, 'Criterion D' is deemed inapplicable to the assessment taxa and will not be used.

D2 is theoretically applicable, though the difficulty in assigning 'locations' to invertebrate populations makes the accurate utilisation of the criterion extremely difficult. Furthermore, the focus of D2 is on specific events that will drive the taxon to CR or EX in a very short amount of time. For the purpose of the taxon covered in this Red List, D2 is considered to be a repeat of A3. Such a comparison is due to the difficulty in establishing 'locations' with such restrictive AoO requirements. Accordingly, to prevent over-saturation of a single facet, D2 has been deemed inappropriate for use.

### Criterion E
No models that provide a '% chance of extinction' were used or generated. Moreover, taxon experts have significant doubts over the ability of models to generate such figures, given the difficulties experienced with modelling thus far.

Criterion E is deemed inapplicable based on a lack of data to be assessed.

### Summary
The following criteria are deemed applicable to aculeate hymenoptera, as well as having data which may be assessed according to the guidance provided:

- A2
- A3
- B2

## Assessing Near Threatened
Near threatened (NT) may be used where a taxon does not meet the threshold for inclusion under vulnerable (VU), but an expert deems it appropriate to flag the taxon as potentially in significant decline. The exact reasons for this are not strictly defined, as the status is deliberately placed as a 'catch-all' for situations where an expert has concerns. Typical uses for NT are:

- A taxon is not exhibiting quantified signs of decline, yet field experts believe there to be substantial decline. The result is considered a *suspected* decline, which according to the rulings may be given a status of NT
- A taxon has declined, but not in a strictly significant quantifiable manner. Where a taxon slightly misses the Red List quantifiable target for achieving a status of VU, NT may be considered as an alternative.

## Data Deficient (DD)
Every effort has been made to avoid ranking a taxon as DD whilst maintaining a strictly evidentiary approach. The majority of DD taxa are:
- those with modern nomenclatural or taxonomic confusion rendering data unusable
- taxa which are so rare that there does not exist enough information to make an informed statement on their status

Where insufficient data exist to reach a quantified conclusion, expert opinion is assessed to attempt to reach a non-quantified conclusion. Doing so results in far fewer taxa reaching DD status.

## Extinctions
A taxon may be declared regionally extinct if it has not been seen for 30 years with targeted survey effort, or for 40 years without targeted survey effort. This range of values comes from previous studies to find purportedly extinct taxa, as well as evidence in the BWARS dataset on scarcely recorded taxa. The values are designed to deliver reasonable certainty of extinction when factoring in taxa with extreme identification or sampling protocol difficulty.

## Regional Rarity
Regional rarity assesses a taxon based on how many unique tetrads are occupied. The statuses which can be assigned as:

|Classification|Meaning|Criteria|
|---|---|---|
| NR | Nationally Rare | *N* <= 15 hectads |
| NS | Nationally Scarce | 15 < *N* <= 100 hectads |
| NF | Nationally Frequent | *N* > 200 hectads |
| ID | Insufficient Data | Experts do not consider there to be enough data to classify the taxon |

The inclusion of `NF` and `ID` remove the possibility for a taxon to have the same status - blank - for two entirely different reasons.

