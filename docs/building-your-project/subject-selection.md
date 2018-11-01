# Subject Selection Process
When you first set up a project, the process for selecting which subjects get shown to volunteers is very simple: it randomly selects an (unretired, unseen) subject from the linked subject sets for that workflow.

## Per workflow weighting
However, we also have support to tweak this process. It’s possible to assign weights to subject sets, so subjects in set A have a proportionally higher chance of getting shown compared to set B. Because subjects retire and subject sets have different amounts of subjects in them, it is possible to set weighting up in two different styles:

1. A fixed chance per subject set. For instance, subjects in set A will always have a 60% chance of being shown to a volunteer, and subjects in set B will always have a 40% chance of being shown, regardless of how many subjects actually are in set A. 
A practical use of this would be to show gold-standard training images to volunteers for 30% of the shown images, even though there might only be 20 training images in the project. Once those 20 training images have all been seen by a user, they would of course not be shown again, providing a natural automatic stop to training.

2. A fixed chance for each individual subject in a set. This is still configured at the per subject set level, but the weight is now applied at a per-subject basis, i.e. relative to all of the other available subjects in the workflow. With this you can make it twice as likely for a subject to be shown.
A practical use for this is when you have new data available, but the previous dataset isn’t fully complete yet. By increasing the relative weight of the old subjects, you can make sure that the subjects in the old subject sets have a high chance of still getting their last few classifications needed for them to proceed to retirement, while still making the new subjects available for classifying as well.

## Per user weighting
It’s also possible to set these same parameters up on a per-user basis. This overrides the configuration at the workflow level. A practical use for this is to use heuristics to detect users with a high accuracy in certain types of subjects, and giving these users a higher chance of seeing certain subjects. This is an advanced use case which combines various features.

## How to set this up
Unfortunately, we haven’t yet had time to build any user interface for project owners to configure this behaviour themselves. If you’d like to make use of this on one of your projects, please let us know at [contact@zooniverse.org](mailto:contact@zooniverse.org) and we’ll be happy to set it up for you.
