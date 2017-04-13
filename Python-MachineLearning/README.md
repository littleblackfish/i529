In the remaining weeks, we will do some machine learning exercises with Python.
The main package we will be using is [scikit-learn](http://scikit-learn.org/).
This is a very simple yet powerful machine learning framework for python.
Because there are so many excellent tutorials on scikit-learn, I wanted to avoid inventing the wheel from scratch and decided to use some of the existing ones and will be emphasizing important points through experience.  

We will start with the [scikit-learn basic tutorial](http://scikit-learn.org/stable/tutorial/basic/tutorial.html).
Scikit-learn is famous for its excellent documentation which is a great source for machine learning in general.
This simple tutorial walks us through the organization of scikit-learn and introduces the generic methods `fit()` and `predict()` implemented for various classifiers.


We will then go to [a realistic example](https://bugra.github.io/work/notes/2014-11-22/an-introduction-to-supervised-learning-scikit-learn/) written up by an experienced data scientist.
This time we will walk through the process of obtaining, cleaning up and normalizing less-then-perfect data and comparing various classifiers with stratified cross validation.

A copy of the [churn dataset](churn.csv) used in the write up is included in this repo for your convenience.

During these two weeks I will also go over some basic concepts such as :
  * [Cross validation](https://en.wikipedia.org/wiki/Cross-validation_(statistics))
  * [ROC](https://en.wikipedia.org/wiki/Receiver_operating_characteristic) and area under ROC
  * [Confusion matrix](https://en.wikipedia.org/wiki/Confusion_matrix)
  * Some other concepts regarding [evaluation of classifiers](https://en.wikipedia.org/wiki/Evaluation_of_binary_classifiers)

Finally, in the 3rd week, you will train your own classifiers using scikit-learn and the [p53 Mutants Data Set](https://archive.ics.uci.edu/ml/datasets/p53+Mutants) and I will be walking around answering your questions.
