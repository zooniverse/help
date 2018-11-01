# Markdown

Here's a few tips that work everywhere we support the Markdown syntax, e.g. pages, tutorials, the project description...

## Displaying and Resizing Embedded Images

You can upload images to Panoptes and display them anywhere the Project Builder allows markdown. Tutorials, help, the field guide, and even as icons. Here’s Galaxy Zoo adding icons to each answer using transparent .png images:


![Galaxy Zoo Task: Disc or Smooth or Artifact?](/img/disc-or-smooth.png)

But what if your image is stupidly large to use as an icon, or much too small for the field guide?

Panoptes has a special version of markdown that lets you specify the image dimensions to display. Copy the markdown string from the Media tab, then add ={pixel_width}x{pixel_height, or blank for square} just before the last bracket. For example:

`![image.png](https://panoptes-uploads...748eb.png =60x)` 

will display a square image resized to 60 by 60 pixels.

This works for an image you host yourself (see [Adam’s section]) - just update the URL.
