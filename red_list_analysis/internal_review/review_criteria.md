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