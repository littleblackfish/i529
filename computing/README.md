Using machine learning methods with bioinformatics data tends to require large computers.
In this class you are assumed to be familiar with working in a POSIX environment.
If you would like a refresher, you can check out [this brief introduction](unix.md).

### Computing resources @ IU

IU has a number of large scale computing resources, the most prevalent ones :

  * [Mason](https://kb.iu.edu/d/bbhh) is our large memory cluster, purpose built for genomics
  * [Karst](https://kb.iu.edu/d/bezu) is our newest general purpose cluster
  * [Bigred II](https://kb.iu.edu/d/bcqt) is our biggest computer

If you have not used these computers before, you need to  [request access](https://access.iu.edu/Accounts/Create) to be able to log in.

### Storage resources @ IU

Once you have access to these computers, you also get access to multiple storage spaces with different characteristics.

  * **Home directory** `/N/u/username/[BigRed2,Mason,Karst]` is for small but persistent files
  * **Scratch space** `/N/dc2/scratch/username` is for large working files
  * [SDA](https://kb.iu.edu/d/aiyi) for long term storage of large files

### Available Software @ IU

A large number of software is maintained by IUTS.
These are arranged into modules that you can load into your environment.
You can try `module avail` to see a full list of available modules.

  * [Bioinformatics Software](https://kb.iu.edu/d/alei)

If you need software that is not already installed on the clusters, you can compile it for yourself in your home directory, or install python packages using `pip install --user packagename` without needing root privileges.

### Job management

When you are using large clusters you usually cannot run your programs directly.
You will have to prepare your work as job scripts and run them through the queue management system.
We use [TORQUE](https://kb.iu.edu/d/avmy) resource manager in IU clusters to manage shared computing resources.

The minimal operation of TORQUE involves you to understand :

  1. Job submission
    * `qsub job.script`
    * `qsub -l nodes=1:ppn=16,vmem=1024mb job.script` with extra parameters
  2. Monitoring jobs
    * `qstat` for all jobs
    * `qstat -u username` to see only your jobs
  3. Cancelling jobs
    * `qdel jobid`  

To make efficient use of the queues however you need to dig deeper.
Each cluster has a number of queues with different characteristics, you can find queue details in [this  page](https://kb.iu.edu/d/avmy).

Every now and then you might need to work interactively on the cluster.
You might be tempted to do this on the head nodes instead of submitting a job script.
Although trivial work can be done on head nodes, anything that requires above 20 minutes of computer time should be done through an **interactive job**.
You can use `qsub -I` with all the additional options you need to request an interactive session from the queue manager.


### Parallelization

Some applications support running in parallel on multiple cpus, or even multiple nodes at once.

Some of those applications make use of native threading capabilities.
These will run on a simple node, but multiple cpus.
For these clusters make sure you specify the **ppn** (processors per node) parameter appropriately.
If you want to write such programs, [OpenMP](http://www.codeproject.com/Articles/60176/A-Beginner-s-Primer-to-OpenMP) is a good choice.
A job submitted with `qsub -l nodes=1:ppn=16` will run on a single node but 16 processors.

Other applications may use a MPI library (OpenMPI) to run on multiple nodes at once.
These require more careful configuration and usually run via `mpirun` wrapper.
A job submitted with `qsub -l nodes=4:ppn=16` wil run in 4 nodes with 16 processors each, making a total of 64 cpus.

### Git

Git is a version control system that helps you manage your work.
We will be making use of git in this class, please go through [this tutorial](git.md) and familiarize yourself with it.
