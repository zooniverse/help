## 7.1 Designing for data output

The primary objective of your Zooniverse project involves transforming an existing dataset (images of handwriting) into another form of dataset (lines and perhaps columns of text) that can be analyzed more efficiently to achieve the broader goals of your project. This transcription data may take on various forms depending on your plans for use. In this section, we’ll consider how your data can be processed, stored, analyzed, and shared during the course of your Zooniverse project and after it is completed. 


Before creating your project, you should know what kind of data you want to collect. Your final data set will comprise a consensus for each Task in your Workflow for a given Subject. Keeping this in mind allows you to think of an ideal architecture for building your project and the provided tools to onboard your historical information to a usable digital dataset.




## 7.2 Data exports

### 7.2.1 How to export data from the Project Builder

You can request a data export via the Data Exports tab of the Project Builder. In this space, there are [several types of data](https://help.zooniverse.org/next-steps/data-exports/) you can request.


| Export Type       | Contents          | Format        |
| ----------------- |:-----------------:|--------------:| 
| Classification export | all task data from all workflows for your entire project | JSON in CSV |
| Workflow classification export | all task data from a specific workflow | JSON in CSV | 
| Workflow export | structural information about how your workflow looks, with version info | JSON in CSV |
| Subject export | a list of all subjects you have uploaded to the project, with any metadata included | JSON in CSV |
| Talk comment export | all comment data from Talk | JSON |
| Talk hashtag export | all hashtag data from Talk | JSON |



### 7.2.2 When to export data from the Project Builder

You can request a data export at any point, even if you have only submitted test transcriptions to your project. If you have not submitted any test transcriptions on your workflow(s), your classification data export will be empty. The Data Exports tab will also show when a Data Export was last requested for each export type.


### 7.2.3 How to export data from ALICE


For information on exporting data from ALICE, please refer to the [ALICE documentation](https://alice.zooniverse.org/about#Data%20exports). Note that only ‘approved’ transcriptions can be exported from ALICE.



### 7.2.4 Data export examples

[![A screenshot showing the headers from a Project Builder workflow classification export CSV file, including classification id, user name, user id, user ip, workflow id, workflow name, workflow version, created at, gold standard, expert, metadata, annotations, subject data, and subject ids](/img/transcription-images/7-2-4_export_csv_headers.png)](/img/transcription-images/7-2-4_export_csv_headers.png)
_Above_: the header structure of a Project Builder workflow classification export. All examples below demonstrate the task-specific structure of data found in the `annotations` column, unless otherwise noted. 

This section will cover task types that are commonly used in Text Transcription projects. For information on other task types, please see [the main 'How to create a project' documentation](https://help.zooniverse.org/getting-started/#task-content).

#### 7.2.4.1 Question task (Project Builder export) - single response

This is the data export format for a question task where only a single response has been submitted, from the project _Corresponding with Quakers_:

`{"task":"T5","task_label":"What is the letter about? Choose a few keywords.","value":["health/illness/death"]}]`

In the above case, a volunteer has selected the option "health/illness/death" for the question `What is the document about? Choose a few keywords.`

[![A screenshot showing a question task input area from a Zooniverse project. The task label reads 'What is the document about? Choose a few keywords.', and the options are "health/illness/death", "childbirth/pregnancy/breastfeeding", "Quakerism/religion", "business/finance/household accounts", "travel", "education", "slavery/abolition/colonialism", "gender/women/female preaching", "American Revolution/French Revolution", "politics", "books/reading/authorship", "letter writing/the post", "family and friends", "other".](/img/transcription-images/7-2-4-1_corresponding_mult_question.png)](/img/transcription-images/7-2-4-1_corresponding_mult_question.png)


#### 7.2.4.2 Question task (Project Builder export) - multiple responses

This is the data export format for a question task where multiple choices are allowed, from the project _Corresponding with Quakers_:

`{"task":"T5","task_label":"What is the letter about? Choose a few keywords.","value":["letter writing/the post","family and friends"]}`

In the above case, a volunteer has selected the options "letter writing/the post" and "family and friends" for the question `What is the document about? Choose a few keywords.`

This is what the task input area looks like for this specific example (i.e. what the volunteer sees when entering data):

[![A screenshot showing a question task input area from a Zooniverse project. The task label reads 'What is the document about? Choose a few keywords.', and the options are "health/illness/death", "childbirth/pregnancy/breastfeeding", "Quakerism/religion", "business/finance/household accounts", "travel", "education", "slavery/abolition/colonialism", "gender/women/female preaching", "American Revolution/French Revolution", "politics", "books/reading/authorship", "letter writing/the post", "family and friends", "other".](/img/transcription-images/7-2-4-1_corresponding_mult_question.png)](/img/transcription-images/7-2-4-1_corresponding_mult_question.png)

#### 7.2.4.3 Dropdown menu - single (Project Builder export)

This is the data export format for a single dropdown task, from the project _Shadows on Stone: Identifying Sing Sing's Incarcerated_:

`{"task":"T30","value":[{"select_label":"Relationship status","option":true,"value":"6e68e5fc7071a","label":"Married"}]}`

In the above case, a volunteer has entered "Married" into the "Relationship status" field via selecting an entry from the options provided in the dropdown list.

This is what the task input area looks like for this specific example (i.e. what the volunteer sees when entering data):

[![A screenshot showing a multi-step dropdown task input area from a Zooniverse project. The task label reads 'Relationship status', and an open dropdown menu is shown underneath, with the options 'Single', 'Married', 'Widower', and 'Divorced'.](/img/transcription-images/7-2-4-3_single_relationship_dropdown.png)](/img/transcription-images/7-2-4-3_single_relationship_dropdown.png)


#### 7.2.4.4 Dropdown menu - multiple (Project Builder export)

This is the data export format for three dropdown tasks, from the project _Shadows on Stone: Identifying Sing Sing's Incarcerated_, presented together in the same workflow step:

`{"task":"T52","task_label":null,"value":[{"task":"T15","value":[{"select_label":"Sentenced (month)","option":true,"value":3,"label":"3 - March"}]},{"task":"T16","value":[{"select_label":"Sentenced (day)","option":true,"value":7,"label":"7"}]},{"task":"T17","value":[{"select_label":"Sentenced (year)","option":true,"value":1898,"label":"1898"}]}]}`

This is what this data looks like when parsed:

[![A screenshot showing parsed JSON data for a dropdown task.](/img/transcription-images/7-2-4-4_date_dropdown_parsed.png)](/img/transcription-images/7-2-4-4_date_dropdown_parsed.png)

In the above case, a volunteer has entered "March" for `Sentenced (month)`, "7" for `Sentenced (day)`, and "1898" for `Sentenced (year)`, meaning that, according to this record, this person was sentenced on March 7, 1898.

This is what the task input area looks like for this specific example (i.e. what the volunteer sees when entering data):

[![A screenshot showing the multi-step dropdown task input area from a Zooniverse project. The three task labels read 'Sentenced (month)', 'Sentenced (day)', and 'Sentenced (year)'. For each field, an unopened dropdown menu is shown underneath.](/img/transcription-images/7-2-4-4_date_dropdown.png)](/img/transcription-images/7-2-4-4_date_dropdown.png)


#### 7.2.4.5 Free-text entry (Project Builder export)

This is the data export format for a free-text entry task, from the project _Shadows on Stone: Identifying Sing Sing's Incarcerated_:

`[{"task":"T50","value":"March 24, 1899","task_label":"Date"}`

In the above case, a volunteer has entered "March 24, 1899" into the `Date` field provided.

This is what the task input area looks like for this specific example (i.e. what the volunteer sees when entering data):


[![A screenshot showing the free-text entry task input area from a Zooniverse project. The task label reads 'Date' and an empty text input field is shown underneath.](/img/transcription-images/7-2-4-4_date_FTE.png)](/img/transcription-images/7-2-4-4_date_FTE.png)


#### 7.2.4.6 Transcription Task (Project Builder export)

This is the Project Builder data export format for the Transcription Task, from the project _Corresponding with Quakers_:

`[{"task":"T0","value":[{"x1":1460.4500246994899,"x2":805.3800428124487,"y1":96.11065371315667,"y2":104.96295076568421,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1450.3331137823154,"x2":1350.4286184752184,"y1":166.92903013337732,"y2":154.2828914869094,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":799.0569734892148,"x2":135.13469454964604,"y1":170.7228717273177,"y2":174.5167133212581,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1474.3607772106047,"x2":615.6879631154292,"y1":282.00889181623586,"y2":285.8027334101763,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1441.4808167297879,"x2":79.49168450518695,"y1":374.3257039354521,"y2":386.9718425819201,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1475.6253910752514,"x2":69.37477358801246,"y1":461.58406059608114,"y2":466.64251605466836,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1427.5700642186732,"x2":63.05170426477869,"y1":553.9008727152974,"y2":566.5470113617654,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1384.573192820682,"x2":71.90400131730621,"y1":646.2176848345135,"y2":655.0699818870411,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1485.7423019924258,"x2":61.78709040013183,"y1":756.2390910587849,"y2":763.8267742466657,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1441.4808167297879,"x2":57.99324880619139,"y1":870.0543388769968,"y2":877.6420220648777,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1473.0961633459578,"x2":171.80849662440326,"y1":957.3126955376256,"y2":969.9588341840936,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1460.4500246994899,"x2":168.01465503046276,"y1":1068.598715626544,"y2":1073.657171085131,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1417.4531533014988,"x2":56.72863494154467,"y1":1154.5924584225259,"y2":1178.6201218508152,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1487.0069158570725,"x2":61.7870904001318,"y1":1253.2323398649762,"y2":1282.3184587518526,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1476.8900049398983,"x2":83.28552609912745,"y1":1358.1952906306606,"y2":1383.4875679235963,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1490.800757451013,"x2":54.19940721225106,"y1":1459.3643998024043,"y2":1490.9797464185742,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1437.6869751358474,"x2":65.58093199407224,"y1":1541.564301004446,"y2":1578.238103079203,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1476.8900049398983,"x2":49.14095175366387,"y1":1626.2934299357817,"y2":1666.7610736044794,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1417.4531533014988,"x2":45.347110159723485,"y1":1702.1702618145891,"y2":1759.077885723695,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0},{"x1":1452.862341511609,"x2":56.72863494154453,"y1":1794.4870739338055,"y2":1838.7485591964435,"frame":0,"details":[{"task":"T0.0.0"}],"toolType":"transcriptionLine","toolIndex":0}],"taskType":"transcription"},{"task":"T0.0.0","value":"Mountmelick  4th of 3rd mo","taskType":"text","markIndex":0},{"task":"T0.0.0","value":"1811","taskType":"text","markIndex":1},{"task":"T0.0.0","value":"My dear Aunt Sally,","taskType":"text","markIndex":2},{"task":"T0.0.0","value":"Thou sent to know if I would","taskType":"text","markIndex":3},{"task":"T0.0.0","value":"chuse thee to write to me? certainly, \u0026 for two","taskType":"text","markIndex":4},{"task":"T0.0.0","value":"reasons thy letters would be most welcome, the","taskType":"text","markIndex":5},{"task":"T0.0.0","value":"one, because they come from thee, \u0026 the other","taskType":"text","markIndex":6},{"task":"T0.0.0","value":"from Ballitore. I hear thou art with","taskType":"text","markIndex":7},{"task":"T0.0.0","value":"Mary Bostello, it is a bad time for me to write,","taskType":"text","markIndex":8},{"task":"T0.0.0","value":"for my letter cannot recompense for taking","taskType":"text","markIndex":9},{"task":"T0.0.0","value":"from such elegant \u0026 agreeable company","taskType":"text","markIndex":10},{"task":"T0.0.0","value":"but thou has always very good company,","taskType":"text","markIndex":11},{"task":"T0.0.0","value":"but thou has not always Mary Costello, I","taskType":"text","markIndex":12},{"task":"T0.0.0","value":"would be obliged to thee to remember me to her.","taskType":"text","markIndex":13},{"task":"T0.0.0","value":"I suppose thou often sees my dear Lydia, alas","taskType":"text","markIndex":14},{"task":"T0.0.0","value":"Beaty's foreboding fears were but too well founded","taskType":"text","markIndex":15},{"task":"T0.0.0","value":"how are thy eyes \u0026 head? I hope thy are, at","taskType":"text","markIndex":16},{"task":"T0.0.0","value":"least, no worse. Governess had not time to look","taskType":"text","markIndex":17},{"task":"T0.0.0","value":"for the verse thou sent for, but I intend to","taskType":"text","markIndex":18},{"task":"T0.0.0","value":"send it the next time. I am sorry I have","taskType":"text","markIndex":19},{"task":"T1","task_label":"Have all the volunteer-made underline marks on all pages turned grey?","value":"No"}`

This is an example of what the first two lines of positional data look like when parsed:

[![A screenshot showing parsed JSON data for the positional lines that make up part of the transcription task.](/img/transcription-images/7-2-4-6_parsed_line_data.png)](/img/transcription-images/7-2-4-6_parsed_line_data.png)


This is an example of what the first four lines of text data look like when parsed: 


[![A screenshot showing parsed JSON data for the text data that makes up part of the transcription task.](/img/transcription-images/7-2-4-6_parsed_text_data.png)](/img/transcription-images/7-2-4-6_parsed_text_data.png)


#### 7.2.4.7 Transcription Task (ALICE Export)

This is the most basic of the ALICE data exports format (plain .txt) for the Transcription Task, from the project _Corresponding with Quakers_ (first four lines of text only):

`Mountmelick 4th of 3rd mo`

`1811`

`My dear Aunt Sally,`

`Thou sent to know if I would`


This export version is only available after a subject is marked as `Approved` in ALICE. For more information on how to use ALICE, read the [documentation](https://alice.zooniverse.org/about).



## 7.3 Data aggregation

Because Zooniverse projects collect multiple transcriptions per Subject, you will need to have a plan for how to identify a single transcription that best represents the material you are transcribing. This could be through manual review, a ‘best of’ determination, scripted data aggregation methods, or other. 

In this section we describe existing methods for aggregating data from text transcription projects.


### 7.3.1 Text aggregation with ALICE 

The following images demonstrate text transcription data processing using [ALICE](https://alice.zooniverse.org/about). The first shows the aggregate line view for a given page, while the second shows the view for reviewing and editing an individual line of text.

[![A screenshot of the ALICE interface for processing transcribed data using the Zooniverse text transcription task. On the left side of the screenshot, under the title “Original Subject” is a photograph of an 18th century letter written in cursive. Each line of text is underlined in a bright color. On the right side of the screenshot is the transcribed text, corresponding to each line. Next to each line of transcribed text are columns titled ‘flag’ and ‘consensus score.’](/img/transcription-images/7-3-1_cwq_ALICE_subject.png)](/img/transcription-images/7-3-1_cwq_ALICE_subject.png)
_Above:_ Letter from John Peters, Dec. 4, 1755. University of California Santa Barbara Mss 4, Box 12, folder 40, 001. A screenshot from the ALICE interface for _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King. 

[![A screenshot of the ALICE interface for processing transcribed data using the Zooniverse text transcription task. On the left side of the screenshot, under the title ‘Original Subject’ is a photograph of an 18th century letter written in cursive. The first line of the letter is underlined in yellow. On the right side of the screenshot is the transcribed text corresponding to each line. This has been grayed out and a popup window appears above the text, with 4 separate transcriptions of the line. Each transcription indicates the date it was submitted and the user who submitted it. Below, there is an ‘aggregated transcription (Via algorithm)” or the option to enter an entirely new transcription.](/img/transcription-images/7-3-1_cwq_ALICE_line.png)](/img/transcription-images/7-3-1_cwq_ALICE_line.png)
_Above:_ Letter from John Peters, Dec. 4, 1755. University of California Santa Barbara Mss 4, Box 12, folder 40, 001. A screenshot from the ALICE interface for _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King. 

The Aggregated Line Inspector and Collaborative Editor ([ALICE](https://alice.zooniverse.org/about)) is the main tool for researchers seeking to automate aggregation of multiple volunteer transcriptions into a single response. To use ALICE, you will need to be using the Transcription Task in your project to collect volunteer transcriptions. Please read through the comprehensive [documentation about ALICE](https://alice.zooniverse.org/about) if you plan to use this tool, as there are [restrictions on how to set up and build your project](https://docs.google.com/document/d/1XpoMC8SBYVCie9mjU_ZBuT3dLR4bWTN-eZE5lHvls2U/edit?usp=sharing) which require intervention from the Zooniverse team. 



### 7.3.2 Other Task types 

Zooniverse has a robust framework for aggregating data generated via other Task types (e.g. Question Tasks, Dropdown Tasks, etc.). The in-house code supports data aggregation for nearly all the Project Builder Task types, by providing [tools](https://github.com/zooniverse/panoptes) to process and aggregate classification data exported from Zooniverse projects. 

A general overview of this process would be: configuring Panoptes to your exported data, extracting the pertinent data from a classification export, and then reducing data for a given Task based on the consensus from each Task’s classification set. 

For an example of Python data aggregation for a Question Task, see this [notebook](https://colab.research.google.com/drive/1sB5datXGQe11jye2DGbfm7OjCo05xaXO?usp=sharing). 


## 7.4 Data sharing requirement

Projects promoted to the Zooniverse community have the goal of producing useful research; your study needs to be well designed, and you must intend to analyze and write up your results as a formal publication. You must make volunteer classification data open within two years of a project’s completion. You also commit to communicating research findings to your volunteer community. Finally, you must formally [acknowledge Zooniverse](https://www.zooniverse.org/about/acknowledgements) in any publications.

Please report publications using Zooniverse-produced data to us via this [form](https://docs.google.com/forms/d/18jwLbtV_6M5HCM74xNFtFbiiszWAxpC5IGHaToYjeiw/viewform).



## 7.5 Unexpected data

One of the benefits of a crowdsourced transcription project is that you are engaging with volunteers who come from a wide variety of backgrounds and fields. While you have a specific end-goal of using your classifications, there are many other, often unexpected outputs of a crowdsourced transcription project. 

Talk boards provide one site where volunteers can share data or findings with one another and the research team. For example, the letters of [Poets and Lovers](https://www.zooniverse.org/projects/pmlogan/poets-and-lovers) often referenced specific paintings or pieces of art. Volunteers on the project took it upon themselves to look up digitized versions of the artworks mentioned and posted them on Talk. This not only provided a fantastic resource for volunteers who wanted to learn more about the two women authors of the diaries, but also the research team will try to incorporate these links into the published edition of the diaries. Talk boards can be exported from the ‘Data Exports’ tab of the Project Builder as a JSON for easier data analysis.

### Case study: *Poets and Lovers*
[Poets and Lovers](https://www.zooniverse.org/projects/pmlogan/poets-and-lovers) is a project to transcribe the diary of Michael Field which was created by two women novelists Katharine Harris Bradley and Edith Emma Cooper.

Peter Logan, Principal Investigator:

> The questions aren't hard and if I can't answer them, I tell one of my partners to get involved, and they'll know the answer. And some of the questions have been very interesting too. Some of them brought up things we didn't know about. So that was an unexpected outcome. We did actually learn things about what's in these diaries that we didn't know about. [The authors] talk a lot about paintings in the diaries, and I was going to write up [the volunteers] responses to the paintings. One of the volunteers found links to online images of the paintings, so we can incorporate them into the transcription. Which is exactly what we're going to do.


Project outputs are not limited to data. By virtue of the nature of crowdsourced transcription projects, research and data are opened up to more people. Many project teams have seen the engagement with the public as a vital output of their work, and have structured their research and project around that engagement. For example, the [Mapping Prejudice](https://mappingprejudice.umn.edu/) team primarily worked with volunteers directly through meetings. They saw the work of educating people on the history of racial covenants through these in-person or small virtual events as an integral practice for their community work. Here, the *process* of crowdsourced transcription was as important of an output as the data.



## 7.6 Data curation

Depending on your affiliations, aspirations, and your project’s goals for presenting data, there may be several ways to preserve and share your project’s results. The most straightforward and cost-effective way for you as a researcher would be to utilize an affiliate institution's data repository (ones with the [CoreTrustSeal](https://www.coretrustseal.org) are best). These institutional repositories allow for consistent access and long-term presentation of your data while allowing you to organize your data in a clear and detailed manner. If you are not a part of an institution, good options for preserving and publishing your data are the [Open Science Framework](https://osf.io/) and [Dryad](https://datadryad.org/stash). In the social sciences, a widely used data repository is [Open ICSPR](https://www.openicpsr.org/openicpsr/). 

Examples of successful data publications from Zooniverse projects can be found here: [https://www.zooniverse.org/about/publications#data](https://www.zooniverse.org/about/publications#data).



























































