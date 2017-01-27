R is a programming environment for statistical computing and graphics.
It is not as practical as Python for general purpose programming, but very intuitive to use for statistical computing.

#### Installing R

R is installed on all SoIC computers (i.e. silo, tank) so you can start it by typing `R`.
R is also available as a module on IU clusters (i.e. [Karst](https://www.datacamp.com/)) and can be loaded by typing `module load curl java r`.

If you need to install R on your oen computer, you download it [here](https://cloud.r-project.org/).
[CRAN](https://cran.r-project.org/) is a repository which you can use to install many R packages.
This is similiar to the pip (or conda) package management system of Python.
The [Bioconductor](https://bioconductor.org) project provides a lot of bioinformatics related tools beyond what is available in CRAN.

[RStudio](https://www.rstudio.com/) provides a graphical environment for R, much like Spyder for Python.
You can also use R with Jupyter notebooks after installing the [R kernel for Jupyter](https://github.com/IRkernel/IRkernel).

#### Using R

R is not my favorite environment but it is very easy to get going and very practical for certain tasks.
The real strength of R comes from data structures that were designed with statistical computing in mind (note that [pandas](http://pandas.pydata.org/) offers R-like data structures for Python.), and the CRAN/Bioconductor ecosystem which has community supported tools for many common applications.

To familiarize yourself with the R syntax, I recomend you quickly run through the [DataCamp](https://www.datacamp.com/) introductory tutorial.

Now, let us run through the short tutorial that I inherited from the previous years lab notes :

### Loading some data

If you cloned this repository, you should already have [binary.csv](binary.csv).

We can read data using one of the read functions, in this case because we have a csv file on hand, we can do `read.csv("binary.csv")`.
But this merely reads and prints the data.
We would rather store it in a variable, so try `data <- read.csv("binary.csv")`.

### Plotting a Gaussian distribution

If you cloned this repository, you should already have [gaussian-demo.R](gaussian-demo.R).

We can load a script into R using the `source()` function.
Let us see what this one does by loading it  : `source("gaussian-demo.R")`.
We got some nice plots, let us walk through the well commented code to understand what it does.  

### Fitting some lines

If you cloned this repository, you should already have [lm-demo.R](lm-demo.R).
This script uses the [MASS](https://cran.r-project.org/web/packages/MASS/index.html) library.

### Fitting a logistic linear regression

If you cloned this repository, you should already have [logit-demo.R](logit-demo.R).

  * The script comes from [this tutorial](http://www.ats.ucla.edu/stat/r/dae/logit.htm) and explained there
  * [Introduction to logistic regression ](http://userwww.sfsu.edu/efc/classes/biol710/logistic/logisticreg.htm)
  * [Paper with logistic regression](http://bioinformatics.oxfordjournals.org/content/23/15/1945.long)
