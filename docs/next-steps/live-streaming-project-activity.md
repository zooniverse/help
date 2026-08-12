# Live Streaming Project Activity Through Code
Zooniverse has enabled project owners, researchers and interested parties a way of following project activity live through code, more specifically utilizing [Pusher channels](https://pusher.com/docs/channels/using_channels/client-api-overview/?ref=docs-index). Subscribing to a public Pusher stream enables your application to receive real-time events over a persistent WebSocket connection. Clients subscribe to a public project specific Panoptes channel and receive published events immediately without repeatedly polling an API.
Public channels require no authentication and share appropriate information to the client. 

Example Use Cases of Utilizing Pusher Stream:

- Project status updates
- Public notifications
- Live dashboards
- Metrics and telemetry
- Activity feeds

## Prerequisites
Before connecting, ensure you have:

- Our public application key: `79e8e05ea522377ba6db`
- Our public cluster name : `mt1`
- The name of your project's public channel: 
    - Will be of the format `panoptes-project-YOUR_PROJECT_ID` (Eg. for Project ID 1234, the channel for this project will be `panoptes-project-1234`). 
    - There also is a public Talk channel called `talk`
    - NOTE: channels are case sensitive. 

## Types of Events Within Channels
### Project Channel Events
For <b>project specific channels</b> (eg. `panoptes-project-3606`), Zooniverse broadcasts 2 types of events:

1. `classification` event which gets broadcasted every time your project receives a classification. Event will look like : 
    
```json
{
  "classification_id": "763041523",
  "project_id": "3606",
  "workflow_id": "31841",
  "user_id": "3037757",
  "subject_ids": [
    "119212846"
  ],
  "subject_urls": [
    {
      "image/jpeg": "https://panoptes-uploads.zooniverse.org/subject_location/c7f2802d-d8fc-483b-86c0-1e9cb53ffa89.jpeg"
    }
  ]
}
```
        2. `workflow_counters` event which will be broadcasted every time a subject within your project's workflow gets retired. Event will look like: 
```json
{
  "project_id": 31843,
  "workflow_id": 31162,
  "subjects_count": 86385,
  "retired_subjects_count": 43033,
  "classifications_count": 488895
}
```
### Talk Channel Events

- For the `talk` channel, Zooniverse only broadcasts `comment` events. Which looks like: 
```json
{
  "id": 6702050,
  "project_id": 7850,
  "board_id": 2181,
  "discussion_id": 4106945,
  "focus_id": 68723492,
  "focus_type": "Subject",
  "user_id": "2244951",
  "section": "project-7850",
  "body": "#crystalgully #small_grey_duiker #blue_duiker #young family group ?",
  "created_at": "2026-08-12T19:44:57.272Z",
  "url": "https://www.zooniverse.org/projects/sassydumbledore/chimp-and-see/talk/2181/4106945?comment=6702050"
}
```
## Code Samples with Step By Step Guide (Javascript)
For extra troubleshooting, view Pusher documentation [here](https://pusher.com/docs/channels/getting_started/javascript/)

- <b>Install the Pusher Client Library</b>
For a JavaScript application using npm: 
```
npm install pusher-js
```

- <b>Import the client </b>: 
```
import Pusher from "pusher-js";
```
For a browser application without a bundler, you can use the CDN build: 
```
<script src="https://js.pusher.com/8.3.0/pusher.min.js"></script>
```

- <b> Open a connection to Channels </b> <br>
You can open a connection via: 
```
var pusher = new Pusher("79e8e05ea522377ba6db", {
  cluster: "mt1",
});
```

- <b> Subscribe to a Channel </b> <br>
In this example, we are subscribing to a Panoptes Project Specific Channel (Specifically Project with ID `1234`):
```
var channel = pusher.subscribe("panoptes-project-1234");
```

> <b>NOTE: that channel names are <i>case sensitive</i>. Please ensure you are connecting with all lowercase.</b>

- <b> Listen for Events on the Channel </b> <br>
In this example, we are listening for `classification` events. 
```
channel.bind("classification", (data) => {
    // Your application logic here
    // Eg. console.log("Classification completed", data); 
})
```

### Complete example (JS)
```
import Pusher from "pusher-js";

const pusher = new Pusher("79e8e05ea522377ba6db", {
  cluster: "mt1",
});

const channel = pusher.subscribe("panoptes-project-1234");

channel.bind("classification", (data) => {
  console.log("Received classification event:", data);

  const {
    classification_id,
    project_id,
    workflow_id,
    user_id,
    subject_ids,
    subject_urls
  } = data;

  console.log(`Classification ${classification_id} completed`);
  console.log(`Done by User with ID: ${user_id}`);
  console.log(`On Subjects: ${subject_ids}`);
  console.log(`Subject Urls: ${subject_urls}`);

  // Update application state/UI here.
});
```