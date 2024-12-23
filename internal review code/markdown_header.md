# Taxon Understanding
## Provisional status: *tbc status here*

## Justification
Any information regarded as central to the justification of the provisional status. Note that this may not contain all information in full detail
## QA Metrics
Quality Assurance metrics, used to gauge the health of the data being fed into the statistical analysis. This section is divided up into 10-year slices and 5-year slice. In general, `# Records` should be > 100/decade (50/5-year) and `BU%A` should be >=80%/decade (>=70%/5-year) for reasonable confidence. There are multiple scenarios where these numbers, especially the `# records` may be changed, but `BU%A` remains overall very stable for this purpose.
### Decade
| Slice | # Records | AoO (sq km) | dEoO (sq km) |BU%A |
|---|---|---|---|---|
|*The time slice in question*|*The number of records in the slice*|*The tetrad area of the time slice in sq km*|*The area of the discreet Extent of Occurrence, modelled by buffer-union, in sq km*|*The % of the total buffer-union that this slice occupies AKA measure of recording consistency*|

## Criterion assessment
The results of all assessments against a given criteria. A value of `?` denotes a 'divide by zero' result and should be regarded as equivalent to `NaN` (Not a Number). Assessments are headed by the criteria they are scored against, with additional separation of non-statistical assessments

|Attribute|Assessment|Value|Accepted|Justification
|---|---|---|---|---|
|*The attribute being tested. E.g. Area of Occupancy, continuous Extent of Occurrence, and discrete Extent of Occurrence*|*The status returned by this particular test e.g. 'VU'*|*The criterion-appropriate value returned by the test e.g. '-21%'*|*Did the internal review team believe that the statistical requirements of the model used are fulfilled? (Yes/No)*|*If the statistical requirements are not believed to be fulfilled, this explains why e.g. 'Insufficient data'*|

---
---