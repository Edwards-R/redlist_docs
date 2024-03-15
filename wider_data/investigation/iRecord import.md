# iRecord import procedures
This document covers any considerations and decisions made when processing the iRecord dataset to the point where it can be considered comparable to the BWARS standard.

## Import route
**Data from BRC**

Incoming data were then processed through the BWARS Checker. To save significant amounts of time, any taxon where the binomial cannot be uniquely translated to an Understanding (i.e. there has been a nomenclatural split in that taxon's modern history) will be discarded from import and from analysis. The volume of data this discards will be noted.