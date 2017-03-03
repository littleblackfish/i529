MEME is tool to discover motifs in a given set of sequences.
A motif is a sequence pattern that occurs repeatedly in a group of related sequences.
MEME does **expectation maximization** on a mixture model to discover ungapped motifs.
In short, it will define a 'background model' and a 'motif model' and maximize the difference between these.

Note that MEME is part of MEME-Suite, which is a group of similar programs with distinct functions.

  * [MEME-Suite homepage](http://meme-suite.org/)
  * [MEME Webserver](http://meme-suite.org/tools/meme)
  * [MEME Manual](http://meme-suite.org/doc/meme.html?man_type=web)

### Installing MEME

MEME is written in C, so it needs to be compiled before we use it.
Although it is also possible to run it through the webserver, we can easily compile a local copy by doing :

```
wget http://meme-suite.org/meme-software/4.11.3/meme_4.11.3.tar.gz
tar zvxf meme_4.11.3.tar.gz
cd meme_4.11.3
./configure --prefix=$HOME/meme --with-url=http://meme-suite.org --enable-build-libxml2 --enable-build-libxslt
make
make test
make install
```

This is pretty straightforward in silo or tank since we already have all the prerequisites, but it takes a while.
We could try `make -j 4` to compile in parallel.

Once this is done, we will have the meme executables in `~/meme/bin/`.
Feel free to add this in your PATH or we can just write the full path every time we are using MEME.

### Running MEME

As usual, detailed explanations of parameters can be found in the [manual](http://meme-suite.org/doc/meme.html?man_type=web).
In its simplest mode, meme reads a set of sequences from a fasta file and generates an output about the motifs found in this file.
We can run meme on the example sequences found in [crp0.fna](crp0.fna) by doing :

`meme crp0.fna -oc crp -dna`

Note that this will only find 1 motif.
We could instead set `-nmotifs 3` to find the 3 most significant motifs.

`meme crp0.fna -oc crp -dna -nmotifs 3`

Or better yet, we could have a large nmotifs but limit the number of motifs by their E-value by using `-evt 0.05`

`meme crp0.fna -oc crp -dna -nmotifs 3 -evt 0.05`

We could also constrain the width of motifs using `-minw` and `maxw` parameters.

### Output

Meme generates a nicely formatted html output in the output folder defined by the `-oc` parameter.
If we prefer, we can get only a simple text output by using the `-text` parameter.
