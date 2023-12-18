# Raw data model assessment process documentation
All information related to the model assessment for raw data

| Aspect | Criteria | Method | Notes |
|---|---|---|---|
| Record count | A2 | `(slice_3/slice_2)*100` | An entry of `null` for `record count` is a divide-by-zero error and should be read as infinity.|
| Tetrad area | A2 | `(slice_3/slice_2)*100` | An entry of `null` for `record count` is a divide-by-zero error and should be read as infinity.|
| Tetrad area | B2 | slice_3 from tetrad area | B2 is not useable for the assessed taxa without expert opinion. This assessment reflects expert interpretation of circumstances surround the tetrad area. |