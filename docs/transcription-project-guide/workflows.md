## 3.1 What is a Workflow?

Volunteers on Zooniverse projects contribute to data creation by examining a piece of media and performing activities that systematically identify features of the media. For transcription projects, the media is an image of text, typically handwritten, which cannot be read by a computer.  

You will ask volunteers examining your images to do one or several small things when examining each image. As well as transcribing the text, these might include answering questions about content on the page. Each of the actions volunteers perform when examining an image (or more generally, any other type of media) are known as a Task. Tasks are then connected in a logical sequence to create a Workflow. 

Definitions: 
**Task:** Any action a volunteer performs when examining a Subject. 

**Workflow:** This is a series of Tasks that a volunteer is asked to complete when presented with data in a Zooniverse project. This can be one Task or multiple Tasks, depending on the project.

See [glossary](https://help.zooniverse.org/getting-started/glossary/) for further elaboration on definitions

Effective Zooniverse projects consider the following principles in designing Tasks and Workflows:
* Tasks are simple and can be understood with minimal guidance. 
* The successful completion of a single Task by a volunteer contributes useful data even if the volunteer submits their Classification without completing the entire Workflow.
* Tasks are connected in such a way that nearly all relevant information a volunteer might encounter can be Classified for the research team.
* The collection of complex or extensive data from a single Subject can be addressed by developing multiple Workflows.



## 3.2 Designing Workflows for the data output you want

This section contains information on the relationship between your desired project output and the process of designing your project Workflow(s).

### 3.2.1 Creating a plan for use

The Zooniverse Project Builder provides creators with significant flexibility in how they ask volunteers to identify information (or data) on an image. There are often several ways to organize the collection of the information you want. You should familiarize yourself with the different Tools in the Project Builder by reviewing [existing projects](https://www.zooniverse.org/projects) and experiencing them as a volunteer. Experiment with these Tools in the Project Builder to see how different Tools work with your images. 

As a project creator you should be familiar with the text you are asking volunteers to transcribe. Content drives Workflow design, so even if discoverability is a goal of your project, you should put in the effort beforehand to look through the materials to develop a general understanding of what your dataset contains. For example, if you are transcribing letters you may want to have volunteers separately identify text that is dates, names, or addresses, so that this information can be easily identified. 

We strongly recommend that before beginning to create Tasks and Workflows in the Project Builder you: 

1. Identify the data that you want to produce at the end of the project.
1. Identify Tasks in the Project Builder that volunteers can use to provide this information. At this stage, it is extremely helpful to identify [existing projects](https://www.zooniverse.org/projects) that have similar Tasks and Workflows to the ones you want to use.
1. Outline the Tasks and Workflow on paper or in software that allows you to sketch the sequential flow between Tasks. Consider whether Tasks might need to be repeated to collect multiple examples of the same type of information. 
1. Practice the Workflow with your data and consider whether it actually produces the data you identified as your ideal output. Request a Data Export from your test Workflows to confirm you are able to get what you need.
1. Consider what information can be identified by programmatic post-processing of the data. For example, instead of asking volunteers to identify dates, names and addresses in letters you might be able to programmatically identify these through their content. Dates are generally recognizable as a string of numbers, or contain numbers and words that do not appear in other contexts. Dates, and names and addresses of senders and recipients may also appear in distinct locations on a letter that can be identified via the coordinate locations of the text. 



### 3.2.2 Balancing the volunteer experience with prioritization of data quality

When designing Tasks and Workflows:

* Try to see the material from the perspective of someone inexperienced but eager to learn. As an expert you may have identified explicit or implicit structure in the text that you wish to have represented in your transcriptions. However, volunteers will not necessarily know the structures you wish to extract. The Tasks and Workflows you design should guide volunteers through the transcription process.

* Consider how often volunteers will encounter a particular type of text. A situation that volunteers may encounter in 1 of every 50 images is relatively rare, but worthy of consideration in your design. Tasks, Task options, and Workflows to address situations that volunteers encounter once in 1,000 images may compromise the volunteer experience by asking volunteers to perform a lot of additional work for little apparent reward.


Well-designed Tasks and Workflows can help volunteers navigate a large amount of complex text and transcribe it into a format that supports your research needs. However, even with well-designed Workflows you should remember that volunteers have limited time. Long Workflows are more likely to be left incomplete by volunteers. If your material can be divided into several shorter, distinct Workflows you may be able to reduce the amount of incomplete transcriptions submitted. 

Workflow design is also an ethical consideration (for more on this, see section 4.1.1). Putting in additional effort during the design stage can result in a better experience for volunteers once the project has launched. When you design Workflows with humans in mind, you communicate that you are respectful of the effort volunteers are donating to your project. 


## 3.3 How to design a Workflow

### 3.3.1 Working from your content

The Zooniverse Project Builder includes several Task types that can be presented to volunteers to capture textual information. The Tasks that are frequently used in crowdsourced transcription projects are:

* Question Tasks
* Dropdown Tasks
* Transcription Tasks


#### 3.3.1.1 Question Tasks


[![A screenshot of a zooniverse transcription project utilizing a question task. The project is titled ‘Corresponding with Quakers’. The main part of the page is a handwritten journal entry, with each line of text underlined in blue, representing the transcriptions that have already been performed on the image. On the right is a question task. The question reads: ‘What is the letter about? Choose a few keywords’ Below is a list of 14 options for users to select, including ‘health/illness/death,’ ‘travel,’ and ‘slavery/abolition/colonialism.’ Here, the user has selected ‘Quakerism/religion’ and ‘family and friends’ to describe the content of the image.](/img/transcription-images/3-3-1-1_cwq_classify.png)](/img/transcription-images/3-3-1-1_cwq_classify.png)
_Above:_ A screenshot of a question task on a Zooniverse project page. From _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King.

Question Tasks present users with a question and a set of predefined answers. The minimal number of answers to present is two—if there was only one option, you would know the answer already. We recommend that you try to avoid giving users too many options (less than 6 is ideal), though there are situations where this may be required, especially for ‘select all that apply’ questions (the screenshot above is a good example). The default behavior is to only let volunteers choose a single response—if you want volunteers to select all that apply, be sure to choose ‘allow multiple.’ 

You can use Question Tasks to create different paths through a Workflow depending upon a volunteer’s response. For example, if you are transcribing manuscript material which occasionally has pictures, you may ask volunteers a yes/no question about whether a picture appears on the page. If their response is ‘Yes,’ you may ask a follow-up question about the content of the picture. This branching structure hides irrelevant Tasks from volunteers. Read more about [how to link Tasks in a Workflow](https://help.zooniverse.org/getting-started/#linking-the-workflow-together) via the main Help page.



#### 3.3.1.2 Dropdown Tasks

[![A screenshot of a zooniverse transcription project utilizing several dropdown tasks. The project is titled ‘Shadows on Stone: Identifying Sing Sing’s Incarcerated’. The main part of the page is a handwritten prison admission register. On the right is a series of questions with a dropdown menu beneath. The top question reads “Sentenced (month)” and the bottom reads “Sentenced (day)”. The dropdown below the ‘year’ option includes a series of numbers representing year options. The years 1893 through 1897 are displayed in the example. Here, the user has selected ‘1895’ as the year of sentencing, according to the displayed admission register image.](/img/transcription-images/3-3-1-2_sos_dropdown.png)](/img/transcription-images/3-3-1-2_sos_dropdown.png)
_Above:_ A screenshot of a dropdown task on a Zooniverse project page. From _Shadows on Stone: Identifying Sing Sing's Incarcerated_, Project Director Roger Panetta.

Dropdown Tasks allow volunteers to efficiently enter standardized text entries. For example, you may have material with a limited list of place names or personal names that occur within the material. From your knowledge of the material you can define a list of pre-specified options that volunteers can select from. Dropdown menus are an efficient way of controlling the entry of elements such as dates for which you want to limit the values that may be selected. For example, if you are transcribing letters from a restricted time period the range of years for which you will accept a letter being written may be limited. Dropdown Tasks constrain users to these values, and potentially lead to less error.


#### 3.3.1.3 Transcription Tasks

[![A screenshot of a user transcribing a journal with the transcription task. The Zooniverse banner at the top reads ‘People’s Contest Digital Archive’. Below is the journal with lines of handwritten text extending past the image. 4 of these lines are underlined, and one is currently selected. There is a popup box with a space to transcribe the selected line, as well as a suggested transcription that a previous user has already submitted. To the right is a panel with two tabs - The unselected one reads ‘Tutorial’. The selected Tab reads ‘Task’ and has instructions for how to complete the transcription task.](/img/transcription-images/3-3-1-3_pc_ttask.png)](/img/transcription-images/3-3-1-3_pc_ttask.png)
_Above:_ A screenshot of a transcription task on a Zooniverse project page. From _People's Contest Digital Archive_, Project Coordinator Kevin Clair.

The Transcription Task is used to allow volunteers to collaboratively mark (underline) and transcribe lines of text. The results of this Task type include positional data as well as the transcription itself. This allows the research team to not only process the transcribed text, but also its location relative to other lines of text. For example, volunteers presented with a page from a journal can transcribe each line of that journal and the research team will be able to see that they are sequentially located on the page. 

Once a line has been transcribed, it will persist on the image, meaning that other volunteers will see it when they encounter that Subject. The transcription can then be reviewed by other volunteers, who will have the option to either select it from a dropdown menu—indicating that they agree with the initial transcription—or input a new transcription either by selecting and editing the previous transcription or typing an entirely new one. Once the text has been agreed upon by the set number of volunteers (see Retirement Limits in section 6) the drawn line will turn gray, indicating it has reached consensus and no longer needs additional review. No additional transcriptions may be submitted for a line once it has turned gray.

This is the most common Task type used in transcription projects. Projects featuring this Task will also be able to use the Aggregate Line Inspector and Collaborative Editor ([ALICE](https://alice.zooniverse.org/about)) to inspect and edit crowdsourced transcriptions after they have reached their retirement limit. 

For detailed instructions on how to set up your project using the Transcription Task, see [this Google Doc](https://docs.google.com/document/d/1XpoMC8SBYVCie9mjU_ZBuT3dLR4bWTN-eZE5lHvls2U/edit?usp=sharing).
