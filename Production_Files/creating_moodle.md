# Creating a moodle version of the course.

## work offline or online ?

If you have only small changes to do, you can find a moodle instance to work with, and use h5p.org for creating interactive contents. Each small step can take quite long, so if you are planning to do a lot of stuff (including h5p content), you better install a moodle instance on your computer directly (it will save your nerves!)

To make a local installation, check the moodle.org page: https://download.moodle.org/releases/latest/ (check osx and windows packages !). Then install h5p interactive content plugins: https://h5p.org/moodle. You may need to change some variables in the php.ini file and **restart your computer**.

## collaborative working

That is difficult, but one can work on the h5p content or videos indepedently (and downloading it) and upload them in the course later.


## Populate your moodle course


### Text and images: Create html page from the .md files

The .md file should be rendered as an html_fragment. One way to do that is to use Rstudio, open the .md file and preview it: the html file will be created. the yaml must have `output: html_fragment`. (One can also write a code to produce all html files when running it.)

In the course, create a new chapter if this is new content, or navigate to a chapter you want to update.
Then, add (or modify) a `label` section. In the content, expand the choice to find the html version `< >` of the content. Copy and paste the html version of the course (i.e. not the .md version, you need to open the html file in a text editor) that you get on github (or locally).

### Videos

You may think of using the open bradcaster software: https://obsproject.com/download
You will then have to push the finished video to youtube, or vimeo (or figshare?) if you want them to be used in h5p.

### h5p

You can create h5p content, and download it for later use. You can indeed then upload the h5p file in the moodle. Alternatively, you can create your h5p content directly in your moodle course if the plugin is installed.




### Publishing

For each new release, make a new backup, save it locally, and  push it to the github repository. One can restore that version of the course (in a different moodle instance) using the restore function. Content can be pushed to other moodle platform (oncampus.de) using this strategy.

