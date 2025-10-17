# Feedback

The **Feedback** functionality in Zooniverse allows project teams to provide volunteers with immediate guidance when they classify designated *training subjects*. This helps participants learn as they go and improves the quality of collected data.  When a volunteer classifies a training subject, the system can show whether their answer was correct — along with customizable success or failure messages. **Feedback** is configured per Workflow and can be used with most tasks (including question, survey, and drawing tasks).

*Note:* **Feedback** is currently an **experimental feature** and may not be configurable for all tasks. If you're interested in seeing if **Feedback** would be a good fit for your project, please email [contact@zooniverse.org](mailto:contact@zooniverse.org) with your project details.


## Setting Up Feedback in a Workflow

Once you've contacted the Zooniverse team and **Feedback** has been enabled for your project, you can configure it within your workflow.

1. Open your workflow and navigate to the **Feedback** section under your question options.  
   - This section appears below your question’s possible answers.  
   - For example, in a yes/no task setup (see below), you’ll see where feedback rules can be added.

2. Select **Create new feedback rule** to open the configuration panel.  

3. Enter a unique **Feedback Rule ID** — this can be any number, but you’ll need to reference it later when uploading your training subjects.  

4. Enable **positive** and/or **negative feedback**, and enter default messages for each.  
   - These messages will be shown to volunteers when they correctly or incorrectly classify a known training subject.  
   - You can later override these defaults by specifying custom messages in subject metadata.

5. Choose a **Feedback Strategy**, such as *Single Answer Question* (recommended for yes/no tasks).

Once configured, click **Save rule** to apply your settings. You can edit or delete the rule later if needed.

| ![Figure 1. Example of a yes/no task with feedback section visible](/img/feedback_setup1.png) | ![Figure 2. Example of a feedback rule configuration showing success and failure messages](/img/feedback_setup2.png) |
| :---: | :----: |
| *Figure 1. Example of a question task setup with feedback section visible below answer options.* | *Figure 2. Example of a feedback rule setup showing success and failure messages for positive and negative feedback.* |





## Creating a Training Subject Set

You’ll need a **Training Subject Set**, which contains examples for which the correct answers are already known.  

When uploading or editing these subjects, include feedback-specific metadata fields in the subject manifest (CSV). For example:

| Metadata Field | Description |
|----------------|-------------|
| `#feedback_1_id` | The feedback rule ID (matches the workflow configuration). |
| `#feedback_1_answer` | The correct answer index (e.g., 0 for “Yes”, 1 for “No”). |
| `#feedback_1_successMessage` | *(Optional)* Custom message when the volunteer classifies correctly. |
| `#feedback_1_failureMessage` | *(Optional)* Custom message when the volunteer classifies incorrectly. |

*Note:* Feedback answer indices must be **strings** when uploaded through the API (e.g., `'0'` not `0`).

If your subjects are already uploaded, you can simply copy them into a new **training subject set** and update their metadata accordingly.


### Example: Uploading Subjects via Code

Here’s a simple example of how to upload training subjects programmatically using the Panoptes Python client:

```python
project_id = 0000
subject_set_id = 000000
feedback_id = 101  # Must match workflow feedback rule ID

metadata_yes = {
    '#feedback_1_id': feedback_id,
    '#feedback_1_answer': '0',  # Correct answer (string)
    '#feedback_1_successMessage': "Correct!",
    '#feedback_1_failureMessage': "Oops! Try again."
}

metadata_no = {
    '#feedback_1_id': feedback_id,
    '#feedback_1_answer': '1',
    '#feedback_1_successMessage': "Correct!",
    '#feedback_1_failureMessage': "Not quite right!"
}

subject_set = SubjectSet.find(subject_set_id)

for each_subject in training_subjects_no:
    s = Subject()
    s.links.project = project_id
    s.add_location(str(each_subject))
    s.metadata = metadata_no
    s.save()
    s.reload()
    subject_set.add(s)

for each_subject in training_subjects_yes:
    s = Subject()
    s.links.project = project_id
    s.add_location(str(each_subject))
    s.metadata = metadata_yes
    s.save()
    s.reload()
    subject_set.add(s)
```

This example uses shared success/failure messages for simplicity, but we recommend customizing them per subject to provide helpful information to the volunteer.


### Metadata Rules Summary

Each **Feedback** rule must have its own numbered group of metadata fields:

| Field | Required | Description |
|--------|-----------|-------------|
| `#feedback_N_id` | Yes | The feedback rule ID from your workflow. |
| `#feedback_N_answer` | Yes | Index of the correct answer (zero-based). |
| `#feedback_N_successMessage` | Optional | Shown when the user is correct; overrides workflow default. |
| `#feedback_N_failureMessage` | Optional | Shown when the user is incorrect; overrides workflow default. |

For example, a subject might include:
```
#feedback_1_id, #feedback_1_answer, #feedback_2_id, #feedback_2_answer
```

## Training Strategy and Probability

The training strategy determines how frequently volunteers are shown training subjects as they progress through classifications. This helps balance early guidance with independent classification as users gain experience.

Each project can define its own strategy using two configuration values:

- **`training_chances`** – a list of probabilities for the first *N* classifications.  
- **`training_default_chance`** – the fallback probability used after *N* classifications.

In the following example, volunteers have a 50% chance of receiving a training subject for their first 10 classifications, which gradually decreases over time. After 100 classifications, the default rate (5%) is applied.

```python
# 10 classifications at 50% probability, then 40 at 20%, then 50 at 10%
training_chances = (10 * [0.5]) + (40 * [0.2]) + (50 * [0.1])
training_default_chance = 0.05  # After 100 classifications
```

This tapering strategy allows teams to introduce volunteers to known examples early on while reducing training frequency as they become more confident and consistent.

*Note:* These values are set at the workflow level but must be entered by the Zooniverse team. After determining the appropriate values for your project, reach out to your Zooniverse contact or email [contact@zooniverse.org](mailto:contact@zooniverse.org) for implementation.


