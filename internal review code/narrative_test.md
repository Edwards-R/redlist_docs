# Narative test
This document outlines the narrative generation process for the Red List

## Narrative tree
The full decision tree for narratives.

The process works by selecting the highest accepted decline which matches the final, non-moderated, status. For example, a taxon with the final non-moderated status of `EN` should have all models giving a result of `EN` under `A` selected. Then, the model-assessment with the **highest** decline is selected as the model to report on.

> The only model which worries about selection is A, as there are multiple methods of selection under A. However, the *rule* is generic and not an exception, which makes it much safer to use.

>**Expert Inference** has its decline set to the *minimum* level to reach that category. For example, if the result is `VU` then the decline is `30%`. This means that **Expert Inference** will be the last option to be cited, only if all other `A` criteria were not accepted. This is in line with the Red List Guidance, which places *Inference* below *Estimation* in terms of reliability.

## Criterion A
> For criterion A, there are multiple options depending on the model selected. Remember that `Expert Inference` (A2 & A3) is considered to be **Inferred**, whilst the statistical models are considered to be **Estimated**

### Statistical inference
The highest accepted population change estimate is `[X]`% (`[Model]`), which

```
{
    {
        exceeds or meets the [[X]]% decline required for qualification as [[XX]]
    } OR {
        does not exceed the 30% required for qualification as VU
    }
} OR {
    was not accepted
}
```
under Criterion A.

### Expert Inference (A2)
The highest accepted population change was inferred at `[XX%]` from expert untargeted general survey experience. This 
```
{
    {
        does not exceed the 30% required for qualification as VU
    } OR {
        exceeds or meets the [[X]]% decline required for qualification as [[XX]]
    }
} OR {
    was not accepted
}
```
under Criterion A.

### Expert Suspicion (A3)
The highest accepted population change was NT under Criterion A, based on expert suspicion of future threats over the next 100 years. 

## Criterion B
The EOO 
```
{
    ([X] km2)
    {
        exceeds the 20,000 km2 VU threshold
    } OR {
        is below the [XX] km2 [XX] threshold
        {
            and satisfies
        } OR {
            but does not satisfy
        }
        sufficient subcriteria for classification as [XX]
    }
} OR {
    was not accepted
}
```
, and the AOO
```
{
    ([X] km2)
    {
        exceeds the 2,000 km2 VU threshold
    } OR {
        is below the [XX] km2 [XX] threshold
        {
            and satisfies
        } OR {
            but does not satisfy
        }
        sufficient subcriteria for classification as [XX]
    }
} OR {
    was not accepted
}
```

## Criterion D
For Criterion D, the number of locations 
```
{
    {
        is five or fewer, meeting the threshold for VU,
        {
            and satisfies
        } OR {
            but does not satisfy
        }
        sufficient subcriteria for classification as VU
    } OR {
        exceeds five, exceeding the VU threshold
    }
} OR {
    was not accepted
}


```
## Example

### Crossocerus dimidiatus: iso. Richards: 1980
The highest accepted population change estimate is -13% (AoO), which does not exceed the 30% required for qualification as VU under Criterion A. The EOO (314,400 km2) exceeds the 20,000 km2 VU threshold, and the AOO (1,072 km2) is below the 2,000 km2 VU threshold but does not satisfy sufficient subcriteria for classification as VU. For Criterion D, the number of locations exceeds five, exceeding the VU threshold.

### Bombus distinguendus: iso. Cameron et al: 2007
The highest accepted population change was NT under Criterion A, based on expert suspicion of future threats over the next 100 years. The EOO (69,700 km2) exceeds the 20,000 km2 VU threshold, and the AOO (1,356 km2) is below the 2,000 km2 VU threshold and satisfies sufficient subcriteria for classification as VU. For Criterion D, the number of locations is five or fewer, meeting the threshold for VU, but does not satisfy sufficient subcriteria for classification as VU.

The majority of habitat is at current sea level. Rises to high water marks will destroy significant amounts of this habitat. If this destruction happens as part of a major event, this taxon has limited ability to adapt or recolonise at many sites.

### Tetramorium atratulum: iso. Seifert: 2007
The highest accepted population change estimate is 0% (Buffer-Union), which was not accepted under Criterion A. The EOO was not accepted, and the AOO was not accepted. For Criterion D, the number of locations was not accepted.

There are serious issues with the volume of ant data that could be found for this project. iRecord data has been used for this group, and still there is a low volume of data.

### Pregen
The estimated population change over the last 10 years is [value 1]% and does not exceed the 30% required for qualification as VU against Criterion A; the EOO ([value 2] km2) and AOO ([value 3] km2) exceed the 20,000km2 and 2000km2 VU thresholds, respectively, for Criterion B; and the number of locations exceeds five, exceeding the Criterion D2 threshold.