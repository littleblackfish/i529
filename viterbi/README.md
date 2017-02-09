In this lab session you are expected to implement the [viterbi algorithm](https://en.wikipedia.org/wiki/Viterbi_algorithm).

The viterbi algorithm finds the maximum likelihood solution for a [hidden Markov model](https://en.wikipedia.org/wiki/Hidden_Markov_model)

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

I will be walking around answering questions.

Good luck.
