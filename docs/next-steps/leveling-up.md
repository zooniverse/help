# Leveling-Up framework for using volunteer skill

The leveling up (LU) framework is a method to track the skill of a volunteer and the difficulty of individual subjects (through the [feedback](/next-steps/feedback) mechanism). This allows the research team to gate more difficult subjects to higher skill volunteers, and provide a method to level up the volunteers through classification of gold-standard subjects.

## Pre-requisites

The LU framework is an advanced system that touches multiple subsystems in Zooniverse and therefore has a strict set of pre-requisites:

1. The project must be on FEM to leverage the [feedback](/next-steps/feedback/) capabilities 
2. You must have a selection of gold-standard subjects with expert classifications. The number of subjects will depend on how quickly you want volunteers to level up and how many separate levels you need in your project
3. You must have [Caesar](/next-steps/caesar-realtime-data-processing/) set up to handle real-time data aggregation
4. You must have a Question or Survey task. Currently leveling up is limited to only these two tasks.

## Setting up the Leveling Up framework

### Step 1. Create Project via Project Builder

1. Reach out to a Zooniverse contact to activate tools for Leveling Up
2. Create Subject Sets. Note that: 
    1. the subjects will need specific columns to work with feedback). 
    2. make sure to upload your gold standard subjects with the `#training-subjects` column to ensure that they are not aggregated

### Step 2: Create Workflows via Project Builder: Levels 1, 2, 3, etc
1. Reach out to a Zooniverse contact to set Workflow Config: `level`=1, etc for each level
2. Create your task: for now we only support the Question and the Survey tasks (note task key – default assumption is “T0”)
3. Add Feedback Rules (sync feedback rule IDs with subject metadata key names)
4. Link Subject Sets to workflow, and note the workflow ID for the next step.

### Step 3: Create & Configure Workflows on Caesar
First, create the workflows on Caesar. Visit https://caesar.zooniverse.org/workflows, click “+ Add” button in the upper right corner of the page and enter your workflow ID from the project builder page.

[![The Caesar workflow page](/img/leveling-up/caesar-workflow-page.png)](caesar-workflow-page.png)


#### Set up the extractors (choose your workflow from Caesar and go to the Extractors tab):
First, we need to extract the feedback from gold-standard subjects to calculate the subject difficulty. To set this up:

1. Click on "Create Extractors" and  select "External"

[![Add an external extractor](/img/leveling-up/add-extractor.png)](add-extractor.png)


2. Provide a key for this extractor (e.g., "feedback")
3. Use this URL: `https://aggregation-caesar.zooniverse.org/extractors/question_extractor?pluck={"feedback":"metadata.feedback.T0"}`. Be sure to change the `T0` to your task defined in the project builder.
[![Add a pluck-field extractor](/img/leveling-up/add-pluck-extractor.png)](add-pluck-extractor.png)

You may continue to add other extractors as needed for the project!

#### Set up the reducers
Go to the reducers tab and set up two reducers. One will be to calculate the subject difficulty and the other to calculate user skill.


##### Subject difficulty reducer
1. Click on "Create Reducers" and  select "External"
2. Provide a key for this extractor (e.g., "subject-difficulty")
3. Use this URL: `https://aggregation-caesar.zooniverse.org/reducers/subject_difficulty_reducer`
4. Click on Filters and type in the feedback extractor we set up previously enclosed in `[]`: `["feedback"]`
5. Click on Empty extracts and select `ignore_empty`. Your configuration should like the one below:
[![Add subject difficulty reducer](/img/leveling-up/add-subject-difficulty-reducer.png)](add-subject-difficulty-reducer.png)

##### User skill reducer
1. Click on "Create Reducers" and  select "External"
2. Provide a key for this extractor (e.g., "user-skill")
3. Click Topic and select `reduce_by_user`
4. Set up the URL changing the `[mode]` and `[count_threshold]` as needed (see [choosing parameter](#choosing-parameters-and-troubleshooting) for more details): 

`https://aggregation-caesar.zooniverse.org/reducers/user_skill_reducer?mode=[mode]&count_threshold=[count_threshold]`

5. Click on Filters and type in the feedback extractor we set up previously enclosed in `[]`: `["feedback"]`
6. Click on Empty extracts and select `ignore_empty`. Your configuration should like the one below:
[![Add user skill reducer](/img/leveling-up/add-user-skill-reducer.png)](add-user-skill-reducer.png)
7. Contact a Zooniverse team member to set up advanced routing between your subject difficulty and the user skill reducer. Be sure to note the names of the reducers and the workflow ID.

### Step 4: Creating rules and leveling up volunteers
1. For Promotion
    TBD
2. For Subject Retirement
    TBD


## Choosing parameters and troubleshooting

