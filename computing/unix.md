## POSIX, and why we do it

In the beginning, there was UNIX.
Imagine 70s when there were a handful of computers on Earth and the lucky few researchers had to share them.
Unix was an operating system designed to handle this situation.
While hardware got cheaper and more widespread, licensing UNIX became an issue, so many operating systems (OS) emulating its behavior were written independently.
Long story short, POSIX standards capture the original UNIX behavior and provide a uniform environment across operating systems.
Even though personal computers are abundant much faster today, the situation in the bleeding edge is very similar to 70s; we have few supercomputers shared by many researchers for heavy workloads.
Such environments are largely POSIX compliant, so familiarizing yourself with POSIX behavior will help you feel at home in any high performance computing environment.

In addition to forming a unifying platforms, POSIX standards require modularity, which is evident throughout the layers of the operating system.
This modularity encourages programs that do one thing and do it well, which we usually connect together to make **workflows**, tackling any workload imaginable.
If you are interested in the history and underlying principles of UNIX check out [this classic book](http://catb.org/~esr/writings/taoup/html/) that is also available online for free.
This is a surprisingly fun read considering the overwhelming title; the first chapter can be casually read to gain precious insight.

*Note that sometimes the term '\*nix' is used to refer to all UNIX-like, or POSIX compliant operating systems.*

## Linux is the kernel

Linux is an open source piece of software that was meant to behave in a very POSIX compliant way.
It has over 20 years of development and community support behind it so it is very stable and widely used in production systems.
It is not an operating system, but only a component of it, namely **the kernel.**

We as humans have no direct interaction with the kernel, we interact with the **shell**, which interacts with the **kernel**, which interacts with the **hardware** (through a BIOS, if you will).
Claiming we 'use Linux', is a bit of a misconception in this sense, but more on this later.

## Bash is the shell

There are many ways to interact with the Linux kernel and each one of these these is called a **shell**.
**Bash is by far the most common shell you'll find in a Linux system, and is fully POSIX compliant.**
Once you are comfortable with bash, you are golden: It does not matter if there is Linux, MacOS or BSD running under the hood, whether it is a low-end music server or a supercomputer, bash is bash.
Even if you run into a shell that is not bash, chances are it will be built on bash and will provide its basic functionality, and then some, just like bash provides basic POSIX functionality, and then some.

Wrapping up, **hardware + kernel + shell = usable computer**.
As a user, the only part you are dealing with is the shell.
Bash is your shell, in Bash you feel at home.

You may also have a **graphical shell** available to you, this is what you are interacting with when you are clicking around.
You can still fire up a **terminal** and access bash through the graphical interface.
Note that the ability to comfortably work in a purely non-graphical environment is an extremely valuable skill.

## What is a distribution ?

Sometimes a community (of software developers) will package a collection of software based on the Linux kernel, providing a complete and coherent operating system and **repositories of software**.
Such collections are called 'distributions', and many popular ones are available for free.
Examples are Debian, Ubuntu, Suse, RedHat, CentOS, Arch, and Mint.
The Linux Mint we have running in our VMs are Ubuntu based, which is in turn Debian based.
But note that the differences between distributions **will NOT be pronounced in your daily usage**, they are mostly evident in system administration and will be invisible to you as a user.
Remember, all you are using is the shell, which is bash, which is POSIX compliant, be aware that there are different flavors of Linux based OS, but do not worry about the distribution unless you are also maintaining the machine.

Note that we often use 'Linux' to refer to such a distribution as a complete OS and not the 'Linux kernel'.
This is a conflicting but widely used terminology, and now you know what is what.

## The super user

As mentioned before, the POSIX standards are based on a multi-user scheme.
Most of these are regular users which each belong to a set of groups, with given permissions, but one, namely **root**, is special in that it has unrestricted access to everything.
**The user 'root' is the superuser, he does not have permissions, he sets the permissions.**

In most occasions, you will be a regular user on a shared computer, and your scope will be limited by set **permissions**.

## The filesystem

The filesystem has a singular **root**, that is called **/**.
All file paths therefore start with /.

This means you don't have drive letters like c: and d:, so what happens if you have multiple storage devices?
You can **mount** them at arbitrary locations, this is a feature that is hard to grasp at first but extremely useful once understood.
Long story short, each directory you open may be located on a different storage device, or even a different computer and this has implications you have to consider.
You also have **hard and soft links** which means that multiple different files or folders may in fact be the same file or folder.
Both the concept of **mounting** and **linking** may sound scary at first but they are immensely powerful once you start using them to your advantage.
For example :
  * you can **mount** a folder from a remote computer into your local computer and treat it like a regular directory.
  * you can hard **link** a large file into multiple folders to avoid copying and syncing them.

The crafty usage of these features are beyond the scope of this document and generally come with experience but at the very least you need to be aware of their existence.

### Permissions

In a \*nix filesystem, each file has an **owner** and **permissions**, you have to familiarize yourself with these as they can be confusing or get you in trouble in multiple ways.

Under the root directory, you will have some directories such as /bin, /boot, /etc, /sys, /var ,
These are components of your operating system, although they could be named anything, they are usually named consistently across distributions.
We do not mess with these unless we know what we are doing, and could not mess with them even if we want to because of permissions.

Your **home** is where you own all the files and have free reign (write permissions).
This is usually found in /home/*username* or /mnt/home/*username*, but could be located anywhere.
This is also where you start  as your **working directory** when you login to your shell by default.
In addition to your home, you may have multiple places where you have write permissions, these may be on different storage devices and have different properties.

For example, on the IU systems each user gets a :
  - **home** directory that is small but accessible across computers
  - **scratch** directory that offers a lot of space, is fairly fast but not backed up
  - **storage** directory which is very slow but offers a lot of space and is backed up

You need to understand how you can access these and how to make efficient use of them with respect to your workload.

#### Exercise

Let's figure out who owns these system folders.

`ls -l /`

*Who owns these files? What does the 10 character-string mean?*

`ls -l ~`

*How about these? Can  the superuser write these files?*

#### Pro tip

I usually **soft link** my scratch and storage folders to my home folder, and **mount** my home folder to my local machine, so I can access all my files on IU servers as if they were on my laptop.
This requires no additional software in a POSIX compliant system and can be done entirely using native features.

## Shell commands

Bash also has scripting capabilities but we mostly use it interactively.
In this case we enter commands to the **command line** to be executed one by one.
These commands generally consist of the name of a program to be executed, and parameters to be passed to that program.
A lot of programs have a default behavior they demonstrate when executed with no parameters, but some require parameters.
Let's look at ls for example :

  * `ls` prints a list of the files in our **working directory**
  * `ls -l` prints the same list, but in a more detailed (long) format
  * `ls -a` prints will include files starting with . as they are excluded by default
  * we can use the long form `ls --all` to get the same behaviour
  * we can also combine these two parameters as `ls -l -a` or even as `ls -la`
  * `ls dirpath` will list the files in dirpath rather than the working directory


So in all of these examples, we are executing the same program, ls, but with different parameters which yield different outputs.
In some bioninformatics programs you will need to specify many parameters such as input files, output files, algorithmic parameters etc. to get any kind of meaningful output.

### Exercise

How would you list all the files in dirpath, including hidden ones? Does parameter order matter?

## Documentation

So how did I know about how ls would behave with those parameters?
I know them by heart because those are some parameters I use on a daily basis, but there are many others I don't, what to do if I need to use one of those someday?
I read the man pages, they explain the expected behaviour of the program wrt to the input and parameters.
Most programs come with a standard manpage, and these are accessible from your terminal at all times.
Try it for yourself by typing 'man ls'.
Most common commands, like ls, will have a few parameters that you will use often, and others you use rarely if ever, and they will all be explained in the man page.
In this day and age, you'd be tempted to google everything, but consider the man page as a letter written from the author of the program to you, it will help you understand what the program was intended to do from first hand.

Some of the larger, especially scientific, software may ship with pdf manuals instead of manpages, in this case that is your reference.

Most programs also have a **-h** or **--help** parameter that will print a short explanation and a list of commonly used parameters.
This is a great way to get a quick look at what it does.

Once you learn to depend on documentation of others, a natural next step is to get used to documenting your work so that others can depend on yours.

### Exercise :

`cd path` command changes the working directory to the one at the given path.
Can you figure out what happens if we run `cd` without any parameters?

### Pro tip :

RTFM, is a shorthand for 'Read The F*ing Manual'.
It is ok to ask naive questions sometimes, but if you go around a forum and start asking the simplest principles of a program directly to its community, you will be told to RTFM.
This is generally not a good sign and you don't want to get on the wrong side of a community that supports free software.
Do not let it come to that, RTFM from the beginning.
Good documentation represents the cumulative effort of the author and community to support their software, it is a valuable resource, use it.

### Fun fact :

PEBKAC, is a shorthand for 'Problem Exists Between Keyboard and Chair'.
Although it is not as common as RTFM and is meant to be more humorous, it means you probably have a misconception about the program and perhaps reporting a bug that is actually a feature.

## Streams and redirection

Before understanding streams, you need to understand a very fundamental \*nix idea: each program behaves like a filter on a stream of data.
Each program takes an input and generates an output, this is an essential feature of \*nix programming philosophy that allows us to daisy-chain programs into workflows.
This is also why such programs usually do not have graphical user interfaces; they simply follow another programming paradigm.

Posix systems generally have two output streams, namely **stdout** and **stderr** and both are printed on your display by default.
Most programs will generate some sort of output and push it to **stdout**, which you see printed in your terminal.
Unexpected output such as disk or network related errors are pushed to **stderr**, to seperate them from the actual output of the program.
We usually do not worry too much about stderr until things start to go wrong and we have to figure out why.
There is also **stdin** that consists of keys you press after the program started running, that is your input to the program.

Wrapping up : **stdin -> program + parameters -> stdout (+stderr)**

This is all well if you are running a quick command, checking out first few lines of a file, listing directories etc. but sometimes you have large outputs that you want to keep for later analysis.
Often times, programs will provide an output file parameter such as **-o** or **--out**, but they don't have to.
Bash has piping and redirection operators that can juggle these streams around.
There are three such operators you need to know by heart.

  * | takes stdout from one program and pipes it into stdin for another
  * > takes stdout from one program and directs it into a file
  * < takes a file and streams it into stdin of a program

In the end we get **workflows** like :

input -> program 1 -> program 2 -> program 3 -> file

Note that it is not important which **programming language** these programs are written in.
We often use different languages to tackle different problems, and as long as all our program runs on linux, bash can pipe them together to make a workflow.
Sometimes when simple piping does not cut it, we write small **bash scripts** to automate more complicated processes.

Thinking about programs in such modular fashion and connecting them together in a robust fashion is a most fundamental skill you need to develop.
Even though our unofficial textbook does a great job explaining this, at this point it is a really good idea to give [the book I mentioned before](http://catb.org/~esr/writings/taoup/html/) a chance.

## Process management

If you have a graphical interface, it is straightforward to run multiple terminals, or kill some of the open terminals, as you can go pointy-pointy-clicky-clicky, but this is not always the case with high performance computers.
Even before there were monitors connected to computers, let alone graphical interfaces, UNIX was designed as a multi-user, multi-tasking OS, so is POSIX, so we are well equipped for this.

In a bash session, if you have a program actively running, you can press ctrl+c, which will kill that process irreversibly.
This is very useful when you realize you started a long program with wrong parameters etc.

You can also 'pause' the program, using ctrl+z, and run it in the background by typing **bg**, which enables you to do other things in the same terminal while it is running.
If you want to get back to the program running in the background, you can 'foreground' it again by typing **fg**.

Although there are very fancy things you can learn to do wrt process management, these three tricks should take you a long way.
