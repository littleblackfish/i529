
This is a meta introduction to Python.
We are assuming you are familiar with some programming language, or even Python itself, and go over some distinguishing features of Python.

#### Why Python?

Python is a widely used interpreted programming language.
It practically replaced Perl as the go-to platform for small to medium sized projects.
These days it is hard to come by a project that **does not** use Python or at least provide a Python wrapper.
Having good command of Python is therefore a very valuable skill.  

Python's syntax is very human friendly.
As such it is an excellent choice for [literate programming](http://www.learnpython.org/).

Although Python is not very fast by itself, it can easily interface with optimized C libraries, and has extensions (e.g. [cython](http://cython.org/), [pyrex](https://wiki.python.org/moin/Pyrex)) that can be used to write very high performance code in C-like syntax.
With crafty usage of these features, Python can be used to tackle all but most computationally demanding problems.  

#### Python 2 vs. Python 3

Unlike most other languages, Python has two mature versions in common use.

Long story short, Python 2 is the legacy and Python 3 is the current and future version.
There has been some resistance to Python 3 due to some of the popular libraries initially not supporting it, but this is not the case anymore.
Python 3 improves over 2 both in syntax and performance and generally is a more polished language.

At this point Python 2 is default but Python 3 is also available in most occasions.
This is the case in all IU computers and you can do ```module load python/3``` or something similar to switch to Python 3.
It is generally good practice to use Python 3 unless you have a very good reason to use Python 2, as most everything is supported in 3 by now and 2 will eventually be depreciated. Especially if you are a newcomer, it is best that you learn the Python 3 version of the syntax, which differs not by much, but enough to bother you when you eventually make the switch.

That being said, you can also get away with using Python 2 in most cases, including your course work.

You can read [this document](https://wiki.python.org/moin/Python2orPython3) for a more in-depth discussion of the subject.


#### Python Tutorials

Actually teaching Python is beyond the scope of this lab, but it is pretty easy to self-teach.
Although most of your assignments will require only the most basic understanding of the language, it is always good to have some understanding of the inner workings of the interpreter to code efficient programs.  

  * [Official Tutorial for Python 2 ](https://docs.python.org/2/tutorial/)
  * [Official Tutorial for Python 3](https://docs.python.org/3.6/tutorial/)
  * [Interactive Python (2) Tutorial](http://www.learnpython.org/)
  * [DataCamp](https://www.datacamp.com/) has pretty good tutorials too
  * [Dive into Python](http://www.diveintopython.net/) if you code well in another language


#### Popular libraries

The strongest feature pf Python arguably is the wealth of high quality community driven libraries.
The PyData community [keeps a list](http://pydata.org/downloads.html) of the most popular Data Science related Python tools.
Some of the ones we might benefit from in this class are :

  * [Numpy](http://www.numpy.org/) provides the basis data structures for efficient scientific computing
  * [SciPy](http://www.scipy.org/) provides efficient routines for common numerical calculations
  * [pandas](http://pandas.pydata.org/) provides sophisticated data structures for statistical computing
  * [scikit-learn](http://scikit-learn.org/stable/) provides general purpose machine learning routines
  * [matplotlib](http://matplotlib.org/) provides plotting capabilities
  * [seaborn](http://seaborn.pydata.org/) provides even nicer plotting capabilities

#### Development environments

Just like any other programming language, you might choose to code Python in a simple text editor.
In fact, having good command of a command line text editor such as VIM is always a valuable skill, but Python offers some very appealing alternatives.

[iPython](https://ipython.org/) is a very powerful interactive shell for Python.
Learning to use iPython may help you become a much more efficient developer.
A lot of scientific computing is essentially a rapid prototyping application, and iPython is a very efficient environment for this.
Using iPython, you can start with a rough, interactive analysis of your data and quickly convert this into a reproducible program, or you can use it to live-debug your existing program to take a closer look at what is happening inside.

Taking the interactive shell concept one step further is [Jupyter](https://jupyter.org) Notebooks.
Using Jupyter notebooks, you can move your interactive iPython shell to your browser and mix and match segments of code with markdown documentation.
What makes Jupyter Notebooks even cooler is that you can also use them with other programming languages such as R and Julia.

Although Jupyter Notebooks are arguably the best platform for scientific computing and data science, you might also opt to use one of the popular graphical interfaces such as [Spyder](https://www.enthought.com/products/canopy/).

#### Example workflow

Depending on how much time we have, we should go over a couple of examples that represent an everyday workflow

  * Look at a [python program](argparse.py) with command line parameters using [argparse](https://docs.python.org/2/howto/argparse.html#id1)
  * Magic running and using an interactive iPython shell
  * Converting an iPython log to a Python program
  * Doing the same or similiar in a Jupyter Notebook
