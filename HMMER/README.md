HMMER is a very popular Profile Hidden Markov Model implementation.

  * [Project website](http://hmmer.org/)
  * [Webserver](https://www.ebi.ac.uk/Tools/hmmer/)
  * [Manual](http://eddylab.org/software/hmmer3/3.1b2/Userguide.pdf)

### Profile-HMMs

For a detailed description of profile-HMMs, check out chapter 5 of our textbook.
For a brief description, check out [lecture slides](http://eddylab.org/software/hmmer3/3.1b2/Userguide.pdf).

From a practical point of view, profile-HMMs are good for two things :

  * To search for members of protein families
  * To search for distant homologs of single proteins

HMMER is also the basis of [pfam](http://pfam.xfam.org/).

### Installing HMMER

HMMER is written in glorious C99 and has an exceptionally well written [manual](http://eddylab.org/software/hmmer3/3.1b2/Userguide.pdf) for both installation and usage.

HMMER is already installed on all SoIC and UITS computers such as silo, tank and Karst.
We only need to load it by doing `module load hmmer`.
Note that there is no excutable called `hmmer` but hmmer consists of multiple tools such as `hmmbuild`, `hmmsearch`, `phmmer`, and `jackhmmer`.
Alternatively, we could download the source code from the main website and compile, or directly get the binary version.
Finally, we could even use the EBI-hosted [webserver](https://www.ebi.ac.uk/Tools/hmmer/) to use hmmer without any installation.

Some of the tutorial files that are included with the HMMER download are included in this repository for your convenience.

### Running HMMER

## Building a profile-HMM

In the case of a profile-HMM, our observation **is not a sequence, but a multiple sequence alignment**.
Making the initial multiple alignment is not HMMER's job.
We can obtain this alignment using various tools (clustal etc.) as HMMER is pretty forgiving with its input.
The [globins4.sto](globins4.sto) is an example multiple sequence alignment from the original hmmer tutorial.
Let us examine this file.

`hmmbuild` builds a profile-HMM from a multiple sequence alignment.
Let us do `hmmbuild globins4.hmm globins4.sto` to accomplish just that.
The freshly built profile-HMM is now written in the file `globins4.hmm`.

## Searching for a full profile in a database

Now that we have our model with, the basic operation is to search for it in a bunch of other sequences.
Note that these sequences are not aligned in any way and there could be quite a few of them.
For the sake of an example, we use 45 globin sequences provided in the HMMER tutorial.
`hmmsearch` is the tool and we can accomplish this task by simply doing `hmmsearch globins4.hmm ../globins45.fa`.
Let us examine the output.
Since this is a large output, we are probably better off redirecting it into a file.
Let us try doing `hmmsearch globins4.hmm ../globins45.fa > globins4.out` instead.
Let us examine the output using a pager such as `less`.

## Searching for a domain profile in a multi domain protein

An alternative use of our new tool is to search for a conserved domain in a multi-domain protein.
The tutorial conveniently includes an example case.
[fn3.sto](fn3.sto) is a multi sequence alignment for a finbronectin domain that is commonly found in various multi domain proteins.
We can easily build a model for this by doing `hmmebuild  fn3.hmm fn3.sto`.
We could then search for this domain in a large multi-domain protein provided in the file [7LESS_DROME](7LESS_DROME) by doing `hmmsearch fn3.hmm 7LESS DROME > fn3.out`.
Let us examine what the output looks like this time around.

## Searching for distant homologs of a single protein

We can also leverage HMMER to sensitively search for distant homologs.
This is similar but reportedly superior to a BLAST search.
The executable for this operation is `phmmer`, which essentially builds a profile-HMM from a single protein sequence and search for it in a sequence database.
We can simply do `phmmer HBB_HUMAN globins45.fa` to search for human $\beta$-globin in our little globin database.

`jackhmmer` extends on this feature by iteratively building a better profile-HMM from those sequences phmmer finds.
The usage would be identical to phmmer, such as `jackhmmer HBB_HUMAN globins45.fa`
Let us compare the outputs from phmmer and jackhmmer for the same query.

Finally, note that you can use hmmer similarly with DNA and RNA sequences.
 
