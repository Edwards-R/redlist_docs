# Review
Notes on Clare Boyes's peer review of data.

## Background
Clare Boyes is the person responsible for checking the vast majority of BWARS data upon submission. If Clare isn't happy with a record, it gets bandied around a wider group (including the submitter) to see if the problems can't be fixed. If they can't, the record simply does not get entered.

## Notes
Starting at the method rather than the preamble

No aggregate - correct

Use of photo to identify date problems interesting. Beware garden/hothouse flowers?

Bit confusing. Need to group things better? Going to try splitting up here. The tables are just *way* too dense.

## Temporal outliers
1,202 Outliers
860 verified - not 886?
342 not yet verified



### Of the 860 already verified:

- 17 determination disagreements
- 2 M. europea out-of-season. Reedbed is a warning flag for potential for rearing records, does the behaviour of the taxon match? BWARS website just says parasitises nests. `M. Edwards says NO.`
- 9 No-photo & highly dubious time periods
- 150 records where date is not possible to verify through various means
- 28 disturbances that should be pushed to year-only date
- 6 Nest-only records (what about the phenology makes these weird? They fly before they have nests, just can't verify them?)
- 3 rearing records (*far* less than BWARS)
- Partial autumn broods (would be accepted as valid records)
- Overwintering species in opportunistic behaviour (would be accepted as valid records)
- 150 records which are impossible to verify
  - Evidence that suggests the date is incorrect e..g via photo
  - Data entry errors resulting from either failure of upload script or bad data being entered (*BIG* problem, immediately need to know the scope of this. Hopefully it's tiny and from one person doing something weird, but still shouldn't have happened)
  - 1970 date is concerning as it means that something assigned that date, probably due to the field being null. 1970 is Unix epoch start. Means that somewhere in the pipeline a rule was broken.
  - A bunch of related records with a date of 1976 that are most likely a systematic error

### Correct data
|Reviewed Status|Count|Percentage|
|---|---|---|
|*Entire dataset*|*422*|-|
|Correct|287|68%|
|Considered correct|26|6%|
|Incorrect|20|3%|
|Plausible|2|<1%|
|Unable to verify|87|21%|

### Considered correct data
|Reviewed Status|Count|Percentage|
|---|---|---|
|*Entire dataset*|*276*|-|
|Correct|9|3%|
|Considered correct|152|55%|
|Incorrect|8|3%|
|Plausible|0|0%|
|Unable to verify|107|39%|

### 'Plausible' data
|Reviewed Status|Count|Percentage|
|---|---|---|
|*Entire dataset*|*89*|-|
|Correct|3|3%|
|Considered correct|0|0%|
|Incorrect|15|17%|
|Plausible|8|9%|
|Unable to verify|63|71%|

### Rejected data
|Reviewed Status|Count|Percentage|
|---|---|---|
|*Entire dataset*|*91*|-|
|Correct|0|0%|
|Considered correct|1|1%|
|Incorrect|82|90%|
|Plausible|0|0%|
|Unable to verify|8|9%|

### 'Unable to verify' data
|Reviewed Status|Count|Percentage|
|---|---|---|
|*Entire dataset*|*8*|-|
|Correct|0|0%|
|Considered correct|0|0%|
|Incorrect|4|50%|
|Plausible|0|0%|
|Unable to verify|4|50%|

### Post-table notes
That's a LOT of rejected 'considered correct' data. A very worrying amount of it. 32% of 'correct' data isolations rejected. 45% of 'considered correct' isolations rejected. That's far too high for me to be comfortable accepting this data blindly.

The 'Plausible'/rejected/unable to verify stuff isn't *that* interesting other than to give a generl background as to 'how much do these two people differ?'. Clare is far less lenient and will put things as 'impossible to verify' rather than 'plausible'. Functionally, these are the same end result: *It might be. I can't say it is, I can't say it isn't*

We know that the verification team has been *very* light on rejections, prefering to use 'plausible' to prevent discouragement. Is it better to have the data or to provide feedback to recorders? Feedback and teaching will slow down verification, but has the greatest chance of producing more verifiers to continue the system.

What about % dissent between Correct/Considered correct/Other? I don't care what level of 'other' there is, I only want to know how many have changed around.

#### Correct
|Action|Count|
|---|---|
|Initial|422|
|Maintained|287|
|Incoming|12|
|Outgoing|135|

#### Considered correct
|Action|Count|
|---|---|
|Initial|276|
|Maintained|152|
|Incoming|1|
|Outgoing|124|

#### Other
|Action|Count|
|---|---|
|Initial|188|
|Maintained|184|
|Incoming|224|
|Outgoing|4|

#### Result
Very strong downgrading present. I can see why Clare isn't willing to accept the data without query. The problem is that there is now *so much* data, all needing to be checked.

If this is the 'error rate' (note - someone has checked the rejections and made errors/not errors now) in the rejected dataset, what is the error rate in the full dataset? It's not looking clean. Then again, I've had highly experienced recorders point out places where their own data has been resubmitted and corrupted somehow, so how clean is the BWARS database?

Does it *really* matter? The goal is a clean dataset - if we *can* clean up the iRecord dataset to a better standard than BWARS current, shouldn't we? Everything will fall down to the lowest quality level, so we're not adding any problems (which would be ***bad***).

347 records with photos in the non-verified group of rejections. 26% of these get accepted. Need a reason - is this deliberate by verifiers? It certainly looks like it is! If so, verification is working, but can be significantly improved upon.

## Spatial outliers
Far far fewer problems. To be expected as this is an area that people are much better at spotting (though there are still mistakes).

### Re-verification
How many records does Clare agree on the ver_2 of? Subset to rejections on a spatial basis of accepted data only (C/CC).

Of 981 'Correct' records

|Clare ver_2|Count|
|---|---|
|Correct|822|
|Considered correct|86|
|Incorrect|18|
|Plausible|7|
|Unable to verify|48|

*All CC records unchanged.*

Broken down, total # is 983:

|Status|Count|
|---|---|
|No change|824|
|Within usable bounds (C/CC)|910|
|No longer usable|73|

>**Problem**: Data table differs by 60 in the 'Correct -> Considered Correct'. This is throwing off my numbers drastically and I need Clare to check that figure for me.