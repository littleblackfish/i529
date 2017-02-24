In this lab we are taking a look at another HMM based tool, **ChromHMM**.

ChromHMM uses a multivariate HMM model to discover epigenomic features on a given chromosome.
Instead of sequence data, it uses experimental results mapping epigenomic (methylation, histone modification etc.) features to the chromosome.

  * [Project website](http://compbio.mit.edu/ChromHMM)
  * [Manual](http://compbio.mit.edu/ChromHMM/ChromHMM_manual.pdf)

**The main difference from previous HMMs we have seen  :**

  * The alphabet size is 2 (binary) : each feature either exists or not
  * There are multiple 'tracks' (sequences, variables ..) : these are multiple experiments done on the same chromosome

### Installing ChromHMM

ChromHMM is written in Java.
Java is preferred for some projects because just like Python, users do not have to compile it, but it runs much faster compared to Python.
*(It is however not quite as fast as native C/C++ and almost as cumbersome to to code.)*
If we have java (runtime environment) already installed, we can [download](http://compbio.mit.edu/ChromHMM/ChromHMM.zip), unzip and be ready to run ChromHMM by doing :

```
wget http://compbio.mit.edu/ChromHMM/ChromHMM.zip
unzip ChromHMM.zip
cd ChromHMM
```

### Running ChromHMM

As usual, the detailed specifications on how to run ChromHMM can be found in the [manual](http://compbio.mit.edu/ChromHMM/ChromHMM_manual.pdfhttp://compbio.mit.edu/ChromHMM/ChromHMM_manual.pdf).

Unfortunately, we need a specific type of data to run ChromHMM (experimental mapping of epigenomic features to chromosome) but fortunately, it comes with some sample data.

We can look at the sample data in the SAMPLEDATA_HG18 directory.
One of them looks like this :

```
GM12878	chr11
CTCF	H3K27ac	H3K27me3	H3K36me3	H3K4me1	H3K4me2	H3K4me3	H3K9ac	H4K20me1	WCE
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
```

Of course we see mostly zeroes because the beginning of the chromosome does not have many epigenomic markers, but we can see the structure.

  * The first line specifies **cell name** and **chromosome name**.
  * The second line specifies the **names of the markers**.
  * The remaining lines specify the presence of those markers in each 200 base segment of the chromosome. 1 means present and 0 means not present.

Once we have such a file, running the main ChromHMM module is a single line operation such as `LearnModel inputdir outputdir numstates assembly`. So we can do :

```
java -jar ChromHMM.jar LearnModel SAMPLEDATA_HG18 test_output 4 hg18
```

Where:

  * **SAMPLEDATA_HG18** is the directory where we have the  input files
  * **test_output** is the directory where we will write the oputput files
  * **4** is the number of states in our model
  * **hg18** is the name of the assembly we are using (the relevant files are in various folders CHROMSIZES,COORDS,ANCHORFILES)

to run the program.

### Output of ChromHMM

ChromHMM conveniently summarizes everything in a html file in the output directory so we can visually take a look.
