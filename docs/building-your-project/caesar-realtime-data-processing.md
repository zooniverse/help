# Use Caesar for more efficient data processing
https://caesar.zooniverse.org/workflows/

The Caesar system receives a copy of each classification submitted by users and can act on this data as it flows through the system. 

Project owners can configure the caesar system to:

* Extract parts of information from the classification
* Reduce (Aggregate) extracted data into answers
* Add Rules to activate based on Reduced data
* Add Actions to attach to Rules to:
  * Retire a Subject
  * Add a Subject to another subject set (which can be used to advance subjects a next workflow which asks more detailed questions).

If a project has Extracts and Reducers setup in Caesar, this can be used to request exportable flat CSV files of both the extracted classification data and the Reduced(Aggregated) answers.

One other feature of the Caesar system is it allows for external third parties to hook into the Extract and Reduction phases. Data can flow out of the Caesar system to the another web service that can provide custom Extract and Reduction functionality. External systems can also be called as an Action when the reduced data matches rules.

The caesar system is documented at https://zooniverse.github.io/caesar and https://github.com/zooniverse/caesar#readme

For inbuilt Extractors see https://github.com/zooniverse/caesar/tree/master/app/models/extractors
For inbuilt Reducers see https://github.com/zooniverse/caesar/tree/master/app/models/reducers

Additionally, all of the aggregation code in https://github.com/zooniverse/aggregation-for-caesar is available to be set up as (Zooniverse-hosted) extractors and reducers. The documentation on how to do that can be found at https://github.com/zooniverse/aggregation-for-caesar#installing-for-online-use