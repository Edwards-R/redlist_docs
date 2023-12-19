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

## Self dev notes
Pick up with the internal review process documentation. Needs a flow chart and some explanation.

Need to do the review of each taxa as each taxon is processed. This means 2 screens are needed. One to display data, one to display data entry

- [ ] GUI needs the Bayesian range `occupancy decade` valud figures changing. This isn't +/- but an absolute value.

- [ ] GUI - change expert opinion justification to actually reference the correct fields

- [ ] Change method to only assign support to B-type criteria *once*. It will never change between B1 and B2

- [ ] Add 'no idea' to first question on Expert A2 and A3. Result maps to DD

- [ ] Move internal review diagram off general process and into process/internal review

- [ ] Add flag *and* process spec for the following
    - post-assessment colonist (maybe? Shouldn't be any)
    - peri-assessment colonist
    - vagrancy status
    - synanthropic status
    - recent taxonomic/nomenclatural changes