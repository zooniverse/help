# Integrations

The Zooniverse platform is often one component within a larger research workflow and cyberinfrastructure ecosystem. 

## Zooniverse Platform Infrastructure Components

- [Panoptes](https://zooniverse.github.io/panoptes): the primary API for the Zooniverse platform
- [Caesar](caesar.md): the platform's decision engine and real-time data processing application
- [Aggregations](https://aggregation-caesar.zooniverse.org/docs): in its "online" mode, a deployed app that enhances Caesar's extraction and reduction capabilities
- [ALICE](https://alice.zooniverse.org/about): the Aggregate Line Inspector and Collaborative Editor is a tool for working collaboratively to view and edit the output of text transcription projects on Zooniverse
- [KaDE](https://github.com/zooniverse/kade): a Zooniverse-hosted active learning infrastructure for human-in-the-loop machine learning

## External Platform Integrations

- **CitSci.org:** The CitSci.org platform now provides a Zooniverse integration, making it possible to smoothly transfer data between a CitSci project and a Zooniverse project. For example, this integration makes it possible for volunteers to contribute images take on their phones using the CitSci mobile app and for research teams to select and transfer images to Zooniverse for follow-up classification and analysis. See this [blog entry](https://blog.citsci.org/2021/11/17/crowdsource-images-with-citsci-analyze-them-with-the-zooniverse/) for more details.
- **iNaturalist:** We built the capability to import iNaturalist observations as Zooniverse subjects to enable further classification and analysis. Check out the [SquirrelMapper](https://www.zooniverse.org/projects/bcosentino/squirrelmapper) project that makes use of this functionality, and please see our [Python Client documentation](https://panoptes-python-client.readthedocs.io/en/latest/user_guide.html#inaturalist-imports) for more information.

## Interfacing with External Data Processing - Examples

- **SWAP:** the Space Warps Analysis Pipeline run by the [Space Warps](spacewarps.org) organization uses Caesar to feed a sophisticated external data processing pipeline in its effort to identify gravitationally lensed galaxies.
- **Kilonova Seekers:** the [Kilonova Seekers](https://www.zooniverse.org/projects/tkillestein/kilonova-seekers) project built a complementary backend infrastructure to enable real-time data upload of newly identified transient events as well as classification retreval and flagging of the most interesting targets.
- **AWS Lambda Processing:** the [Planetary Response Network](https://www.zooniverse.org/organizations/vrooje/the-planetary-response-network) organization and its collaborators use Lambda serverless functions hosted on Amazon Web Services to perform computational tasks associated with data reduction and preparation of results, such as the identification of new geospatial features to add to result maps in realtime.
