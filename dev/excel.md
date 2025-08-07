# Excel spec

B.   Excel Spreadsheet for the Red List assessment

This should provide a succinct summary of the data used for each taxon in Assessments. As a minimum, this should include for each species:

- Higher Taxonomic Group name: following current taxonomic consensus, e.g., superfamilies Chrysidoidea, Vespoidea, Apoidea.
- Family name, following current taxonomic consensus.
- Species scientific name: All species within the taxonomic scope of the review (i.e., the British list) should be listed and named, in separate columns, according to the ‘ISO’ method used by BWARS and to the Taxon Version Key (TVK) of the National Biodiveristy Network, for the recommended scientific name in the UK Species Inventory - https://www.nhm.ac.uk/our-science/data/uk-species/index. This step will allow species in BWARS outputs to be matched to the standard method of naming British species.
- Species categorised according to IUCN Red List status, including: Not Applicable NA, Not Evaluated NE, Data Deficient DD, Least Concern LC etc. As the BWARS dataset includes species recorded only in the Channel Islands, their names should be listed but categorised as Not Applicable (outside the geographic scope of the assessment – Channel Island only). Such species provide context for the continental European fauna expanding its range margins northwards, which might colonise Great Britain in future. 
- Synonyms: Note any scientific name synonyms used in any previous assessments. As synonyms may be complex, restrict this field to synonyms that might have been in recent, widespread usage. Complete lists of synonyms can be referred to on the BWARS website, via a guidance note in the spreadsheet. 
- Vernacular name:  Include the most commonly used vernacular (English) name, e.g. referring to recent published texts such as Falk & Lewington (2015, Field guide to the bees of Great Britain and Ireland, Bloomsbury); but there is no need to create new vernacular names.
- Rank: Status assessments for taxa other than species (infraspecifics such as sub-species, races, or variants for example) are welcome and should be presented as for species, but it is important that their rank is stated, and imperative that a species level assessment for any infraspecific taxa is also completed and presented.
- Non-native species (including vagrants): IUCN discourages the assessment of non-native taxa, including vagrants.  Where such species form part of a British List – or the list used as the basis for selecting species for review, they should be categorised as NA.  However, if they are, for some specific reason assessed and assigned to any category other than NA, their non-native status must be highlighted and the reasons for non-NA categorisation made explicit in the rationale (see ‘Category Rationale’, below). Any species not arriving through its own powers of dispersal is non-native, although it should be recognised when a species could arrive by both natural and human means. All non-native species must be clearly identified as such.
- Endemics: all species endemic to Britain or any area within Britain must be identified as such, and checked for any global assessment, as the threat statuses must match.
- Taxon Version Key: This is the NBN TVK for the recommended scientific name in the UK Species Inventory https://www.nhm.ac.uk/our-science/data/uk-species/index
- IUCN GB Category: A separate column should indicate the category as assessed against each Criterion (A-E), with ‘na’ indicating any criteria that was ‘not assessed’ (Attention must be paid to the accurate use of IUCN categories, not least to RE, EX and EW categories; and NE and NA categories).
- IUCN GB Category in previous reviews, for context but not direct comparison.
- Category Change: Changes in extinction risk category are normally recorded as ‘genuine’ or ‘non-genuine’, where a previous review used the IUCN’s categories and criteria. As this group has not been previously assessed under IUCN guidelines, a field for category change is not necessary. This should be explained in the report – see Word document below.
- IUCN Global Category (if any), e.g., bumblebees Bombus (Apidae)
- IUCN European Category (if any), e.g., bees (Apidae)
 IUCN England category (if any)
- GB National Rarity category – not part of IUCN guidelines, but using 2 statuses based on: Nationally Rare (NR) - species recorded from between 1-15 hectads (10x10km square of the Ordnance Survey national grid in Great Britain) since 1991; and Nationally Scarce (NS) – species recorded from between 16-100 hectads. The statuses only apply when there is reasonable confidence that exhaustive recording would not find a species in more hectads than for the respective thresholds. Statuses for more frequent or widespread species are not considered in the current assessment.
- Generation Time
- % Population Change: over 10-years / 3 generation (whichever is the longer). Generation time is normally set at one year for species with annual life cycles. However, as there is uncertainty over generation length in ant queens, a separate rule is given in the documentation.
- Extent Of Occurrence (EOO, in km2) as measured by Minimum Convex Polygon, with change in extent of occurrence measured by Union Buffer (a refinement of Alpha Hulls).
- Area Of Occupancy (AOO) as measured by summation of tetrads (2x2km cells), i.e. no. of tetrads multiplied by 4 to give area in km2.
- Number of hectads with records for the species, since 1991. Hectads are a useful indication as to the occurrence of species, though not used in the IUCN assessment.
- GB Population Size, where the no. of individuals is estimated (if applicable).
- Continuing Decline (enter Cd in cell if applies, otherwise empty).
- Severely Fragmented (enter Sf in cell if applies, otherwise empty).
- Extreme Fluctuations (enter Ef in cell if applies, otherwise empty).
- Any ‘Rescue Effect’: i.e., from populations in neighbouring regions (enter Re in cell if applies, otherwise empty)
- Presence / Absence in each of England, Wales and Scotland, by stating E, W, S in separate columns. If absent, any historic presence should be indicated by parentheses, e.g. (E).
- A narrative rationale summarising the justification for the IUCN GB category, such that another reader, e.g. future assessor can quickly understand how the category was determined. This is particularly important for threatened or Data Deficient categories. Whilst rationales for Least Concern species may use standard text, give full justifications for any Regionally Extinct, Extinct in the Wild, Threatened or Near Threatened species.

This information is essential for future assessments, so that a category change resulting from a real decline or recovery (a ‘genuine change’) can be distinguisehed from a change in assessment approach or data availability (a ‘non-genuine change’).

## Attributes not used

### Synonymy
Just no. This is *not* the document to fill with lists of Understandings used in synonymy - the taxa are undergoing significant changes at a prodigious rate beyond what we can cope with as a damn Excel attribute. Understandings take care of all synonymy when resolved, just use that. Don't make this project worse by trying to feature creep it to a 'checklist' type idea. Checklists also don't *work*, so it's doubly pointless.

### Vernacular
Utterly pointless. They might be 'nice' names, but vernacular is even less usable than pure binomial nomenclature. There's also the point that the UKSI is the place for all of thise - stop trying to monolith *and* feature creep the hell out of this project. Just stop.

### Previous Red List Category
What the hell??

### IUCN X category
I have zero clue what is trying to be achieved here. It reads like horrendous over-engineering trying to do something that the scientific name should handle.

### GB population size
Nope

### Extreme fluctuations
No taxa qualify


## Query for sheet
Update as time goes on
```
SELECT n.sf_name Superfamily, n.f_name Family, m.binomial 'Scientific Name', NULL TVK,
iif(regexp_like(m.binomial, 'agg:')=1, 'Species aggregate', 'Species') Rank,
wrc.status 'Red List Status',
fs.sup_crit 'Red List Supporting Criteria',
IIF(a.synanthropy IS NOT NULL, 'true', 'false') 'Synanthropically Present', 'false' Endemic, 'Non-genuine' 'Category Change',
nr.moderated 'National Rarity', 1 'Generational Time', a2.value '% Population Change', mcp.'all' 'Extent of Occurrence',
ta.'all' 'Area of Occupancy', h.combined 'Hectad',
IIF((b1_used = 'Yes' OR b2_used = 'Yes') AND b2_support IS NOT NULL,'true','false') 'Continuing Decline',
IIF(bd.b_locations = 'Fragmented', 'true', 'false') 'Severely Fragmented',
IIF(h.england > 0, 'true', 'false') 'Presence England',
IIF(h.scotland > 0, 'true', 'false') 'Presence Scotland',
IIF(h.wales > 0, 'true', 'false') 'Presence Wales',
replace(v.narrative,'', char(10)) || IIF(v.text IS NOT NULL, char(10) || char(10) ||replace(v.text,'', char(10)), '') Rationale
FROM assessment a
JOIN bwars_nomenclature n ON a.tik = n.id
JOIN nomenclature m ON a.tik = m.tik
JOIN wider_review_consolidation wrc ON a.tik = wrc.nik /*Swap to nik from tik expected. Using WRC as it is the last step in assessment */
JOIN internal_review ir ON a.tik = ir.tik /* Swap back to tik. I hate this. Too 'smart' for my own good */
JOIN national_rarity nr ON a.tik = nr.tik
JOIN a2_stat_picked a2 ON a.tik = a2.nik
JOIN mcp ON a.tik = mcp.tik
JOIN tetrad_area ta on a.tik = ta.tik
JOIN regional_hectad_count h ON a.tik = h.tik
JOIN bd_summary bd ON a.tik = bd.nik
JOIN narrative v ON a.tik = v.nik
JOIN format_subcrit fs ON a.tik = fs.tik
WHERE wrc.status IS NOT NULL
AND wrc.status != 'ERROR'
ORDER BY sf_name, f_name, m.binomial
```