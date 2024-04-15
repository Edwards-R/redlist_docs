# iRecord import procedures
This document covers any considerations and decisions made when processing the iRecord dataset to the point where it can be considered comparable to the BWARS standard.

## Import route
**Data from BRC**

## Pre-processing
Incoming data will then processed through the BWARS Checker. To save significant amounts of time, any taxon where the binomial cannot be uniquely translated to an Understanding (i.e. there has been a nomenclatural split in that taxon's modern history) will be discarded from import and from analysis. The volume of data this discards will be noted.

## Range checking

Following this, the BWARS range-checking routines, one for spatial and one for temporal, will be performed on the incoming dataset. Again, the number of failures, per check type will be recorded. Please note that
- a failure per range checker does not denote an invalid record, it denotes a record which does not fall within the bounds expected by the system
- there is no provision to follow up on individual failures

