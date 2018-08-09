**Documentos Dinámicos con R Markdown**

Fernando Hoces de la Guardia

Berkeley Initiative for Transparency in the Social Sciences

* Breve introducción ocupando la presentación de [Thomas Leeper](http://thomasleeper.com) de RT2 London. [Presntación aquí](https://osf.io/4ah58/).

* Para el ejercicio practico vamos a seguir el taller de Garret Christensen [en ingles más abajo].
  * Primero deben descargar y descomprimir [este archivo](https://github.com/fhoces/BITSS_SPANISH/blob/master/3-Rmarkdown/3-Rmarkdown.zip).

* Si el tiempo alcanza podemos ver el ejemplo de mi disertación [aquí](https://rpubs.com/fhoces/dd_cbo_mw).
-----

This directory contains several files designed to familiarize you with the basics of dynamic documents in R Studio using R Markdown and KnitR. The most important files are:

(Don't worry about any Rproj or Rhistory files you may see. That's just R Studio being friendly and keeping track of everything in the background for you if you organize the directory as an R Project.)

1. RMarkdownHTMLExample.Rmd is an R Markdown file for use in R. When successfully run, it will load data (the WASHpublic_mock.dta file) and run three basic regressions. It uses the stargazer package to create nicely formatted HTML regression tables in outputR.html. That table is included in the final combined output: RMarkdownHTMLExample.html.

2. RMarkdownPDFExample.Rmd is similar to the above but makes PDF output. When successfully run, it will load data (the WASHpublic_mock.dta file) and run three basic regressions. This uses the stargazer package to create nicely formatted LaTeX regression tables (outputR.tex). The combined output file is RMarkdownPDFExample.pdf.

3. Tons of people use Word. So there's an option for that, too.

4. Rmarkdown_slides.Rmd generates HTML slides.

5. Rmarkdown_advanced.Rmd is a bit more advanced, with citations, footnotes, and a detailed YAML header.

6. my_bib.bib is a simple bibliography to be used with Rmarkdown_advanced.Rmd.

7. WASHpublic_mock.dta is a Stata data file that gets used for demo regressions.


# Step One

That's it. There's one step. Open a .Rmd file and click Knit. It's beautiful. You don't even have to worry about filepaths, and version control is built right in.
