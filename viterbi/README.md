In this lab session you are expected to implement the viterbi algorithm as described in the [lecture slides](http://homes.soic.indiana.edu/classes/spring2017/info/i529-yye/lectures/HMM.pdf).

The viterbi algorithm finds the maximum likelihood solution for a hidden Markov model.

A hidden Markov model with will have these parameters  :
  * **M** and **N**, number of states and size of alphabet
  * **M** initial probabilities
  * **MxM** transition probabilities
  * **MxN** emission probabilities

#### Specifications
Your program should :

  1. **Read parameters from a file** like [this](sample_parameters.dat), which represents the classical fair/biased coin toss example.

  2. **Take an observed sequence** as input.

  3. **Return the most likely hidden sequence** as output.

You have 50 minutes.

You can use the example in the slide #18 as a test case to test your program.

I will be walking around answering questions.

Good luck.
