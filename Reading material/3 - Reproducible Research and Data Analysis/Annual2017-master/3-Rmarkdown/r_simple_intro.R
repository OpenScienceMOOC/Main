######## INFO ########

# Purpose: Super basic and abbreviated intro to R
# Created: 17 March by Julia Clark

##### What is R?

# R is not a statistical software package. It is an "object oriented" programming language, based on another language called 'S' and similar to Python. Using base functionality in R as well as lots of user-created packages you can load, R can do statistical analysis, awesome data visualization, scrape the web, run simulations, etc., etc.). This means that it is much more versitile than Stata, but has a steeper learning curve, and you have to manually program some tasks that are canned functions in purpose-build statistical software like Stata. 

# We're working in RStudio, which is an 'integrated development environment' or IDE to run R code, which you could also execute directly in R, or in the command line (shell), or in a number of text editors. But RStudio is easiest to learn for beginners. 

##### Executing code

# Right now, your reading an R script, which saves with the extension '.R'. Like Stata's do files, we use scripts to write and save code for reproducibility. To run part of your code, select it and press 'command + return' (Mac) or 'control + return' (PC), or click the 'Run' button at the top of this script. Try that now with the following command: 

  print('Hello, World!')

# You can always type commmands directly into the 'console'. Try copying and pasting the above command directly into the console and run it by clicking 'return'. 

######## BASICS ########

# A simplistic way of thinking about R is that you can give it two kinds of commands. The first kind (like the above "print('Hello, World!'") are just telling it to execute something and print the result in the console. 

# The second type of command tells it to ASSIGN something to an 'object'. We do this by using the '<-' operator. For example, put your name between the quotations below, and execute:

  my_name <- "Julia" # Creates an object called "my_name" with the value "Julia"

# If we want to see the contents of that object, we can either command ...

  print(my_name)

# Or simply type the name of the object

  my_name

# We can then use this object in a variety of ways. Let's create a few more ... 
  
  greeting <- "Hello"
  punctuation <- "!"
  greeting
  punctuation
  
# Now, let's put them together in a new object called 'phrase' using the 'c()' or concantinate function that groups things together:
  
  phrase <- c(greeting, my_name, punctuation)
  phrase
  
# So now have a few objects. You can see them by running the command 'ls()' to list all the object you have stored, or by looking at the 'Environment' window in Rstudio. 
  
  ls()
  
# Each of these objects is a 'vector' (one row of data) of a different length. Because the type of data they're storing is text, they are 'character' vectors. We can tell that by looking at each object using the 'class()' command, or the 'str()' (structure) command:
  
  class(greeting) # the 'chr' in the console tells me that this is a character
  str(phrase)

# As you can see, 'greeting' is a character vector of length 1, while 'phrase' is a character vector of length 3. I'm not happy with the 'phrase' object, because I wanted all the words to appear as a single phrase, not as distinct components of a vector. Unlike Stata, R let's me write over an object (as supposed to dropping a variable and then recreating it). So let's do
  
  phrase <- paste(greeting, my_name, punctuation, # listing character objects to paste together
                  sep= " ") # telling it to separate them with a space
  phrase
  
# Let's change the values of our other objects and try to make a new phrase: 
  
  greeting <- "Goodbye"
  punctuation <- "?"
  phrase
  
# Well that didn't work. Why? Because 'phrase' was already defined as an object made up of the old greating and punctuation, and we didn't redefine it. Instead, let's make a function called 'phrase_fun', where these three arguments, named 'greeting', 'my_name', and 'punctuation': 
  
  phrase_fun <- function(greeting, my_name, punctuation){ 
    paste(greeting, my_name, punctuation, sep= " ")
  }
  
# Now, we can call the function and enter any values we want for 'greeting', 'my_name', and 'punctuation': 
  
  phrase_fun(greeting = "Goodbye", my_name = "Julia", punctuation = ":(")
  phrase_fun(greeting = "What's up", my_name = "Delhi", punctuation = "?")
  
# R can also store lots of other types of data like numbers, which we obviously need for stats, and in addition to vector, you can create objects that are matrices, dataframes, and lists. For example: 
  
  x <- rnorm(100)  #  x values are 100 draws from the normal distribution
  x
  
# Let's make another vector y, which is a function of x, plus random noise:
  
  y <- x + rnorm(100) 
  y
  
# In this case, R is adding each value of the x vector to the ordered value of the rnorm values
  
# Now let's make a dataframe:
  
  dat <- data.frame(y, x)
  dat

# Run a simple regression and print a summary of the results
  
  reg1 <- lm(y ~ x, data=dat)
  summary(reg1)
  
# It's significant, obviously. 

######## EXAMPLE DATA ########
  
# It's great that you can make fake data in R, but let's try some real data. Let's begin by clearning our workspace and setting our working directory:
  
  rm(list=ls())
  setwd ("~/Documents/RA/India_BITSS/rmarkdown")
  
# Then, we need to load the packages that we'll use for this analysis, including 'foreign' (to read Stata .dta files), 'sandwich' to help with robust SEs, 'ggplot2' (for cool graphs), and 'stargazer' (to format nice regression and summary tables). 

# These packages only need to be installed once on your system, using the 'install.packages()' command, but they need to be loaded using 'library()' for each session. This can be a bit of a pain, since you may not remember what you have installed previously and it's annoying to have a separate 'library()' command for each package. But, if you omit 'install.packages()' in your code because you already have something loaded, someone else trying to run your code that hasn't already installed the package will get an error. So, here's a nice bit of code to deal with this:

  need <- c("foreign", "sandwich", "ggplot2", "stargazer") # list packages you need
  have <- need %in% rownames(installed.packages()) # see which are already installed
  if(any(!have)) install.packages(need[!have]) # installs the missing ones 
  invisible(lapply(need, library, character.only=T)) # then loads them all 
  
# Now we can load our data
  
  washb <- read.dta("WASHBpublic_mock.dta")
  
# Let's have a look at it
  head(washb) # look at first few rows
  str(washb) # look at structure
  plot(haz06 ~ waz06, data = washb) # simple scatter plot
  hist(washb$waz06) # simple histogram
  
# And run Garret's models
  
  model1 <- lm(free_chl_yn ~ treatw, data = washb) # basic model, saved to an object
  summary(model1)
  
  model2 <- lm(free_chl_yn ~ treatw + kiswahili + english, data = washb) # adds baseline controls
  summary(model2)
  
  robust.se1 <- sqrt(diag(vcovHC(model1, type = "HC")))
  robust.se2 <- sqrt(diag(vcovHC(model2, type = "HC")))
  
# Let's make a nice table of this in Stargazer, which is analogous to estout in Stata:
  
  stargazer(model1, model1, 
            se=list(robust.se1, robust.se2), 
            title="Made Automatically in R", 
            out="outputR.tex", header=FALSE)
  
# You can copy and paste the output in the console into LaTeX, or you can write it as an object in a .tex., .txt, or .html format) using the "out" option.
  
# Or better yet, we can just do this all in RMarkdown!
  
##### Next steps

# There are many, many online resources and courses for learning R if you're interested, and a lot of them are free. One awesome resource are the free 'Swirl' tutorials that you can right in your RStudio console:

  install.packages("swirl")
  library("swirl")
  swirl()
  
# Type 'esc' then 'bye()' to exit swirl
  


