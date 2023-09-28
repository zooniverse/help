# 1.3 What is Zooniverse?

Zooniverse is an online platform for people-powered research. Though the platform’s origins are based in astronomy research, the founders of Zooniverse recognized that many research challenges in the modern social sciences and humanities are similar: there is abundant digital media containing information that people want to transform into a format that allows easier manipulation. There is a fundamental similarity between an astronomer asking, “What shape is this galaxy?” and a medieval historian asking, “What words are written on this page?” 

Because digital images can be shared easily on the internet, it is possible to ask people all over the world to help us answer questions about those images. The Zooniverse Project Builder is a browser-based tool that allows anyone to build what are essentially sequences of questions posed to people about the image at which they are looking. We will describe the technical aspects of using the Project Builder and how they apply to transcription in this Guide. You should also consult the general Zooniverse guide to building projects at [help.zooniverse.org](https://help.zooniverse.org/), which will contain the most up-to-date technical information about the Project Builder. 

Projects on Zooniverse ask volunteers for help in systematically examining images (or more generally, media) and recording answers about them because the questions being asked about the image are not yet possible for a computer to answer with acceptable accuracy. The boundaries between “what can a computer do quickly and accurately?” and “what can people do more accurately?” are shifting rapidly. Before asking volunteers for help with transcribing, consider whether some of your material could be transcribed by a computer. Computers are becoming better at accurately recognizing handwritten text—some handwritten documents can already be read accurately enough by computers—but for other documents the human eye still rules. Data from Zooniverse and other transcription projects is already being used to improve how computers read handwriting. As you develop your project, we encourage you to be aware of these possibilities and collaborate where you can with people trying to improve these methods. For more information, see [“Preface”](https://www.sciencedirect.com/science/article/pii/S0014498322000766) (Wanamaker, Frydman, and Dahl), which discusses and links to recent work in computer recognition of handwriting.

Zooniverse is also a community of project creators and volunteers who connect online about the projects on which they are collaborating. Developing a community of volunteers who will spend time on the project that you create is a distinct challenge from designing and building the project itself. Finding and encouraging people to spend their time on your project, and to keep them engaged and motivated, is a social challenge. We encourage you to think about who might be interested in the material you want to transcribe. When a project launches publicly, Zooniverse will publicize it to an email subscription list of several million people. Every project launch is a chance to engage existing Zooniverse volunteers as well as new volunteers who join the platform because they are interested in that new project.

Transcription projects often draw on audiences interested in history, genealogy, literature, the culture of the place the writing comes from, and the history of particular institutions, organizations and topics.

[![A side by side image, on the left is a manuscript letter from Mary Leadbeater, and on the right a digital transcription of that letter](/img/transcription-images/1-3_cwq_leadbeter_comparison.png)](/img/transcription-images/1-3_cwq_leadbeter_comparison.png)

_Above:_ Mary Leadbeater to Benjamin Haughton, July 16, 1804. University of California Santa Barbara Mss4, Box 6, folder 8, 001. From _Corresponding with Quakers_, Principal Investigator and Project Director Rachael Scarborough King.



## 1.3.1 Project Builder broad overview

The elements of a Zooniverse project are simple. You have a collection of images which contain information that is best extracted by asking people to look at the image and do something. The [Project Builder](https://www.zooniverse.org/lab) allows you to upload the images, ask people a set of questions about the image, and export the answers that people provide. Zooniverse projects feature multiple, (typically) independent classification, meaning more than one person will respond to the questions being asked about each image. By comparing the answers that different people give to the same question about the same image, you can be more confident you are getting an accurate answer. In general, crowdsourcing has been proven to be a reliable method for generating high-quality data, even at [expert levels](https://doi.org/10.48550/arXiv.2103.12104), and a number of Zooniverse projects have resulted in [publications](https://www.zooniverse.org/publications) demonstrating the reliability and usefulness of crowd-generated data.

The Zooniverse platform stores the answers that different people give, and makes it available to you for download as a CSV file. You will use your knowledge of the material to decide how to combine the answers that different people give into a single answer that best represents the material you are transcribing: this is called Aggregation. 

Because text transcription is a popular and complex task, Zooniverse has developed [additional tools](https://alice.zooniverse.org/about) for aggregating text data and reviewing transcription project results. For more detail on data aggregation, see Section 7.



## 1.3.2 Outlining the Zooniverse project process

This graphic represents seven high-level steps required to build and launch a public Zooniverse project (i.e. one that is listed on our [Projects page](https://www.zooniverse.org/projects)).

[![A graphic representing 7 high-level steps required to build a Zooniverse project, entitled “Build a Zooniverse Project.” It reads: Step 1: Identify and Source Your Data. 1a) Create a research question, 1b) Procure digital copies. 2: Create a strategic plan. 2a) Identify your data needs, 2b) Plan for how to get there. 3) Build your project. 3a) Build workflows to classify data, 3b) Add project content. 4) Test and revise. 4a) Go through project review, 4b) Implement feedback. 5) Launch your project. 5a) Find volunteers, 5b) Build community. 6: Analyze Data. 6a) Process and share data, 6b) Continue your research. 7: Publish and conclude. 7a) Wrap up your project, 7b) And start again! Below the table are 3 institutional logos: the National Endowment for the Humanities, the University of Minnesota, and Zooniverse overlaid on the Adler Planetarium icon. ](/img/transcription-images/1-3-2_buildproject_graphic.png)](/img/transcription-images/1-3-2_buildproject_graphic.png)


## 1.3.3 Project input: overview

To build a project in the Project Builder you will need a collection of digital images of the material you want transcribed. You do not need all of your images right away. You should know the provenance and usage rights for each image, and have a plan in place for organizing information about the data you are using, such as a spreadsheet. If you are using images of material in a library or archive, the file reference of the images is information you should plan to save along with the image names.

### 1.3.3.1 What is a Subject Set?

Transcription projects often involve collections of related pages that you likely want transcribed together. For example, it is not very helpful to have one random page of a set of multi-page letters transcribed. You probably want related pages transcribed together. Subject Sets allow you to group related images to be transcribed at the same time, so you can examine the output (text) from those images together. See Section 2 for more detail. 


## 1.3.4 Project output: overview

Zooniverse projects allow you to collect multiple transcriptions of the same text. We find that 2-5 people transcribing an image is sufficient to produce a generally accurate transcription without wasted effort. Not every volunteer will write the same thing, so you will need to aggregate the data into a harmonized or consensus version that best represents the original material. Zooniverse provides a [tool for aggregating lines of text transcription[(https://alice.zooniverse.org) which can be used for [certain transcription project types](https://sites.google.com/zooniverse.org/new-developments-in-ctt/home), and also provides [Python scripts](https://aggregation-caesar.zooniverse.org/docs) to assist with aggregation of data produced by other tools available in the Project Builder. As a project creator your knowledge of the material and plans for using the output should shape how you collect and aggregate data. For example, if you are producing an authoritative edition of a manuscript you will be less tolerant of spelling mistakes than if you are coding or classifying text into numeric categories for quantitative analysis.  

The interests of project creators will shape the way that data is initially collected and aggregated. Zooniverse requires that you make your data publicly available [within two years of your project’s completion](https://help.zooniverse.org/getting-started/lab-policies/). Therefore, you should ideally collect and aggregate data in a way that will be useful to other people interested in the material you are transcribing. Try to anticipate how others might want to use your data when putting together your strategic plan. 

The aggregated consensus output (i.e. the ‘approved’ transcription data) is likely to be most useful to other people interested in your material. However, when you conclude your project you should also make available the larger, unedited dataset of transcriptions and the code used to transform these into aggregate output.

