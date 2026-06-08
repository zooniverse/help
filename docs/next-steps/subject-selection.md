# Subject Selection Process

When you first set up a project, the process for selecting which subjects get shown to volunteers is very simple: it randomly selects an (unretired, unseen) Subject from the linked Subject sets for that workflow. 

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


## Sequential Classification
### Overview
This feature will present subjects to project volunteers in a specific order. This is set on a per-workflow basis, and is established using your [subject manifest](https://help.zooniverse.org/getting-started/example/#details-subject-sets-and-manifest-details-aka-what-is-a-manifest).

### Subject upload and manifest creation
To support sequential classification, you must upload your project data with a manifest that includes a ‘Priority’ column. The contents of this column must be integers. You must include separate manifests for each subject set that you upload to your project. Each subject set’s ‘Priority’ column should begin with 1. Click [here](https://docs.google.com/spreadsheets/d/1xgoCCw29i0XlnpYyXiVQIiPTpsw5wCaXQSKfskPX3QA/edit?gid=0#gid=0) to view an example manifest with a 'Priority' column.

### Setup
At present, project builders must request this feature for their project, on a per-workflow basis. Send an email request to [contact@zooniverse.org](mailto:contact@zooniverse.org), asking that sequential classification be turned on. Be sure to include your project ID number and the relevant workflow ID number(s) in your email. 

## Subject Set Selection
### Overview
This feature allows volunteers to choose what subject set they want to work on within a given workflow. 

### User experience description
Once this feature is activated, a volunteer will select a workflow from the project homepage, and then a pop-up box will appear, displaying a list of subject sets to choose from. When they select a subject set, they will proceed to the workflow as normal, and *will only be served subjects from within that set* during their classification session. Along with subject set names, this pop-up will also display the completeness metrics for each subject set (n%). If a subject set is complete, it will be displayed in gray, at the end of the list. The maximum number of subject sets you can associate with a single workflow at a time is 50.

### Setup
At present, project builders must request this feature for their project, on a per-workflow basis. Send an email request to [contact@zooniverse.org](mailto:contact@zooniverse.org), asking that sequential classification be turned on. Be sure to include your project ID number and the relevant workflow ID number(s) in your email. 

## Indexing Tool
### Overview
Indexed subjects allow volunteers to choose an individual subject from a list and work through a subject set in sequential order (nb: [sequential classification](https://help.zooniverse.org/next-steps/subject-selection/#sequential-classification) is required for teams who want to use the indexing tool). This option is helpful for teams who have useful metadata already available for their subjects, and who think their volunteer communities will want to choose what subject they want to classify. Indexed subject sets may not contain more than 100 subjects each. 

### User experience description
After selecting a workflow from a project’s home page, volunteers will be prompted to first select a subject set. Within a subject set, volunteers can select the individual subject they want to work on based on the metadata fields available. Once they have selected a subject, they can work sequentially through the rest of the set, or return to the index and choose a new subject.

On all index pages, the Status column tells volunteers whether a subject is Available (i.e. not complete and not yet seen); Already Seen (i.e. not complete, but already classified by the volunteer viewing the list); or Finished (i.e. has received enough classifications and no longer needs additional effort).

When classifying sequentially, volunteers that reach a retired subject will see a pop-up message blocking the task panel that notes the subject is finished, and offers available options for how to move on with the classification task, including navigating directly to the next classifiable subject or returning to the Index to choose a new subject to classify.

Volunteers can also use ‘Previous’ and ‘Next’ buttons to navigate through the subject set in sequence without leaving the classification interface. 

### Setup
At present, project builders must request this feature for their project. Send an email request to [contact@zooniverse.org](mailto:contact@zooniverse.org), asking that the indexing tool be turned on for your project. Be sure to include your project ID number in that email. 


