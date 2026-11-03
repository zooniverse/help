# Data Aggregation

Zooniverse classifications record the answers and annotations submitted by
individual volunteers. Most research projects need to bring together multiple
classifications before using them for further analysis. The appropriate method
depends on the questions asked in the workflow, the type of annotations
collected, and whether the results are needed in batches or as classifications
arrive.

This page explains the stages of aggregation and introduces the tools available
to project teams. For information about requesting the underlying files, see
[Data Exports](data-exports.md).

## From subjects to aggregated results

Data moves through several stages in a typical Zooniverse aggregation workflow:

1. **Subject data:** A subject is the material presented to volunteers, such as
   an image, audio recording, video, or text, together with its associated
   metadata. The subject export describes these records and includes media
   locations and metadata.
2. **Classifications:** Each classification contains the answers and
   annotations submitted by a volunteer for a subject in a particular workflow.
   A classification may include responses to several tasks. Classification
   exports contain these individual submissions, not an agreed-upon answer for
   each subject.
3. **Extracted data:** An *extractor* selects and structures the information
   needed from a classification. For a question task, it might retrieve the
   selected answer; for a drawing task, it might retrieve the coordinates or
   shape parameters of an annotation.
4. **Aggregated results:** A *reducer* combines multiple extracts, commonly
   grouping them by subject. Depending on the task and reduction method, the
   output might be a majority answer, vote counts, agreement statistics,
   clustered points, or combined shapes.

In short, **classifications → extracts → reductions** describes the processing
stages. The original subjects provide the material to which those
classifications refer.

### Example: extracting and combining question responses

Consider a workflow that asks volunteers whether an image contains a glitch.
A classification may include answers to several tasks, along with metadata.
A **question extractor** can select the response for task `T0` and leave
unrelated task responses and metadata out of the extract.

![A question extractor selects the response to task T0 from a classification containing two task responses and metadata.](../img/data-aggregation/question-extractor.png)

*Question extraction: only the response to task `T0` is retained in this
illustrative extract.*

Suppose three volunteers answer this question for the same subject: two answer
**Yes** and one answers **No**. A **reducer** combines those three extracts to
produce a majority response of **Yes**, with an agreement fraction of
approximately **0.667** (two out of three volunteers).

![Three extracts for subject 500 with Yes, Yes, and No responses are combined by a question reducer into a majority Yes response and agreement of 0.667.](../img/data-aggregation/question-reducer.png)

*Question reduction: individual answers are combined into a summary for one
subject. Actual output fields depend on the reducer and its configuration.*

### Example: combining drawing annotations

Drawing tasks may require a different aggregation approach. Volunteers can mark
multiple features and draw shapes at slightly different positions. An
aggregation may therefore need to group corresponding annotations before
estimating representative locations or shapes.

![Three-panel comparison from Jovian Vortex Hunter: the subject image, volunteer-drawn ellipses around features, and combined ellipses.](../img/data-aggregation/jovian-vortex-hunter.png)

*Example from the **Jovian Vortex Hunter** project: the subject image (left),
individual volunteer ellipses (center), and aggregated ellipses (right).*

Aggregation does not always produce a single answer per subject; depending on
the task and reduction method, a result might include several features, clusters,
counts, or uncertainty measures.

!!! note "Agreement is not the same as accuracy"

    A high level of agreement shows that volunteers responded consistently;
    it does not, by itself, establish that their answer is correct. Consider
    the number of classifications, disagreements, task design, and any
    validation data when interpreting an aggregation.

## Choosing an aggregation method

Zooniverse offers several ways to process classification data. They serve
different needs and do not necessarily support the same tasks or configuration
options.

| Method | When to consider it |
| --- | --- |
| **Batch aggregation in the Project Builder** | Start here for a supported, standard aggregation without installing software. The hosted service uses baseline extraction and reduction methods and offers limited customization. |
| **Local aggregation with `panoptes_aggregation`** | Use the Python package's command-line tools or graphical interface when you need more control over workflow versions, extractor and reducer configuration, or local processing. |
| **Real-time processing with Caesar** | Use Caesar when classifications should be processed as they arrive, especially if their results need to trigger actions such as subject retirement or routing to another subject set. |

Text transcription projects may also use specialist tools and review workflows;
see the [Transcription Project Guide](../transcription-project-guide/working-with-data.md#73-data-aggregation).

### Batch aggregation in the Project Builder

The **Aggregate My Results** section of your project's **Data Exports** page
provides a hosted batch aggregation option. Before configuring a batch
aggregation, request both a **Workflow Classification** export and a
**Workflow** export. The Project Builder requires these two exports as inputs.

Batch aggregation processes an existing collection of classifications rather
than continuously processing new submissions. It is intended for standard,
supported workflow tasks; it does not provide all the configuration options
available when running the aggregation package yourself.

For the prerequisite files and their contents, see [Data Exports](data-exports.md).
The [Panoptes Client documentation](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#automated-aggregation-of-classifications)
also explains how to request hosted batch aggregation programmatically.

### Local aggregation with `panoptes_aggregation`

The [Panoptes Aggregation package](https://github.com/zooniverse/aggregation-for-caesar)
can generate extracts and reductions on your own computer. It provides both
command-line and graphical workflows. A typical process is to obtain the
classification and workflow exports, select the workflow and applicable
versions, generate or review the extractor and reducer configurations, and
then run extraction followed by reduction.

Local processing is useful when your task needs a particular extractor or
reducer, or when you want to inspect and adjust the configuration before
processing the data. The supported task types and output formats depend on
the package; consult its
[CLI and GUI documentation](https://aggregation-caesar.zooniverse.org/docs)
for installation, configuration, and examples.

!!! note "Check workflow versions"

    A workflow classification export covers the selected workflow, including
    earlier versions. If task structure or answer choices changed during the
    project, classifications from different versions may need separate
    handling. See [Data Exports](data-exports.md#choosing-an-export) for the
    distinction between workflow and workflow-version selection.

### Real-time processing with Caesar

[Caesar](caesar.md) monitors classifications as volunteers submit them. Its
extractors and reducers can calculate updated results, and its **rules and
effects** can act on those results. For example, a project might retire a
subject after meeting a specified criterion or send it to another workflow
for additional review.

Caesar is therefore more than another way to download aggregated CSV files: it
is useful when decisions need to happen during classification. For setup and
specific extractor, reducer, and rule options, see the
[Caesar guide](caesar.md).

## Interpreting the results

Before using an aggregated dataset for downstream research, check which
workflow and versions were included, how repeat classifications and missing
answers were handled, and what each output field represents. A count of
responses, an agreement fraction, a cluster of markings, and an inferred
consensus answer describe different things. The appropriate quality checks
will depend on the scientific question and the selected reduction method.

For examples of project-specific processing and analysis code, see
[Zooniverse Data-digging](https://github.com/zooniverse/Data-digging) and
[Panoptes analysis examples](https://github.com/vrooje/panoptes_analysis).
For published examples of more specialized approaches, see
[Space Warps](https://doi.org/10.1093/mnras/stv2009) and
[Snapshot Serengeti](https://doi.org/10.1111/cobi.12695).
