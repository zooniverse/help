# Using Caesar: Retire Subjects with Rules and Effects

This tutorial builds on the [question aggregation walkthrough](caesar-question-aggregation.md).
It shows how Caesar can use the output of a Consensus reducer to decide when
**a subject has received enough consistent answers to retire it** from a
workflow. The decision is implemented as a *subject rule* with a **Retire
Subject** effect.

For the full explanation of extractors, reducers, rules, and effects, start with
[Caesar: Zooniverse's Classification and Decision Engine](caesar.md), especially
[Step 3: Rules and effects](caesar.md#step-3-rules-and-effects). This page is a
worked example, not a complete reference for every retirement strategy. The
[official Caesar rules guide](https://zooniverse.github.io/caesar/#configure-rules-effects)
covers the current interface and supported rule syntax.

!!! warning "Test before enabling automatic retirement"

    Retirement changes which subjects are offered for further classification.
    Test conditions and effects with a non-live workflow or test project first,
    inspect actual reductions, and agree on appropriate thresholds with your
    research team. The thresholds below are **illustrative**, not suggested
    defaults. Do not activate the rule on a live workflow until its behavior
    has been independently checked.

## Before you begin

Complete [the question aggregation tutorial](caesar-question-aggregation.md)
or configure an equivalent **Question extractor** and **Consensus reducer**
on your Caesar workflow. For this example, we assume:

| Item | Example configuration |
| --- | --- |
| Extractor key | `question-extract` |
| Reducer key | `question-reducer` |
| Reducer topic | `reduce_by_subject` |
| Reducer output | `most_likely`, `num_votes`, `agreement` |

The reducer key is important: rule conditions refer to its output fields using
`reducer-key.field-name`. Confirm the actual names and values in Caesar before
writing your condition.

## 1. Decide on a retirement criterion

Suppose a project wants to retire a subject when **at least five included classifications
vote for the leading answer** and **at least 80% of the included
classifications agree with it**. In the example, Caesar evaluates two fields:

* `question-reducer.num_votes`: the number of votes for the **most likely
  answer**, not necessarily the total classifications for the subject.
* `question-reducer.agreement`: the fraction of included classifications
  supporting that answer.

These two checks are distinct. A subject with five votes for the leading
answer out of ten classifications has `num_votes = 5` but only 50% agreement,
so it would **not** meet both conditions.

!!! note "Retiring after a total classification count"

    If your scientific criterion requires a **minimum total number of
    classifications**, do not use `num_votes` as a substitute. Consider a
    separately configured [Count reducer](caesar.md#step-2-reducers), whose
    `classifications` field counts included classifications. Match its filters
    and repeated-classification treatment to your analysis, and verify both
    reducers' results before enabling any rule.

## 2. Write a subject-rule condition

Open your workflow in the [Caesar web interface](https://caesar.zooniverse.org/workflows)
and navigate to **Rules**. Choose **Create** and select a **subject rule**.

The condition below is an illustrative example of Caesar's documented JSON
condition syntax. It combines two numerical comparisons using `and`:

```json
[
  "and",
  ["gte", ["lookup", "question-reducer.num_votes", 0], ["const", 5]],
  ["gte", ["lookup", "question-reducer.agreement", 0], ["const", 0.8]]
]
```

Here `lookup` reads a reduction field, `const` supplies a threshold, `gte`
means *greater than or equal to*, and `and` requires both comparisons to be
true. The `0` fallback means a missing field does **not** accidentally satisfy
these positive thresholds.

Adjust the reducer key to match your Caesar configuration. In particular, do
not copy the example until you've checked that the reduction fields are
populated and have the expected values. See the
[conditions reference](https://zooniverse.github.io/caesar/#conditions)
for other available operators.

## 3. Add the Retire Subject effect

In the subject-rule editor, add an effect of type **Retire Subject**. Configure
its **reason** according to the action being taken; for a consensus-based
rule, the documented reason value is `consensus`. The official reference lists
`blank`, `consensus`, and `other` as permitted reason values.

Save the effect, then save or update the subject rule. The configured effect is
executed when Caesar evaluates the subject rule as true. See the
[official rules-and-effects setup](https://zooniverse.github.io/caesar/#configure-rules-effects)
for screenshots of the current workflow, and the
[effects reference](https://zooniverse.github.io/caesar/#effects) for the
supported actions and parameters.

!!! warning "A saved rule can perform real actions"

    Caesar evaluates configured rules when reductions change. The official
    guide documents an option in workflow settings to disable rule evaluation
    temporarily. Confirm the workflow's evaluation settings and existing
    rules *before* saving or enabling a retirement effect; do not assume that
    creating the rule is a harmless preview.

## 4. Check the behavior before using it on live data

Use representative test subjects and verify the actual reduction values and
rule results, including borderline cases. For the illustrative condition,
these expected outcomes provide a useful review checklist:

| Leading-answer votes | Agreement | Expected rule result |
| ---: | ---: | --- |
| 4 | 100% | False: fewer than five leading votes |
| 5 | 83.3% (5 of 6) | True: both thresholds met |
| 5 | 71.4% (5 of 7) | False: agreement below threshold |
| 7 | 87.5% (7 of 8) | True: both thresholds met |

Check how missing answers, duplicate volunteer submissions, and earlier
workflow versions affect the reduction. If you use training subjects or
feedback, review the [Feedback guide's retirement discussion](feedback.md#adapting-subject-retirement)
so that training classifications do not unintentionally trigger retirement.
Also review the Project Builder's existing retirement configuration: another
retirement mechanism may already be in effect.

Finally, verify on a test workflow that a matching rule actually retires the
intended subject and that non-matching subjects remain available. Review the
real-time processing logs or available Caesar diagnostics and consult your
Zooniverse contact if the behavior is unclear. Only then choose scientifically
appropriate conditions for a live project.

## What next?

Subject retirement is one possible effect. Caesar can also add subjects to
other subject sets or collections, or invoke an external service, depending on
the project. For those options, return to
[Caesar: Zooniverse's Classification and Decision Engine](caesar.md#step-3-rules-and-effects).
For broader background on interpreting agreement and aggregated results, see
[Data Aggregation](data-analysis.md#interpreting-the-results).
