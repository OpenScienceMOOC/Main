# Creating a moodle version of the course.

## work offline or online ?

If you have only small changes to do, you can find a moodle instance to work with, and use h5p.org for creating interactive contents. Each small step can take quite long, so if you are planning to do a lot of stuff (including h5p content), you better install a moodle instance on your computer directly (it will save your nerves!)

To make a local installation, check the moodle.org page: https://download.moodle.org/releases/latest/ (check osx and windows packages !). Then install h5p interactive content plugins: https://h5p.org/moodle. You may need to change some variables in the php.ini file and **restart your computer**.

## collaborative working

That is difficult, but one can work on the h5p content or videos indepedently (and downloading it) and upload them in the course later.


## Populate your moodle course

### .md file export 1: Create a book 

Using the bookdown package in R:
- create _bookdown.yml, listing all .dmd files to include in the book
```
output_dir: "book-output2"

rmd_files: [
  "index.Rmd",
  "MAIN.md",
   "Task_1.md",
"Task_2.md",
"Task_3.md"
]
edit: https://github.com/OpenScienceMOOC/Module-5-Open-Research-Software-and-Open-Source/edit/master/content_development/%s
```
- create a index.rmd file, with the yaml:

```
---
title: "Open source research software"
author: "OS MOOC"
output:
  bookdown::html_book:
    toc: no
    css: toc.css
---
```

- run `bookdown::render_book("index.Rdm")` whithin the correct working directory.

### .md file export 2: Create html page from the .md files

The .md file should be rendered as an html_fragment. One way to do that is to use Rstudio, open the .md file and preview it: the html file will be created. the yaml must have `output: html_fragment`. (One can also write a code to produce all html files when running it.)

In the course, create a new chapter if this is new content, or navigate to a chapter you want to update.
Then, add (or modify) a `label` section. In the content, expand the choice to find the html version `< >` of the content. Copy and paste the html version of the course (i.e. not the .md version, you need to open the html file in a text editor) that you get on github (or locally).

### Videos

You may think of using the open bradcaster software: https://obsproject.com/download
You will then have to push the finished video to youtube, or vimeo (or figshare?) if you want them to be used in h5p.

### h5p

You can create h5p content, and download it for later use. You can indeed then upload the h5p file in the moodle. Alternatively, you can create your h5p content directly in your moodle course if the plugin is installed.




### Publishing

For each new release, make a new backup, save it locally, and  push it to the github repository. One can restore that version of the course (in a different moodle instance) using the restore function. Content can be pushed to other moodle platform (oncampus.de) using this strategy, but the new platform must have the corresponding plugins (and competency framework if we use that) uploaded beforehand.

## Using badges

### without using competencies (preferred)

We will need to use completion tracking for this. It needs the following settings to be set (you need admin access):

1. To use activity completion, the feature needs to be enabled for the site by an administrator as follows:

> In Administration > Site administration > Advanced features check the "Enable completion tracking" box.

2. Required course settings: Administration > Course administration > Edit settings and look for the Completion tracking section.

Now you will see an activity completion part in the settings of your activities (including h5p activities). H5P content types that supports completion tracking can be automatically tracked as completed in Moodle, by enabling ”Showing activity as completed” and then selecting ”Student must receive a grade to complete this activity. (https://h5p.org/completion-settings)

### using competencies

Badges are quite complicated to set up. You can indeed add badges that will be delivered when one (or several) `competencies` are obtained. So one first need to define these competencies, which comes into a `Competency frameworks`.

```
not sure??

It seems Competency frameworks must be uplaoded independently of the course to work. I will investigate this
```

### creating a Competency frameworks

### adding compentency to a framework

### adding compentency to the course

### set action for competencies completion

### setting up badges

### Transfer badges

- you need admin rights to add competencies:
  - local: site settings > competencies > export competencies
  - new instance: site settings > competencies > import competencies 

- backup local moodle (with enrolled users and badges)
- restore on https://edu.opensciencemooc.eu:
    - go to any course, click restore, uplaod the downloaded backup
    - Restore as a new course
    - there is a manage badge option that show the badges, but competencies were not uploaded.

## using badgr

- get a badgr.io account with your email address (add password if necessary), create an issuer, create badges
- create a pathway, add LTI integration for moodle
- moodle:
  - add issuer and email address used in `Home > Site administration > Badges > Badges settings `
  - set manage backpacks settings (add password if needed)
  - follow instruction for LTI integration
  - try to open the frame in a new window, sometimes it is working even when you see nothing (then you can try to use the window view instead of embed)
