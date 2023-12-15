# Model
This file documents the individual [models](./glossary.md#model) that the project will consist of

## Raw Data
The bare minimum of statistical calculations performed on the raw data. This consists of the following:

- Raw record counts per 10 year period
- Raw record counts per 5 year period for the final two 10 year periods
- Tetrad area per 10 year period
- A map of all records at 10km resolution, per 10 year period

In addition, the internal review team has the capability to create maps on demand via QGIS and postGIS. One such example would be the creation of a map to show the spread of a parasite and its host on one map, within a custom defined time slice.

## Buffer Union
See [buffer union](./glossary.md#buffer-union) for a description

Data presented is the following:

- Buffer union area per 10 year period
- Buffer union area per 5 year period for the final two 10 year periods
- Each of the above expressed as a percentage of the buffer union of the entire 30 year period (see [BU%A](#bua))

### BU%A
Buffer Union as a percentage of All

This metric is designed to highlight problems related to low area coverage by the buffer union model. It works by first constructing a buffer union model of the entire 30 year assessment period for the subject taxon. The area of this buffer-union is the *All*. The calculation then takes the buffer union area of the time period and expresses that as a percentage of the *all*.

An increase in this metric over time slices suggests an expanding population. Correspondingly, a decrease in this metric over time suggests a declining population.

Provisionally, if this metric remains below 80% through the majority of the assessment period, this suggests that this model, and others, will suffer from problems associated with low data density.

### History of BU%A
The idea from this metric arose from trials using alpha hulls, which are highly vulnerable to small adjustments in data when at low data *density*. By expressing the alpha hull as the percentage of the sum of the alpha hulls it was possible to look for low values in this metric, identifying taxa where the alpha hull was at risk of misrepresentation.

The X%A metric has been kept in for use with buffer union, though initial testing suggests that buffer union is so stable that data density has to get to incredibly low values for the buffer union to destabilise.

## Bayesian Occupancy Trend
This model uses a Bayesian method to estimate the occupancy of a taxon on an annual basis. As this is a complex model and, at time, contentious model, please see [the documentation](./bayesian_docs.md) for more details on how this model was constructed.

Each numerical output for this model is accompanied by a 95% CI. For more details, please see the dedicated documentation for this model. The outputs are:

- Mean average start point
- Mean average 10 year point
- Mean average end point
- 30 year trend based on mean start to mean end
- 10 year trend based on mean 10 year to mean end
- 30 year trend based on mean of individual Bayesian 30 year trends
- 10 year trend based on mean of individual Bayesian 10 year trends
- Graph showing mean and confidence interval per year

## Frescalo
This model is based on inter-species assumptions. It has been run at 10 year intervals only, meaning that it cannot provide any insight into a 10 year trend and must be assessed over the three points as a 30 year trend.

## Internal Expert Opinion
The expert opinion of the internal review team

## Wider Expert Opinion
The expert opinion of each individual wider review team member