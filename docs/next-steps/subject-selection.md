# Subject Selection Process

When you first set up a project, the process for selecting which subjects get shown to volunteers is very simple: it randomly selects an (unretired, unseen) subject from the linked subject sets for that workflow. 

## Weighting
### Per workflow weighting
However, we also have support to tweak this process. It’s possible to assign weights to subject sets, so subjects in set A have a proportionally higher chance of getting shown compared to set B. Because subjects retire and subject sets have different amounts of subjects in them, it is possible to set weighting up in two different styles:

1. A fixed chance per subject set. For instance, subjects in set A will always have a 60% chance of being shown to a volunteer, and subjects in set B will always have a 40% chance of being shown, regardless of how many subjects actually are in set A.
A practical use of this would be to show gold-standard training images to volunteers for 30% of the shown images, even though there might only be 20 training images in the project. Once those 20 training images have all been seen by a user, they would of course not be shown again, providing a natural automatic stop to training.

2. A fixed chance for each individual subject in a set. This is still configured at the per subject set level, but the weight is now applied at a per-subject basis, i.e. relative to all of the other available subjects in the workflow. With this you can make it twice as likely for a subject to be shown.
A practical use for this is when you have new data available, but the previous dataset isn’t fully complete yet. By increasing the relative weight of the old subjects, you can make sure that the subjects in the old subject sets have a high chance of still getting their last few classifications needed for them to proceed to retirement, while still making the new subjects available for classifying as well.

### Per user weighting
It’s also possible to set these same parameters up on a per-user basis. This overrides the configuration at the workflow level. A practical use for this is to use heuristics to detect users with a high accuracy in certain types of subjects, and giving these users a higher chance of seeing certain subjects. This is an advanced use case which combines various features.

### Setup
If you’d like to make use of weighting on one of your projects, please let us know at [contact@zooniverse.org](mailto:contact@zooniverse.org) and we’ll be happy to set it up for you. Be sure to include your project ID number in your email.


## Sequential classification
### Overview
This feature will present subjects to project volunteers in a specific order. This is set on a per-workflow basis, and is established using your [subject manifest](https://help.zooniverse.org/getting-started/example/#details-subject-sets-and-manifest-details-aka-what-is-a-manifest).

### Subject Upload and Manifest Creation
To support Sequential Classification, you must upload your project data with a Manifest that includes a ‘Priority’ column. The contents of this column must be integers. You must include separate Manifests for each Subject Set that you upload to your project. Each Subject Set’s ‘Priority’ column should begin with 1. Click [here](https://docs.google.com/spreadsheets/d/1xgoCCw29i0XlnpYyXiVQIiPTpsw5wCaXQSKfskPX3QA/edit?gid=0#gid=0) to view an example manifest with a 'Priority' column.

### Setup
At present, Project Builders must request this feature for their project, on a per-workflow basis. Send an email request to [contact@zooniverse.org](mailto:contact@zooniverse.org), asking that Sequential Classification be turned on. Be sure to include your Project ID number and the relevant Workflow ID number(s) in your email. 

