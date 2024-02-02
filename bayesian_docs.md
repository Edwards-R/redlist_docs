# Bayesian Occupancy Model documentation
The Bayesian Occupancy Model is the subject of much debate, including its usage for the creation of Red List assessments. Considerable time has been spent in this assessment pruning the various assumptions that the model utilises, discarding any where it is possible to do so and the taxon specialists deem the assumption to be incorrect.

## Model Scale
The model was run at 2 km and 10 km resolutions to examine the differences. It was decided that the difference in result between 10 km and 2 km was insufficient to justify the vastly decreased statistical power that the 2 km model was left with.

## Certainty vs Confidence
The `CI` metrics reported from the Bayesian Occupancy Model are *Certainty* Intervals, **not** *Confidence* Intervals.

A *confidence* interval

## Trend Calculation
There exist two different ways of calculating the trends from the occupancy models. These are the *Arithmetic* and *Bayesian* methods. The difference revolves around where the mean average reading occurs.

Remember that the Occupancy model consists of many (999 in this case) repetitions of the same model, which are then condensed down to a singular 'run', using the mean average in this project.

### Arithmetic
This method takes the mean average of all start points of the [time slice](./glossary.md#slice), the mean average of all end points of the time slice, then calculates the difference between them.

### Bayesian
This method takes the start and end point per cycle of the model and calculates the trend. This is repeated for every repetition, then the resulting trends are condensed to a mean average trend.

### Differences
There are frequently substantial differences between the means calculated by each of these methods, though whether these differences are significant is unknown. Making this harder is that these trends are expressed as percentage points (percentage chance between two percentages), during a period in which the subject matter has, overall, experienced significant growth. The nature of a percentage change means that high increases, especially with smaller starting points, result in larger percentage changes and therefore larger discrepencies between the Arithmetic and Bayesian means.