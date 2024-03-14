# Investigation of the Red List dataset
This file documents various investigations into the provenance of the Red List dataset.

## Data sourcing
The bulk of the Red List dataset is composed of the BWARS database. This dataset is then augmented with data from the Essex Field Club.

## BWARS call for data
As part of the Red List process, BWARS put out a call for data. Due to the timing of the initial request for a Red List, there was not much time available for the gathering of that year's data (see [accompanying BWARS documentation](./bwars.md)). To mitigate this, the call asked for data, regardless of clarity. Examples of 'lack of clarity' include:

- Non-species level data
- Non-relevant taxa
- Resubmissions
- Poor input formatting

The estimation of number of total records supplied was over one million. From this, approximately 123,011 records were added, though this number does include some which did not reach inclusion in time for use in the Red List. Processing the data from input to inclusion took approximately two months. Due to the volume of data to be added at very short notice, the BWARS procedures to perform automated range checking (spatial and temporal) were created to provide some level of quality control. These metrics are not as accurate as expert review, but still exposed approximately 200 suspect records. On further investigation, these records were predominantly problematic due to the presence of 'rearing records' - records where individuals had been raised from stem nests in a way which disrupted their natural life cycle.

## Essex Field Club
The Essex Field Club does not provide their data as a whole to BWARS, though members can and do submit data to both schemes. Data from the Essex Field Club are very carefully curated and verified, allowing the records to be very easily integrated into the same dataset as the BWARS data. All Essex Field Club data underwent the exact same processing that other BWARS data does.

## iRecord
iRecord data was not added to this dataset, for a large number of reasons. These reasons boil down to historical issues with accuracy of data imported from the source, the root causes of which have never been entirely identified. BWARS has attempted to integrate bulk iRecord data three times in the past, each attempt resulting in the conclusion that the entomologists do not have sufficient faith in the imported data as a whole to be confident of keeping the data in the dataset.