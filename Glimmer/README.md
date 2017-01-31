Glimmer (Gene Locator and Interpolated Markov ModelER) is a system for finding genes in microbial DNA, especially the genomes of bacteria, archaea, and viruses.
It uses interpolated Markov models (IMMs) to identify the coding regions and distinguish them from noncoding DNA.

  * [Glimmer webpage](http://ccb.jhu.edu/software/glimmer/index.shtml)
  * [Glimmer manual](http://ccb.jhu.edu/software/glimmer/glim302notes.pdf)
  * [Lecture material explaining the interpolated context model](http://courses.cs.washington.edu/courses/cse527/00wi/lectures/lect14.pdf)

Note that Glimmer is installed on SoIC computers as a module so you need to do `module load glimmer` before you can use it.

#### Using Glimmer

  1. Building the model using `build-icm`
    * Using known genes
    * Using long, non-overlapping ORFs (using `long-orfs`)
    * Using genes from a highly similar species.
  2. Predicting genes using `glimmer3`


Let us go through the sample run provided with Glimmer package.

  * [Treponema pallidium genome](tpall.fna)
  * [List of annotated genes](tpall.nh)

### Build a model from scratch

We first find long, overlapping ORFs in the genome using `long-orfs`.
Note that :

`USAGE: long-orfs [options] <sequence-file> <output-file>`

So we can do :

`long-orfs -n -t 1.15 tpall.fna orf-list.nh`

Which will generate `orf-list.nh`.
Examine this file using cat.
Now we need to extract the training sequences from the genome using `extract`. Note that :

`USAGE:  extract [options] <sequence-file> <coords>`

So we can do  :

`extract -t tpall.fna orf-list.nh > orf-seq.fna`

Which will generate orf-seq.fna.
Examine this file using cat.
We will then build the model based on this training set using `build-icm`.
Note that :   

`USAGE:  build-icm [options] output_file < input-file`

So we can do :

`build-icm -r orf-model.icm < orf-seq.fna`

Which will generate the file `orf-model.icm`.
Examine this file with cat.
Now we can predict other genes in our genome using `glimmer3`. Note that :

`USAGE:  glimmer3 [options] <sequence-file> <icm-file> <tag>`

So we can do :

`glimmer3 tpall.fna orf-model.icm orfBased`

Which will generate files `orfBased.predict` and `orfBased.detail`.
Examine these with cat.

### Build a model using known genes

Building the model from scratch is the worst case scenario.
In most cases, a lot of genes may be easily identified using homology searches.
We have a list of such genes in [tpall.nh](tpall.nh) and we can use them instead of the long ORF sequences we found.
This is likely to yield better results in most occasions.

Start by examining `tpall.nh` with cat.
Then we can extract the sequences for these genes by doing :

`extract -t tpall.fna tpall.nh > gene-seq.fna`

Build the model by doing :

`build-icm -r gene-model.icm < gene-seq.fna`

Predict more genes by doing :

`glimmer3 tpall.fna gene-model.icm geneBased`

Examine the resulting files `geneBased.predict` and `geneBased.detail` to see how your results differ from the previous run.

#### Combining training sets

Do you think combining the long orfs you found using `long-orfs` with the genes you found by homology searches a good idea?

Do that as an excercise and see how your results differ.
