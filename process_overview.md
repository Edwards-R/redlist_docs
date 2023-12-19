# Process Overview
This document outlines the general process by which this Red List is produced.

The particular point of interest for this design is to incorporate multiple different ways of assessing a taxon in such a way that the methodology may be reused for repeats of this taxa, and on other taxa. This is accomplished by using a strict hierarchical model structure to divide up specific 'responsibilities' from one another. The template for doing so comes from Software Engineering practices to analyse, design, and document highly complex systems.

## Separation of responsibilities
A responsibility may also be thought of as a purpose. Each component in the design of this analysis must address one responsibility. These responsibilities are expected to be nested in a heirarchy, but every layer up the heirarchy should accomplish a new responsibility. The design terminology for this process is the *Single Responsibility Principle*, and the primary purpose is to ensure that effort is never duplicated or decisions overwritten.

As a simple example, the document [glossary](./glossary.md) has the single responsibility of acting as a glossary for this project. The document [rulings](./rulings.md) is responsible for stating the individual rulings used by this project. [Model](./model.md) specifies the individual [models](./glossary.md#model) used in this assessment etc.

## Definition of models
*Please see the glossary definition of [model](./glossary.md#model) to understand what a model is. This section covers the act of defining what models will be used, not what a model is*.

The first step is to define the data sources, termed `models` in this process. Any data source, including expert opinion, is defined as a model. The project specific models may be found at [the models documentation](./model.md).

## Criteria eligibility
The next stage is to examine the models against the needs for each Red List criterion. If a criterion does not have *any* model which the criterion might assess, that criterion is rejected from further consideration. This process is documented in the [criteria](./criteria.md) document.

## Model-assessment
The final setup stage is to state which criteria may be applied to which model. The Red List guidance requires that every criterion utilised must be documented. As per the ruling on the [modification of 'all criteria'](./rulings.md#modification-of-all-criteria), if a criterion is not considered eligible for use on a per-model basis, it does not need to be reported for those ineligible models.

For example, Criterion D is not applicable in any supportable manner to any model in this assessment. Therefore, Criterion D is never reported upon as every answer would be 'Not evaluated'.

Criterion B2 is used in the assessment, under `raw data` (see [model assessment](./model_assessment.md#raw-data)). However, B2 is not applicable to the [Bayesian occupancy model](./model.md#bayesian-occupancy-trend). As such, B2 *is* reported for the `raw data` model, but *not* reported for the `Bayesian occupancy` model.

The primary reason for this modification is to drastically reduce the clutter of inapplicable results caused by the use of multiple models. The process also follows standard heirarchical design practices to avoid over-creation of null results.

The model-assessment process can be found in the [model assessment](./model_assessment.md) document.

## Assessment Stages
This assessment is broken up in 5 [review stages](./glossary.md#review-stage). These are, in order:

- Internal assessment, subdivided into
  - Eligibility assessment
  - Statistical assessment
  - Expert assessment
- Internal review
- Wider assessment
- Wider review
- Final review

An `assessment` assesses models. A `review` examines the results of all `assessments` in a `review stage` and condenses them down to a singular option, alongside justification for that choice.

## Internal Assessment
This assessment is conducted by three people, termed the [internal review team](./glossary.md#internal-review-team), with the option for any of the [Red List Steering Group](./glossary.md#red-list-steering-group) to observe or comment at any time. The criteria for each assessment may be found at `process/internal_stage`. To get an overview of the entire stage, please read the [process specification for the internal stage](./process/internal_stage/internal%20stage.md).

## Internal review
Once the internal assessment has been completed, the individual outputs from each model-assessment process (see `process/internal_stage` for individual details) are collated. These results are then reviewed to determine which is the correct threat status. This process is documented in the [internal review](./process/internal_review/internal_review.md) document.

