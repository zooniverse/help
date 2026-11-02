# Data Exports

Zooniverse project teams can download classifications submitted by volunteers,
information about their subjects and workflows, and discussions from Talk.
Classification exports contain individual contributions rather than consensus
results for each subject.

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

## Requesting and downloading an export

1. Sign in to [the Project Builder](https://www.zooniverse.org/lab) and open your
   project.
2. Select **Data Exports**.
3. Request the type of export you need. For a workflow classification export,
   select the relevant workflow.
4. When the export has been generated, Zooniverse will email you. Return to the
   **Data Exports** tab to download the file.

You can request exports while a project is being tested or after it has launched.
An export of classifications will be empty if no classifications have been
submitted. Generating large exports may take some time. Zooniverse processes at
most one request of each export type within a 24-hour period; the tab also shows
when an export was last requested.

## Choosing an export

| Export | Contents | Format |
| --- | --- | --- |
| **Classification** | Individual classifications submitted across the project's workflows | CSV, including JSON-formatted fields |
| **Workflow classification** | Individual classifications submitted for a selected workflow | CSV, including JSON-formatted fields |
| **Subject** | Subjects uploaded to the project and their associated metadata | CSV, including JSON-formatted fields |
| **Workflow** | Workflow definitions, tasks, settings, and version information | CSV, including JSON-formatted fields |
| **Talk comments** | Comments from project Talk discussions | JSON |
| **Talk hashtags** | Hashtags used in project Talk discussions | JSON |

!!! note "Workflow classification exports include all versions"

    Selecting a workflow for a classification export does **not** select a
    particular workflow version. The export includes classifications from
    earlier versions of the same workflow, so it may be large even if the
    latest version has only a few thousand classifications. Check the
    `workflow_version` column before filtering or combining the records.

Some columns, including `annotations`, `metadata`, and `tasks`, contain
JSON-formatted data. Their contents depend on the project's workflows and
subject metadata.

## Downloading exports with the Python client

The [Panoptes Python Client](https://github.com/zooniverse/panoptes-python-client)
provides a way to request and download exports without using the Project
Builder. Install it with:

```bash
pip install panoptes-client
```

The following example signs in to Zooniverse and downloads the most recently
generated project classification export. Replace the example IDs with your
project or workflow IDs, and use an account with permission to access the
exports.

```python
from getpass import getpass
from panoptes_client import Panoptes, Project

Panoptes.connect(
    username=input("Zooniverse username: "),
    password=getpass("Zooniverse password: "),
)


def download_export(response, filename):
    with open(filename, "wb") as file:
        for chunk in response.iter_content(chunk_size=1024 * 1024):
            if chunk:
                file.write(chunk)


project = Project(1234)  # Replace with your project ID.
download_export(project.get_export("classifications"), "classifications.csv")
```

To list the workflows associated with your project and find their IDs, use:

```python
for workflow in project.links.workflows:
    print(workflow.id, workflow.display_name)
```

This follows the workflow-listing example in the
[Panoptes Client user guide](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#other-examples).

To download classifications for a single workflow instead, use the same
`download_export()` function with a `Workflow` object:

```python
from panoptes_client import Workflow

workflow = Workflow(5678)  # Replace with your workflow ID.
download_export(workflow.get_export("classification"), "workflow-classifications.csv")
```

By default, `get_export()` downloads an **existing** export; it does not
request a fresh one. To start generating a new project classification export,
use:

```python
project.generate_export("classifications")
```

When the export is ready, download it using `get_export()` as above. You can
also use `get_export("classifications", generate=True)` to request a fresh
export and wait for it to finish, subject to the same export-generation limits
as requests made through the Project Builder.

Other project-level export types include `"subjects"` and `"workflows"`.

!!! note "`classification` vs. `classifications`"

    These are different export type names in the Python client, not
    interchangeable spellings: use `"classifications"` (plural) with
    `Project.get_export()` but `"classification"` (singular) with
    `Workflow.get_export()`. The same distinction appears in the
    [Panoptes Client export examples](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#data-exports)
    for generating exports.

See the [Panoptes Client user guide](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#data-exports)
for export metadata, waiting for in-progress exports, and subject-set exports.
For a command-line alternative, see [Panoptes CLI](https://github.com/zooniverse/panoptes-cli).

## Classification export

The classification CSV contains one row for each submitted classification. A
classification records the answers submitted by one volunteer during one
classification session; it is **not** a consensus result for a subject. The
file includes these columns:

* `classification_id`: Unique ID assigned to the classification.
* `user_name`: User name for a logged-in volunteer. For a volunteer who is not
  logged in, a pseudonymous name based on an export-scoped, randomized
  10-character identifier associated with their IP address.
* `user_id`: Zooniverse user ID for a logged-in volunteer; absent for an
  anonymous volunteer.
* `user_ip`: **Not the original IP address.** A randomized 10-character
  identifier associated with an IP address when the export is generated.
  Identifiers can help group contributions within an individual export, but
  cannot reliably be matched across different exports.
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
* `subject_ids`: ID of the subject associated with the classification.

### Understanding annotations and workflow versions

The `annotations` field contains task-specific data. For example, a question
might produce a task identifier and one or more selected answer values, while a
drawing or transcription task produces a different structure. The task
identifiers can be interpreted using the `tasks` field in the workflow export.
For concrete examples of question, dropdown, and transcription annotations,
see [Working with data](../transcription-project-guide/working-with-data.md#724-data-export-examples).

Pay particular attention to `workflow_id` and `workflow_version`. A project may
have several workflows, and a single workflow may change while classifications
are being collected. Task labels, available answers, and annotation structures
may therefore differ between records. Inspect those differences before
aggregating or comparing classifications.

## Subject export

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

## Workflow export

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
