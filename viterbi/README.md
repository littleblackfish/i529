In this lab session you are expected to implement the [viterbi algorithm](https://en.wikipedia.org/wiki/Viterbi_algorithm).

The viterbi algorithm finds the maximum likelihood solution for a [hidden markov model](https://en.wikipedia.org/wiki/Hidden_Markov_model)

A hidden Markov model with M hidden states and an alphabet size of N will have these parameters  :
  * **N** and **M**
  * **M** initial probabilities
  * **MxM** transition probabilities
  * **MxN** emission probabilities

Your program should read these parameters file like [this](sample_parameters.dat), which represents the classical  fair/biased coin toss example.

Your program should also take an **observed sequence**.

Your program should return the **most likely hidden sequence**.

You have 50 minutes.

Good luck.
