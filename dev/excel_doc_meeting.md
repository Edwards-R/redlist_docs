# Meeting notes

## European Red List
Have asked Tom when the bees Red List will come out. This one we have a *chance* of using, but the 2014 one is absolutely not usable as nomenclature would have to be processed by someone like Tom Wood before we could use it. There are so many nomenclatural differences between the UK and EU at that point, not to mention between 2014 and now is ~ 100 changes to our understandings.

> Going to leave them out. There are too many nomenclature/taxonomic pitfalls for the lay person to use them safely. Don't want to promote bad information.

## Past Red Lists
Falk did not use the modern Red List system and reverted to the older one which also incorporated rarity. Add that on top of the nomenclature issues and I think this is best left alone. Any equivalence presented here has far too large of a chance of being false to be helpful.

> Going to leave them out. There are too many nomenclature/taxonomic pitfalls for the lay person to use them safely. Don't want to promote bad information.

## Philanthus
Does not qualify as extreme fluctuation as it does not meet the 10x factor, it's only ~6x from recollection - I did test it and it fell substantially short.

> agreed.

## Rescue Effect
I was more concerned over the use of `Re` (Rescue effort) vs `RE` (Regionally Extinct) in the document. Rather than putting `Re` in the attribute, it would be far safer to use `true` and `false` - this also stops the 'well, did they look at it?' problem that nulls invite.

> This is removed as an attribute following discussions on the practicallity and completeness of principle. It would need significantly more focus on European datasets than was practical.
>
> **Done**

## UKSI
We're still working on this one - Chris Raper is looking at way to implement the Understandings into the UKSI as he thinks it's worth a go. See [this link](https://www.researchgate.net/profile/Zachary-Portman/publication/393642837_Big_data_changing_taxonomy_and_ghost_records_permanent_preservation_of_collected_specimens_is_essential_for_insect_monitoring/links/6874989f6e247f362b1906f4/Big-data-changing-taxonomy-and-ghost-records-permanent-preservation-of-collected-specimens-is-essential-for-insect-monitoring.pdf) for an example of where binomial nomenclature ends up after a few years.

> Waiting for Chris to get back on how things are going. Would like to do it if possible, but can't until done.

## GB Rarity
The doc does not explain this as that would be a very odd thing to do - the methods explain how a metric was calculated, the data dictionary tells you what it is and what format. We could put 'the GB rarity calculated according to *link*'?

> Put link to explanation of all outputs, including new attributes `NF` and `ID`
>
> Sheet made

## Generational time
That's for you to decide! It'll be `1` the whole way down if left in. If it is removed, then things like 'Genuine change' would also need to be considered for removal. I'd personally lean towards 'leave it in if it's in the spec', but I'm really not convinced by the quality of the spec when it comes to rigour.

> Left in for now

## Output doc of 'who is using this data'
- LRC
- County Councils
- National conservation trusts
- Local conservation trusts
- Universities
- Research institutes

## 'Flag' attributes moved to TRUE/FALSE
> Where possible, change specific flags to true/false rather than allowing blanks

## Red List Supporting Criteria format
>Desired
>
>`B2ab(iii)`
>
> **Done**

## Report
> RS to send RE an example, RE to go through and extract skeleton
