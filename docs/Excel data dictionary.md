# Excel format data dictionary
This file documents the attributes in the Excel download format of the 2025 Aculeate Hymenoptera Red List.

|Attribute|Type|Description|
|---|:-:|---|
|Superfamily|Text|Superfamily of the taxon|
|Family|Text|Family of the taxon|
|Scientific Name|Text|The scientific name of the taxon, given as an Understanding|
|TVK|Text|The Taxon Version Key from the UKSI, where possible and of as exact precision as the Understanding. Note that TVKs are not protected from change and that the Understanding should be used in preference to the TVK|
|Rank|Text|The taxonomic rank of the taxon. Will be `species` or `species aggregate`|
|Red List Status|Text|The Red List status abbreviation for this taxon e.g. `EN`|
|Synanthropically present|Bool|Is the taxon synanthropically present (did it get here by human-assisted means) within the assessment area (`true`/`false`)|
|Endemic|Bool|Is the taxon endemic to the assessment area (`true`/`false`)|
|Red List Category|Text|A comma-separated list of utilised categories|
|Category Change|Text|`Genuine` or `Non-genuine`|
|GB Rarity|Text|The GB rarity status of the taxon e.g. `NR`|
|Generational time|Int|The 'standard' time for a single generation|
|% Population Change|Decimal|Most severely negative change assessed and accepted under criterion A|
|Extent of Occurrence|Int|The Continuous Extent of Occurrence, measured by MCP, of the taxon over the period 1992-2021 (inclusive)|
|Area of Occupancy|Int|The Area of Occupancy of the taxon over the period 1992-2021 (inclusive)|
|Hectad|Int|The number of occupied hectads of the taxon over the period 1992-2021 (inclusive)|
|Continuing decline|Text|`Cd` if any of B's subcriteria (`i` -> `v`)were assessed to be true|
|Severely fragmented|Text|`Sf` if B's `severely fragmented` was assessed to be true|
|Rescue effort|Text|`Re` if there has been any rescue effort|
|Presence England|Bool|`true` if taxon is known to be present in England during assessment period, `false` if not|
|Presence Scotland|Bool|`true` if taxon is known to be present in Scotland during assessment period, `false` if not|
|Presence Wales|Bool|`true` if taxon is known to be present in Wales during assessment period, `false` if not|
|Rationale|Text|Full text rationale for the taxon. A combination of the narrative statistal readout and Ben's handwritten expert knowledge|