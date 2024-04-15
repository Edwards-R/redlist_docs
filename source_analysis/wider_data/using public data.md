# On the use of 'general public' data

> *Question is 'why have you not used every piece of available data'?*

## What even *is* 'public data'/'citizen science'
'Public data' is an undefined term. This is also true for the monikor of 'citizen science'. The phrase 'citizen science' is often touted as some magical watchword that will solve all problems. In my experience, this process is far more similar to watching a circus performer try to convince children that a horse with a horn stuck on its head is a unicorn.

The major divider between scientific and non-scientific data collection is not the employment of a particular person in a particular laboratory, but the degree of rigour to which the observer holds themselves. Attempting to qualify data on the basis of 'public' or 'citizen' completely misses this mark entirely. BWARS, and indeed Hymettus, rely on an indviduals ability to provide accurate data and are not concerned at all with their employment status or whether they are regarded as a 'scientist' by others.

## How does BWARS decide on inclusion of data?
Peer review. Old fashioned and liable to insularity as it is, no-one has yet provided an alternative method that satisfies the taxon experts. BWARS places a significant emphasis on inclusion of new arrivals to aculeate hymenoptera recording to rectify the problem of 'it's who you know' as much as possible. None the less, the bare reality of the situation is that accurate, species-level identification of taxa is a *skill* that requires training and experience in order to be accurate.

## What damage could including a wider selection of data do?
A dataset ***very quickly*** takes on the quality of the *lowest common denominator*. It is not that we do not trust *all* 'public' data, but that there is a sufficient error rate to obscure 'reality'. This obscuration is often hard to find. The version that we can find 'traditionally' is spatial range errors, where a species record appears in a place that it shouldn't. For aculeate hymenoptera, this error is typically a southern-restricted taxon appearing in more northern areas without any evidence of northward expansion. There are likely a host of other errors present, but the simple fact of the matter is that there aren't methods by which these are detected other than taxon & location-specific experts noticing them. The 'Atlas' series of publications is the traditional way in which erroneous records were identified, but this can only handle spatial errors and not others such as time-of-year.

## What about the BWARS database's quality?

It's certainly not perfect and there are errors present. A number of factors contribute to this, though this is far too much detail to get into here. What matters is that BWARS has spent *considerable* effort attempting to identify errors and, perhaps more importantly, prevent already identified errors from being reintroduced to the dataset. incoming data goes through a number of processes designed to weed out error, including:

a) Embedding of a nomenclatural authority to the record

b) Conversion of incoming dates to ISO 8601 compliant format

c) Fundamental spatial placement checking

d) Soft computational identification of spatial and temporal potential outliers

e) Human examination of potential outliers

f) Identification of high-self-duplication datasets

g) Skipping of records considered already present in the database

The actual data itself is stored in a relational database with *very* strict variable type parameters. For example, it is quite literally not possible for a malformed date to enter the database. A wrong date, yes, but not a malformed one.

The core aspect of the prevention of error propagation is that incorrect records are *not* removed from the database, but follow the standard parent-child routine of duplication and correction. Accordingly, resubmissions of an error will not generally cause that error to reappear in the post-process dataset.

Following all of this protocol, the standard export of the data is

a) Resolved to current nomenclature standards

b) Strictly de-duplicated

These steps reduce the volume of error again and have become the de-facto standard for use in scientific analysis of the BWARS database.


## What has informed this focus on data quality?
A number of big projects informed BWARS opinions on this subject. The first is the Friends of the Earth's *Great British Bee Count*, where the general were asked to 'record bees'. The resulting data was place on the NBN, where it was subjected to criticism from a number of rather irate taxon experts on the basis that the proposed distribution of taxa was utterly unbelievable. This led to a number of changes, one of which was a push for 'data quality' indicators on the NBN, and one of which was for Friends of the Earth to run another count with taxonomic oversight. This second count came to the general conclusion that attempting to quality control vast amounts of data from well-meaning members of the public was:

a) Necessary

b) Extremely time consuming and expensive

Sadly, Friends of the Earth never wrote up their results in a scientific paper, which is an absolute shame. They have performed one of the *best* large-scale experiments of this nature that I am aware of. The initial 'unverified' data was removed from the NBN leaving, as far as I am aware, only the very few records which were verified by an expert.

The second large-scale projects which influences this decision are the three times I have personally attempted to bulk integrate data from iRecord into the BWARS database. Every single attempt has resulted in a failure as judged by the taxon experts, with far too many erroneous records appearing for the experts to accept the result. These records are not simply 'out of what BWARS considers the range' records, but records which have, somehow, made it past the various data verification systems in place despite being *very* wrong. Multiple taxa, previously constrained to the south of England, had their range 'expanded' to the Scottish highlands. Attempts to ascertain the origin of these errors highlighted a number of problems in various systems, ranging from long-seated software bugs to errors made by humans to feature requests by said humans to help prevent them making errors. Some of these changes have been made, many haven't.

The third aspect which has influenced this decision is the reaction of taxon-specific experts to the idea of utilising wider public data in such a project. These are the people who will be judging the Red List results and holding the result to review. The response, when the idea of utilising bulk 'verified' public data was put forward, was to unanimously reject the idea. Not on principle, but on the grounds of 'there are too many unknown problems'.

Fourth was the idea of only using public-sourced data for individual taxa. This is a statistical minefield due to the way in which aculeate hymenoptera recording is conducted. The vast, almost entirety, of taxa do not have any form of standardised or even extensive monitoring in place. The very very few that *do* indeed have a focused monitoring system in place are typically the result of taxon-focused projects, or the simple result of the taxon only being from such a small location that a local entomologist is able to survey that particular area. As such, the process of designating a threat is contingent on understanding trends in overall recording. In order to understand trends, we need to treat all data in a comparable manner. This method is still highly vulnerable to bias, but we can reduce the *skew* of the analysis. Having a two-method approach to such an analysis has an enormous risk of skewing data to the point where the two methods are incomparable. There are methods to mitigate this, but such an approach needs to be undertaken *very* carefully and with the guidance of statisticians rather than on a whim. There is also the issue of bias towards photogenic and photographically identifiable taxa to be considered. For a breakdown of this in a different taxonomic region, please see **Roger Morris's articles on photo bias**:

 - [Is photographic recording influencing published trends in the relative frequency of invertebrates](../support/3002.pdf) *(British Journal of Entomological Natural History, 34: 2021)*

 - [Understanding the complexities of data compiled by recording schemes](../support/BENHS%202964-1.pdf) *(British Journal of Entomological Natural History, 34: 2021)*

 - [Taking nothing but photos - time for a reality check?](../support/BWM32_2%2009%20Comment.pdf) *(British Wildlife, November 2020 pp 118-124)*

. The extent of this photographical bias is currently unknown in aculeate hymenoptera, but experts agree that it is highly probable, almost certain, to be occurring.

## Why does this obscuration matter?
Because we're looking at *threats* which are defined at an already frequently-inapplicable resolution. A very small amount of erroneous data carries the possibility of an extremely large change to the threat status of a taxon. The way in which this is currently handled is through maintaining a stable-as-possible level of bias. Adding an unknown amount of skew to that bias is not a simple solution.

## Is this a new problem?
Not *really*, no. It's a fairly newly *recognised* problem, but quite honestly a big part of BWARS's ability to *see* this problem is because of a particular combination of a very capable data admin and a very interested, and experienced, system architect. There are *so many* problems surrounding biological recording that it has taken BWARS many years of work to get to the point where we can be *reasonably* confident that we do not hold vast amounts of poor quality data. There are still invalid records within the dataset and we still continue to remove or adjust invalid data that we find, but the volume is much lower than a wide swathe of 'general public' data.

The problems are also not limited to this taxonomic group. At a meeting for Irish biological recording organisations, the predominant problem that most recording groups faced was handling the volume of data input. BWARS has managed to circumvent or surmount the majority of these issues. As part of the Red List preparation, it is estimated that over one million *extremely murky* records were considered. Of these, approximately 120,000 were added to the BWARS database. This process was primarily run by two people over approximately two months of on-off work.

The point is that BWARS is past the hurdle of 'ability to handle data' and into the realm of 'what do we do now that we have the ability to handle data', which includes examination of data quality.

## What is needed to address these concerns?
If any attempt is going to be made to attempt this process again, it's now at a point where it needs funding. The previous attempts where made on a voluntary basis, but have a 100% failure rate. If any future attempt is to be successful it needs to conducted at a large scale to identify the sources of error in platforms. This includes extensive code testing. Multiple *critical* errors have been identified in all public recording platforms which should have been caught by testing - as well as critical errors in non-public recording systems such as BWARS's own system.  Such a project will need to touch on:

a) end user testing of platforms

b) code testing of platforms

c) accuracy testing of verifiers

d) development of new tooling to aid verifiers

These are *not* trivial matters to undertake and will consume significant resources. However, until these issues are comprehensively addressed there is little BWARS *can* do that we, as a voluntary society, aren't already doing.

## Alternative methodology - Data Tiers

The primary alternative idea for consideration is to utilise a three-tier approach to data quality:

### High quality
This tier covers data with a *known and high* level of confidence in its accuracy. In this example, the 'high' data is the BWARS dataset

### Unknown quality
This tier covers data with an *unknown* level of confidence in its accuracy. Specifically, this is the confidence in the identified *lowest common denominator*. If a datasets lowest common denominator is unknown, it automatically falls into this category. This judgement is entirely from the perspective of the person assessing and is subjective.

### Masked quality
This tier is achieved by using the high quality data as a mask for the unknown quality data. Doing so does not raise the quality of the data to high quality as doing so would be an un-managed self-referrential systems. That would be a very bad thing when the goal is an increase in quality.

This approach is part of what BWARS uses for outlier detection and what is planned for usage in the upcoming Record Cleaner work. A 'masked' data set could be used to include data into the Red List, but the approach is entirely untested and will introduce unknown measures of bias and skew to the project.

## Alternative methodology - Loop Over
*This method can be combined with Data Tiers*
It is possible to at the very least encpasulate the uncertainty around the utilisation of data of unknown quality. If, for a given taxon, there is *reasonable suspicion* that the threat status of a taxon would be *significantly* changed by incorporation of extra data, that process can be added as an extra [model](../glossary.md#model). This model would then be assessed as part of the [internal review](../glossary.md#internal-review), following a process specification.

## Closing thoughts

The problematic questions is '*How do you know that additional data will have an appropriate impact and not cause more problems?*'. I'm really not sure that there *is* a good answer to this situation - which by itself is a reason to give it a serious trial. What will be absolutely key to any attempt to answer this question will be a very cleanly defined set of process specification documents. It must be abundantly clear when and *why* the decision to incorporate additional data has been made. Even if that decision is 'the expert thinks it'd be a good idea'.