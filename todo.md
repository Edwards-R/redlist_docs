## Generational Length & Ants

Rulings has a rule that generation length is 1 year - does this cause any problems for ants, given that the length is only used to establish the 10 year time period that we then boost to 30 years?

## Dispersion range & Ants
40km has been used generically throughout the assessment as a metric for 'probable population'. There are some taxa where this assumption is false, the one I know of are ants which return to the home nest post-mating and don't have a wide-ranging dispersal method. How to document this?

## Other
- [x] Data sources explanation

*Done, see [model](./model.md)*
- [ ] paper ref for [bayesian occupancy model](./model.md#bayesian-occupancy-trend)
- [x] [This assessment](./process/raw_data.md) requires that expert opinion be used to assess under `B2`. The statistical figure of tetrad AoO is what is assessed, but `B2` cannot be addressed with purely AoO and requires expert opinion as well.

*Does this need a ruling to state that the model is what forms the basis and expert opinion may be added to any model when deemed necessary to answer Red List criteria?*

**It did and it has been done**

- [x] Make document that lists every single model assessment method, and add glossary definition for `model assessment method`. It means 'Way that the model assessment was approached' - specifically for the Bayesian occupancy model where expert opinion assessing it is a 'hidden extra'.

*No need, this is covered by the `process` documentation.*

- [ ] Bayesian expert analysis - Check that Richard is happy with what this is doing. It's not a repeat of expert opinion, it's specifically to interpret the graph with human eyes rather than start -> end calculation. Think 'Philanthus 2015 uptick' as a place where there would be a differentiation.

- [ ] Turn the overall [process](./process_overview.md) document into a flow diagram once it is done

- [x] GUI needs the Bayesian range `occupancy decade` valud figures changing. This isn't +/- but an absolute value.

- [x] GUI - change expert opinion justification to actually reference the correct fields

- [x] Change method to only assign support to B-type criteria *once*. It will never change between B1 and B2

*Can only be done with locations as the supporting criteria are assessment-dependent*

- [x] Add 'no idea' to first question on Expert A2 and A3. Result maps to DD

- [x] Move internal review diagram off general process and into process/internal review

- [x] Add flag *and* process spec for the following
    - [x] post-assessment colonist (maybe? Shouldn't be any)
    - [x] peri-assessment colonist
    - [x] vagrancy status
    - [x] synanthropic status
    - [x] recent taxonomic/nomenclatural changes

 - [ ] Add imported ant example to [eligibility example](./process/internal_stage/eligibility.md#synathropic-status)

 ## Self dev notes

- [ ] Need to do the review of each taxa as each taxon is processed. This means 2 screens are needed. One to display data, one to display data entry. Make it happen

- [ ] Need to find a good title for 'not really part of the *official* process, but we found it to be a good idea'. Things like 'Pick some representative taxa to look at to get an idea of baseline trends before you start'. Discussion maybe? Should probably be a `discussion` page per review stage. Also need a generic `discussion` page to explain what the section is about. It'll function as a 'notes we learned along the way'.

- [ ] Ruling on not re-stating Expert:A2 in Expert:A3?

- [ ] Ruling on exactly what A3 should be doing for already threatened taxa. For example, a taxa at `VU` might only be future assessible at `NT` due to rules on `suspect`-quality data. This does *not* mean that the future looks great and is improving - it means we *suspect* a decline but cannot forecast a magnitude of said decline. Get Richard's opinion on this. No *great* options here. Can't 'copy' Expert:A2's result as we don't *know* that this will happen, we only suspect. Simplest rule would be a note somewhere stating that 'even if A3 is a lesser threat category, this doesn't mean things will improve in the future, it just means we don't know how bad they will be in the future to a quantifiable state`