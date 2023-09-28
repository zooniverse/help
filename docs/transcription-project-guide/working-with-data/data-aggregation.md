# 7.3 Data aggregation

Because Zooniverse projects collect multiple transcriptions per Subject, you will need to have a plan for how to identify a single transcription that best represents the material you are transcribing. This could be through manual review, a ‘best of’ determination, scripted data aggregation methods, or other. 

In this section we describe existing methods for aggregating data from text transcription projects.


## 7.3.1 Text aggregation with ALICE 

The following images demonstrate text transcription data processing using [ALICE](https://alice.zooniverse.org/about). The first shows the aggregate line view for a given page, while the second shows the view for reviewing and editing an individual line of text.

[![A screenshot of the ALICE interface for processing transcribed data using the Zooniverse text transcription task. On the left side of the screenshot, under the title “Original Subject” is a photograph of an 18th century letter written in cursive. Each line of text is underlined in a bright color. On the right side of the screenshot is the transcribed text, corresponding to each line. Next to each line of transcribed text are columns titled ‘flag’ and ‘consensus score.’](/img/transcription-images/7-3-1_cwq_ALICE_subject.png)](/img/transcription-images/7-3-1_cwq_ALICE_subject.png)
_Above:_ Letter from John Peters, Dec. 4, 1755. University of California Santa Barbara Mss 4, Box 12, folder 40, 001. A screenshot from the ALICE interface for _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King. 

[![A screenshot of the ALICE interface for processing transcribed data using the Zooniverse text transcription task. On the left side of the screenshot, under the title ‘Original Subject’ is a photograph of an 18th century letter written in cursive. The first line of the letter is underlined in yellow. On the right side of the screenshot is the transcribed text corresponding to each line. This has been grayed out and a popup window appears above the text, with 4 separate transcriptions of the line. Each transcription indicates the date it was submitted and the user who submitted it. Below, there is an ‘aggregated transcription (Via algorithm)” or the option to enter an entirely new transcription.](/img/transcription-images/7-3-1_cwq_ALICE_line.png)](/img/transcription-images/7-3-1_cwq_ALICE_line.png)
_Above:_ Letter from John Peters, Dec. 4, 1755. University of California Santa Barbara Mss 4, Box 12, folder 40, 001. A screenshot from the ALICE interface for _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King. 

The Aggregated Line Inspector and Collaborative Editor ([ALICE](https://alice.zooniverse.org/about)) is the main tool for researchers seeking to automate aggregation of multiple volunteer transcriptions into a single response. To use ALICE, you will need to be using the Transcription Task in your project to collect volunteer transcriptions. Please read through the comprehensive [documentation about ALICE](https://alice.zooniverse.org/about) if you plan to use this tool, as there are [restrictions on how to set up and build your project](https://docs.google.com/document/d/1XpoMC8SBYVCie9mjU_ZBuT3dLR4bWTN-eZE5lHvls2U/edit?usp=sharing) which require intervention from the Zooniverse team. 



## 7.3.2 Other Task types 

Zooniverse has a robust framework for aggregating data generated via other Task types (e.g. Question Tasks, Dropdown Tasks, etc.). The in-house code supports data aggregation for nearly all the Project Builder Task types, by providing [tools](https://github.com/zooniverse/panoptes) to process and aggregate classification data exported from Zooniverse projects. 

A general overview of this process would be: configuring Panoptes to your exported data, extracting the pertinent data from a classification export, and then reducing data for a given Task based on the consensus from each Task’s classification set. 

For an example of Python data aggregation for a Question Task, see this [notebook](https://colab.research.google.com/drive/1sB5datXGQe11jye2DGbfm7OjCo05xaXO?usp=sharing). 