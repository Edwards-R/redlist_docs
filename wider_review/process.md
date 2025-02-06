# Wider Review Process Documentation
The Wider Review is a step within the Red List process where the proposed Red List statuses from the Internal Review are sent to knowledgeable taxon experts for comment. Several people, each with significant field experience and entomological skills, have been identified to perform a review of the provisional Red List output by the Internal Review process. These people are firstly divided into two groups: Ants, and Bees & Wasps. This divide reflects the underlying general separation in experience and focus present in the entomologists' experience. From here, each group is subdivided to cover a specific geographic region, the size and placement of which depends on both the availability of entomologists and concentration of the subject matter. As an example, the south of England, being warmer, tends to have a higher diversity of taxa than the northernmost tip of Scotland. Accordingly, a greater number of reviewers were selected for the south of England than for Scotland, as those in the south of England have more taxa to cover and with greater variation.

Each reviewer was asked to consider the proposed statuses from their regional perspective, with a particular focus on `A2 Expert Inference`. This focus was performed to provide a counterbalance to the inherent regional biases present in the core review team, especially when considering Scotland. Reviewers were especially asked to highlight taxa where the proposed status *did not* match up to their regional knowledge. Such an approach worked well. The Scottish reviewer highlighted many `NT` taxa as being common in Soctland, whilst the southern England reviewers highlighted their agreement with `NT` for those same taxa. Such a response gives significant credence to the assessment of `NT` based on sub-regional shifts in distribution, as well as the accuracy and capability of the selected reviewers.

## Handling Feedback
Feedback from the Wider Review process will be examined by the Internal Review team, with Richard Smith chairing. All results from the Wider Review will be stored, but each disagreement a reviewer has with a taxon's proposed status must be assessed for compliance with the Red List criteria. At the end of the taxon's review, a status may be placed in one of three categories:

### Maintained
The taxon maintains its Internal Review status

### Moderation
The moderation process has been used to change a taxon's status, abiding by the **Guidance** and rulings.

### Re-assessed
The Wider Review process process has uncovered information which permits the re-assessment of a taxon using this information using the full Red List criteria. Moderation may be attempted after this stage, but moderation must still only be used *once* per taxon.

## Data storage
An archive of the pre-review dataset will be made, so no data is lost due to re-assessment. The existing dataset, and support structure, will then be used to re-assess any taxa that require it. Moderation steps will then be examined and decided upon.

### Note to dev
- Clone the filemaker file
- Label new file as 'wider review' rather than internal
- Make new table
  - Understanding
  - Moderation result (Maintain, moderated, re-assessed)
  - Justification
- Import responses to a table
- Look over the list of taxa with any disagreement to see what the correct outcome is
  - Look for `f_sum`> 0
- 