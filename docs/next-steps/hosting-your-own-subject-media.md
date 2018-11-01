# Hosting your own subject media

We’ll happily host your media (images, videos, etc.) for you, but if you don’t want to upload them all to us you can host them on your own server. E.g. for copyright reasons, or to save time (if you already have them online and don't want to spend the time uploading them).

All you need to do is include the URLs in the manifest.csv file and then upload the manifest using the Panoptes command-line client using the panoptes subject-set upload-subjects command. You’ll need to specify a couple of extra options to the upload-subjects command:

1. `-r column_number` – this option tells the client which column(s) in your manifest contains the media URL(s). You can specify this option more than once to include more than one piece of media. Replace column_number with the number.
2. `-m file_type` – this option tells the client what the file type of your media is. Unlike when you upload files to us, the client can’t automatically detect the file type. If you don’t specify this option, it will default to image/png. It’s important to make sure the type you specify matches the media files you’re using, as otherwise they may not be displayed correctly when people visit your project. The type should be specified as a standard MIME type string.

Important: Make sure your media URLs start with `https` rather than `http`. Zooniverse.org is served over a secure connection, so in order for your media to be loaded correctly it will have to be served securely too.

So, for example, if your manifest.csv looks like this:

URL | Catalogue number | Location
--- | ---------------- | --------
https://example.com/images/image1.jpg | img-003-01 | Oxford, UK
https://example.com/images/image2.jpg | img-003-02 | Chicago, USA

You would use this command to upload the manifest:

```bash
panoptes subject-set upload-subjects -r 1 -m image/jpeg manifest.csv
```
