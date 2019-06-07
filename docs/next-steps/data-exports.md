# Data Exports

Zooniverse projects provide a large amount of data to research teams. These data can be exported from the `Data Export` tab on a project's `Lab` page.

## Classification export

This `csv` file has one row for every classification submitted for a project.  This files has the following columns:

* `classification_id`: A unique ID number assigned to each classification
* `user_name`: The name of the user that submitted the classification.  Non logged-in users are assigned a unique name based on (a hashed version of) their IP address.
* `user_id`: User ID number is provided for logged-in users
* `user_ip`: A hashed version of the user's IP address (original IP addresses are not provided for privacy reasons)
* `workflow_id`: The ID number for the workflow the classification was made on
* `workflow_name`: The name of the workflow
* `workflow_version`: The major and minor workflow version for the classification
* `created_at`: The `UTC` timestamp for the classification
* `gold_standard`: Identifies if the classification was made on a gold standard subject
* `expert`: Identifies if the classification was made in "expert" mode
* `metadata`: A `JSON` blob containing additional metadata about the classification (e.g. browser size, browser user agent, classification duration, etc...)
* `annotations`: A `JSON` blob with the annotations made for each task in the workflow.  The exact shape of this blob is dependent on the shape of the workflow.
* `subject_data`: A `JSON` blob with the metadata associated with the subject that was classified.  The exact shape of this blob is dependent on the metadata uploaded to each subject
* `subject_ids`: The ID number for the subject classified

## Subject export

This `csv` file has one row for every subject uploaded to a project.  This file has the following columns:

* `subject_id`: A unique ID number assigned to each subject as they are uploaded
* `project_id`: The ID number for the project
* `workflow_id`: The workflow ID the subject is associated with
* `subject_set_id`: The ID of the subject set the subject is connected to
* `metadata`: A `JSON` blob with the subject's metadata
* `locations`: A `JSON` blob with the URL to each `frame` of the subject
* `classifications_count`: How many users have classified the subject
* `retired_at`: If the subject is retired this is the `UTC` timestamp for when it was retired
* `retirement_reason`: The reason why it was retired
* `created_at`: The `UTC` timestamp for the creation of the subject
* `updated_at`: The `UTC` timestamp for the latest update to a subject

## Workflows export

This `csv` file has the information for every major version of a workflow.  This file has the following columns:

* `workflow_id`: The ID number for the workflow
* `display_name`: The display name for the workflow
* `version`: The major version number
* `active`: `true` if the workflow is active
* `classifications_count`: How many classifications have been made on the workflow
* `pairwise`:
* `grouped`:
* `prioritized`:
* `primary_language`: The language code for the workflow
* `first_task`: The task key for the first task
* `tutorial_subject_id`:
* `retired_set_member_subjects_count`: The number of retired subjects from the workflow
* `tasks`: A `JSON` blob showing the full workflow structure
* `retirement`: The retirement rules for the workflow
* `aggregation`:
* `strings`: A `JSON` blob containing all the text associated with the workflow
* `minor_version`: The minor version number
