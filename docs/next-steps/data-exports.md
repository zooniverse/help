# Data Exports

Zooniverse project teams can download results from their projects, as well as information about project components (subjects, workflows), in the form of data exports.

## Types of Exports

| Export | Contents | Format |
| --- | --- | --- |
| **Classifications** | Individual classifications submitted by volunteers | CSV, including JSON-formatted fields |
| **Subjects** | Subjects uploaded to the project and their associated metadata | CSV, including JSON-formatted fields |
| **Workflows** | Workflow definitions, tasks, settings, and version information | CSV, including JSON-formatted fields |
| **Talk Comments** | Comments from project Talk discussions | JSON |
| **Talk Hashtags** | Hashtags used in project Talk discussions | JSON |

Export Formats: Export CSVs contain columns whose values are blobs of JSON-formatted data: key-value pairs that may be hierarchically nested). Examples include: `annotations` from classification exports, `metadata` from subject exports; `tasks` from workflow exports. Talk comment and hashtag exports are pure JSON format.

Classification exports can be requested in three different sizes or scopes:

- **Project:** All classifications submitted across the full project.
- **Workflow:** Classifications submitted to a specific workflow.
- **Subject Set:** Classifications submitted for subjects that are members of a specific subject set, and submitted to workflows where that subject set is linked at the time of export creation.

The motivation for different scope options: project-level classification exports can get very large for long-running projects; workflow and subject set scoped exports can help alleviate this challenge by restricting outputs to a specific subset.

<!-- Removing Batch Aggregation text until experimental feature is fully deployed.

Each classification records an individual volunteer's submission for a subject, not an aggregated result. For an explanation of how individual classifications can be combined to drive volunteer consensus about a subject, see [Data Aggregation](data-analysis.md).

For **batch aggregation**, use **Aggregate My Results** on the Project Builder's
**Data Exports** page. Before configuring an aggregation, request both a
**Workflow Classification** export and a **Workflow** export; the portal requires
both. For more detailed guidance, see the
[Panoptes Aggregation guide](https://aggregation-caesar.zooniverse.org/Scripts.html),
or the [Transcription Project Guide](../transcription-project-guide/working-with-data.md#73-data-aggregation)
for transcription projects. The
[Panoptes Client guide](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#automated-aggregation-of-classifications)
also covers requesting hosted batch aggregations programmatically.

In addition to batch aggregation, [Caesar](caesar.md) processes classifications
as they arrive. It supports real-time aggregation and can automate actions such
as retiring subjects or adding them to other subject sets.
-->

## Requesting and Downloading an Export

You can request exports at any time: while a project is being tested or after it has launched.
An export of classifications will be empty if no classifications have been
submitted. Generating large exports may take some time. Zooniverse processes at
most one request of each export type within a 24-hour period; the tab also shows
when an export was last requested.

### Using the Project Builder

1. Sign in to [the Project Builder](https://www.zooniverse.org/lab) and open your
   project.
2. Navigate to the **Data Exports** page.
3. Request the type of export you need. For a workflow classification export,
   select the relevant workflow.
4. When the export has been generated, Zooniverse will email you. Return to the
   **Data Exports** page to download the file.

### Using the Python Client or CLI

The Panoptes Python Client ([docs](http://panoptes-python-client.readthedocs.io/), [code](https://github.com/zooniverse/panoptes-python-client)) provides project owners and collaborators a programmatic way to request and download exports without using the Project Builder. This can be helpful for scripting export creation as part of a data pipeline.

Please see the Python Client [user guide](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#data-exports) for specific instructions on how to generate and download exports.

This functionality can also be accessed through the Command Line Interface (CLI) tool; see [this link](https://github.com/zooniverse/panoptes-cli#generate-and-download-a-classifications-export) for details.

## Export Column Descriptions

### Classification Export

The classification CSV contains one row for each submitted classification. A
classification records the answers submitted by one volunteer for the tasks 
of one workflow regarding one subject; it is **not** a consensus result for a subject. 
The file includes these columns:

* `classification_id`: Unique ID assigned to the classification.
* `user_name`: The login/username for a logged-in volunteer. For a volunteer who is not
  logged in, a pseudonymous name based on an export-scoped, randomized
  10-character identifier associated with their IP address.
* `user_id`: Zooniverse user ID for a logged-in volunteer; absent for an
  anonymous volunteer.
* `user_ip`: **Not the original IP address.** A randomized 10-character
  identifier assigned to each unique IP address when the export is generated.
  Identifiers can help group contributions within an individual export, but
  cannot be used to match across different exports.
* `workflow_id`: ID of the workflow used for the classification.
* `workflow_name`: Name of that workflow.
* `workflow_version`: Major and minor workflow version used for the
  classification.
* `created_at`: UTC timestamp when the classification was created.
* `gold_standard`: Boolean indicating whether the classification was submitted
  in gold-standard mode.
* `expert`: When submitted in gold-standard mode, the role of the classifying
  user (`expert` or `owner`).
* `metadata`: JSON containing additional classification information, such as
  browser information and classification duration.
* `annotations`: JSON containing the answers to workflow tasks. Its structure
  depends on the task types and workflow definition.
* `subject_data`: JSON containing the metadata associated with the classified
  subject, based on the metadata supplied when it was uploaded.
* `subject_ids`: ID of the subject(s) associated with the classification.

**Annotations:** The `annotations` field contains task-specific data. For example, a question
might produce a task identifier and one or more selected answer values, while a
drawing or transcription task produces a different structure. The task
identifiers can be interpreted using the `tasks` field in the workflow export.
For concrete examples of question, dropdown, and transcription annotations,
see [Working with data](../transcription-project-guide/working-with-data.md#724-data-export-examples).

**Workflow Version:** Pay particular attention to `workflow_id` and `workflow_version`. A project may
have several workflows, and a single workflow may change while classifications
are being collected. Task labels, available answers, and annotation structures
may therefore differ between records. Inspect those differences before
aggregating or comparing classifications.

### Subject Export

The subject CSV contains one row for each subject uploaded to a project. Its
columns are:

* `subject_id`: Unique ID assigned to the subject.
* `project_id`: ID of the project.
* `workflow_id`: Workflow ID associated with the subject.
* `subject_set_id`: ID of an associated subject set.
* `metadata`: JSON containing metadata supplied for the subject.
* `locations`: JSON containing the media locations (URLs) for the subject's
  frames.
* `classifications_count`: Number of classifications recorded for the subject
  (not necessarily the number of distinct volunteers).
* `retired_at`: UTC timestamp when the subject was retired, if applicable.
* `retirement_reason`: Reason for retirement, if applicable.
* `created_at`: UTC timestamp when the subject was created.
* `updated_at`: UTC timestamp when the subject was last updated.

Use the subject identifier to relate a classification back to a subject. The
fields in `metadata` depend on what the project team provided when uploading
subjects; they are not the same for every project.

### Workflow Export

The workflow CSV describes the structure of workflows, including their major
versions. Its columns are:

* `workflow_id`: ID assigned to the workflow.
* `display_name`: Display name of the workflow.
* `version`: Major workflow version.
* `active`: Boolean indicating whether the workflow is active.
* `classifications_count`: Number of classifications submitted on the workflow.
* `pairwise`: Whether subjects are selected for pairwise comparisons (not
  typically used).
* `grouped`: Whether subjects are selected by subject set (not typically used).
* `prioritized`: Whether subjects are selected in a given order (not typically
  used).
* `primary_language`: Language code of the workflow.
* `first_task`: Identifier of the first task.
* `tutorial_subject_id`: Default subject linked to the tutorial (not typically
  used).
* `retired_set_member_subjects_count`: Number of retired subjects associated
  with the workflow.
* `tasks`: JSON describing the workflow tasks and their structure.
* `retirement`: Retirement rules for the workflow.
* `aggregation`: Information for downstream aggregation services (deprecated).
* `strings`: JSON containing the text associated with the workflow.
* `minor_version`: Minor workflow version.
