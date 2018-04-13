
from sklearn import datasets
from keras.utils import to_categorical
from keras.models import Sequential
from keras.layers import Dense

iris = datasets.load_iris()
X=iris.data
y=iris.target
y_binary = to_categorical(y, num_classes=3)

model = Sequential()
model.add(Dense(10, input_dim=4))
model.add(Dense(10))
model.add(Dense(3, activation='softmax') )
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics =['accuracy'])

model.fit(X,y_binary,epochs=100)
