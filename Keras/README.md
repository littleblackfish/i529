We don't do a rigorous treatment of neural nets (or any other model for the most part) in this course but you don't necessarily have to know all the math to make use of them.
[Keras](https://keras.io/) is a high-level Python library for deep learning that runs on high performance back-ends such as Theano and TensorFlow.

## Installing Keras

Installing Keras is pretty similar to any other python package; and can be done using pip or conda.
It requires that either one of Theano or TensorFlow is also installed, but pip or conda should handle that too.

## Using Keras

Building and training models with Keras is only slightly more complex than scikit-learn.
Although there are many different architectures that can be implemented in Keras, the simplest ones go a long way.

### Perceptron

In Keras, these are called **Sequential models**.

```
from keras.models import Sequential
model = Sequential()
```
We can construct a perceptron, we need a layer of fully connected units.
In Keras, this is called a **Dense layer**.

```
from keras.layers import Dense

# Input layer
model.add(Dense(10, input_dim=5, activation='relu'))
# Hidden layer
model.add(Dense(10, activation='relu'))
# Output layer
model.add(Dense(1, activation='sigmoid'))
```

Unlike scikit-learn, we then have to **Compile** our model so the backend knows how to calculate efficiently.

```
model.compile(loss='binary_crossentropy',
                  optimizer='adam',
                  metrics=['accuracy'])
```

### Multilayer perceptron

A multilayer perceptron is simply a perceptron with multiple hidden layers.
We therefore already know how to build it

```
from keras.models import Sequential
from keras.layers import Dense

model = Sequential()

# Input layer
model.add(Dense(10, input_dim=5, activation='relu'))

# Hidden layers
model.add(Dense(10, activation='relu'))
model.add(Dense(10, activation='relu'))
model.add(Dense(10, activation='relu'))
model.add(Dense(10, activation='relu'))
model.add(Dense(10, activation='relu'))

# Output layer
model.add(Dense(1, activation='sigmoid'))

model.compile(loss='binary_crossentropy',
                  optimizer='adam',
                  metrics=['accuracy'])
```
### Multilayer perceptron with dropout

Dropout is an elegant way to avoid overfitting in neural networks, as described in [this paper](https://www.cs.toronto.edu/~hinton/absps/JMLRdropout.pdf).
Luckily, it is already implemented in Keras and available as a layer.
We can simply add **Dropout** layers to our multilayer perceptron.

```
from keras.models import Sequential
from keras.layers import Dense,Dropout

model = Sequential()

# Input layer
model.add(Dense(10, input_dim=5, activation='relu'))

# Hidden layers with dropout
model.add(Dropout(0.5))
model.add(Dense(10, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(10, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(10, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(10, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(10, activation='relu'))

# Output layer
model.add(Dense(1, activation='sigmoid'))

model.compile(loss='binary_crossentropy',
                  optimizer='adam',
                  metrics=['accuracy'])
```

### Using Keras models with scikit-learn

Keras conveniently ships with wrappers to make scikit-compatible models.
This way we can test our Keras models just like our scikit-learn models, using for example **cross_validate** or **GridSearchCV** methods.
All we need to do is to wrap our model-building into a function with appropriate parameters.  

```
from keras.models import Sequential
from keras.layers import Dense,Dropout
from keras.wrappers.scikit_learn import KerasClassifier

def genmodel(depth, width, dropout=False):

    model = Sequential()

    # Input layer
    model.add(Dense(width, input_dim=61, activation='relu'))
    # Optional dropout
    if dropout : model.add(Dropout(0.5))

    # Hidden layers with dropout
    for i in range(depth) :
        model.add(Dense(width, activation='relu'))
        # Optional dropout
        if dropout : model.add(Dropout(0.5))

    # Output layer
    model.add(Dense(1, activation='sigmoid'))

    model.compile(loss='binary_crossentropy',
                  optimizer='adam',
                  metrics=['accuracy'])

    return model

model = KerasClassifier(build_fn=genmodel, verbose=0)

```
The rest of the workflow is identical to a scikit-learn model.

```
from sklearn.model_selection import cross_validate

s = cross_validate(model, X, y, cv=10, 'scoring':['accuracy', 'precision', 'recall', 'f1', 'roc_auc'])

print (s)
```
