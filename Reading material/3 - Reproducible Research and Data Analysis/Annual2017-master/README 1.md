# BITSS Annual Meeting 2017  

## Tools for Research Transparency
Please see the full agenda for the Annual Meeting [http://www.bitss.org/wp-content/uploads/2015/12/2017-BITSS-Annual-Meeting-Agenda.pdf](here).

### Agenda for Software Workshop
Time | Session | Presenter |
------------ | ------------- | ------------|
10:00AM-11:15AM | Hands-on with Dynamic Documents (using RMarkdown + brief references to Stata) | Fernando Hoces de la Guardia
11:15AM-12:00PM | Demonstration of Pandoc, and ShareLaTeX | Garret Christensen


### Software Installation
*Please install the following components before the beginning of the workshop!* We will have problems if everyone tries to download the ~4GB LaTeX installer at the same time.

#### Dynamic Documents
You can write your code and your paper in one place. This means you won’t mess anything up
copying and pasting, and you’ll never have to wonder what code it was that produced which
figure, where on earth you saved it, or whether the paper has the updated version.

 * [Install R.](https://cloud.r-project.org)
 * [Install RStudio.](https://www.rstudio.com/products/rstudio/download/#download)
 * Download the contents of the repository into a folder in your desktop. ("Clone or download" button [here](https://github.com/BITSS/Annual2017))
 * *Optional:* if you want to replicate the section where we produce an output into PDF, you will need to have [LaTeX](https://www.latex-project.org/get/) installed in your computer (the default version, not the small one).

 * With RStudio, go to `File -> New file -> RMarkdown...` and hit `OK`. Then save the file. Then go to `File -> Knit file`. If it runs without problem you are ready to start. If it asks to install some packages, click OK. If you have any trouble send me [an email](fhoces@berkeley.edu).

#### Pandoc
 Pandoc is a tool to convert between document formats. It should be installed when you install RStudio.
 You can test this by typing `which pandoc` into the command line. If you don't get the path to your installed version, you can find it [here](https://pandoc.org/installing.html).

#### ShareLaTeX
ShareLaTeX allows you to collaboratively edit LaTeX documents. (No more choosing Word because of Tracked Changes). Create a [user account](https://www.sharelatex.com/).
