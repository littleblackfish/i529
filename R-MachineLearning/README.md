In this weeks lab, we will go through some example workflows using machine learning packages with R.

### Requirements

R is installed on all SoIC computers by default but we do not have root permissions in these machines.
We need to set the library path to a place where we have write permissions so we can install new packages.

```
mkdir Rlib
R
.libPaths("Rlib")
```
Now we can install packages using `install.packages('packagename')`.
Some packages we will use in this lab:

  * mlbench
  * rpart
  * party
  * ipred
  * e1071
  * ROCR
  * bnlearn

We can also install bioconductor is a project including a lot of bioinformatics related R packages.
We can install bioconductor by doing  :

```
source("http://bioconductor.org/biocLite.R")
```

And then we can install bioconducto rpackage 'Rgraphviz' by doing :

```
biocLite("Rgraphviz")
```

### mlbench

mlbench includes a collection of artificial and real-world machine learning benchmark problems.
Some of these are also in the [UCI machine learning repository](https://archive.ics.uci.edu/ml/).

### A comparison of classifiers

We will be using the [BreastCancer](http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29) dataset included in mlbench.
This dataset has 9 features for each tumor sample and a Class label that is either **benign** and **malignanat**.
We will go over a [script](breastcancer.R) that attempts this task using various classifiers.

  * recursive partioning (rpart)
  * conditional inference trees (party->ctree)
  * random forest  (party->cforest)
  * bagging (bootstrap aggregating) (ipred->bagging)
  * SVM (e1071->tune)

## Bayesian networks

Learning a Bayesian network has two components :
  * [Learning the graph](bnlearn_test.R) using various methods
  * [fitting the parameters](asia.R) given a graph
