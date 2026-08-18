---
title: Using AI and ML on Zooniverse
---
# Guidance for Teams Running AI/ML-Engaged Zooniverse Projects

This page is for teams who are incorporating AI or Machine Learning into their Zooniverse project. This can be as a tool for pre-processing, data analysis, human-in-the-loop classification, or as a result (e.g. training a model on Zooniverse classification data).

For more information, please refer to our main [Zooniverse AI Ethics Framework](https://www.zooniverse.org/about/ai-ethics) page.

## **Recommendations for Project Teams**

1. **Design your project with volunteer agency (choice) in mind.** This requires transparency and clear communication for volunteers to make informed decisions about whether they want to take part in your project. If you are incorporating AI/ML at any stage of your work (pre- or post-processing, human-in-the-loop classification systems, etc.), you need to provide specific details about how these processes work, and why they are necessary. For example, saying “we will use the resulting data to train a model” is insufficient detail.   
2. **Show volunteers where/when/why AI/ML is incorporated in your project.** Some workflows within a project may be AI/ML involved/assisted and others not. These should be clearly labeled in the Workflow Name field, or Workflow Description area, so volunteers can choose accordingly (if they have a preference).  If you used AI/ML to pre-process your data, describe what your quality control metrics are (including if this is your reasoning for running a validation workflow on Zooniverse).  
3. **Consider the consequences of optimization.** When considering ‘offloading’ easy tasks to AI/ML and having humans do harder/more complex tasks, be mindful that more advanced workflows may narrow who is able/qualified to participate, unless there is an onramp. Training tasks may be needed to gain proficiency *to do tasks that AI/ML cannot do.* Any onramp process or training workflow should be clearly labeled, including workflows using the Zooniverse Feedback feature.  
4. **Retain context.** For projects inviting volunteers to engage with or review machine-generated output, consider whether and how context can impact the task—including both the quality of the data and the quality of the volunteer experience. For example, if a task asks volunteers to review the quality of machine transcriptions but only includes a portion of the document (e.g. a single word or phrase), including a link to the full image or document will ensure that volunteers can continue to interact with the source material and its meaning, if desired. This information can be included within a subject’s metadata.   
5. **Follow up.** Provide feedback on the degree of success achieved as AI/ML models are trained. The method will be determined by the project team, and may include e.g. a Talk post, email newsletter, etc.   
6. **Create pathways for feedback.** Any project with an AI/ML component should have a route for volunteers to share their feedback with project team members. For example, teams may wish to create a dedicated Talk Board to describe the use of AI/ML, respond to questions, and provide updates on any training or outputs.   
7. **Address quality.** Describe how you are evaluating and addressing any potential impact on data quality within your project due to AI/ML usage.   
8. **When disclosing your intended use of project results/data, consider how your intended use could shift over time.** Volunteers may choose to take part in your project based on the project goals and intended uses of results/data indicated in the About page. Later, what are the chances that you will expand those uses?   
9. **Consider both the opportunities and potential risks of running an AI/ML-engaged project.** We encourage researchers to understand potential risks—alongside opportunities—before launching projects and point them to vetted tools and published scholarship such as Ceccaroni et al. (2019), which presents a survey of risks and opportunities related to AI use in citizen science, and recommendations for risk mitigation.

## **The 5 Ws of AI/ML-Engaged Projects**

When developing a new Zooniverse project that involves AI/ML, researchers should reflect on and be prepared to answer the following questions. Ideally, the answers to these questions will be available somewhere in the project copy (e.g. the About page, FAQ, etc.).

* Who is responsible for ensuring data quality and integrity?   
* What AI/ML techniques are being applied?   
* When and Where in the lifecycle of data collection, processing, and analysis is AI/ML being used? At what point(s) are volunteers entering the lifecycle? Do the two ever interact? If so, how?  
* Why is AI/ML being used? What is it helping to accomplish and who benefits? What would the research look like if AI/ML was not used?

## **FAQs for Research Teams**

*Don’t see your question answered here? Send us your questions at [contact@zooniverse.org](mailto:contact@zooniverse.org)\! We will update this list as needed.*

* Can I use generative AI to help write or translate my project copy (e.g. About page, etc.)?  
    - You can use these tools, with the following guidelines:  
        - You must disclose any use of generative AI to write project copy beyond basic text refinement (e.g. grammar, copy editing).   
        - You must disclose any use of generative AI to translate your project copy.   
        - You are responsible for any errors introduced into your project copy due to the use of generative AI.  
* How much detail should I give about how I’m using AI with my project?  
    * This is where the 5 Ws framework\[LINK\] can come in handy\! Consider these questions when writing your project copy, explaining your research methods, and describing why your workflows and tasks are structured in the way that they are.  
    * Remember, your volunteer community may contain a range of expertise and interest when it comes to AI/ML techniques, so if you only include a basic explanation, volunteers who are particularly interested may ask more detailed questions on your Talk boards. Conversely, if your explanation is too detailed, people who are not familiar with these methods may not understand what you are doing, or why.  
* What if I don’t have any plans to use AI/ML with my project data, but change my mind later?  
    * Unanticipated uses for project data are generally okay—just because you don’t anticipate using a technology doesn’t necessarily mean you can’t do so. However, your volunteers need to understand what, if any, limitations will be placed on use of the resulting data in order to make an informed decision about whether they want to participate. This is why it is important to communicate **how** your data will be published and/or made available once your project is complete.   
    * If you do end up using AI/ML with your project data but did not have that as an original goal, it is your responsibility to update your results page accordingly. See the [Results page from the Clump Scout project](https://www.zooniverse.org/projects/hughdickinson/galaxy-zoo-clump-scout/about/results) for a good example of how to report this information after the fact.  
    * Remember, our [Zooniverse Policies](https://help.zooniverse.org/getting-started/lab-policies/) state that projects promoted to the Zooniverse community must make their classification data open after a proprietary period, normally lasting two years from project launch. It is your responsibility to communicate the details about how and where you plan to make your data available.  
* I already have a Zooniverse project that I created before these recommendations existed. Do I have to do anything to my project?  
    * Updating an existing project is not required, but we recommend taking a look at the copy on your project Home page, About page, etc., to see whether you have appropriately disclosed any AI/ML use, details about the technology you’re using, etc.

